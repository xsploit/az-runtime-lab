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
