#!/bin/bash
set -eu
cd /home/pompu_5/az-native-lab
export XDG_RUNTIME_DIR=/run/user/1000 WAYLAND_DISPLAY=wayland-1
export SWAYSOCK=$(echo /run/user/1000/sway-ipc.*.sock)
child=''
restore(){
 if [ -n "$child" ]; then kill -TERM "$child" 2>/dev/null || true; wait "$child" 2>/dev/null || true; fi
 nohup /usr/local/bin/pflx-bitedj-supervisor > bite-restore.log 2>&1 < /dev/null &
}
trap restore EXIT
kill -TERM "$(cat /run/user/1000/pflx-bitedj.pid)"
sleep 2
if pgrep -x mixxx >/dev/null; then exit 1; fi
taskset -c 0,1,2 /usr/local/bin/mixxx --settings-path /home/pompu_5/.mixxx --resource-path /usr/local/share/mixxx --log-level warning benchmark-usb/01-Estara.mp3 benchmark-usb/02-Dead-Wrong.mp3 > bite-two.log 2>&1 &
child=$!
sleep 15
swaymsg '[app_id="org.mixxx.Mixxx"] focus' >/dev/null || true
swaymsg 'seat - cursor set 442 28' >/dev/null
swaymsg 'seat - cursor press button1' >/dev/null
swaymsg 'seat - cursor release button1' >/dev/null
wtype -k d -k l
sleep 5
grim bite-two-before.png
python3 pi-sample.py "$child" 20 > bite-two-benchmark.json
grim bite-two-after.png
