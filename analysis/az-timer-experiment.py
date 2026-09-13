#!/usr/bin/env python3
"""AZ1.30 live timer diagnostic. Root ptrace access required on the target.
Read-only by default. --scale temporarily changes data (not executable code)
and restores it on normal exit, exceptions, SIGTERM and SIGINT. SIGKILL cannot
run cleanup; restarting AZ restores firmware defaults. Never use during a gig.
"""
import argparse,hashlib,json,math,os,signal,struct,time
from pathlib import Path
SHA='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
PERIOD=1000/59.24
class Timer:
 def __init__(self,pid,write=False):
  self.fd=None;self.pid=pid
  exe=Path(f'/proc/{pid}/exe')
  with exe.open('rb') as f:
   digest=hashlib.file_digest(f,'sha256').hexdigest()
  if digest!=SHA:raise ValueError('Unsupported firmware executable')
  self.fd=os.open(f'/proc/{pid}/mem',os.O_RDWR if write else os.O_RDONLY)
  try:
   self.hook=self.q(0x3bd6708);self.address=self.hook-0x28
   if self.hook<0x10000 or self.q(self.hook)!=0x2e41590 or self.q(self.address)!=0x2e414e0:raise ValueError('Unexpected display hook layout')
   self.original=self.read(self.address+0x58,8)
   period=struct.unpack('<d',self.original)[0]
   if not math.isclose(period,PERIOD,rel_tol=0,abs_tol=1e-8):raise ValueError('Timer is already modified; refusing to overwrite')
  except BaseException:self.close();raise
 def read(self,a,n):
  data=os.pread(self.fd,n,a)
  if len(data)!=n:raise RuntimeError('Short process memory read')
  return data
 def q(self,a):return struct.unpack('<Q',self.read(a,8))[0]
 def set(self,scale):
  if scale not in (1,.5,.25):raise ValueError('Only1,0.5,0.25 diagnostic scales supported')
  self.write(struct.pack('<d',PERIOD*scale))
 def write(self,data):
  if os.pwrite(self.fd,data,self.address+0x58)!=8:raise RuntimeError('Short process memory write')
  if self.read(self.address+0x58,8)!=data:raise RuntimeError('Timer write did not verify')
 def restore(self):self.write(self.original)
 def close(self):
  if self.fd is not None:os.close(self.fd);self.fd=None
 def info(self):return dict(pid=self.pid,timer=hex(self.address),period_ms=struct.unpack('<d',self.read(self.address+0x58,8))[0])
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('pid',type=int);p.add_argument('--scale',type=float,choices=[1,.5,.25]);p.add_argument('--seconds',type=float,default=10);a=p.parse_args()
 if not 0<a.seconds<=60:p.error('seconds must be >0 and <=60')
 t=Timer(a.pid,write=a.scale is not None)
 try:
  print(json.dumps(t.info()),flush=True)
  if a.scale is None:return
  def stop(signum,frame):raise InterruptedError(f'Signal {signum}')
  signal.signal(signal.SIGTERM,stop);signal.signal(signal.SIGINT,stop)
  try:
   t.set(a.scale);print(json.dumps(dict(event='applied',**t.info())),flush=True);time.sleep(a.seconds)
  finally:
   t.restore();print(json.dumps(dict(event='restored',**t.info())),flush=True)
 finally:t.close()
if __name__=='__main__':main()
