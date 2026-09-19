"""Per-load statistics for a multi-load-capture.sh directory.

For every load stamp: XDamage gaps in the 2.5 s after LOAD (max, >25 ms,
>40 ms), and two response latencies measured from the page sampler at ~10 ms
resolution: browse command -> page kind 'browse', LOAD -> page kind
'waveform'. These are UI-response proxies on the same processing path a touch
takes after X has delivered the event; they are not touch latency. Prints a
one-line summary per load and a totals line; --json dumps everything.
"""
import bisect,json,sys
from pathlib import Path
d=Path(sys.argv[1]);dmg=json.loads((d/'damage.json').read_text());start=dmg['start_monotonic']
times=[start+s['local_ms']/1000 for s in dmg['samples']]
ev=sorted((e for e in json.loads((d/'events.json').read_text()) if 'kind' in e),key=lambda e:e['observed_at']);ev_t=[e['observed_at'] for e in ev]
cmds=[json.loads(l) for l in (d/'commands.json').read_text().splitlines() if l.strip()]
def first_kind(after,kind,limit=3.0):
    for e in ev[bisect.bisect_left(ev_t,after):]:
        if e['observed_at']-after>limit:return None
        if e['kind']==kind:return round((e['observed_at']-after)*1000,1)
    return None
def gaps(a,b):
    i=bisect.bisect_left(times,a);j=bisect.bisect_right(times,b);w=times[max(i-1,0):j]
    return [(y-x)*1000 for x,y in zip(w,w[1:])]
loads=[c for c in cmds if c['command'].startswith('load')];rows=[]
for c in loads:
    n=c['command'][4:];g=gaps(c['at'],c['at']+2.5)
    br=next((x for x in cmds if x['command']=='browse'+n),None)
    rows.append(dict(load=int(n),max_ms=round(max(g),1) if g else None,over25=sum(x>25 for x in g),over40=sum(x>40 for x in g),
        browse_to_browser_ms=first_kind(br['at'],'browse') if br else None,load_to_waveform_ms=first_kind(c['at'],'waveform')))
# whole-capture waveform-page gaps (pages sampled as waveform only between the two damage stamps)
def kinds(a,b):return {e['kind'] for e in ev[bisect.bisect_left(ev_t,a):bisect.bisect_right(ev_t,b)]}
wave=[(b-a)*1000 for a,b in zip(times,times[1:]) if kinds(a,b)=={'waveform'}]
tot=dict(loads=len(rows),waveform_gaps=len(wave),max_ms=round(max(wave),1) if wave else None,over25=sum(x>25 for x in wave),over40=sum(x>40 for x in wave),
    per_load_over25=sum(r['over25'] for r in rows),per_load_max_ms=max((r['max_ms'] or 0) for r in rows) if rows else None,
    browse_ms=[r['browse_to_browser_ms'] for r in rows],load_to_wave_ms=[r['load_to_waveform_ms'] for r in rows])
if '--json' in sys.argv:print(json.dumps(dict(loads=rows,totals=tot),indent=1));sys.exit()
for r in rows:print(f"  load{r['load']}: max={r['max_ms']} over25={r['over25']} over40={r['over40']} browse->browser={r['browse_to_browser_ms']}ms load->waveform={r['load_to_waveform_ms']}ms")
print(f"  totals: loads={tot['loads']} per-load over25={tot['per_load_over25']} per-load max={tot['per_load_max_ms']} | whole capture waveform gaps n={tot['waveform_gaps']} max={tot['max_ms']} over25={tot['over25']} over40={tot['over40']}")
