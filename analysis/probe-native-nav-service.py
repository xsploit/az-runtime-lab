"""Exercise actual MIDI service + RX owner + native player, then graceful release."""
import json,socket,subprocess,sys,tempfile,time
from pathlib import Path
b=Path(__file__).resolve().parents[1];log=b/'analysis/native-nav-service-launch.log'
deadline=time.monotonic()+40
while '"event": "rx_feedback"' not in log.read_text():
 if time.monotonic()>deadline:raise RuntimeError('No RX ready')
 time.sleep(.1)
events=[json.loads(x) for x in log.read_text().splitlines() if x.startswith('{')]
r=next(x for x in events if x.get('event')=='rx_feedback');m=next(x for x in events if x.get('event')=='mixer_control');display=next(x for x in events if x.get('event')=='started')['display']
pids=[]
for p in Path('/proc').iterdir():
 if not p.name.isdigit():continue
 try:a=(p/'cmdline').read_bytes().split(b'\0')
 except OSError:continue
 if a[0]==b'/qemu' and b'/home/root/pdj/EP147' in a:pids.append(int(p.name))
assert len(pids)==1
with tempfile.TemporaryDirectory(prefix='az-nav-live-') as td,(b/'analysis/native-nav-service.log').open('w') as service_log:
 midi=Path(td)/'midi.sock'
 proc=subprocess.Popen([sys.executable,str(b/'analysis/run_native_navigation.py'),str(pids[0]),r['baseline'],r['input_socket'],str(midi),'--mapping',str(b.parent/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml'),'--seconds','60'],stdout=service_log,stderr=service_log)
 try:
  deadline=time.monotonic()+35
  while not midi.exists():
   assert proc.poll() is None and time.monotonic()<deadline
   time.sleep(.05)
  with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sender:
   def pulse(note):
    sender.sendto(bytes([0x96,note,127]),str(midi));time.sleep(.3)
    sender.sendto(bytes([0x96,note,0]),str(midi));time.sleep(1.5)
   for _ in range(5):pulse(0x41)
   sender.sendto(b'P1 0 12300 0 0 1 0',m['socket']);sender.sendto(b'E1 5 0 3 .5',m['socket'])
   pulse(0x46);time.sleep(2)
   subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',display,'-frames:v','1',str(b/'xdjaz/native-nav-service-loaded.png')],check=True,timeout=10)
   pulse(0x7a);pulse(0x65)
   subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',display,'-frames:v','1',str(b/'xdjaz/native-nav-service-back.png')],check=True,timeout=10)
   # Leave encoder press held: service shutdown must emit the release itself.
   sender.sendto(bytes([0x96,0x41,127]),str(midi));time.sleep(.3)
  proc.terminate();proc.wait(timeout=3);assert proc.returncode==0
  assert not midi.exists()
  result=dict(guest_pid=pids[0],service_returncode=proc.returncode,midi_socket_removed=True,scope='Native MIDI datagram replay through RX owner; physical hardware absent; screenshots require review')
  (b/'analysis/native-nav-service-live.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
 finally:
  if proc.poll() is None:proc.terminate();proc.wait(timeout=3)
