"""Short, reversible native scheduling experiment for the pinned AZ binary.
Uses GDB/ptrace writes while stopped (including instruction-cache handling).
No firmware file writes. Original instructions restored in finally.
SIGINT/SIGTERM trigger restoration; SIGKILL/host loss cannot run cleanup.
Restarting the original executable clears in-memory changes.
"""
import argparse,hashlib,json,os,signal,subprocess,time,struct
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('--timer-fields',action='store_true');a=p.parse_args()
assert hashlib.sha256(Path(f'/proc/{a.pid}/exe').read_bytes()).hexdigest()=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
patches=[(0x212fb94,0x7100041f,0x7100001f),(0x212f344,0x7100041f,0x7100001f),(0x212f974,0x11000673,0x52800033),(0x212f9ac,0x11000673,0x52800033)]
start_id=Path(f'/proc/{a.pid}/stat').read_text().rsplit(')',1)[1].split()[19]
def memvals():
 assert Path(f'/proc/{a.pid}/stat').read_text().rsplit(')',1)[1].split()[19]==start_id
 with open(f'/proc/{a.pid}/mem','rb',buffering=0) as m:
  out=[]
  for addr,_,_ in patches:m.seek(addr);out.append(int.from_bytes(m.read(4),'little'))
 return out
def change(enable):
 current=memvals()
 expected=[old if enable else new for _,old,new in patches]
 # Restore also handles a partial application: only known original/candidate bytes.
 assert all(c in (old,new) for c,(_,old,new) in zip(current,patches))
 if enable:assert current==expected
 lines=['set pagination off','set confirm off','set auto-load off','set print thread-events off',f'attach {a.pid}']
 for addr,old,new in patches:lines.append(f'set {{unsigned int}}{addr:#x} = {(new if enable else old):#x}')
 lines+=['detach','quit'];fn=Path('/tmp/az-one-tick.gdb');fn.write_text('\n'.join(lines)+'\n')
 r=subprocess.run(['gdb','-q','-nx','-batch','-x',str(fn)],capture_output=True,text=True,timeout=10)
 Path(f'/tmp/az-one-tick-{"apply" if enable else "restore"}.log').write_text(r.stdout+r.stderr)
 r.check_returncode();assert memvals()==[new if enable else old for _,old,new in patches]
def interrupted(sig,frame):raise InterruptedError(sig)
for sig in (signal.SIGINT,signal.SIGTERM):signal.signal(sig,interrupted)
assert memvals()==[old for _,old,_ in patches]
results=[]
try:
 for label,enabled in [('original',False),('candidate',True),('restored',False)]:
  if label!='original':change(enabled)
  time.sleep(.25)
  if a.timer_fields:
   with open(f'/proc/{a.pid}/mem','rb',buffering=0) as m:
    m.seek(0x3bd6708);timer=int.from_bytes(m.read(8),'little')-0x28
    m.seek(timer);assert int.from_bytes(m.read(8),'little')==0x2e414e0
    end=time.monotonic()+6;last=None;records=[]
    while time.monotonic()<end:
     m.seek(timer+0x78);values=struct.unpack('<dd',m.read(16))
     if values!=last:records.append([time.monotonic(),*values]);last=values
     time.sleep(.001)
   Path(f'/tmp/az-one-tick-fields-{label}.json').write_text(json.dumps(records))
  else:
   subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-framerate','120','-video_size','850x170','-i',':0+180,90','-t','6','-f','framemd5',f'/tmp/az-one-tick-{label}.framemd5'],check=True,timeout=12)
  results.append({'label':label,'instructions':[hex(v) for v in memvals()]})
finally:
 change(False)
Path('/tmp/az-one-tick-results.json').write_text(json.dumps({'patches':[{'address':hex(a),'original':hex(o),'candidate':hex(n)} for a,o,n in patches],'samples':results,'restored':True},indent=2)+'\n')
print('original instructions restored')
