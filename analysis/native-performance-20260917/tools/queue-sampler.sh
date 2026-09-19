#!/bin/bash
# Sample the renderer's socket queues (its netns) and one Xwayland socket (host)
# as fast as ss allows, CLOCK_REALTIME-stamped via bash $EPOCHREALTIME (no forks
# beyond ss). Args: RENDERER_PID RENDERER_INO XWAY_INO SECS OUTFILE
P=$1; RI=$2; XI=$3; SECS=$4; OUT=$5
end=$(( ${EPOCHREALTIME%.*} + SECS )); : > "$OUT"
# monotonic<->realtime offset so timestamps can be aligned with the capture
python3 -c "import time;print('offset_mono_minus_real', time.monotonic()-time.time())" >> "$OUT"
while [ "${EPOCHREALTIME%.*}" -lt "$end" ]; do
  t=$EPOCHREALTIME
  r=$(sudo -n nsenter -t "$P" --net ss -xn 2>/dev/null | awk -v i="$RI" '$0 ~ (" "i" ") {print $3, $4}')
  x=$(sudo -n ss -xn 2>/dev/null | awk -v i="$XI" '$0 ~ (" "i" ") {print $3, $4}')
  echo "$t renderer_rq_sq=${r:-? ?} xwayland_rq_sq=${x:-? ?}" >> "$OUT"
done
