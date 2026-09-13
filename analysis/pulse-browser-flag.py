"""Pulse candidate rotary-press bit without changing accumulated counter."""
import argparse,os,stat,time
from pathlib import Path
from az_browser_input import BrowserInput
p=argparse.ArgumentParser();p.add_argument('--counter',type=int,default=0);a=p.parse_args()
base=bytearray(128);base[0]=1;encoder=BrowserInput(a.counter)
f=os.open(Path(__file__).resolve().parents[1]/'xdjaz/state/tmp/mixer-rx.fifo',os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
try:
 if not stat.S_ISFIFO(os.fstat(f).st_mode):raise ValueError('Expected private FIFO')
 for flag in (False,True,False):
  frame=encoder.encode(base,flag=flag)
  if os.write(f,frame)!=128:raise RuntimeError('Short write')
  print('flag',flag,'counter',a.counter,flush=True);time.sleep(.4)
finally:os.close(f)
