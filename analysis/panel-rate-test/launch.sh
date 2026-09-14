set -eu
cd /home/pompu_5/az-native-lab
mkdir -p analysis/panel-rate-test
printf '59.24
' > analysis/panel-rate-test/rate.txt
nohup env XDG_RUNTIME_DIR=/run/user/1000 WAYLAND_DISPLAY=wayland-1 PLAYER=xdjaz LAB_PI_JEMALLOC=/home/pompu_5/az-native-lab/libjemalloc-pi.so.2 OFFLINE_MIDI=1 NULL_AUDIO=1 PACED_AUDIO=1 USB_FIXTURE=1 USB_FIXTURE_PATH=/home/pompu_5/az-native-lab/benchmark-usb MIXER_FIXTURE=1 ERP_FIXTURE=1 XIMAGE_FAST24=1 LAB_XIMAGE_PRESENT=1 LAB_AZ_SMOOTH_SCROLL=1 LAB_AZ_FRACTIONAL_GRID=1 LAB_VSYNC_HZ=59.24 LAB_KEEP_OPEN=1 LAB_TIMING_RATE_FILE=/home/pompu_5/az-native-lab/analysis/panel-rate-test/rate.txt python3 run-az-timing-test.py > analysis/panel-rate-test/launch.log 2>&1 < /dev/null &
echo $!
