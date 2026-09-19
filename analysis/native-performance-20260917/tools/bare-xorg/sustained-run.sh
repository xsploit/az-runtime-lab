#!/bin/sh
# Sustained comparison, unattended: for each X server a FRESH session, both
# decks started by load-two.sh, then 8 alternating-deck loads 120 s apart
# under the damage/page samplers (~16 min). Xwayland first (kiosk), then bare
# Xorg. Log: $LAB/local/sustained-<stamp>.log, summary lines prefixed '##'.
set -u
LAB=${AZ_LAB:-$HOME/az-native-lab}; B=$LAB/local/kiosk-swap-backup; cd "$LAB"; export AZ_LAB=$LAB
LOG=$LAB/local/sustained-$(date +%Y%m%dT%H%M%SZ).log; exec >"$LOG" 2>&1; echo "log=$LOG"
cleanup() { pgrep -x Xorg >/dev/null && sh /tmp/bare-xorg-arm.sh stop; for f in pflx-mode-menu pflx-az-session start-pflx-kiosk; do sudo -n install -m 0755 "$B/$f" "/usr/local/bin/$f"; done; echo "## cleanup done"; }
trap cleanup EXIT INT TERM
summarise() { OUT=$(cat /tmp/last-capture-dir); s=$(ls -1dt "$LAB"/local/session-* | head -1); echo "## $1 sustained: $(grep -o 'ep147_pct=[0-9]*' "$OUT/meta.txt" 2>/dev/null || cat "$OUT/capture.log" | head -1) temp=$(cat /sys/class/thermal/thermal_zone0/temp) dir=$OUT"; python3 analysis/summarize_steady.py "$OUT" "$s" 2>&1 | sed 's/^/## /'; python3 analysis/attribute_multi_load.py "$OUT" 2>&1 | tail -1 | sed 's/^/## /'; }
# --- Xwayland: fresh session through the kiosk (stub menu, no-controller) ---
printf '#!/bin/sh\necho az\n' > /tmp/stub-menu; sudo -n install -m 0755 /tmp/stub-menu /usr/local/bin/pflx-mode-menu
sed 's|\$drop python3 pi/session.py "\$config" >>|\$drop python3 pi/session.py "\$config" --no-controller >>|' "$B/pflx-az-session" > /tmp/az-nc; sudo -n install -m 0755 /tmp/az-nc /usr/local/bin/pflx-az-session
sup=$(ps -eo pid,args | awk '/python3 pi\/session.py/ && /session-library.json/ && !/awk/{print $1; exit}'); [ -n "$sup" ] && kill -TERM "$sup"
pgrep -x pflx-mode-menu >/dev/null && pkill -x pflx-mode-menu
for p in $(ps -eo pid,args | awk '/pflx-bitedj-supervisor/ && !/awk/{print $1}'); do kill "$p"; done; pkill -x mixxx 2>/dev/null
i=0; while [ $i -lt 30 ]; do pgrep -x EP147 >/dev/null || break; sleep 1; i=$((i+1)); done
i=0; while [ $i -lt 60 ]; do sleep 2; pgrep -x EP147 >/dev/null && break; i=$((i+1)); done; sleep 25
sudo -n install -m 0755 "$B/pflx-mode-menu" /usr/local/bin/pflx-mode-menu
echo "## xwayland session: EP147=$(pgrep -xc EP147) Xwayland=$(pgrep -xc Xwayland) prio=$(chrt -p $(pgrep -x EP147) 2>/dev/null | tail -1 | awk '{print $NF}')"
FRESH=1 ALTERNATE=1 LOADS=8 PERIOD=120 LOAD_WAIT=12 sh /tmp/multi-load-capture.sh | grep -E "outdir|done|need|count|no EP147"; summarise xwayland
sudo -n install -m 0755 "$B/pflx-az-session" /usr/local/bin/pflx-az-session
# --- bare Xorg: fresh session attached to Xorg :1 ---
sh /tmp/bare-xorg-arm.sh start | tail -2; sleep 45
echo "## xorg session: EP147=$(pgrep -xc EP147) Xorg=$(pgrep -xc Xorg) Xwayland=$(pgrep -xc Xwayland)"
FRESH=1 NO_KIOSK=1 AZ_DISPLAY=:1 ALTERNATE=1 LOADS=8 PERIOD=120 LOAD_WAIT=12 sh /tmp/multi-load-capture.sh | grep -E "outdir|done|need|count|no EP147"; summarise xorg
sh /tmp/bare-xorg-arm.sh stop | tail -1
echo "## run complete"
