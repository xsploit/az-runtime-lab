#!/bin/sh
# Sustained two-deck playback capture on the RUNNING session (start it fresh
# first; the session must be on its SOURCE page for load-two.sh). Damage and
# page samplers only. SECS default 1200. Honours NO_KIOSK / AZ_DISPLAY for
# the bare-Xorg arm. Summarise with summarize_steady.py DIR SESSIONDIR.
set -u
LAB=${AZ_LAB:-$HOME/az-native-lab}; cd "$LAB"; SECS=${SECS:-1200}
export AZ_LAB=$LAB XDG_RUNTIME_DIR=/run/user/$(id -u) WAYLAND_DISPLAY=wayland-1
OUT=$LAB/local/steady-$(date +%Y%m%dT%H%M%SZ); mkdir -p "$OUT"; echo "outdir=$OUT"; echo "$OUT" > /tmp/last-capture-dir
[ "${SKIP_LOAD:-0}" = 1 ] || { sh /tmp/load-two.sh >/dev/null 2>&1; sleep 5; }
XP="$(pgrep -n -x Xwayland || pgrep -n -x Xorg) $(pgrep -n -x sway)"
SKIP_PERF=1 NO_KIOSK=${NO_KIOSK:-0} EXTRA_PID="$XP" sh analysis/capture_waveform_gap.sh "$OUT" "$SECS" > "$OUT/capture.log" 2>&1; tail -1 "$OUT/capture.log"
s=$(ls -1dt "$LAB"/local/session-* | head -1); python3 analysis/summarize_steady.py "$OUT" "$s"
echo "  ep147: $(grep -o 'ep147_pct=[0-9]*' "$OUT/meta.txt") temp: $(cat /sys/class/thermal/thermal_zone0/temp)"
