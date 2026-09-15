"""Reversible AZ1.30 single-lane/zoom<1 contrast-blend comparison.

Requires two already paused decks and fixture encoder counter1. Rebuilds the
same view by zoom2->1. Does not alter transport or persist firmware changes.
GDB writes code while stopped; finally restores bytes and rebuilds original.
"""

# Locate shared helpers from this checkout, independent of the caller's cwd.
import sys as _az_sys
from pathlib import Path as _AzPath
_az_sys.path.insert(0, str(_AzPath(__file__).resolve().parents[1]))
from az_paths import lab_path

import argparse,hashlib,json,os,signal,subprocess,time
from pathlib import Path
from az_mixer_packet import crc16
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('--motion',action='store_true',help='Requires already playing decks; sequential six-second samples, not matched content');a=p.parse_args()
base=lab_path('');root=Path('/tmp/az-blend-motion' if a.motion else '/tmp/az-blend-compare');root.mkdir(exist_ok=True)
assert hashlib.sha256(Path(f'/proc/{a.pid}/exe').read_bytes()).hexdigest()=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
patches=[(0x1e0246c,0x5400126d),(0x1e02548,0x54000f6d),(0x1e025f0,0x54001bad),(0x1e027d4,0x5400056d)]
candidate=0x14000006
identity=Path(f'/proc/{a.pid}/stat').read_text().rsplit(')',1)[1].split()[19]
def values():
 assert Path(f'/proc/{a.pid}/stat').read_text().rsplit(')',1)[1].split()[19]==identity
 with open(f'/proc/{a.pid}/mem','rb',buffering=0) as m:
  out=[]
  for addr,_ in patches:m.seek(addr);out.append(int.from_bytes(m.read(4),'little'))
 return out
def patch(enable):
 current=values()
 assert all(v in (old,candidate) for v,(_,old) in zip(current,patches))
 commands=['set pagination off','set confirm off','set auto-load off','set print thread-events off',f'attach {a.pid}']
 commands += [f'set {{unsigned int}}{addr:#x} = {(candidate if enable else old):#x}' for addr,old in patches]
 commands+=['detach','quit'];g=root/'change.gdb';g.write_text('\n'.join(commands)+'\n')
 r=subprocess.run(['gdb','-q','-nx','-batch','-x',str(g)],capture_output=True,text=True,timeout=10)
 (root/('apply.log' if enable else 'restore.log')).write_text(r.stdout+r.stderr)
 r.check_returncode();assert values()==[candidate if enable else old for _,old in patches]
def rebuild():
 for counter in [2,1]:
  f=bytearray(128);f[0]=1;f[34:36]=counter.to_bytes(2,'little',signed=True);f[96:98]=crc16(f[:96]).to_bytes(2,'little')
  fd=os.open(base/'xdjaz/state/tmp/mixer-rx.fifo',os.O_WRONLY|os.O_NONBLOCK)
  try:os.write(fd,f)
  finally:os.close(fd)
  time.sleep(.6)
def capture(label):
 subprocess.run(['ffmpeg','-v','error','-y','-f','x11grab','-video_size','1280x800','-i',':0','-frames:v','1',str(root/f'{label}.png')],check=True,timeout=5)
def interrupted(sig,frame):raise InterruptedError(sig)
def motion(label):
 def cpu():
  f=Path(f'/proc/{a.pid}/stat').read_text().rsplit(')',1)[1].split()
  return int(f[11])+int(f[12])
 before=cpu();start=time.monotonic()
 subprocess.run(['ffmpeg','-v','error','-y','-f','x11grab','-framerate','120','-video_size','620x82','-i',':0+420,89','-t','6','-f','framemd5',str(root/f'{label}.framemd5')],check=True,timeout=12)
 elapsed=time.monotonic()-start
 results.append({'phase':label,'cpu_percent_one_core':100*(cpu()-before)/os.sysconf('SC_CLK_TCK')/elapsed,'elapsed':elapsed})
 capture(label)
for sig in (signal.SIGINT,signal.SIGTERM):signal.signal(sig,interrupted)
assert values()==[old for _,old in patches]
results=[]
try:
 if a.motion:
  motion('original');patch(True);motion('candidate')
 else:
  rebuild();capture('original');time.sleep(.5);capture('original-repeat')
  patch(True);rebuild();capture('candidate')
finally:
 patch(False)
 if a.motion:motion('restored')
 else:rebuild();capture('restored')
(root/'results.json').write_text(json.dumps(results,indent=2)+'\n')
print(json.dumps({'pid':a.pid,'directory':str(root),'restored':values()==[old for _,old in patches]}))
