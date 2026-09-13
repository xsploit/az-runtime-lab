"""Read-only bounded native transport/CPU sample for pinned cache variants."""
import argparse,hashlib,json,os,struct,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('output',type=Path);p.add_argument('--file-cache-mib',type=int,choices=(32,100),required=True);p.add_argument('--seconds',type=float,default=10);p.add_argument('--memory',action='store_true');a=p.parse_args()
assert 0<a.seconds<=60
hashes={100:'137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c',32:'f61eb7dda3ec197c675af28cac87dcca53eca0bfde2977a6a9824e4809e5b324'}
proc=Path(f'/proc/{a.pid}')
assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest()==hashes[a.file_cache_mib]
identity=(proc/'stat').read_text().rsplit(')',1)[1].split()[19]
def read(addr,fmt='<Q'):
 assert (proc/'stat').read_text().rsplit(')',1)[1].split()[19]==identity
 fd=os.open(proc/'mem',os.O_RDONLY)
 try:return struct.unpack(fmt,os.pread(fd,struct.calcsize(fmt),addr))[0]
 finally:os.close(fd)
def discover():
 registry=read(0x3bd7830);lo,hi=read(registry+0x1a0),read(registry+0x1a8)
 assert 0<hi-lo<16000 and (hi-lo)%16==0
 found=sorted(set(read(e) for e in range(lo,hi,16) if read(read(e))==0x2da1c28))
 return found if len(found)==4 and all(read(o+16,'<I')==16 for o in found) else None
# The active timer registry is reordered by the GUI thread. Require two
# matching complete snapshots; a transient partial read is not a new layout.
players=None
for attempt in range(20):
 first=discover();time.sleep(.01);second=discover()
 if first is not None and first==second:players=first;break
assert players is not None,'Could not obtain a stable LocalPlayer registry snapshot'
sources=[read(o+0xb0) for o in players];assert all(read(s)==0x25eb390 for s in sources)

def sample():
 assert all(read(o)==0x2da1c28 and read(o+0xb0)==src and read(src)==0x25eb390 for o,src in zip(players,sources))
 fields=(proc/'stat').read_text().rsplit(')',1)[1].split()
 result=dict(time=time.monotonic(),positions=[read(src+0xe8,'<q') for src in sources],cpu_ticks=int(fields[11])+int(fields[12]),minor_faults=int(fields[7]),major_faults=int(fields[9]))
 if a.memory:
  result['memory_kib']={parts[0].rstrip(':'):int(parts[1]) for row in (proc/'smaps_rollup').read_text().splitlines()[1:] if len(parts:=row.split())>=2}
 return result
first=sample();time.sleep(a.seconds);last=sample();elapsed=last['time']-first['time']
result=dict(pid=a.pid,file_cache_mib=a.file_cache_mib,first=first,last=last,source_rates=[(y-x)/elapsed if max(x,y)<2**63-1 else None for x,y in zip(first['positions'],last['positions'])],cpu_percent_one_core=100*(last['cpu_ticks']-first['cpu_ticks'])/os.sysconf('SC_CLK_TCK')/elapsed)
result['minor_faults_delta']=last['minor_faults']-first['minor_faults'];result['major_faults_delta']=last['major_faults']-first['major_faults']
a.output.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
