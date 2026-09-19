#!/bin/sh
# One focused capture of steady two-deck playback, everything on CLOCK_MONOTONIC.
# Sends NO inputs: the controller bridge stays up and the state is whatever the
# operator loaded. Refuses to run unless exactly one kiosk shell exists and the
# player reports the WAVEFORM page. Run on the Pi as the desktop user (sudo -n
# is used for perf and the native view reader).
#
#   sh capture_waveform_gap.sh OUTDIR [SECONDS]
set -u
OUT=${1:?outdir}; SECS=${2:-60}
# The checkout this script lives in, unless AZ_LAB points elsewhere. Walk up
# until pi/session.py is found so the script works from any staging depth.
LAB=${AZ_LAB:-}
if [ -z "$LAB" ]; then
  d=$(cd "$(dirname "$0")" && pwd)
  while [ "$d" != / ] && [ ! -f "$d/pi/session.py" ]; do d=$(dirname "$d"); done
  LAB=$d
fi
[ -f "$LAB/pi/session.py" ] || { echo "cannot locate the lab checkout; set AZ_LAB"; exit 1; }
PP=$LAB:$LAB/analysis:$LAB/mixer
mkdir -p "$OUT"; cd "$LAB"
P=$(pgrep -x EP147) || { echo "no EP147"; exit 1; }
# NO_KIOSK=1: the session was started outside the kiosk loop (bare-Xorg arm).
[ "${NO_KIOSK:-0}" = 1 ] || [ "$(ps -eo args | grep -c '[/]bin/sh /usr/local/bin/start-pflx-kiosk')" = 1 ] || { echo "kiosk count != 1"; exit 1; }
MAIN=$(for t in /proc/$P/task/*; do [ "$(cat $t/comm)" = EP147 ] && echo ${t##*/}; done | head -1)
kind=$(sudo -n env PYTHONPATH=$PP python3 -c "from az_live_view import LiveView;v=LiveView($P);print(v.sample()['kind']);v.close()" 2>/dev/null)
[ "$kind" = waveform ] || { echo "page is '$kind', need waveform"; exit 1; }
# Playback gate: two decks scrolling put EP147 well above its ~14 %core idle.
# This is a proxy, not the LocalPlayer position reader Codex used; a single
# playing deck or a paused pair can pass it. Verify titles by eye as well.
busy=$(python3 - "$P" <<'PY2'
import os,sys,time
p=sys.argv[1];h=os.sysconf("SC_CLK_TCK")
def t():
    s=open(f"/proc/{p}/stat").read();f=s.rsplit(")",1)[1].split();return int(f[11])+int(f[12])
a=t();time.sleep(3);b=t();print(int(100.0*(b-a)/h/3))
PY2
)
[ "${busy:-0}" -ge 30 ] || { echo "EP147 at ${busy} %core: not two-deck playback (need >=30)"; exit 1; }
echo "player=$P main=$MAIN kiosks=1 page=waveform ep147_pct=$busy secs=$SECS" | tee "$OUT/meta.txt"

# 1. XDamage notifications
(DISPLAY=${AZ_DISPLAY:-:0} python3 $LAB/analysis/probe-xdamage.py --display ${AZ_DISPLAY:-:0} --seconds "$SECS" > "$OUT/damage.json" 2>"$OUT/damage.err") & D=$!
# SKIP_PERF=1 keeps only the damage and page samplers (long captures, many loads).
C=;S=
# 2. main-thread on-CPU stacks
[ "${SKIP_PERF:-0}" = 1 ] || sudo -n perf record -k CLOCK_MONOTONIC -F 997 -g --call-graph fp -t "$MAIN" -o "$OUT/cpu.data" -- sleep "$SECS" >"$OUT/perf-cpu.log" 2>&1 & C=$!
# 3. off-CPU: switches involving the main thread, with the stack it blocked in
# EXTRA_PID (e.g. Xwayland) widens the switch/wakeup filters to a second task;
# -a does not lift a filter, so without this only the renderer's switches exist.
# EXTRA_PID may list several space-separated PIDs (e.g. Xwayland and sway).
SW="prev_pid==$MAIN || next_pid==$MAIN"; WK="pid==$MAIN"
for xp in ${EXTRA_PID:-}; do SW="$SW || prev_pid==$xp || next_pid==$xp"; WK="$WK || pid==$xp"; done
echo "extra_pid=${EXTRA_PID:-none}" >> "$OUT/meta.txt"
[ "${SKIP_PERF:-0}" = 1 ] || sudo -n perf record -k CLOCK_MONOTONIC -a -g -e sched:sched_switch --filter "$SW" \
  -e sched:sched_wakeup --filter "$WK" -e block:block_rq_issue -o "$OUT/sched.data" -- sleep "$SECS" >"$OUT/perf-sched.log" 2>&1 & S=$!
# 4. page kind + io + ctxt switches, ~10 ms
sudo -n env PYTHONPATH=$PP python3 - "$P" "$MAIN" "$SECS" > "$OUT/events.json" 2>"$OUT/events.err" <<'PY' & E=$!
import json,sys,time
from az_live_view import LiveView
pid,main,secs=sys.argv[1],sys.argv[2],float(sys.argv[3])
v=LiveView(int(pid));out=[];end=time.monotonic()+secs
def io():
    d=dict(l.split(':') for l in open(f'/proc/{pid}/io').read().split('\n') if ':' in l)
    st=open(f'/proc/{pid}/task/{main}/stat').read().rsplit(')',1)[1].split()
    sd=open(f'/proc/{pid}/task/{main}/status').read()
    vol=[l for l in sd.split('\n') if l.startswith('voluntary_ctxt')][0].split()[-1]
    nvol=[l for l in sd.split('\n') if l.startswith('nonvoluntary_ctxt')][0].split()[-1]
    try: wchan=open(f'/proc/{pid}/task/{main}/wchan').read().strip()
    except OSError: wchan=''
    return dict(read_bytes=int(d['read_bytes']),rchar=int(d['rchar']),state=st[0],vol=int(vol),nvol=int(nvol),wchan=wchan)
while time.monotonic()<end:
    s=v.sample();s.update(io());out.append(s);time.sleep(.01)
v.close();print(json.dumps(out))
PY
wait $D $C $S $E
[ "${SKIP_PERF:-0}" = 1 ] && { echo "done: damage+page only (SKIP_PERF)"; exit 0; }
sudo -n chown "$(id -u)" "$OUT"/*.data 2>/dev/null
sudo -n perf script -F time,event,ip,sym,dso -i "$OUT/cpu.data" > "$OUT/cpu.txt" 2>/dev/null
sudo -n perf script -F time,event,trace -i "$OUT/sched.data" > "$OUT/sched.txt" 2>/dev/null
echo "done: $(wc -l < "$OUT/cpu.txt") cpu lines, $(wc -l < "$OUT/sched.txt") sched lines"
