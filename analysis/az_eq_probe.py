"""Read-only AZ EQ registry probe. Explicit PID, pinned code, bounded traversal.

Repeated reads detect some races; they do not create an atomic snapshot.
Only supports verified generic HuiSlider layout, never writes player memory.
"""
import argparse,json,math,os,select,struct
from pathlib import Path

class Unavailable(RuntimeError): pass
REGISTRY=0x3b45568
BANDS={'high':0x7dcb7936b7ed2b00,'mid':0xa6518fb8028ca800,'low':0xdacc2ca9faed3600}

def snapshot(read):
 def q(a):
  if not a or a%8:raise Unavailable('Unaligned/null pointer')
  return struct.unpack('<Q',read(a,8))[0]
 table=q(REGISTRY+8)
 count=struct.unpack('<i',read(REGISTRY+24,4))[0]
 if count<=0 or count>65536:raise Unavailable('Invalid registry bucket count')
 result=[]
 for channel in range(4):
  for band,base in BANDS.items():
   key=base+channel;node=q(table+8*(key%count));seen=set();component=None
   while node:
    if node in seen or len(seen)>=4096:raise Unavailable('Registry chain cycle/limit')
    seen.add(node)
    if q(node)==key:component=q(node+8);break
    node=q(node+16)
   if not component:raise Unavailable(f'EQ {channel}/{band} not registered')
   if q(component)!=0x2e639f8:raise Unavailable('Unverified EQ component override')
   owner=component-0xc0
   if q(owner)!=0x2e63990 or q(owner+0xd0)!=key:raise Unavailable('EQ owner identity mismatch')
   value,raw=struct.unpack('<fI',read(owner+0xd8,8))
   if not math.isfinite(value):raise Unavailable('Nonfinite current EQ value')
   adapter=q(owner+0xb8)
   adapter_vtable=q(adapter)
   config=None
   if adapter_vtable==0x2e63960:
    # Live identity matched; pin the original default conversion/range methods.
    if q(adapter_vtable+16)!=0x21ee490 or q(adapter_vtable+24)!=0x21edc30:
     raise Unavailable('Default EQ adapter implementation changed')
    denominator,scale=struct.unpack('<If',read(adapter+12,8))
    if not denominator or not math.isfinite(scale) or scale<=0:
     raise Unavailable('Invalid default EQ adapter configuration')
    config=dict(raw_denominator=denominator,scale=scale,range_min=0.0,range_max=scale)
   result.append(dict(channel=channel,band=band,hui_id=hex(key),component=hex(component),owner=hex(owner),value=value,raw=raw,adapter=hex(adapter),adapter_vtable=hex(adapter_vtable),default_adapter=config))
 return dict(registry_table=hex(table),bucket_count=count,controls=result)

def stable_snapshot(read):
 first=snapshot(read);second=snapshot(read)
 if first!=second:raise Unavailable('EQ registry/values changed during observation')
 return second

class ProcessReader:
 def __init__(self,pid):
  if pid<=0:raise ValueError('Positive explicit player PID required')
  self.pidfd=None;self.mem=None
  try:
   self.pidfd=os.pidfd_open(pid);self.poll=select.poll();self.poll.register(self.pidfd,select.POLLIN)
   self.mem=os.open(f'/proc/{pid}/mem',os.O_RDONLY|os.O_CLOEXEC)
   # Guards cover the traced lookup and value-production entries.
   for address,expected in [(0x6c5330,'fd7bbaa9fd030091'),(0x21ef320,'450040f9057000f9')]:
    if self.read(address,8)!=bytes.fromhex(expected):raise Unavailable('Mapped code differs from pinned AZ')
  except BaseException:self.close();raise
 def read(self,address,size):
  if self.poll.poll(0):raise Unavailable('Player session ended')
  try:data=os.pread(self.mem,size,address)
  except OSError as exc:raise Unavailable('Player memory unavailable') from exc
  if len(data)!=size:raise Unavailable('Short memory read')
  return data
 def close(self):
  for name in ('mem','pidfd'):
   fd=getattr(self,name,None)
   if fd is not None:os.close(fd);setattr(self,name,None)

if __name__=='__main__':
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('pid',type=int);args=p.parse_args()
 reader=ProcessReader(args.pid)
 try:print(json.dumps(stable_snapshot(reader.read),indent=2))
 finally:reader.close()
