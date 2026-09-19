"""Inside the worst post-LOAD WAVEFORM gap of an instrument-arm.sh capture:
socket queue trajectories on both sides, fd-20 poll flags, and Xwayland's own
switch-outs and blocked stacks (requires the capture to have run with EXTRA_PID).
Lockstep between the renderer's Send-Q and Xwayland's Recv-Q is the peer
proof that ss cannot give across the --unshare-net boundary."""
import bisect,json,re,sys
from collections import Counter,defaultdict
from pathlib import Path
d=Path(sys.argv[1])
dmg=json.loads((d/'damage.json').read_text());start=dmg['start_monotonic']
ev=sorted([e for e in json.loads((d/'events.json').read_text()) if 'kind' in e],key=lambda e:e['observed_at']);ev_t=[e['observed_at'] for e in ev]
cmds=[json.loads(l) for l in (d/'commands.json').read_text().splitlines() if l.strip()]
load=next(c['at'] for c in cmds if c['command'].startswith('load'))
meta=(d/'meta.txt').read_text();main=re.search(r'main=(\d+)',meta).group(1)
xp=re.search(r'extra_pid=(\d+)',meta);xp=xp.group(1) if xp else None
print("sockets:",(d/'sockets.txt').read_text().strip() if (d/'sockets.txt').exists() else '(none)')
times=[start+s['local_ms']/1000 for s in dmg['samples']]
def kinds(a,b):return {e['kind'] for e in ev[bisect.bisect_left(ev_t,a):bisect.bisect_right(ev_t,b)]}
gaps=sorted([(b-a,a,b) for a,b in zip(times,times[1:]) if a>=load and kinds(a,b)=={'waveform'}],reverse=True)
if not gaps:print("no post-LOAD waveform gaps");sys.exit()
g,a,b=gaps[0];print(f"worst post-LOAD waveform gap: {g*1000:.1f} ms at +{a-load:.3f}s  next: {[round(x[0]*1000,1) for x in gaps[1:4]]}")
rows=[];off=0.0
if (d/'queues.txt').exists():
    for line in open(d/'queues.txt'):
        o=re.match(r'^offset_mono_minus_real (\S+)',line)
        if o:off=float(o.group(1));continue
        m=re.match(r'^(\d+\.\d+) renderer_rq_sq=(\S+) (\S+) xwayland_rq_sq=(\S+) (\S+)',line)
        if m:rows.append((float(m.group(1))+off,)+m.groups()[1:])
win=[r for r in rows if a-0.03<=r[0]<=b+0.03]
print("--- socket queues through the gap (t rel gap start; renderer Recv-Q/Send-Q | Xwayland Recv-Q/Send-Q) ---")
for r in win[::max(1,len(win)//14)]:print(f"  {(r[0]-a)*1000:+7.1f} ms  R rq={r[1]:>6} sq={r[2]:>6} | X rq={r[3]:>6} sq={r[4]:>6}")
nz=lambda i:sum(1 for r in win if r[i] not in ('0','?'))
print(f"  samples={len(win)}  renderer Send-Q>0: {nz(2)}  Xwayland Recv-Q>0: {nz(3)}  renderer Recv-Q>0: {nz(1)}")
pc=Counter();rc=Counter();fdc=Counter();sendb=Counter()
if (d/'strace.txt').exists():
    for line in open(d/'strace.txt',errors='ignore'):
        m=re.match(r'^(\d+)\s+[\d:.]+\s+(p?poll)\((\[.*?\])(.*)$',line)
        if m and m.group(1)==main:
            for fd in re.findall(r'fd=(\d+)',m.group(3)):fdc[fd]+=1
            continue
        w=re.match(r'^(\d+)\s+[\d:.]+\s+(send|sendto|write|writev|sendmsg)\((\d+),.*=\s*(\d+)\s*$',line)
        if w:sendb[(w.group(1),w.group(3))]+=int(w.group(4))
    # the X fd: polled by the main thread and carrying the main thread's outbound bytes
    main_send=[(k[1],v) for k,v in sendb.most_common() if k[0]==main]
    xfd=main_send[0][0] if main_send else (fdc.most_common(1)[0][0] if fdc else None)
    print("--- main-thread poll fds:",fdc.most_common(4),"| main-thread bytes out by fd:",main_send[:3],"| X fd guess:",xfd)
    if xfd:
        for line in open(d/'strace.txt',errors='ignore'):
            m=re.match(r'^(\d+)\s+[\d:.]+\s+(p?poll)\((\[.*?\])(.*)$',line)
            if not m or m.group(1)!=main or f'fd={xfd}' not in m.group(3):continue
            e=re.search(r'fd=%s, events=([A-Z|]+)'%xfd,m.group(3));pc[e.group(1) if e else '?']+=1
            r=re.search(r'fd=%s, revents=([A-Z|]+)'%xfd,m.group(4));rc[r.group(1) if r else 'none']+=1
        print(f"--- renderer poll() on fd {xfd}, whole trace: requested",pc.most_common(4),"revents",rc.most_common(4))
if xp:
    tr={};outs=[];ins=0
    for line in open(d/'sched.txt',errors='ignore'):
        m=re.match(r'^\s*(\d+\.\d+):\s+(\S+):\s*(.*)$',line)
        if not m or not(a<=float(m.group(1))<=b):continue
        tr[(m.group(1),m.group(2))]=m.group(3)
        if 'sched_switch' in m.group(2):
            if f'prev_pid={xp} ' in m.group(3):outs.append(m.group(3))
            if f'next_pid={xp} ' in m.group(3):ins+=1
    st=Counter(re.search(r'prev_state=(\S+)',o).group(1) for o in outs);nxt=Counter(re.search(r'next_comm=(.*?) next_pid',o).group(1) for o in outs)
    print(f"--- Xwayland ({xp}) in the gap: switch-outs={len(outs)} states={dict(st)} switch-ins={ins}; gave CPU to {nxt.most_common(5)}")
    st2=defaultdict(list);cur=None
    for line in open(d/'sched-stacks.txt',errors='ignore'):
        m=re.match(r'^\s*(\d+\.\d+):\s+(\S+):',line)
        if m:cur=(m.group(1),m.group(2)) if a<=float(m.group(1))<=b else None
        elif cur and line.strip():st2[cur].append(line.strip())
    sc=Counter()
    for k,v in tr.items():
        if 'sched_switch' in k[1] and f'prev_pid={xp} ' in v and re.search(r'prev_state=[SD]',v):
            fr=[(f.split()+['?'])[1] for f in st2.get(k,[])[:14]];fr=[x for x in fr if not re.match(r'(__|_raw|schedule|preempt|el0|el1|ret_|finish_task|__switch)',x)]
            sc[' <- '.join(fr[:6])[:200]]+=1
    print("  Xwayland blocked stacks:",sc.most_common(4))
