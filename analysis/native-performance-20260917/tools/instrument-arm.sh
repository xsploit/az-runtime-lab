#!/bin/sh
# Instrumentation arm (not a benchmark): Xwayland AND sway in the sched filters and
# fork-free socket queue sampling on both sides across one load. No strace (it
# perturbs the run); set STRACE=1 to add it. Arms its own rollback watchdog and
# restores the kiosk files on exit.
set -u
LAB=${AZ_LAB:-$HOME/az-native-lab}; PP=$LAB:$LAB/analysis:$LAB/mixer; B=$LAB/local/kiosk-swap-backup; cd "$LAB"
nohup setsid sh /tmp/rollback-watchdog.sh 900 >/dev/null 2>&1 </dev/null &
restore() { for f in pflx-mode-menu pflx-az-session start-pflx-kiosk; do [ -f "$B/$f" ] && sudo -n install -m 0755 "$B/$f" "/usr/local/bin/$f"; done; echo "kiosk files restored"; }
trap restore EXIT INT TERM
export AZ_LAB=$LAB SWAYSOCK=$(ls /run/user/$(id -u)/sway-ipc.* | head -1) XDG_RUNTIME_DIR=/run/user/$(id -u) WAYLAND_DISPLAY=wayland-1
printf '#!/bin/sh\necho az\n' > /tmp/stub-menu; sudo -n install -m 0755 /tmp/stub-menu /usr/local/bin/pflx-mode-menu
sed 's|\$drop python3 pi/session.py "\$config" >>|\$drop python3 pi/session.py "\$config" --no-controller >>|' "$B/pflx-az-session" > /tmp/az-nc; sudo -n install -m 0755 /tmp/az-nc /usr/local/bin/pflx-az-session
sed 's|mode=bitedj$|mode=az|' "$B/start-pflx-kiosk" > /tmp/kiosk-az; sudo -n install -m 0755 /tmp/kiosk-az /usr/local/bin/start-pflx-kiosk
OUT=$LAB/local/instr-$(date +%Y%m%dT%H%M%SZ); mkdir -p "$OUT"; echo "$OUT" > /tmp/last-capture-dir; echo "outdir=$OUT"
sup=$(pgrep -f "pi/session.py .*session-library.json" | head -1); [ -n "$sup" ] && kill -TERM "$sup"
i=0; while [ $i -lt 30 ]; do sleep 1; pgrep -x EP147 >/dev/null || break; i=$((i+1)); done
i=0; while [ $i -lt 60 ]; do sleep 2; pgrep -x EP147 >/dev/null && break; i=$((i+1)); done
sleep 20; sh /tmp/load-two.sh >/dev/null 2>&1; sleep 5
P=$(pgrep -x EP147); X=$(pgrep -x Xwayland | head -1); SW=$(pgrep -x sway | head -1)
RI=$(sudo -n readlink /proc/$P/fd/20 | grep -o "[0-9]*"); XI=$(sudo -n ss -xn 2>/dev/null | awk '$1=="u_str" && $2=="ESTAB" && $5=="*" {print $6}' | tr '\n' ' ')
echo "renderer=$P xwayland=$X sway=$SW fd20_ino=$RI unnamed_stream_inos=$XI" | tee "$OUT/sockets.txt"
erp() { sudo -n env PYTHONPATH=$PP python3 analysis/send-erp-button.py --button "$1" --group "$2" >/dev/null 2>&1; }
stamp() { python3 -c "import time,json,sys;print(json.dumps({'command':sys.argv[1],'at':time.monotonic()}))" "$1" >> "$OUT/commands.json"; }
( EXTRA_PID="$X $SW" sh analysis/capture_waveform_gap.sh "$OUT" 45 > "$OUT/capture.log" 2>&1 ) & CAP=$!
( bash /tmp/queue-sampler.sh "$P" "$RI" "$(echo $XI | awk '{print $NF}')" 45 "$OUT/queues.txt" ) & QS=$!
ST=; if [ "${STRACE:-0}" = 1 ]; then ( sudo -n timeout 45 strace -f -tt -e trace=poll,ppoll,send,sendto,write,writev,sendmsg,recv,recvfrom,recvmsg,read -p "$P" -o "$OUT/strace.txt" >/dev/null 2>&1 ) & ST=$!; fi
sleep 12; stamp browse; python3 /tmp/input.py browse; sleep 4; stamp rotate3; python3 /tmp/input.py rotate 3; sleep 4
stamp load1; python3 /tmp/input.py load 1; sleep 6; stamp play0; erp play 0
wait $CAP $QS $ST 2>/dev/null
sudo -n perf script -f -F time,event,trace -i "$OUT/sched.data" 2>/dev/null > "$OUT/sched.txt"
sudo -n perf script -f -F time,event,ip,sym,dso -i "$OUT/sched.data" 2>/dev/null > "$OUT/sched-stacks.txt"
sudo -n perf script -f -F time,event,ip,sym,dso -i "$OUT/cpu.data" 2>/dev/null > "$OUT/cpu.txt"
echo "queues: $(wc -l < "$OUT/queues.txt")  strace: $(wc -l < "$OUT/strace.txt" 2>/dev/null || echo 0)  sched: $(wc -l < "$OUT/sched.txt")"
