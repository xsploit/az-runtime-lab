#!/bin/bash
set -eu
cd /home/pompu_5/az-native-lab
launcher=""
restore() {
 if [ -n "$launcher" ] && kill -0 "$launcher" 2>/dev/null; then
  wait "$launcher" || true
 fi
 XDG_RUNTIME_DIR=/run/user/1000 WAYLAND_DISPLAY=wayland-1 nohup /usr/local/bin/pflx-bitedj-supervisor > bite-restore.log 2>&1 < /dev/null &
}
trap restore EXIT
kill -TERM "$(cat /run/user/1000/pflx-bitedj.pid)"
for i in {1..30}; do
 if ! pgrep -x mixxx >/dev/null; then break; fi
 sleep .1
done
if pgrep -x mixxx >/dev/null; then echo 'BiteDJ did not stop'; exit 1; fi
LAB_PI_JEMALLOC=/home/pompu_5/az-native-lab/libjemalloc-pi.so.2 NULL_AUDIO=1 OFFLINE_MIDI=1 PACED_AUDIO=1 USB_FIXTURE=1 MIXER_FIXTURE=1 ERP_FIXTURE=1 USB_FIXTURE_PATH=/home/pompu_5/az-native-lab/benchmark-usb LAB_DURATION_SECONDS=70 python3 run-az-pi-probe.py > native-launch.log 2>&1 &
launcher=$!
sleep 15
python3 pi-az-two-input.py
sleep 3
display=$(python3 -c 'import json; print(next(json.loads(x)["display"] for x in open("native-launch.log") if "display" in x))')
ffmpeg -y -loglevel error -f x11grab -video_size 1280x800 -i "$display" -frames:v 1 az-two-before.png
pid=$(pgrep -x EP147 | head -1 || true)
if [ -n "$pid" ]; then python3 pi-sample.py "$pid" 20 > az-two-benchmark.json; fi
ffmpeg -y -loglevel error -f x11grab -video_size 1280x800 -i "$display" -frames:v 1 az-two-after.png
wait "$launcher"
