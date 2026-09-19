#!/bin/sh
# Sample the renderer's socket queues (its netns) and one Xwayland socket (host)
# at ~5 ms, CLOCK_MONOTONIC stamped. Args: RENDERER_PID RENDERER_INO XWAY_INO SECS OUTFILE
P=$1; RI=$2; XI=$3; SECS=$4; OUT=$5
end=$(python3 -c "import time;print(time.monotonic()+$SECS)"); : > "$OUT"
while [ "$(python3 -c "import time;print(int(time.monotonic()<$end))")" = 1 ]; do
  t=$(python3 -c "import time;print(time.monotonic())")
  r=$(sudo -n nsenter -t "$P" --net ss -xn 2>/dev/null | awk -v i="$RI" '$0 ~ (" "i" ") {print $3, $4}')
  x=$(sudo -n ss -xn 2>/dev/null | awk -v i="$XI" '$0 ~ (" "i" ") {print $3, $4}')
  echo "$t renderer_rq_sq=${r:-? ?} xwayland_rq_sq=${x:-? ?}" >> "$OUT"
done
