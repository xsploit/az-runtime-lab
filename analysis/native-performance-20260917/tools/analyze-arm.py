"""Per-arm readout for a load-span capture: the renderer's time split inside its
worst post-LOAD WAVEFORM gap (running / blocked S,D / runnable-preempted), and for
every extra PID in the sched filters (meta.txt extra_pid), its switch-out states
and who it gave the CPU to in the same window. Streams sched.txt; needs the
'trace' perf-script pass already written as sched.txt (load-span-capture.sh does)."""
import bisect,json,os,re,sys
from collections import Counter
d=sys.argv[1].rstrip('/')
dmg=json.load(open(d+'/damage.json'));start=dmg['start_monotonic']
ev=sorted([e for e in json.load(open(d+'/events.json')) if 'kind' in e],key=lambda e:e['observed_at']);et=[e['observed_at'] for e in ev]
cmds=[json.loads(l) for l in open(d+'/commands.json') if l.strip()];load=next(c['at'] for c in cmds if c['command'].startswith('load'))
meta=open(d+'/meta.txt').read();main=re.search(r'main=(\d+)',meta).group(1)
xps=re.search(r'extra_pid=([\d ]+)',meta);xps=xps.group(1).split() if xps else []
t=[start+s['local_ms']/1000 for s in dmg['samples']]
gaps=sorted([(b-a,a,b) for a,b in zip(t,t[1:]) if a>=load and {e['kind'] for e in ev[bisect.bisect_left(et,a):bisect.bisect_right(et,b)]}=={'waveform'}],reverse=True)
if not gaps:print(os.path.basename(d),'no post-LOAD waveform gaps');sys.exit()
ln,a,b=gaps[0]
evs=[];xo={x:[] for x in xps};names={}
for line in open(d+'/sched.txt',errors='ignore'):
    m=re.match(r'^\s*(\d+\.\d+):\s+(\S+):\s*(.*)$',line)
    if not m or 'sched_switch' not in m.group(2):continue
    tt=float(m.group(1))
    if tt<a-0.05 or tt>b+0.05:continue
    txt=m.group(3)
    if f'prev_pid={main} ' in txt:evs.append((tt,'out',re.search(r'prev_state=(\S+)',txt).group(1)))
    elif f'next_pid={main} ' in txt:evs.append((tt,'in',None))
    if a<=tt<=b:
        for x in xps:
            if f'prev_pid={x} ' in txt:
                xo[x].append(txt);names.setdefault(x,re.search(r'prev_comm=(.*?) prev_pid',txt).group(1))
evs.sort();run=blk=rdy=0.0;state=None;last=a
def cls(k,st):return 'run' if k=='in' else ('blk' if st and st[0] in 'SD' else 'rdy')
for tt,k,st in evs:
    if tt<a:state=cls(k,st);continue
    if tt>b:break
    seg=tt-last;run+=seg*(state=='run');blk+=seg*(state=='blk');rdy+=seg*(state=='rdy');last=tt;state=cls(k,st)
seg=b-last;run+=seg*(state=='run');blk+=seg*(state=='blk');rdy+=seg*(state=='rdy');tot=run+blk+rdy or 1e-9
print('%s: worst %.1f ms at +%.3fs; next %s'%(os.path.basename(d),ln*1e3,a-load,[round(g[0]*1e3,1) for g in gaps[1:4]]))
print('  renderer: running %.0f%%  blocked %.0f%%  preempted %.0f%%'%(100*run/tot,100*blk/tot,100*rdy/tot))
for x in xps:
    outs=xo[x];st=Counter(re.search(r'prev_state=(\S+)',o).group(1) for o in outs);nxt=Counter(re.search(r'next_comm=(.*?) next_pid',o).group(1) for o in outs)
    print('  %s (%s): switch-outs=%d states=%s gave CPU to %s'%(names.get(x,'pid'),x,len(outs),dict(st),nxt.most_common(5)))
