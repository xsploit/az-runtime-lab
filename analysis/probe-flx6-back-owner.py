"""Native FLX6 packet replay through RX owner; explicit local USB page context.
No claim of automatic PcControlView disambiguation or physical controller input.
"""
import argparse,json,socket,subprocess,sys,time
from pathlib import Path
from flx6_navigation import Navigation
from az_tx_freshness import TxFreshness
b=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser(description=__doc__);p.add_argument('launch_log',type=Path);a=p.parse_args()
deadline=time.monotonic()+20
while '"event": "rx_feedback"' not in a.launch_log.read_text():
 if time.monotonic()>deadline:raise RuntimeError('No RX service ready')
 time.sleep(.1)
events=[json.loads(x) for x in a.launch_log.read_text().splitlines() if x.startswith('{')]
r=next(x for x in events if x.get('event')=='rx_feedback');d=next(x for x in events if x.get('event')=='started')
n=Navigation(b.parent/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml',Path(r['baseline']).read_bytes())
observations=[]
with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as out:
 out.setblocking(False);out.connect(r['input_socket'])
 def send(packet):
  if packet is not None:assert out.send(packet)==128
 def pulse(control,visible=None):
  send(n.message(0x96,control,127,browser_visible=visible));time.sleep(.3)
  send(n.message(0x96,control,0));time.sleep(1.5)
 def sample(label):
  fresh=TxFreshness();path=b/'xdjaz/state/tmp/mixer-tx.raw'
  fresh.poll(path,time.monotonic());time.sleep(.15);group=fresh.poll(path,time.monotonic())
  image=b/'xdjaz'/('flx6-owner-'+label+'.png')
  subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',d['display'],'-frames:v','1',str(image)],check=True,timeout=10)
  observations.append(dict(label=label,group=group,image=str(image)))
 for _ in range(5):pulse(0x41)
 sample('tracks')
 send(n.message(0xb6,0x40,1));time.sleep(1.5);sample('rotated')
 pulse(0x65,True);sample('back')
 pulse(0x41);sample('enter-again')
 # Native browse toggle establishes waveform, then preferred View opens it.
 n.frame[32]|=64;send(n.packet());time.sleep(.3);n.frame[32]&=~64;send(n.packet());time.sleep(1.5)
 sample('waveform');pulse(0x7a,False);sample('view');pulse(0x7a,True);sample('view-repeat')
result=dict(pid=d['pid'],observations=observations,scope='Scripted local USB context with explicit visibility; images need review; no physical controller')
(b/'analysis/flx6-back-owner-live.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
