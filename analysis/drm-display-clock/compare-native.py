"""Reversible native AZ upload comparison. No firmware/instruction changes.

Discovers current LocalPlayer sources and loaded experiment data symbols.
Caller settles transport first. Paused mode checks source stability; motion
mode checks both decks' source rates. Restores the initial upload switch.
"""
import argparse,hashlib,json,os,signal,struct,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('--xserver',type=int,required=True);p.add_argument('--output',type=Path,required=True);p.add_argument('--seconds',type=int,default=12);p.add_argument('--launcher',type=int,required=True);a=p.parse_args()
assert 1<=a.seconds<=60
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
def cpus():
 assert (server/'stat').read_text().rsplit(')',1)[1].split()[19]==server_id
 out=[]
 for p in (proc,server,Path('/proc/self')):
  v=(p/'stat').read_text().rsplit(')',1)[1].split();out.append(int(v[11])+int(v[12]))
 if clock_process is not None:
  v=Path(f'/proc/{clock_process.pid}/stat').read_text().rsplit(')',1)[1].split();out.append(int(v[11])+int(v[12]))
 else:out.append(0)
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

import statistics
ratefile=Path('/home/pompu_5/az-native-lab/analysis/panel-rate-test/rate.txt')
initial_rate=ratefile.read_text().strip();assert initial_rate=='59.24'
timer=read(0x3bd6708)-0x28
assert read(timer)==0x2e414e0
initial=read(timer+0x58,'<d');assert abs(initial-1000/59.24)<1e-10
results=[]
def positions():return [read(s+0xe8,'<q') for s in sources]
def change(hz,label):
 code=f"""import gdb,struct
from pathlib import Path
i=gdb.selected_inferior()
assert i.pid=={a.pid}
assert Path('/proc/{a.pid}/stat').read_text().rsplit(')',1)[1].split()[19]=={identity!r}
assert int.from_bytes(bytes(i.read_memory({timer},8)),'little')==0x2e414e0
old=struct.unpack('<d',bytes(i.read_memory({timer+0x58},8)))[0]
assert any(abs(old-1000/r)<1e-10 for r in (59.24,60.018))
i.write_memory({timer+0x58},struct.pack('<d',{1000/hz!r}))
Path({str(ratefile)!r}).write_text({str(hz)!r})
print('RATE_VERIFIED',{hz})"""
 script=a.output/f'{label}.gdb';script.write_text(f'set pagination off\nset confirm off\nset auto-load off\nset print thread-events off\nattach {a.pid}\npython\n'+code+'\nend\ndetach\nquit\n')
 r=subprocess.run(['gdb','-q','-nx','-batch','-x',str(script)],capture_output=True,text=True,timeout=15)
 (a.output/f'{label}.gdb.log').write_text(r.stdout+r.stderr);r.check_returncode();assert 'RATE_VERIFIED' in r.stdout
 assert abs(read(timer+0x58,'<d')-1000/hz)<1e-10
 time.sleep(.5)
def measure(label,hz):
 c=cpus();started=time.monotonic();pos=positions();records=[]
 while time.monotonic()-started<8:
  records.append([time.monotonic(),read(timer+0x78,'<d'),read(timer+0x80,'<d'),get_sequence()[1]/1e6,read(timer+0x68,'<d')]);time.sleep(.002)
 elapsed=time.monotonic()-started;endpos=positions();rates=[(y-x)/elapsed for x,y in zip(pos,endpos)]
 assert sum(42000<r<46000 for r in rates)==2,rates
 row={'phase':label,'hz':hz,'source_rates':rates,'cpu_percent_one_core':dict(zip(['player','xwayland','test_process','display_helper'],[100*(y-x)/os.sysconf('SC_CLK_TCK')/elapsed for x,y in zip(c,cpus())]))}
 row['rss_kib']=next(line for line in (proc/'status').read_text().splitlines() if line.startswith('VmRSS:'))
 row['drm_writer']=dict(clock_stats)
 row['temperature_c']=int(Path('/sys/class/thermal/thermal_zone0/temp').read_text())/1000
 for col,name in [(1,'repaint'),(2,'upload')]:
  changes=[b[col]-a[col] for a,b in zip(records,records[1:]) if b[col]!=a[col]]
  ordered=sorted(changes)
  row[name]={'hz':len(changes)/elapsed,'interval_median_ms':statistics.median(changes),'p95_ms':ordered[int(.95*(len(ordered)-1))],'max_ms':max(changes),'negative':sum(x<0 for x in changes)}
 if clock_error: raise RuntimeError(clock_error)
 (a.output/f'{label}-timings.json').write_text(json.dumps(records))
 subprocess.run(['ffmpeg','-v','error','-y','-f','x11grab','-framerate','60','-video_size','640x380','-i',':0+420,85','-t',str(a.seconds),'-c:v','libx264rgb','-threads','1','-preset','ultrafast','-crf','0',str(a.output/f'{label}.mkv')],check=True,timeout=a.seconds+10)
 subprocess.run(['ffmpeg','-v','error','-y','-f','x11grab','-video_size','1280x800','-i',':0','-frames:v','1',str(a.output/f'{label}.png')],check=True,timeout=6)
 results.append(row);(a.output/'results.json').write_text(json.dumps(results,indent=2));print(json.dumps(row),flush=True)

import ctypes,threading
from display_timing import publish_timing
launcher=Path(f'/proc/{a.launcher}')
launcher_identity=(launcher/'stat').read_text().rsplit(')',1)[1].split()[19]
assert b'run-az-timing-test.py' in (launcher/'cmdline').read_bytes()
assert (launcher/'stat').read_text().rsplit(')',1)[1].split()[0] not in ('T','t')
sock=next(Path('/run/user/1000').glob('sway-ipc.*.sock'))
output=json.loads(subprocess.check_output(['swaymsg','-r','-t','get_outputs'],env=dict(os.environ,SWAYSOCK=str(sock)),text=True))
panel=next(o for o in output if o['name']=='DSI-2' and o['active'])
assert panel['scale_filter']=='linear' and panel['current_mode']['refresh']==60018
lib=ctypes.CDLL('libdrm.so.2',use_errno=True)
lib.drmCrtcGetSequence.argtypes=[ctypes.c_int,ctypes.c_uint32,ctypes.POINTER(ctypes.c_uint64),ctypes.POINTER(ctypes.c_uint64)]
lib.drmCrtcGetSequence.restype=ctypes.c_int
fd=os.open('/dev/dri/card0',os.O_RDWR|os.O_CLOEXEC)
def get_sequence():
 seq,stamp=ctypes.c_uint64(),ctypes.c_uint64()
 if lib.drmCrtcGetSequence(fd,36,ctypes.byref(seq),ctypes.byref(stamp)):raise OSError(ctypes.get_errno(),'DRM sequence read failed')
 assert 0<=time.monotonic_ns()-stamp.value<100_000_000,'DRM timestamp stale/future'
 return seq.value,stamp.value
get_sequence()
clock_process=None;clock_error=[];clock_stats={};clock_log=None
clockfile=Path('/home/pompu_5/az-native-lab/xdjaz/state/sys/module/rockchipdrm/parameters/vsync_time')
def physical_on():
 global clock_process,clock_log
 assert (launcher/'stat').read_text().rsplit(')',1)[1].split()[19]==launcher_identity
 os.kill(a.launcher,signal.SIGSTOP)
 for _ in range(100):
  if (launcher/'stat').read_text().rsplit(')',1)[1].split()[0]=='T':break
  time.sleep(.001)
 assert (launcher/'stat').read_text().rsplit(')',1)[1].split()[0]=='T'
 clock_log=(a.output/'native-publisher.log').open('w')
 clock_process=subprocess.Popen(['/tmp/az-drm-publish','/dev/dri/card0','36',str(clockfile),'120'],stdout=clock_log,stderr=clock_log,user=1000,group=1000)
 time.sleep(.2);assert clock_process.poll() is None,'Native display helper failed'
 st=clockfile.stat();assert st.st_uid==1000 and (st.st_mode&0o444),'Clock is not readable by player'
 timestamp=int(clockfile.read_text());assert 0<=time.monotonic_ns()-timestamp<50_000_000
 clock_stats['native_pid']=clock_process.pid

def physical_off():
 global clock_process,clock_log
 if clock_process is not None:
  clock_process.terminate();clock_process.wait(timeout=3);rc=clock_process.returncode
  clock_log.close();clock_log=None;clock_process=None
  if rc:clock_error.append('Native publisher failed; inspect native-publisher.log')
 assert (launcher/'stat').read_text().rsplit(')',1)[1].split()[19]==launcher_identity
 os.kill(a.launcher,signal.SIGCONT)
 time.sleep(.1)
cue=None
try:
 for label,hz,physical in [('synthetic-before',59.24,False),('physical-refresh',60.018,True),('synthetic-restored',59.24,False)]:
  physical_off()
  pulse(4);pos=positions();time.sleep(.4);assert pos==positions(),'Native cue failed'
  if cue is None:cue=pos
  assert cue==pos,'Cue differs between phases'
  change(hz,label)
  if physical:physical_on()
  pulse(2);time.sleep(1)
  measure(label,hz)
finally:
 try:physical_off()
 finally:
  change(float(initial_rate),'final-restore')
  os.close(fd)
  (a.output/'restored.json').write_text(json.dumps({'native_period_ms':read(timer+0x58,'<d'),'rate_file':ratefile.read_text(),'pid':a.pid,'launcher_state':(launcher/'stat').read_text().rsplit(')',1)[1].split()[0]}))
