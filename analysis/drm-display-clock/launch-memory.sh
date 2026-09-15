set -eu
AZ_SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
AZ_LAB_ROOT=${AZ_LAB_ROOT:-$(CDPATH= cd -- "$AZ_SCRIPT_DIR/../.." && pwd)}
export AZ_LAB_ROOT
: "${LAB_PI_JEMALLOC:?Set LAB_PI_JEMALLOC explicitly; see PORTABILITY.md}"
: "${USB_FIXTURE_PATH:?Set USB_FIXTURE_PATH explicitly; see PORTABILITY.md}"
: "${XDG_RUNTIME_DIR:?Set XDG_RUNTIME_DIR explicitly; see PORTABILITY.md}"
: "${WAYLAND_DISPLAY:?Set WAYLAND_DISPLAY explicitly; see PORTABILITY.md}"
cd "$AZ_LAB_ROOT"
mkdir -p analysis/panel-rate-test analysis/drm-display-clock
printf '59.24
' > analysis/panel-rate-test/rate.txt
nohup env XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" WAYLAND_DISPLAY="$WAYLAND_DISPLAY" PLAYER=xdjaz LAB_PI_JEMALLOC="$LAB_PI_JEMALLOC" OFFLINE_MIDI=1 NULL_AUDIO=1 PACED_AUDIO=1 USB_FIXTURE=1 USB_FIXTURE_PATH="$USB_FIXTURE_PATH" MIXER_FIXTURE=1 ERP_FIXTURE=1 XIMAGE_FAST24=1 LAB_XIMAGE_PRESENT=1 LAB_AZ_SMOOTH_SCROLL=1 LAB_AZ_FRACTIONAL_GRID=1 LAB_VSYNC_HZ=59.24 LAB_KEEP_OPEN=1 LAB_TIMING_RATE_FILE="$AZ_LAB_ROOT/analysis/panel-rate-test/rate.txt" LAB_TIMING_TMPFS=1 python3 analysis/drm-display-clock/run-az-memory-clock.py > analysis/drm-display-clock/memory-launch.log 2>&1 < /dev/null &
echo $!
