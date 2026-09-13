#!/usr/bin/env python3
"""Summarize observed host-thread deltas; never interpret QEMU CPU as native Pi FPS."""
import argparse,json
from pathlib import Path
p=argparse.ArgumentParser(description=__doc__);p.add_argument('profile',type=Path);p.add_argument('output',type=Path);a=p.parse_args()
j=json.loads(a.profile.read_text());groups={}
for s in j['samples']:
 for t in s['threads']:
  try:
   fields=t['stat'].rsplit(')',1)[1].split()
   key=(t['pid'],t['tid'],int(fields[19]))
   cpu=int(fields[11])+int(fields[12])
   sched=[int(x) for x in t['schedstat'].split()]
   if len(sched)!=3:continue
  except (ValueError,IndexError):continue
  groups.setdefault(key,[]).append((s['monotonic'],cpu,sched,t))
rows=[]
for key,points in groups.items():
 first,last=points[0],points[-1];dt=last[0]-first[0]
 if dt<=0:continue
 delta=[b-a for a,b in zip(first[2],last[2])]
 if min(delta)<0:continue
 rows.append(dict(pid=key[0],tid=key[1],name=last[3]['fields'].get('Name'),observed_seconds=round(dt,3),samples=len(points),cpu_seconds=round((last[1]-first[1])/j['clock_ticks'],4),one_core_cpu_percent=round(100*(last[1]-first[1])/j['clock_ticks']/dt,2),scheduler_run_seconds=round(delta[0]/1e9,6),runqueue_wait_seconds=round(delta[1]/1e9,6),scheduler_slices=delta[2],last_wait_channel=last[3]['wchan'].strip(),affinity=last[3]['fields'].get('Cpus_allowed_list')))
rows.sort(key=lambda x:x['scheduler_run_seconds'],reverse=True)
r=dict(scope=j['scope'],limitation='Emulated player; audio configuration must be recorded alongside this report. Host-thread CPU/scheduler counters; no guest callback durations or playback/FPS measurement. Thread lifetimes outside their observed span are omitted.',threads=rows)
a.output.write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
