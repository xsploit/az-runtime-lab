"""Offline lab-only preferred View experiment in known local-USB context.
Does not disambiguate PcControlView; not a production MIDI bridge.
"""
from pathlib import Path
import os,stat,time,json,subprocess
from flx6_navigation import Navigation
from az_tx_freshness import TxFreshness
b=Path(__file__).resolve().parents[1]
n=Navigation(b.parent/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml')
r=TxFreshness();tx=b/'xdjaz/state/tmp/mixer-tx.raw'
f=os.open(b/'xdjaz/state/tmp/mixer-rx.fifo',os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
assert stat.S_ISFIFO(os.fstat(f).st_mode)
events=[]
def send(packet):
 if packet is not None: assert os.write(f,packet)==128

def pulse(control,visible=None):
 packet=n.message(0x96,control,127,browser_visible=visible)
 send(packet);time.sleep(.25);send(n.message(0x96,control,0));time.sleep(.6)
 return packet is not None

def sample(label):
 # baseline/fresh capture only, no cached state from before an input
 global r
 r=TxFreshness();r.poll(tx,time.monotonic());time.sleep(.15)
 state=r.poll(tx,time.monotonic())
 image=b/'xdjaz'/('flx6-nav-'+label+'.png')
 subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',':0','-frames:v','1',str(image)],check=True)
 events.append(dict(label=label,group=state,image=str(image)))
 print(json.dumps(events[-1]),flush=True)
 return state
try:
 send(n.packet());time.sleep(.2)
 pulse(0x41);pulse(0x41);time.sleep(3);pulse(0x41)
 assert sample('folder')==2
 pulse(0x65,True)
 assert sample('back-sidebar')==2
 # Native Browse toggle deliberately establishes waveform for View test.
 n.frame[32]|=64;send(n.packet());time.sleep(.25);n.frame[32]&=~64;send(n.packet());time.sleep(.6)
 assert sample('waveform')==1
 assert pulse(0x7a,False)
 assert sample('view-opens')==2
 assert not pulse(0x7a,True)
 assert sample('view-repeat')==2
 (b/'analysis/az-flx6-navigation-live.json').write_text(json.dumps(dict(events=events,scope='Saved XML message adapter, known local USB fixture; screenshots require visual review. No physical device or PcControlView coverage.'),indent=2)+'\n')
finally:os.close(f)
