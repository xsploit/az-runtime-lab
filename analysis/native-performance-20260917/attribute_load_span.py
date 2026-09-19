"""Split XDamage gaps across a track load by page kind and by distance from LOAD.

Input: a capture directory that also holds commands.json (one JSON object per
line: {"command","at"}, CLOCK_MONOTONIC). Reports the largest gaps in three
buckets -- BROWSE-only, WAVEFORM-only, page transitions -- each tagged with
seconds relative to the LOAD command, plus main-thread on/off-CPU and I/O for
the WAVEFORM-only ones. Browser gaps are expected (a static list need not
repaint) and are reported, not treated as stalls.
"""
import bisect,json,re,sys
from collections import Counter
from pathlib import Path
d=Path(sys.argv[1]);top=int(sys.argv[2]) if len(sys.argv)>2 else 6
dmg=json.loads((d/'damage.json').read_text());start=dmg['start_monotonic']
ev=[e for e in json.loads((d/'events.json').read_text()) if 'kind' in e]
cmds=[json.loads(l) for l in (d/'commands.json').read_text().splitlines() if l.strip()]
load=next((c['at'] for c in cmds if c['command'].startswith('load')),None)
meta=(d/'meta.txt').read_text() if (d/'meta.txt').exists() else ''
main=re.search(r'main=(\d+)',meta).group(1) if re.search(r'main=(\d+)',meta) else '0'
times=[start+s['local_ms']/1000 for s in dmg['samples']]
ev.sort(key=lambda e:e['observed_at']);ev_t=[e['observed_at'] for e in ev]
def ev_between(a,b):return ev[bisect.bisect_left(ev_t,a):bisect.bisect_right(ev_t,b)]
cpu=[];cur=None
for line in (d/'cpu.txt').read_text().split('\n'):
    m=re.match(r'^\s*(\d+\.\d+):\s+\S+',line)
    if m:cur=dict(t=float(m.group(1)),frames=[]);cpu.append(cur)
    elif cur is not None and line.strip():cur['frames'].append(line.strip())
cpu.sort(key=lambda s:s['t']);cpu_t=[s['t'] for s in cpu]
def cpu_between(a,b):return cpu[bisect.bisect_left(cpu_t,a):bisect.bisect_right(cpu_t,b)]
sched=[]
for line in (d/'sched.txt').read_text().split('\n'):
    m=re.match(r'^\s*(\d+\.\d+):\s+(\S+):\s*(.*)$',line)
    if m:sched.append(dict(t=float(m.group(1)),ev=m.group(2),txt=m.group(3)))
sched.sort(key=lambda s:s['t']);sched_t=[s['t'] for s in sched]
def sched_between(a,b):return sched[bisect.bisect_left(sched_t,a):bisect.bisect_right(sched_t,b)]
def kinds(a,b):return Counter(e['kind'] for e in ev_between(a,b))
rows=[]
for a,b in zip(times,times[1:]):
    k=kinds(a,b);ks=set(k)
    bucket='waveform' if ks=={'waveform'} else 'browse' if ks=={'browse'} else 'transition' if ks else 'unsampled'
    on=cpu_between(a,b)
    outs=[s for s in sched_between(a,b) if 'sched_switch' in s['ev'] and f'prev_pid={main} ' in s['txt']]
    st=Counter(re.search(r'prev_state=(\S+)',s['txt']).group(1) for s in outs if re.search(r'prev_state=(\S+)',s['txt']))
    disk=sum(1 for s in sched_between(a,b) if 'block_rq_issue' in s['ev'])
    io=ev_between(a,b)
    rb=(io[-1]['read_bytes']-io[0]['read_bytes']) if len(io)>1 else 0
    leaf=Counter(fr.split()[-1] if fr.split() else '?' for s in on for fr in s['frames'][:1]).most_common(3)
    rows.append(dict(bucket=bucket,t_rel_load=round(a-load,3) if load else None,gap_ms=round((b-a)*1000,1),
        pages=dict(k),oncpu=len(on),expected=int((b-a)*997),switch_outs=len(outs),prev_states=dict(st),disk=disk,read_bytes=rb,leaf=leaf))
out=dict(commands=[dict(c,rel=round(c['at']-load,3) if load else None) for c in cmds],
         intervals=len(rows),by_bucket={k:sum(1 for r in rows if r['bucket']==k) for k in ('waveform','browse','transition','unsampled')})
for bk in ('waveform','transition','browse'):
    sel=sorted([r for r in rows if r['bucket']==bk],key=lambda r:-r['gap_ms'])[:top]
    out[f'largest_{bk}']=sel
    wf=[r['gap_ms'] for r in rows if r['bucket']==bk]
    if wf:out[f'{bk}_stats']=dict(n=len(wf),max=max(wf),over25=sum(g>25 for g in wf),over40=sum(g>40 for g in wf))
print(json.dumps(out,indent=1,default=str))
