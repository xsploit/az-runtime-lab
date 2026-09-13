"""Read-only, process-bound native AZ view observer for private QEMU lab.

Repeated matching reads detect some races, not an atomic GUI-thread snapshot.
Discovery is separate. Never cache a manager pointer across player sessions.
"""
import os,select,struct,time

class ViewUnavailable(RuntimeError):pass

def read_layout(q,manager):
 if q(manager)!=0x29cb4a0:raise ViewUnavailable('View manager identity changed')
 nested=q(manager+24)
 if not nested or nested%8:raise ViewUnavailable('Invalid nested view object')
 vt=q(nested)
 if not vt or q(vt+488)!=0x198f468:raise ViewUnavailable('Unsupported view getter override')
 current=q(nested+336)
 if not current or current%8:raise ViewUnavailable('No current view')
 identity=q(current+248);browse=q(0x3baf670);pc=q(0x3baf678)
 source=q(0x3baf668);waveform=q(0x3baf6d0)
 if not identity or not all((browse,pc,source,waveform)) or len({browse,pc,source,waveform})!=4:raise ViewUnavailable('Uninitialized or aliased view names')
 return (nested,vt,current,identity,browse,pc,source,waveform)

def stable_view(q,manager):
 first=read_layout(q,manager);second=read_layout(q,manager)
 if first!=second:raise ViewUnavailable('View changed during observation')
 nested,vt,current,identity,browse,pc,source,waveform=second
 # 'other' names are deliberately opaque until separately mapped.
 names={browse:'browse',pc:'pc_control'}
 if source and source not in names:names[source]='source'
 if waveform and waveform not in names:names[waveform]='waveform'
 kind=names.get(identity,'other')
 return dict(kind=kind,identity=identity,current=current,nested=nested)

def discover_manager(q):
 app=q(0x3bd5d70)
 if not app or app%8 or q(app)!=0x2968548:raise ViewUnavailable('AZ application not initialized')
 ui=q(app+272)
 if not ui or ui%8 or q(ui)!=0x29676f0:raise ViewUnavailable('UI layer not initialized')
 gui=q(ui+16)
 if not gui or gui%8 or q(gui)!=0x29676d0:raise ViewUnavailable('GUI owner not initialized')
 manager=q(gui+400)
 if not manager or manager%8 or q(manager)!=0x29cb4a0:raise ViewUnavailable('View owner not initialized')
 return manager

class LiveView:
 def __init__(self,pid,manager=None):
  if type(pid) is not int or pid<=0 or manager is not None and (type(manager) is not int or manager<=0 or manager%8):
   raise ValueError('Explicit positive PID and aligned manager address required')
  self.pid=pid;self.manager=manager;self.auto=manager is None;self.pidfd=None;self.mem=None
  try:
   self.pidfd=os.pidfd_open(pid);self.poll=select.poll();self.poll.register(self.pidfd,select.POLLIN)
   self.mem=os.open(f'/proc/{pid}/mem',os.O_RDONLY|os.O_CLOEXEC)
   self._alive()
   if os.pread(self.mem,8,0x198f468)!=bytes.fromhex('01a840f940120190'):
    raise ViewUnavailable('Mapped getter does not match AZ lab layout')
   if self.q(0x29cb498)!=0x29cb050 or self.q(0x29cb4b0)!=0x198cac0:
    raise ViewUnavailable('Mapped view vtable does not match AZ lab layout')
   if self.auto:self.manager=discover_manager(self.q)
   self.sample()
  except BaseException:self.close();raise
 def _alive(self):
  if self.pidfd is None or self.poll.poll(0):raise ViewUnavailable('Player session ended')
 def q(self,address):
  if address<=0 or address%8:raise ViewUnavailable('Invalid aligned read address')
  try:return struct.unpack('<Q',os.pread(self.mem,8,address))[0]
  except (OSError,struct.error) as exc:raise ViewUnavailable('View memory unavailable') from exc
 def sample(self):
  self._alive()
  if self.auto and discover_manager(self.q)!=self.manager:raise ViewUnavailable('View owner replaced')
  result=stable_view(self.q,self.manager)
  if self.auto and discover_manager(self.q)!=self.manager:raise ViewUnavailable('View owner replaced during observation')
  self._alive()
  result.update(pid=self.pid,observed_at=time.monotonic())
  return result
 def close(self):
  if self.mem is not None:os.close(self.mem);self.mem=None
  if self.pidfd is not None:os.close(self.pidfd);self.pidfd=None
 def __enter__(self):return self
 def __exit__(self,*_):self.close()
