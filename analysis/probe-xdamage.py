#!/usr/bin/env python3
"""Observe X11 damage notifications, not compositor presentation or true FPS.

NonEmpty notifications are acknowledged immediately. Multiple drawing operations
can coalesce while damage is pending; timestamps have millisecond resolution.
This is a low-overhead diagnostic, not proof of completed frames or smoothness.
"""
import argparse, ctypes as C, ctypes.util, json, select, time
p=argparse.ArgumentParser();p.add_argument('--display',default=':0');p.add_argument('--seconds',type=float,default=10);a=p.parse_args()
x=C.CDLL(ctypes.util.find_library('X11'));d=C.CDLL(ctypes.util.find_library('Xdamage'))
def bind(lib,name,args,ret):
 f=getattr(lib,name);f.argtypes=args;f.restype=ret;return f
ptr=C.c_void_p;ul=C.c_ulong;i=C.c_int
op=bind(x,'XOpenDisplay',[C.c_char_p],ptr);close=bind(x,'XCloseDisplay',[ptr],i)
root=bind(x,'XDefaultRootWindow',[ptr],ul);conn=bind(x,'XConnectionNumber',[ptr],i)
pending=bind(x,'XPending',[ptr],i);nxt=bind(x,'XNextEvent',[ptr,ptr],i);flush=bind(x,'XFlush',[ptr],i)
query=bind(d,'XDamageQueryExtension',[ptr,C.POINTER(i),C.POINTER(i)],i)
create=bind(d,'XDamageCreate',[ptr,ul,i],ul);subtract=bind(d,'XDamageSubtract',[ptr,ul,ul,ul],None);destroy=bind(d,'XDamageDestroy',[ptr,ul],None)
class Rect(C.Structure):_fields_=[('x',C.c_short),('y',C.c_short),('width',C.c_ushort),('height',C.c_ushort)]
class Damage(C.Structure):_fields_=[('type',i),('serial',ul),('send_event',i),('display',ptr),('drawable',ul),('damage',ul),('level',i),('more',i),('timestamp',ul),('area',Rect),('geometry',Rect)]
dis=op(a.display.encode());assert dis,'Cannot open display'
evbase=i();errbase=i();assert query(dis,C.byref(evbase),C.byref(errbase)),'No DAMAGE extension'
handle=create(dis,root(dis),3);flush(dis)
event=(C.c_long*24)();samples=[];start=time.monotonic()
try:
 while time.monotonic()-start<a.seconds:
  if not pending(dis):select.select([conn(dis)],[],[],min(.1,max(0,a.seconds-(time.monotonic()-start))))
  while pending(dis):
   nxt(dis,C.byref(event));e=C.cast(C.byref(event),C.POINTER(Damage)).contents
   if e.type==evbase.value and e.damage==handle:
    samples.append(dict(local_ms=(time.monotonic()-start)*1000,server_ms=e.timestamp,area=[e.area.x,e.area.y,e.area.width,e.area.height]))
    subtract(dis,handle,0,0);flush(dis)
finally:destroy(dis,handle);close(dis)
gaps=[b['local_ms']-a['local_ms'] for a,b in zip(samples[1:],samples[2:])]
sorted_gaps=sorted(gaps)
print(json.dumps(dict(method='XDamage NonEmpty root notifications; not presented FPS',duration_s=time.monotonic()-start,count=len(samples),interval_ms=dict(median=sorted_gaps[len(gaps)//2],p95=sorted_gaps[min(len(gaps)-1,int(len(gaps)*.95))],max=max(gaps),over25=sum(g>25 for g in gaps),over40=sum(g>40 for g in gaps)) if gaps else None,samples=samples),indent=2))
