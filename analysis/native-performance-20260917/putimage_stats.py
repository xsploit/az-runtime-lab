"""Summarise an ximage-stats.log (one XPutImage per line: t_start duration w h
bpp bytes drawable) against a capture's commands.json: per load, the count,
bytes, summed and maximum call duration of PutImage calls in the WINDOW
seconds after LOAD, and the same per second over ordinary playback (the
seconds that contain no command). Separates redraw volume from drain rate.
usage: putimage_stats.py STATS_LOG CAPTURE_DIR [--window 1.0]
"""
import json,sys,bisect
from pathlib import Path
log=Path(sys.argv[1]);d=Path(sys.argv[2]);win=float(sys.argv[sys.argv.index('--window')+1]) if '--window' in sys.argv else 1.0
recs=[]
for l in log.read_text().splitlines():
    p=l.split()
    if len(p)>=7:recs.append((float(p[0]),float(p[1]),int(p[2]),int(p[3]),int(p[5])))
recs.sort();ts=[r[0] for r in recs]
cmds=[json.loads(l) for l in (d/'commands.json').read_text().splitlines() if l.strip()]
def window(a,b):
    rs=recs[bisect.bisect_left(ts,a):bisect.bisect_right(ts,b)]
    return dict(n=len(rs),bytes=sum(r[4] for r in rs),dur_ms=round(sum(r[1] for r in rs)*1000,1),max_ms=round(max((r[1] for r in rs),default=0)*1000,2),
                rects=sorted(((r[2],r[3]) for r in rs),key=lambda x:-x[0]*x[1])[:3])
print(f"records={len(recs)} span={ts[-1]-ts[0]:.1f}s" if recs else "no records")
for c in cmds:
    if c['command'].startswith('load'):
        w=window(c['at'],c['at']+win);print(f"  {c['command']}: {win:.1f}s after LOAD  calls={w['n']} bytes={w['bytes']/1e6:.1f}MB busy={w['dur_ms']}ms max={w['max_ms']}ms largest={w['rects']}")
# ordinary playback: seconds without any command within +-2 s
if recs:
    quiet=[];t=ts[0]
    while t<ts[-1]:
        if all(abs(c['at']-t)>2 for c in cmds):
            w=window(t,t+1);quiet.append(w)
        t+=1
    if quiet:
        n=len(quiet);print(f"  playback per second (n={n}): calls={sum(q['n'] for q in quiet)/n:.1f} bytes={sum(q['bytes'] for q in quiet)/n/1e6:.2f}MB busy={sum(q['dur_ms'] for q in quiet)/n:.1f}ms max={max(q['max_ms'] for q in quiet)}ms")
