"""Sustained-playback summary for a capture directory: XDamage interval
statistics over the whole capture, split by sampled page kind, in
per-minute buckets, plus underruns from the session's audio-events.jsonl
(pass the session dir as the second argument). Intervals, not dropped frames.
Intervals during which the main thread only slept in poll (nothing to draw)
are reported as idle time and excluded from the statistics.
"""
import bisect,json,sys
from collections import Counter
from pathlib import Path
d=Path(sys.argv[1]);dmg=json.loads((d/'damage.json').read_text());start=dmg['start_monotonic']
times=[start+s['local_ms']/1000 for s in dmg['samples']]
ev=sorted((e for e in json.loads((d/'events.json').read_text()) if 'kind' in e),key=lambda e:e['observed_at']);ev_t=[e['observed_at'] for e in ev]
def window(a,b):return ev[bisect.bisect_left(ev_t,a):bisect.bisect_right(ev_t,b)]
rows=[]
for a,b in zip(times,times[1:]):
    w=window(a,b);k={e['kind'] for e in w}
    # An interval in which every sample saw the main thread asleep in poll is
    # the renderer with nothing to draw (no deck scrolling, static page), not a
    # hitch. Only intervals with at least one non-sleeping sample count as
    # 'active'. Short intervals (< 3 samples) cannot be judged and count as active.
    idle=len(w)>=3 and all(e.get('state')=='S' and e.get('wchan','').startswith('poll') for e in w)
    rows.append(dict(t=a-start,gap=(b-a)*1000,bucket='waveform' if k=={'waveform'} else 'other' if k else 'unsampled',idle=idle))
wave=[r for r in rows if r['bucket']=='waveform' and not r['idle']]
idle_ms=sum(r['gap'] for r in rows if r['idle'])
def stats(rs):
    g=sorted(r['gap'] for r in rs)
    return dict(n=len(g),median=round(g[len(g)//2],1) if g else None,p99=round(g[min(len(g)-1,int(len(g)*.99))],1) if g else None,max=round(g[-1],1) if g else None,over25=sum(x>25 for x in g),over40=sum(x>40 for x in g),over100=sum(x>100 for x in g))
per_min=[]
for m in range(int(rows[-1]['t']//60)+1 if rows else 0):
    rs=[r for r in wave if m*60<=r['t']<(m+1)*60];per_min.append(dict(minute=m,**stats(rs)))
under=[]
if len(sys.argv)>2:
    evs=[json.loads(l) for l in (Path(sys.argv[2])/'audio-events.jsonl').read_text().splitlines() if l.strip()]
    t0=next((e['monotonic'] for e in evs if e.get('event')=='audio_started'),None)
    under=[round(e['monotonic']-t0,1) for e in evs if 'underrun' in e.get('text','')]
out=dict(duration_s=round(rows[-1]['t'],1) if rows else 0,idle_s=round(idle_ms/1000,1),waveform=stats(wave),buckets=dict(Counter(r['bucket'] for r in rows)),per_minute=per_min,underruns=under,largest=[dict(t=round(r['t'],1),gap=round(r['gap'],1)) for r in sorted(wave,key=lambda r:-r['gap'])[:8]])
if '--json' in sys.argv:print(json.dumps(out,indent=1));sys.exit()
w=out['waveform'];print(f"  {out['duration_s']}s (renderer idle {out['idle_s']}s excluded) active waveform intervals n={w['n']} median={w['median']} p99={w['p99']} max={w['max']} >25={w['over25']} >40={w['over40']} >100={w['over100']} | underruns={len(under)} at {under[:6]}")
print("  per minute >25/>40/max: "+" ".join(f"{p['minute']}:{p['over25']}/{p['over40']}/{p['max']}" for p in per_min))
print("  largest: "+" ".join(f"{l['gap']}ms@{l['t']}s" for l in out['largest']))
