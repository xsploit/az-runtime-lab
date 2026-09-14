#!/bin/bash
set -eu
AZ_SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
AZ_LAB_ROOT=${AZ_LAB_ROOT:-$(CDPATH= cd -- "$AZ_SCRIPT_DIR/.." && pwd)}
export AZ_LAB_ROOT
: "${LAB_PI_JEMALLOC:?Set LAB_PI_JEMALLOC explicitly; see PORTABILITY.md}"
: "${USB_FIXTURE_PATH:?Set USB_FIXTURE_PATH explicitly; see PORTABILITY.md}"
: "${XDG_RUNTIME_DIR:?Set XDG_RUNTIME_DIR explicitly; see PORTABILITY.md}"
: "${WAYLAND_DISPLAY:?Set WAYLAND_DISPLAY explicitly; see PORTABILITY.md}"
: "${BITE_SUPERVISOR_PID:?Set BITE_SUPERVISOR_PID explicitly; see PORTABILITY.md}"
: "${BITE_SUPERVISOR:?Set BITE_SUPERVISOR explicitly; see PORTABILITY.md}"
cd "$AZ_LAB_ROOT"
launcher=""
restore() {
 if [ -n "$launcher" ] && kill -0 "$launcher" 2>/dev/null; then
  wait "$launcher" || true
 fi
 XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" WAYLAND_DISPLAY="$WAYLAND_DISPLAY" nohup "$BITE_SUPERVISOR" > bite-restore.log 2>&1 < /dev/null &
}
trap restore EXIT
kill -TERM "$BITE_SUPERVISOR_PID"
for i in {1..30}; do
 if ! pgrep -x mixxx >/dev/null; then break; fi
 sleep .1
done
if pgrep -x mixxx >/dev/null; then echo 'BiteDJ did not stop'; exit 1; fi
LAB_PI_JEMALLOC="$LAB_PI_JEMALLOC" NULL_AUDIO=1 OFFLINE_MIDI=1 PACED_AUDIO=1 USB_FIXTURE=1 MIXER_FIXTURE=1 ERP_FIXTURE=1 USB_FIXTURE_PATH="$USB_FIXTURE_PATH" LAB_DURATION_SECONDS=70 python3 run-az-pi-probe.py > native-launch.log 2>&1 &
launcher=$!
sleep 15
python3 analysis/pi-az-two-input.py
sleep 3
display=$(python3 -c 'import json; print(next(json.loads(x)["display"] for x in open("native-launch.log") if "display" in x))')
ffmpeg -y -loglevel error -f x11grab -video_size 1280x800 -i "$display" -frames:v 1 az-two-before.png
pid=$(pgrep -x EP147 | head -1 || true)
if [ -n "$pid" ]; then python3 analysis/pi-sample.py "$pid" 20 > az-two-benchmark.json; fi
ffmpeg -y -loglevel error -f x11grab -video_size 1280x800 -i "$display" -frames:v 1 az-two-after.png
wait "$launcher"
