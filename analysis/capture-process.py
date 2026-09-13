"""Read-only process-tree/thread sampling; no environment or memory contents.
Usage: python capture-process.py PID OUTPUT.json [seconds]
"""
import sys,time,json,os
from pathlib import Path
pid=int(sys.argv[1]); dest=Path(sys.argv[2]);duration=int(sys.argv[3]) if len(sys.argv)>3 else 20
samples=[]
def read(p):
 try:return p.read_text()
 except (OSError,ProcessLookupError):return ''
for tick in range(duration):
 pending=[pid];seen=set();threads=[]
 while pending:
  n=pending.pop()
  if n in seen:continue
  seen.add(n);root=Path('/proc')/str(n)
  for t in (root/'task').glob('*'):
   pending.extend(int(x) for x in read(t/'children').split())
   status=read(t/'status')
   fields={k:v.strip() for line in status.splitlines() if ':' in line for k,v in [line.split(':',1)] if k in ['Name','State','VmRSS','Cpus_allowed_list','voluntary_ctxt_switches','nonvoluntary_ctxt_switches']}
   threads.append(dict(pid=n,tid=int(t.name),fields=fields,stat=read(t/'stat'),schedstat=read(t/'schedstat'),wchan=read(t/'wchan')))
 samples.append(dict(monotonic=time.monotonic(),threads=threads))
 time.sleep(1)
dest.write_text(json.dumps(dict(clock_ticks=os.sysconf('SC_CLK_TCK'),scope='Host QEMU thread sampling; not native Pi FPS or guest function profiling',samples=samples),indent=2))
