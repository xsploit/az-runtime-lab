#!/bin/sh
# Trace the recurring load spikes under bare Xorg: fresh session on Xorg :1,
# six-load capture WITH perf stacks (main-thread on-CPU, sched switches and
# wakeups for EP147 main + Xorg), then stop Xorg, restore the kiosk, and only
# then (AZ down, memory free) run the per-load attribution for loads 3 and 5.
set -u
LAB=${AZ_LAB:-$HOME/az-native-lab}; B=$LAB/local/kiosk-swap-backup; cd "$LAB"; export AZ_LAB=$LAB
LOG=$LAB/local/xorg-trace-$(date +%Y%m%dT%H%M%SZ).log; exec >"$LOG" 2>&1; echo "log=$LOG"
cleanup() { pgrep -x Xorg >/dev/null && sh /tmp/bare-xorg-arm.sh stop; for f in pflx-mode-menu pflx-az-session start-pflx-kiosk; do sudo -n install -m 0755 "$B/$f" "/usr/local/bin/$f"; done; echo "## cleanup done"; }
cleaned=; cleanup_once() { [ -n "$cleaned" ] && return; cleaned=1; cleanup; }
trap 'cleanup_once; exit 130' INT TERM; trap cleanup_once EXIT
sh /tmp/bare-xorg-arm.sh start | tail -2; sleep 45
echo "## xorg session: EP147=$(pgrep -xc EP147) Xorg=$(pgrep -xc Xorg)"
pgrep -x EP147 >/dev/null || { echo "## no session; abort"; exit 1; }
FRESH=1 NO_KIOSK=1 AZ_DISPLAY=:1 SKIP_PERF=0 LOADS=6 sh /tmp/multi-load-capture.sh | grep -E "outdir|done|need|count|no EP147"
OUT=$(cat /tmp/last-capture-dir); echo "## capture $OUT: $(grep -o 'ep147_pct=[0-9]*' "$OUT/meta.txt") $(ls -la "$OUT" | awk '{s+=$5} END{print s/1e6 " MB"}')"
python3 analysis/attribute_multi_load.py "$OUT" | sed 's/^/## /'
sh /tmp/bare-xorg-arm.sh stop | tail -1; pgrep -x Xorg >/dev/null || echo "## xorg stopped"
sleep 10
for n in 3 5; do echo "## attribution load$n"; python3 analysis/attribute_load_span.py "$OUT" 4 --load $n 2>&1 | python3 -c "
import json,sys
r=json.load(sys.stdin);w=r.get('waveform_stats',{})
print('  waveform: n=%s max=%s over25=%s over40=%s'%(w.get('n'),w.get('max'),w.get('over25'),w.get('over40')))
for g in r.get('largest_waveform',[])[:4]:print('  t=%+7.3fs gap=%5.1fms oncpu=%s/%s states=%s disk=%s leaf=%s'%(g['t_rel_load'],g['gap_ms'],g['oncpu'],g['expected'],g['prev_states'],g.get('disk'),g.get('leaf')))
" | sed 's/^/## /'; done
echo "## run complete"
