#!/bin/sh
# X-server-only RR 12 validation, unattended: (1) a second six-load A/B/A,
# (2) a sustained A/B/A (8 alternating-deck loads 120 s apart, ~16 min per
# arm) with underruns, load->waveform latency and steady-state intervals per
# arm. Both through scheduling-aba.sh xonly (priority re-asserted and
# verified per arm; everything restored on exit). Arm rollback-watchdog.sh
# with a long enough timeout first (the sustained A/B/A takes ~60 min).
set -u
LAB=${AZ_LAB:-$HOME/az-native-lab}; cd "$LAB"; export AZ_LAB=$LAB
LOG=$LAB/local/xonly-validation-$(date +%Y%m%dT%H%M%SZ).log; exec >"$LOG" 2>&1; echo "log=$LOG"
echo "## six-load A/B/A"
CAPTURE=/tmp/multi-load-capture.sh LOADS=6 sh /tmp/scheduling-aba.sh xonly 2>&1 | grep -E "^=== arm|applied|totals|underruns|load[35]:" | sed 's/^/## /'
echo "## sustained A/B/A"
CAPTURE=/tmp/multi-load-capture.sh LOADS=8 PERIOD=120 LOAD_WAIT=12 ALTERNATE=1 sh /tmp/scheduling-aba.sh xonly 2>&1 | grep -E "^=== arm|applied|totals|underruns" | sed 's/^/## /'
# steady-state summary of the three sustained captures (newest three multi-load dirs), oldest first
for d in $(ls -1dt "$LAB"/local/multi-load-2026* | head -3 | sort); do
  s=$(ls -1dt "$LAB"/local/session-2026* | while read x; do [ "$x" \< "$d" ] && echo "$x"; done | head -1)
  echo "## sustained $d"; python3 analysis/summarize_steady.py "$d" "$s" 2>&1 | head -2 | sed 's/^/## /'; python3 analysis/attribute_multi_load.py "$d" 2>&1 | sed 's/^/## /'
done
echo "## run complete"
