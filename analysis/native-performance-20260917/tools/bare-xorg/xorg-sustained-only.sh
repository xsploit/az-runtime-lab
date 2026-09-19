#!/bin/sh
# Bare-Xorg half of sustained-run.sh on its own (fresh session on Xorg :1,
# load-two, 8 alternating-deck loads 120 s apart), then restore the kiosk.
set -u
LAB=${AZ_LAB:-$HOME/az-native-lab}; B=$LAB/local/kiosk-swap-backup; cd "$LAB"; export AZ_LAB=$LAB
LOG=$LAB/local/sustained-xorg-$(date +%Y%m%dT%H%M%SZ).log; exec >"$LOG" 2>&1; echo "log=$LOG"
cleanup() { pgrep -x Xorg >/dev/null && sh /tmp/bare-xorg-arm.sh stop; for f in pflx-mode-menu pflx-az-session start-pflx-kiosk; do sudo -n install -m 0755 "$B/$f" "/usr/local/bin/$f"; done; echo "## cleanup done"; }
trap cleanup EXIT INT TERM
sh /tmp/bare-xorg-arm.sh start | tail -3; sleep 45
echo "## xorg session: EP147=$(pgrep -xc EP147) Xorg=$(pgrep -xc Xorg) Xwayland=$(pgrep -xc Xwayland)"
pgrep -x EP147 >/dev/null || { echo "## no session; abort"; tail -3 "$LAB/local/xorg-session.log"; exit 1; }
FRESH=1 NO_KIOSK=1 AZ_DISPLAY=:1 ALTERNATE=1 LOADS=8 PERIOD=120 LOAD_WAIT=12 sh /tmp/multi-load-capture.sh | grep -E "outdir|done|need|count|no EP147"
OUT=$(cat /tmp/last-capture-dir); s=$(ls -1dt "$LAB"/local/session-* | head -1)
echo "## xorg sustained: $(grep -o 'ep147_pct=[0-9]*' "$OUT/meta.txt" 2>/dev/null || head -1 "$OUT/capture.log") temp=$(cat /sys/class/thermal/thermal_zone0/temp) dir=$OUT"
python3 analysis/summarize_steady.py "$OUT" "$s" 2>&1 | sed 's/^/## /'; python3 analysis/attribute_multi_load.py "$OUT" 2>&1 | tail -1 | sed 's/^/## /'
echo "## run complete"
