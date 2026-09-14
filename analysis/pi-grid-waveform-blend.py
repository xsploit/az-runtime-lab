"""Compare native waveform contrast with continuous blend, fractional grid ON.

Private AZ 1.30 overlay only. Caller settles transport before invoking. All
instruction writes are guarded inside GDB with threads stopped; finally restores
the original waveform branches. Does not alter firmware files or grid settings.
"""

# Locate shared helpers from this checkout, independent of the caller's cwd.
import sys as _az_sys
from pathlib import Path as _AzPath
_az_sys.path.insert(0, str(_AzPath(__file__).resolve().parents[1]))
from az_paths import lab_path

import argparse,hashlib,json,os,signal,subprocess,time
from pathlib import Path
from az_mixer_packet import crc16
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('--players',type=Path,required=True)
p.add_argument('--output',type=Path,required=True);p.add_argument('--motion',action='store_true')
p.add_argument('--smooth-stub',type=Path,help='Native contrast-curve interpolation, instead of bypassing contrast')
p.add_argument('--stub-address',type=lambda v:int(v,0));a=p.parse_args()
root=a.output;root.mkdir(parents=True,exist_ok=True);proc=Path(f'/proc/{a.pid}')
assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest()=='137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
identity=(proc/'stat').read_text().rsplit(')',1)[1].split()[19]
mapping=next(x for x in (proc/'maps').read_text().splitlines() if x.endswith('/lab-shims/fractional-grid.so') and x.split()[2]=='00000000')
base=int(mapping.split('-')[0],16)
nm=subprocess.check_output(['nm','-D',str(lab_path('shims/fractional-grid.so'))],text=True)
switch=base+int(next(x.split()[0] for x in nm.splitlines() if x.endswith(' lab_grid_enabled')),16)
patches=[(0x1e0246c,0x5400126d),(0x1e02548,0x54000f6d),(0x1e025f0,0x54001bad),(0x1e027d4,0x5400056d)]
candidate=0x14000006;players=json.loads(a.players.read_text())
def read(address,length):
 assert (proc/'stat').read_text().rsplit(')',1)[1].split()[19]==identity
 fd=os.open(proc/'mem',os.O_RDONLY)
 try:return os.pread(fd,length,address)
 finally:os.close(fd)
def snapshot():
 assert int.from_bytes(read(switch,4),'little')==1
 return {'time':time.monotonic(),'positions':[int.from_bytes(read(int(x['source'],16)+0xe8,8),'little',signed=True) for x in players[:2]]}
stub_guard=''
if a.smooth_stub:
 assert a.stub_address is not None
 assert all(int.from_bytes(read(addr,4),'little')==old for addr,old in patches), 'Restore original contrast branches first'
 code=a.smooth_stub.read_bytes();assert len(code)<=0x800 and len(code)%4==0
 branch=int.from_bytes(read(0x1b97984,4),'little');assert branch>>26==0b100101
 imm=branch&0x3ffffff
 if imm&(1<<25):imm-=1<<26
 veneer=0x1b97984+imm*4
 assert a.stub_address==veneer+0x400
 assert read(veneer,8)==bytes.fromhex('5000005800021fd6')
 owned=next(line for line in (proc/'maps').read_text().splitlines() if int(line.split('-')[0],16)<=a.stub_address<int(line.split()[0].split('-')[1],16))
 assert owned.split()[1]=='r-xp' and len(owned.split())==5
 assert a.stub_address+len(code)<=int(owned.split()[0].split('-')[1],16)
 patches=[(0x1e00ed4,0x1e620269)]
 delta=a.stub_address-0x1e00ed4;assert delta%4==0 and -(1<<27)<=delta<(1<<27)
 candidate=0x14000000|((delta//4)&0x3ffffff)
 stub_guard=f'''assert {owned!r} in Path('/proc/{a.pid}/maps').read_text().splitlines()
assert int.from_bytes(bytes(i.read_memory(0x1b97984,4)),'little')=={branch}
stub=bytes.fromhex({code.hex()!r})
assert bytes(i.read_memory({a.stub_address},len(stub))) in (bytes(len(stub)),stub)
i.write_memory({a.stub_address},stub)
'''
 # Keep stub code allocated after rollback: a stopped thread may be inside it.
def patch(enabled,label):
 code=f'''import gdb
from pathlib import Path
i=gdb.selected_inferior()
assert i.pid=={a.pid}
assert Path('/proc/{a.pid}/stat').read_text().rsplit(')',1)[1].split()[19]=={identity!r}
assert {mapping!r} in Path('/proc/{a.pid}/maps').read_text().splitlines()
assert int.from_bytes(bytes(i.read_memory({switch},4)),'little')==1
{stub_guard}
for addr,old in {patches!r}:
    assert int.from_bytes(bytes(i.read_memory(addr,4)),'little') in (old,{candidate})
for addr,old in {patches!r}:
    i.write_memory(addr,({candidate} if {enabled!r} else old).to_bytes(4,'little'))
print('WAVEFORM_PATCH_VERIFIED', {enabled!r})'''
 script=root/f'{label}.gdb';script.write_text(f'set pagination off\nset confirm off\nset auto-load off\nset print thread-events off\nattach {a.pid}\npython\n'+code+'\nend\ndetach\nquit\n')
 r=subprocess.run(['gdb','-q','-nx','-batch','-x',str(script)],capture_output=True,text=True,timeout=15)
 (root/f'{label}.gdb.log').write_text(r.stdout+r.stderr);r.check_returncode()
 assert f'WAVEFORM_PATCH_VERIFIED {enabled}' in r.stdout
 assert [int.from_bytes(read(addr,4),'little') for addr,old in patches]==[candidate if enabled else old for addr,old in patches]
 time.sleep(.3)
def rebuild():
 for counter in [2,1]:
  f=bytearray(128);f[0]=1;f[34:36]=counter.to_bytes(2,'little',signed=True);f[96:98]=crc16(f[:96]).to_bytes(2,'little')
  fd=os.open(str(lab_path('xdjaz/state/tmp/mixer-rx.fifo')),os.O_WRONLY|os.O_NONBLOCK)
  try:assert os.write(fd,f)==128
  finally:os.close(fd)
  time.sleep(.4)
def cpu():
 f=(proc/'stat').read_text().rsplit(')',1)[1].split();return int(f[11])+int(f[12])
def capture(label):
 subprocess.run(['ffmpeg','-v','error','-y','-f','x11grab','-video_size','1280x800','-i',':0','-frames:v','1',str(root/f'{label}.png')],check=True,timeout=5)
def interrupted(sig,frame):raise InterruptedError(sig)
for sig in [signal.SIGINT,signal.SIGTERM]:signal.signal(sig,interrupted)
assert all(int.from_bytes(read(addr,4),'little')==old for addr,old in patches)
results=[]
try:
 for label,enabled in [('grid-only',False),('grid-and-smooth-curve' if a.smooth_stub else 'grid-and-blend',True),('grid-only-restored',False)]:
  patch(enabled,label)
  if not a.motion:rebuild()
  before=snapshot();time.sleep(.5);check=snapshot()
  assert (check['positions'][0]>before['positions'][0]) if a.motion else (check['positions']==before['positions'])
  result={'phase':label,'before':before}
  if a.motion:
   c=cpu();start=time.monotonic();time.sleep(4)
   result['cpu_without_capture']=100*(cpu()-c)/os.sysconf('SC_CLK_TCK')/(time.monotonic()-start)
   subprocess.run(['ffmpeg','-v','error','-y','-f','x11grab','-framerate','60','-video_size','640x190','-i',':0+420,85','-t','8','-c:v','libx264rgb','-threads','1','-preset','ultrafast','-crf','0',str(root/f'{label}.mkv')],check=True,timeout=15)
  capture(label);result['after']=snapshot()
  if a.motion:
   result['source_rate']=(result['after']['positions'][0]-before['positions'][0])/(result['after']['time']-before['time'])
   result['transport_valid']=42000<result['source_rate']<46000
  else:result['transport_valid']=result['after']['positions']==before['positions']
  results.append(result);(root/'results.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(result),flush=True)
  assert result['transport_valid'],'Paused, sought or ended during capture; reject comparison'
finally:
 patch(False,'final-restore')
 if not a.motion:rebuild()
 print('Original waveform restored; fractional grid retained.',flush=True)
