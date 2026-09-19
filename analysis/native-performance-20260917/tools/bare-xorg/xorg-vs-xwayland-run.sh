#!/bin/sh
# Second bare-Xorg comparison, unattended: for each X server, one six-load
# capture on a fresh session, then a sustained capture on the same session
# (8 alternating-deck loads 150 s apart, ~20 min). Order: Xorg first (the
# kiosk is stopped for it), then Xwayland through the kiosk. Logs to
# $LAB/local/xorg-vs-xwayland-<stamp>.log; the summary lines are prefixed '##'.
set -u
LAB=${AZ_LAB:-$HOME/az-native-lab}; B=$LAB/local/kiosk-swap-backup; cd "$LAB"; export AZ_LAB=$LAB
LOG=$LAB/local/xorg-vs-xwayland-$(date +%Y%m%dT%H%M%SZ).log; exec >"$LOG" 2>&1; echo "log=$LOG"
cleanup() { pgrep -x Xorg >/dev/null && sh /tmp/bare-xorg-arm.sh stop; for f in pflx-mode-menu pflx-az-session start-pflx-kiosk; do sudo -n install -m 0755 "$B/$f" "/usr/local/bin/$f"; done; echo "## cleanup done"; }
trap cleanup EXIT INT TERM
capture_pair() {  # $1 = label ; env NO_KIOSK/AZ_DISPLAY set by caller
  FRESH=1 LOADS=6 sh /tmp/multi-load-capture.sh | grep -E "outdir|done|need|count|no EP147"
  OUT=$(cat /tmp/last-capture-dir); echo "## $1 six-load: $(grep -o 'ep147_pct=[0-9]*' "$OUT/meta.txt")"; python3 analysis/attribute_multi_load.py "$OUT" | sed 's/^/## /'
  FRESH=1 SKIP_LOAD=1 ALTERNATE=1 LOADS=8 PERIOD=150 sh /tmp/multi-load-capture.sh | grep -E "outdir|done|need|count|no EP147"
  OUT=$(cat /tmp/last-capture-dir); s=$(ls -1dt "$LAB"/local/session-* | head -1)
  echo "## $1 sustained: $(grep -o 'ep147_pct=[0-9]*' "$OUT/meta.txt") temp=$(cat /sys/class/thermal/thermal_zone0/temp)"; python3 analysis/summarize_steady.py "$OUT" "$s" | sed 's/^/## /'; python3 analysis/attribute_multi_load.py "$OUT" | tail -1 | sed 's/^/## /'
}
# --- bare Xorg ---
sh /tmp/bare-xorg-arm.sh start | tail -3; sleep 45
echo "## xorg session: EP147=$(pgrep -xc EP147) Xorg=$(pgrep -xc Xorg) Xwayland=$(pgrep -xc Xwayland) display=$(tr '\0' '\n' </proc/$(pgrep -x EP147)/environ 2>/dev/null | grep ^DISPLAY)"
NO_KIOSK=1 AZ_DISPLAY=:1 capture_pair xorg
sh /tmp/bare-xorg-arm.sh stop | tail -1
# --- Xwayland via the kiosk: stub menu must be in place before the menu's countdown ends ---
printf '#!/bin/sh\necho az\n' > /tmp/stub-menu; sudo -n install -m 0755 /tmp/stub-menu /usr/local/bin/pflx-mode-menu
sed 's|\$drop python3 pi/session.py "\$config" >>|\$drop python3 pi/session.py "\$config" --no-controller >>|' "$B/pflx-az-session" > /tmp/az-nc; sudo -n install -m 0755 /tmp/az-nc /usr/local/bin/pflx-az-session
i=0; while [ $i -lt 60 ]; do pgrep -x pflx-mode-menu >/dev/null && { pkill -x pflx-mode-menu; break; }; pgrep -x EP147 >/dev/null && break; sleep 1; i=$((i+1)); done
i=0; while [ $i -lt 60 ]; do sleep 2; pgrep -x EP147 >/dev/null && break; i=$((i+1)); done; sleep 25
sudo -n install -m 0755 "$B/pflx-mode-menu" /usr/local/bin/pflx-mode-menu
echo "## xwayland session: EP147=$(pgrep -xc EP147) Xwayland=$(pgrep -xc Xwayland) mixxx=$(pgrep -xc mixxx) kiosks=$(ps -eo args | grep -c '[/]bin/sh /usr/local/bin/start-pflx-kiosk') prio=$(chrt -p $(pgrep -x EP147) 2>/dev/null | tail -1 | awk '{print $NF}')"
capture_pair xwayland
sudo -n install -m 0755 "$B/pflx-az-session" /usr/local/bin/pflx-az-session
echo "## run complete"
