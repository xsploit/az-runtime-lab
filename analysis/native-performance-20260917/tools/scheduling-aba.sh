#!/bin/sh
# One-knob A/B/A over load-span-capture.sh. KNOB selects what arm B changes;
# A arms run defaults. Usage: sh scheduling-aba.sh irq|audio|renderer|joint
# irq: irq 111 -> CPU 3; audio: mix-stream+aplay -> CPU 3; renderer: EP147
# main RR 12; joint: EP147 main AND Xwayland RR 12; noglamor: session config
# xwayland_glamor=off for arm B (Xwayland software rendering, no V3D BOs);
# jointnoglamor: EP147 main AND Xwayland RR 12 in EVERY arm, glamor off only in
# arm B (isolates the V3D path once X is no longer starved). Everything is
# reverted on exit; arm rollback-watchdog.sh separately before running.
set -u
KNOB=${1:?irq|audio|renderer|joint|noglamor|jointnoglamor}; LAB=${AZ_LAB:-$HOME/az-native-lab}; B=$LAB/local/kiosk-swap-backup
printf '#!/bin/sh\necho az\n' > /tmp/stub-menu; sudo -n install -m 0755 /tmp/stub-menu /usr/local/bin/pflx-mode-menu
sed 's|\$drop python3 pi/session.py "\$config" >>|\$drop python3 pi/session.py "\$config" --no-controller >>|' "$B/pflx-az-session" > /tmp/az-nc; sudo -n install -m 0755 /tmp/az-nc /usr/local/bin/pflx-az-session
sed 's|mode=bitedj$|mode=az|' "$B/start-pflx-kiosk" > /tmp/kiosk-az; sudo -n install -m 0755 /tmp/kiosk-az /usr/local/bin/start-pflx-kiosk
setglamor() { python3 - "$1" <<'EOF'
import json,sys
from pathlib import Path
p=Path("local/session-library.json");c=json.loads(p.read_text());c["xwayland_glamor"]=(None if sys.argv[1]=="null" else sys.argv[1]);p.write_text(json.dumps(c,indent=2))
EOF
}
restore() { for f in pflx-mode-menu pflx-az-session start-pflx-kiosk; do sudo -n install -m 0755 "$B/$f" "/usr/local/bin/$f"; done; echo 3 | sudo -n tee /proc/irq/111/smp_affinity >/dev/null; (cd "$LAB" && setglamor null); echo "restored"; }
trap restore EXIT INT TERM
apply() {  # $1 = on|off ; applied to fresh processes as they appear
  on=$1; seen=""; end=$(( $(date +%s) + 200 ))
  while [ $(date +%s) -lt $end ]; do
    case $KNOB in
      irq) [ "$on" = on ] && echo 8 | sudo -n tee /proc/irq/111/smp_affinity >/dev/null || echo 3 | sudo -n tee /proc/irq/111/smp_affinity >/dev/null; sleep 5; continue;;
      audio) pids=$(pgrep -x aplay; pgrep -x mix-stream); mask=$([ "$on" = on ] && echo 8 || echo 3)
             for p in $pids; do case " $seen " in *" $p "*) ;; *) sudo -n taskset -p $mask $p >/dev/null 2>&1; seen="$seen $p";; esac; done;;
      renderer) for p in $(pgrep -x EP147); do case " $seen " in *" $p "*) ;; *) [ "$on" = on ] && sudo -n chrt -r -p 12 $p >/dev/null 2>&1; seen="$seen $p";; esac; done;;
      joint) for p in $(pgrep -x EP147) $(pgrep -n -x Xwayland); do case " $seen " in *" $p "*) ;; *) [ "$on" = on ] && sudo -n chrt -r -p 12 $p >/dev/null 2>&1; seen="$seen $p";; esac; done;;
      jointnoglamor) for p in $(pgrep -x EP147) $(pgrep -n -x Xwayland); do case " $seen " in *" $p "*) ;; *) sudo -n chrt -r -p 12 $p >/dev/null 2>&1; seen="$seen $p";; esac; done;;
    esac; sleep 0.5
  done
}
arm() {
  label=$1; on=$2
  case $KNOB in noglamor|jointnoglamor) (cd "$LAB" && setglamor "$([ "$on" = on ] && echo off || echo null)");; esac
  apply "$on" & HOOK=$!
  sh /tmp/load-span-capture.sh > "/tmp/arm-$label.log" 2>&1; kill $HOOK 2>/dev/null
  OUT=$(cat /tmp/last-capture-dir); echo "=== arm $label knob=$KNOB on=$on"
  XL=$(pgrep -n -x Xwayland); echo "  xwayland cmdline: $(tr '\0' ' ' < /proc/$XL/cmdline | grep -o -- '-glamor [a-z]*' || echo default)"; echo "  applied: renderer=$(chrt -p $(pgrep -x EP147) 2>/dev/null | tail -1 | awk '{print $NF}') xwayland(pid $XL)=$(chrt -p $XL 2>/dev/null | tail -1 | awk '{print $NF}') n_xwayland=$(pgrep -xc Xwayland) irq111=$(cat /proc/irq/111/smp_affinity) $(grep -o "sched filter extra: .*" /tmp/arm-$label.log)"
  grep -E "player=|before frame|after frame" "/tmp/arm-$label.log" | tr '\n' ' '; echo
  python3 "$LAB/analysis/attribute_load_span.py" "$OUT" 3 2>/dev/null | python3 -c "
import json,sys;r=json.load(sys.stdin);w=r.get('waveform_stats',{})
print(f\"  waveform: n={w.get('n')} max={w.get('max')} over25={w.get('over25')} over40={w.get('over40')}\")
for g in r.get('largest_waveform',[])[:3]: print(f\"    t={g['t_rel_load']:+7.3f}s gap={g['gap_ms']:5.1f}ms oncpu={g['oncpu']}/{g['expected']} states={g['prev_states']}\")"
  s=$(ls -1dt "$LAB"/local/session-* | head -1); echo "  underruns: $(grep -ic underrun "$s/audio-events.jsonl")  temp: $(cat /sys/class/thermal/thermal_zone0/temp)"
}
arm A1 off; arm B on; arm A2 off
