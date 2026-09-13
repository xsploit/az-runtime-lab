"""Live FLX6 replay using automatic native view observation, no page hints."""
import json,os,time,subprocess
from pathlib import Path
from az_live_view import LiveView,ViewUnavailable
from az_live_navigation import LiveNavigation
from flx6_navigation import Navigation
b=Path(__file__).resolve().parents[1];pid=None
for p in Path('/proc').iterdir():
 if not p.name.isdigit():continue
 try:a=(p/'cmdline').read_bytes().split(b'\0')
 except OSError:continue
 if a[0]==b'/qemu' and b'/home/root/pdj/EP147' in a:
  assert pid is None;pid=int(p.name)
assert pid;deadline=time.monotonic()+15
while True:
 try:reader=LiveView(pid);break
 except ViewUnavailable:
  if time.monotonic()>deadline:raise
  time.sleep(.1)
obs=[]
with reader:
 n=Navigation(b.parent/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml');nav=LiveNavigation(n,reader)
 fd=os.open(b/'xdjaz/state/tmp/mixer-rx.fifo',os.O_WRONLY|os.O_NONBLOCK)
 def send(packet):
  if packet is not None:assert os.write(fd,packet)==128
 def pulse(control):
  send(nav.message(0x96,control,127));time.sleep(.3);send(nav.message(0x96,control,0));time.sleep(1.5)
 def sample(label,screenshot=False):
  state=reader.sample();state['label']=label
  if screenshot:
   path=b/'xdjaz'/('auto-nav-'+label+'.png')
   subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',':0','-frames:v','1',str(path)],check=True,timeout=10)
   state['screenshot']=str(path)
  obs.append(state);print(json.dumps(state),flush=True)
 try:
  sample('initial');assert obs[-1]['kind']=='source'
  for _ in range(5):pulse(0x41)
  sample('tracks');assert obs[-1]['kind']=='browse'
  pulse(0x65);sample('back',True)
  pulse(0x41)
  # Establish waveform with the native toggle, then exercise preferred View.
  n.frame[32]|=64;send(n.packet());time.sleep(.3);n.frame[32]&=~64;send(n.packet());time.sleep(1.5)
  sample('waveform');assert obs[-1]['kind']=='waveform'
  pulse(0x7a);sample('view',True);assert obs[-1]['kind']=='browse'
  pulse(0x7a);sample('view-repeat',True);assert obs[-1]['kind']=='browse'
 finally:os.close(fd)
(b/'analysis/auto-navigation-live.json').write_text(json.dumps(dict(pid=pid,observations=obs,scope='Native packet replay with automatic page reads; no physical FLX6; read and input not atomic'),indent=2)+'\n')
