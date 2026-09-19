#!/bin/sh
# Capture ACROSS a track load: fresh AZ via the kiosk loop, two decks playing,
# then inside the 60 s window browse -> rotate 3 -> LOAD deck1 -> PLAY, each
# stamped on CLOCK_MONOTONIC into commands.json. Requires --no-controller.
set -u
LAB=${AZ_LAB:-$HOME/az-native-lab}; PP=$LAB:$LAB/analysis:$LAB/mixer; cd "$LAB"
export AZ_LAB=$LAB SWAYSOCK=$(ls /run/user/$(id -u)/sway-ipc.* | head -1) XDG_RUNTIME_DIR=/run/user/$(id -u) WAYLAND_DISPLAY=wayland-1
OUT=$LAB/local/load-span-$(date +%Y%m%dT%H%M%SZ); mkdir -p "$OUT"; echo "outdir=$OUT"; echo "$OUT" > /tmp/last-capture-dir
OLDX="$(pgrep -x Xwayland | tr '\n' ' ')"
sup=$(pgrep -f "pi/session.py .*session-library.json" | head -1); [ -n "$sup" ] && kill -TERM "$sup"
i=0; while [ $i -lt 30 ]; do sleep 1; pgrep -x EP147 >/dev/null || break; i=$((i+1)); done
# The previous session's Xwayland lingers well after EP147 exits; wait for it so
# pgrep cannot hand a stale PID to the sched filters or the priority hook.
i=0; while [ $i -lt 40 ]; do alive=0; for p in $OLDX; do kill -0 $p 2>/dev/null && alive=1; done; [ $alive = 0 ] && break; sleep 1; i=$((i+1)); done
echo "previous Xwayland ($OLDX) gone after ${i}s"
i=0; while [ $i -lt 60 ]; do sleep 2; pgrep -x EP147 >/dev/null && break; i=$((i+1)); done
sleep 20; sh /tmp/load-two.sh >/dev/null 2>&1; sleep 5
grim "$OUT/before.png" 2>/dev/null; echo "before frame: $(stat -c%s "$OUT/before.png") B"
stamp() { python3 -c "import time,json,sys;print(json.dumps({'command':sys.argv[1],'at':time.monotonic()}))" "$1" >> "$OUT/commands.json"; }
erp() { sudo -n env PYTHONPATH=$PP python3 analysis/send-erp-button.py --button "$1" --group "$2" >/dev/null 2>&1; }
# Xwayland is per-session: resolve it now (after the fresh launch), not from the caller.
XP="$(pgrep -n -x Xwayland) $(pgrep -n -x sway)"; echo "sched filter extra: $XP"
( EXTRA_PID="${EXTRA_PID:-$XP}" sh analysis/capture_waveform_gap.sh "$OUT" 60 > "$OUT/capture.log" 2>&1 ) & CAP=$!
sleep 12
stamp browse;  python3 /tmp/input.py browse;   sleep 4
stamp rotate3; python3 /tmp/input.py rotate 3; sleep 4
stamp load1;   python3 /tmp/input.py load 1;   sleep 6
stamp play0;   erp play 0
wait $CAP; tail -2 "$OUT/capture.log"
sudo -n perf script -f -F time,event,ip,sym,dso -i "$OUT/cpu.data" > "$OUT/cpu.txt" 2>/dev/null
sudo -n perf script -f -F time,event,trace -i "$OUT/sched.data" 2>/dev/null | grep -E "sched_switch|sched_wakeup|block_rq_issue" > "$OUT/sched.txt"
grim "$OUT/after.png" 2>/dev/null; echo "after frame: $(stat -c%s "$OUT/after.png") B"
