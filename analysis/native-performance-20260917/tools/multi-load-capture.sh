#!/bin/sh
# Repeated cached-track loads inside ONE fresh session (validation of a
# scheduling knob over several loads, not one). Fresh AZ via the kiosk loop,
# two decks playing, then LOADS iterations of browse -> rotate 1 -> LOAD deck1
# -> PLAY, each stamped on CLOCK_MONOTONIC into commands.json, under the damage
# and page samplers only (SKIP_PERF=1; set SKIP_PERF=0 for stacks too).
# Requires --no-controller. Analyse with attribute_multi_load.py.
set -u
LAB=${AZ_LAB:-$HOME/az-native-lab}; PP=$LAB:$LAB/analysis:$LAB/mixer; cd "$LAB"
LOADS=${LOADS:-6}; PERIOD=${PERIOD:-18}; SECS=$((15+LOADS*PERIOD))
export AZ_LAB=$LAB SWAYSOCK=$(ls /run/user/$(id -u)/sway-ipc.* 2>/dev/null | head -1) XDG_RUNTIME_DIR=/run/user/$(id -u) WAYLAND_DISPLAY=wayland-1
OUT=$LAB/local/multi-load-$(date +%Y%m%dT%H%M%SZ); mkdir -p "$OUT"; echo "outdir=$OUT"; echo "$OUT" > /tmp/last-capture-dir
OLDX="$(pgrep -x Xwayland | tr '\n' ' ')"
sup=$(ps -eo pid,args | awk '/python3 pi\/session.py/ && /session-library.json/ && !/awk/{print $1; exit}'); [ -n "$sup" ] && kill -TERM "$sup"
i=0; while [ $i -lt 30 ]; do sleep 1; pgrep -x EP147 >/dev/null || break; i=$((i+1)); done
i=0; while [ $i -lt 40 ]; do alive=0; for p in $OLDX; do kill -0 $p 2>/dev/null && alive=1; done; [ $alive = 0 ] && break; sleep 1; i=$((i+1)); done
echo "previous Xwayland ($OLDX) gone after ${i}s"
# RELAUNCH: a command that starts the next session when there is no kiosk loop
# to do it (bare-Xorg experiment); default relies on the kiosk's stub menu.
[ -n "${RELAUNCH:-}" ] && { nohup setsid sh -c "$RELAUNCH" >/dev/null 2>&1 </dev/null & }
i=0; while [ $i -lt 60 ]; do sleep 2; pgrep -x EP147 >/dev/null && break; i=$((i+1)); done
sleep 20; sh /tmp/load-two.sh >/dev/null 2>&1; sleep 5
grim "$OUT/before.png" 2>/dev/null || xwd -display ${AZ_DISPLAY:-:0} -root -silent > "$OUT/before.xwd" 2>/dev/null; echo "before frame: $(stat -c%s "$OUT"/before.* 2>/dev/null | head -1) B"
stamp() { python3 -c "import time,json,sys;print(json.dumps({'command':sys.argv[1],'at':time.monotonic()}))" "$1" >> "$OUT/commands.json"; }
erp() { sudo -n env PYTHONPATH=$PP python3 analysis/send-erp-button.py --button "$1" --group "$2" >/dev/null 2>&1; }
XP="$(pgrep -n -x Xwayland) $(pgrep -n -x sway)"; echo "sched filter extra: $XP"
( SKIP_PERF=${SKIP_PERF:-1} EXTRA_PID="${EXTRA_PID:-$XP}" sh analysis/capture_waveform_gap.sh "$OUT" "$SECS" > "$OUT/capture.log" 2>&1 ) & CAP=$!
sleep 10
n=1; while [ $n -le $LOADS ]; do
  stamp browse$n; python3 /tmp/input.py browse;   sleep 4
  stamp rotate$n; python3 /tmp/input.py rotate 1; sleep 3
  stamp load$n;   python3 /tmp/input.py load 1;   sleep 5
  stamp play$n;   erp play 0;                      sleep $((PERIOD-12))
  n=$((n+1))
done
wait $CAP; tail -1 "$OUT/capture.log"
grim "$OUT/after.png" 2>/dev/null || xwd -display ${AZ_DISPLAY:-:0} -root -silent > "$OUT/after.xwd" 2>/dev/null; echo "after frame: $(stat -c%s "$OUT"/after.* 2>/dev/null | head -1) B"
