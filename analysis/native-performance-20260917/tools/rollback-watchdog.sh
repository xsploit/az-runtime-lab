#!/bin/sh
# Independent timed rollback: after SECS restore kiosk files and reset any live
# EP147 main thread / Xwayland to RR 1 and irq 111 to the default mask.
# Start with: nohup setsid sh rollback-watchdog.sh 1500 >/dev/null 2>&1 </dev/null &
SECS=${1:-1500}; LAB=${AZ_LAB:-$HOME/az-native-lab}; B=$LAB/local/kiosk-swap-backup
sleep "$SECS"
for pid in $(pgrep -x EP147) $(pgrep -x Xwayland); do sudo -n chrt -r -p 1 "$pid" 2>/dev/null; done
echo 3 | sudo -n tee /proc/irq/111/smp_affinity >/dev/null 2>&1
for f in pflx-mode-menu pflx-az-session start-pflx-kiosk; do [ -f "$B/$f" ] && sudo -n install -m 0755 "$B/$f" "/usr/local/bin/$f"; done
echo "$(date -u +%FT%TZ) watchdog rollback done" >> "$LAB/local/watchdog.log"
