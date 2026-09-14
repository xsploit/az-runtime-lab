#!/bin/bash
set -eu
AZ_SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
AZ_LAB_ROOT=${AZ_LAB_ROOT:-$(CDPATH= cd -- "$AZ_SCRIPT_DIR/.." && pwd)}
export AZ_LAB_ROOT
: "${BITE_SUPERVISOR_PID:?Set BITE_SUPERVISOR_PID explicitly; see PORTABILITY.md}"
: "${BITE_SUPERVISOR:?Set BITE_SUPERVISOR explicitly; see PORTABILITY.md}"
: "${XDG_RUNTIME_DIR:?Set XDG_RUNTIME_DIR explicitly; see PORTABILITY.md}"
: "${WAYLAND_DISPLAY:?Set WAYLAND_DISPLAY explicitly; see PORTABILITY.md}"
: "${BITE_BINARY:?Set BITE_BINARY explicitly; see PORTABILITY.md}"
: "${BITE_SETTINGS:?Set BITE_SETTINGS explicitly; see PORTABILITY.md}"
: "${BITE_RESOURCES:?Set BITE_RESOURCES explicitly; see PORTABILITY.md}"
: "${BITE_TRACK_ONE:?Set BITE_TRACK_ONE explicitly; see PORTABILITY.md}"
: "${BITE_TRACK_TWO:?Set BITE_TRACK_TWO explicitly; see PORTABILITY.md}"
: "${SWAYSOCK:?Set SWAYSOCK explicitly; see PORTABILITY.md}"
cd "$AZ_LAB_ROOT"
export XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" WAYLAND_DISPLAY="$WAYLAND_DISPLAY"
: "${SWAYSOCK:?Run inside the intended Sway desktop session}"
child=''
restore(){
 if [ -n "$child" ]; then kill -TERM "$child" 2>/dev/null || true; wait "$child" 2>/dev/null || true; fi
 nohup "$BITE_SUPERVISOR" > bite-restore.log 2>&1 < /dev/null &
}
trap restore EXIT
kill -TERM "$BITE_SUPERVISOR_PID"
sleep 2
if pgrep -x mixxx >/dev/null; then exit 1; fi
taskset -c 0,1,2 "$BITE_BINARY" --settings-path "$BITE_SETTINGS" --resource-path "$BITE_RESOURCES" --log-level warning "$BITE_TRACK_ONE" "$BITE_TRACK_TWO" > bite-two.log 2>&1 &
child=$!
sleep 15
swaymsg '[app_id="org.mixxx.Mixxx"] focus' >/dev/null || true
swaymsg 'seat - cursor set 442 28' >/dev/null
swaymsg 'seat - cursor press button1' >/dev/null
swaymsg 'seat - cursor release button1' >/dev/null
wtype -k d -k l
sleep 5
grim bite-two-before.png
python3 analysis/pi-sample.py "$child" 20 > bite-two-benchmark.json
grim bite-two-after.png
