"""Pulse a named native browser button in the private AZ lab.
Neutral diagnostic packet; caller supplies current encoder counter to avoid movement.
"""
import argparse,json,os,stat,time
from pathlib import Path
from az_browser_input import BrowserInput
from az_mixer_packet import crc16
b=Path(__file__).resolve().parent
names=json.loads((b/'az-browser-named-buttons.json').read_text())
p=argparse.ArgumentParser();p.add_argument('button',choices=names);p.add_argument('--counter',type=int,default=0);a=p.parse_args()
base=bytearray(128);base[0]=1;base=BrowserInput(a.counter).encode(base)
f=os.open(b.parent/'xdjaz/state/tmp/mixer-rx.fifo',os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
try:
 if not stat.S_ISFIFO(os.fstat(f).st_mode):raise ValueError('Expected lab FIFO')
 for pressed in (False,True,False):
  v=bytearray(base);n=names[a.button]
  if pressed:v[n['byte']]|=1<<n['bit']
  v[96:98]=crc16(v[:96]).to_bytes(2,'little')
  if os.write(f,v)!=128:raise RuntimeError('Short write')
  print(a.button,pressed,flush=True);time.sleep(.2)
finally:os.close(f)
