"""Reversible native AZ upload comparison. No firmware/instruction changes.

Discovers current LocalPlayer sources and loaded experiment data symbols.
Caller settles transport first. Paused mode checks source stability; motion
mode checks both decks' source rates. Restores the initial upload switch.
"""
import argparse,hashlib,json,os,signal,struct,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('--xserver',type=int,required=True);p.add_argument('--output',type=Path,required=True);p.add_argument('--motion',action='store_true');p.add_argument('--replay-cue',action='store_true');p.add_argument('--seconds',type=int,default=12);a=p.parse_args()
assert 1<=a.seconds<=60 and (not a.replay_cue or a.motion)
a.output.mkdir(parents=True,exist_ok=True);proc=Path(f'/proc/{a.pid}')
assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest()=='137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
identity=(proc/'stat').read_text().rsplit(')',1)[1].split()[19]
server=Path(f'/proc/{a.xserver}');server_id=(server/'stat').read_text().rsplit(')',1)[1].split()[19]
assert (server/'comm').read_text().strip()=='Xwayland'
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
(a.output/'players.json').write_text(json.dumps([{'object':hex(o),'source':hex(s)} for o,s in zip(players,sources)],indent=2))
mapping=next(s for s in (proc/'maps').read_text().splitlines() if s.endswith('/lab-shims/ximage-present.so') and s.split()[2]=='00000000');base=int(mapping.split('-')[0],16)
shim=Path('/home/pompu_5/az-native-lab/shims/ximage-present.so');shim_sha=hashlib.sha256(shim.read_bytes()).hexdigest()
symbols={s.split()[2]:base+int(s.split()[0],16) for s in subprocess.check_output(['nm','-D',str(shim)],text=True).splitlines() if len(s.split())==3 and s.split()[2].startswith('lab_present_')}
switch=symbols['lab_present_enabled'];initial=read(switch,'<I');assert initial in (0,1)
def snapshot():
 assert all(read(o)==0x2da1c28 and read(o+0xb0)==src and read(src)==0x25eb390 for o,src in zip(players,sources))
 return {'time':time.monotonic(),'positions':[read(s+0xe8,'<q') for s in sources],'enabled':read(switch,'<I'),'uploads':read(symbols['lab_present_uploads']),'fallbacks':read(symbols['lab_present_fallbacks'])}
def change(value,label):
 code=f'''import gdb,hashlib
from pathlib import Path
i=gdb.selected_inferior()
assert i.pid=={a.pid}
assert Path('/proc/{a.pid}/stat').read_text().rsplit(')',1)[1].split()[19]=={identity!r}
assert {mapping!r} in Path('/proc/{a.pid}/maps').read_text().splitlines()
assert hashlib.sha256(Path({str(shim)!r}).read_bytes()).hexdigest()=={shim_sha!r}
assert int.from_bytes(bytes(i.read_memory({switch},4)),'little') in (0,1)
i.write_memory({switch},({value}).to_bytes(4,'little'))
print('PRESENT_SWITCH_VERIFIED',{value})'''
 script=a.output/f'{label}.gdb';script.write_text(f'set pagination off\nset confirm off\nset auto-load off\nset print thread-events off\nattach {a.pid}\npython\n'+code+'\nend\ndetach\nquit\n')
 r=subprocess.run(['gdb','-q','-nx','-batch','-x',str(script)],capture_output=True,text=True,timeout=15)
 (a.output/f'{label}.gdb.log').write_text(r.stdout+r.stderr);r.check_returncode();assert f'PRESENT_SWITCH_VERIFIED {value}' in r.stdout and read(switch,'<I')==value
 time.sleep(.4)
def cpus():
 assert (server/'stat').read_text().rsplit(')',1)[1].split()[19]==server_id
 out=[]
 for p in (proc,server):
  v=(p/'stat').read_text().rsplit(')',1)[1].split();out.append(int(v[11])+int(v[12]))
 return out
def interrupted(sig,frame):raise InterruptedError(sig)
for s in (signal.SIGINT,signal.SIGTERM):signal.signal(s,interrupted)
def pulse(mask):
 from az_mixer_packet import crc16
 fd=os.open('/home/pompu_5/az-native-lab/xdjaz/state/tmp/erp-rx.fifo',os.O_WRONLY|os.O_NONBLOCK)
 try:
  for v in (0,mask,0):
   f=bytearray(128);f[0]=1;f[10]=v;f[18]=v;f[28:30]=crc16(f[:28]).to_bytes(2,'little');assert os.write(fd,f)==128;time.sleep(.2)
 finally:os.close(fd)
results=[];cue_position=None
try:
 for label,enabled in [('original-upload',0),('staged-upload',1),('original-upload-restored',0)]:
  if a.replay_cue:
   pulse(4);cue=snapshot();time.sleep(.4);assert snapshot()['positions']==cue['positions']
   if cue_position is None:cue_position=cue['positions']
   assert cue['positions']==cue_position,'Native cue did not return to the same source position'
   (a.output/'replay-cue.json').write_text(json.dumps({'source_positions':cue_position})+'\n')
  change(enabled,label)
  if a.replay_cue:pulse(2)
  before=snapshot();time.sleep(.5);check=snapshot()
  assert all(y>x for x,y in zip(before['positions'][:2],check['positions'][:2])) if a.motion else before['positions']==check['positions']
  row={'phase':label,'before':before}
  if a.motion:
   c=cpus();t=time.monotonic();time.sleep(4);elapsed=time.monotonic()-t
   row['cpu_percent_one_core']={n:100*(end-start)/os.sysconf('SC_CLK_TCK')/elapsed for n,start,end in zip(['player','xwayland'],c,cpus())}
   subprocess.run(['ffmpeg','-v','error','-y','-f','x11grab','-framerate','60','-video_size','640x190','-i',':0+420,85','-t',str(a.seconds),'-c:v','libx264rgb','-threads','1','-preset','ultrafast','-crf','0',str(a.output/f'{label}.mkv')],check=True,timeout=a.seconds+10)
  subprocess.run(['ffmpeg','-v','error','-y','-f','x11grab','-video_size','1280x800','-i',':0','-frames:v','1',str(a.output/f'{label}.png')],check=True,timeout=6)
  row['after']=snapshot();row['source_rates']=[(y-x)/(row['after']['time']-before['time']) for x,y in zip(before['positions'],row['after']['positions'])]
  row['transport_valid']=all(42000<r<46000 for r in row['source_rates'][:2]) if a.motion else row['after']['positions']==before['positions']
  results.append(row);(a.output/'results.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(row),flush=True);assert row['transport_valid']
finally:
 change(initial,'final-restore');print(f'Initial upload switch restored: {initial}',flush=True)
