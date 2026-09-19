"""Print what happened inside one XDamage gap: the renderer's switch-outs
(prev_state), the wakeups that brought it back and WHO issued them (perf's
per-event comm/pid is the waker's context), block I/O issued, and the other
task's (Xorg/Xwayland) switches. Reads a narrow --time window straight from
sched.data with perf, so memory is constant.

usage: gap_window.py CAPTURE_DIR --load N [--rank K] [--pad SECONDS]
  N selects the loadN stamp; K (default 1) the K-th largest waveform gap
  within 3 s after it; pad widens the window on both sides (default 0.05).
"""
import bisect,json,re,subprocess,sys
from pathlib import Path
d=Path(sys.argv[1]);a=sys.argv
which=a[a.index('--load')+1];rank=int(a[a.index('--rank')+1]) if '--rank' in a else 1;pad=float(a[a.index('--pad')+1]) if '--pad' in a else .05
dmg=json.loads((d/'damage.json').read_text());start=dmg['start_monotonic'];times=[start+s['local_ms']/1000 for s in dmg['samples']]
cmds=[json.loads(l) for l in (d/'commands.json').read_text().splitlines() if l.strip()]
load=next(c['at'] for c in cmds if c['command']=='load'+which)
main=re.search(r'main=(\d+)',(d/'meta.txt').read_text()).group(1)
extra=re.search(r'extra_pid=(.*)',(d/'meta.txt').read_text());extra=extra.group(1).split() if extra else []
gaps=sorted(((b-a_,a_,b) for a_,b in zip(times,times[1:]) if load<=a_<=load+3),reverse=True)
g,t0,t1=gaps[rank-1];print(f"load{which} at {load:.3f}; gap #{rank}: {g*1000:.1f} ms at +{t0-load:.3f} s  [{t0:.6f},{t1:.6f}]  main={main} extra={extra}")
out=subprocess.run(['sudo','-n','perf','script','-f','-F','comm,pid,tid,time,event,trace','--time',f'{t0-pad:.6f},{t1+pad:.6f}','-i',str(d/'sched.data')],capture_output=True,text=True).stdout
rx=re.compile(r'^\s*(?P<comm>\S+)\s+(?P<pid>\d+)/(?P<tid>\d+)\s+(?P<t>\d+\.\d+):\s+(?P<ev>\S+):\s*(?P<tr>.*)$')
rows=[m.groupdict() for m in (rx.match(l) for l in out.splitlines()) if m]
print(f"events in window: {len(rows)}")
# Time accounting for the main thread across the gap itself [t0,t1]: running
# (switched in), runnable-but-preempted (switched out with prev_state R/R+, or
# woken but not yet switched in), blocked-S / blocked-D (switched out sleeping,
# until its wakeup). State at t0 is taken from the first event seen after t0
# (the gap starts on a damage notification, i.e. the renderer had just run).
acct={'running':0.,'runnable':0.,'blocked_S':0.,'blocked_D':0.};state='running';last=t0;preempted_by={}
def add(until):
    global last;dt=max(0.,until-last);acct[state]+=dt;last=until
for r in rows:
    t=float(r['t'])
    if t<t0:continue
    if t>t1:break
    tr=r['tr'];ev=r['ev']
    if 'sched_switch' in ev:
        pm=re.search(r'prev_pid=(\d+).*?prev_state=(\S+).*?next_comm=(\S+)\s+next_pid=(\d+)',tr)
        if not pm:continue
        if pm.group(1)==main:
            add(t);st=pm.group(2)
            state='runnable' if st.startswith('R') else ('blocked_D' if st.startswith('D') else 'blocked_S')
            if state=='runnable':preempted_by[pm.group(3)]=preempted_by.get(pm.group(3),0)+1
        elif pm.group(4)==main:
            add(t);state='running'
    elif 'sched_wakeup' in ev:
        wm=re.search(r'comm=\S+\s+pid=(\d+)',tr)
        if wm and wm.group(1)==main and state.startswith('blocked'):add(t);state='runnable'
add(t1)
tot=sum(acct.values()) or 1
print("time accounting across the gap: "+"  ".join(f"{k}={v*1000:.1f}ms({v/tot*100:.0f}%)" for k,v in acct.items()))
# The same accounting for the X server (first extra pid): running = draining
# requests, runnable = starved by higher-priority tasks, blocked = waiting.
for xp in extra[:1]:
    xa={'running':0.,'runnable':0.,'blocked':0.};xs=None;xl=t0;xpre={}
    for r in rows:
        t=float(r['t'])
        if t<t0:continue
        if t>t1:break
        tr=r['tr'];ev=r['ev']
        if 'sched_switch' in ev:
            pm=re.search(r'prev_pid=(\d+).*?prev_state=(\S+).*?next_comm=(\S+)\s+next_pid=(\d+)',tr)
            if not pm:continue
            if pm.group(1)==xp:
                if xs:xa[xs]+=t-xl
                xl=t;xs='runnable' if pm.group(2).startswith('R') else 'blocked'
                if xs=='runnable':xpre[pm.group(3)]=xpre.get(pm.group(3),0)+1
            elif pm.group(4)==xp:
                if xs:xa[xs]+=t-xl
                xl=t;xs='running'
        elif 'sched_wakeup' in ev:
            wm=re.search(r'comm=\S+\s+pid=(\d+)',tr)
            if wm and wm.group(1)==xp and xs=='blocked':xa[xs]+=t-xl;xl=t;xs='runnable'
    if xs:xa[xs]+=t1-xl
    known=sum(xa.values())
    print(f"X server ({xp}) across the gap (first state unknown for {(t1-t0-known)*1000:.1f}ms): "+"  ".join(f"{k}={v*1000:.1f}ms" for k,v in xa.items())+"  preempted by: "+", ".join(f"{k}:{v}" for k,v in sorted(xpre.items(),key=lambda x:-x[1])[:5]))
print("preempted by (switch-outs while runnable): "+", ".join(f"{k}:{v}" for k,v in sorted(preempted_by.items(),key=lambda x:-x[1])[:6]))
for r in rows:
    t=float(r['t']);rel=(t-t0)*1000;tr=r['tr'];ev=r['ev']
    if 'sched_switch' in ev:
        pm=re.search(r'prev_pid=(\d+).*?prev_state=(\S+).*?next_comm=(\S+)\s+next_pid=(\d+)',tr)
        if pm and (pm.group(1)==main or pm.group(4)==main or pm.group(1) in extra or pm.group(4) in extra):
            who='MAIN' if pm.group(1)==main else ('X' if pm.group(1) in extra else pm.group(1))
            print(f"  {rel:+8.2f} ms switch  cpu? {who:>5} -> {pm.group(3)}({pm.group(4)}) prev_state={pm.group(2)}")
    elif 'sched_wakeup' in ev:
        wm=re.search(r'comm=(\S+)\s+pid=(\d+)',tr)
        if wm and (wm.group(2)==main or wm.group(2) in extra):
            print(f"  {rel:+8.2f} ms wakeup  {wm.group(1)}({wm.group(2)}) woken by {r['comm']}({r['pid']}/{r['tid']})")
    elif 'block_rq_issue' in ev:
        print(f"  {rel:+8.2f} ms blkio   by {r['comm']}({r['pid']}) {tr[:60]}")
