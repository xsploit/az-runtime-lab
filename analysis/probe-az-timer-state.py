"""Read AZ v1.30 timer fields without stopping the process.
Requires ptrace read permission (run locally on target with sudo). The timer
address must be discovered in the current process; never reuse across launches.
Layout is specific to the analyzed EP147, not portable to other firmware.
"""
import argparse,json,os,struct,time
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('address',type=lambda x:int(x,0));p.add_argument('--seconds',type=float,default=8);a=p.parse_args()
fd=os.open(f'/proc/{a.pid}/mem',os.O_RDONLY)
try:
 assert struct.unpack('<Q',os.pread(fd,8,a.address))[0]==0x2e414e0,'Unexpected timer vtable'
 start=time.monotonic();last=[None,None];samples=[[],[]]
 while time.monotonic()-start<a.seconds:
  raw=os.pread(fd,48,a.address+0x58)
  period,path,vsync,now,paint,blit=struct.unpack('<dQdddd',raw)
  assert abs(period-1000/59.24)<1e-8,'Unexpected timer period'
  for i,v in enumerate([paint,blit]):
   if v!=last[i]:samples[i].append(dict(observed_ms=(time.monotonic()-start)*1000,native_ms=v));last[i]=v
  time.sleep(.001)
finally:os.close(fd)
result=dict(pid=a.pid,object=hex(a.address),period_ms=period,seconds=time.monotonic()-start,fields={})
for name,ss in zip(['offset78_repaint','offset80_blit'],samples):
 gs=sorted(b['native_ms']-a['native_ms'] for a,b in zip(ss,ss[1:]))
 result['fields'][name]=dict(changes=len(ss),interval_ms=dict(median=gs[len(gs)//2],p95=gs[int(len(gs)*.95)],max=max(gs)) if gs else None,samples=ss)
print(json.dumps(result,indent=2))
