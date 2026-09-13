"""Send baseline or one mapped ERP group button to the private AZ ERP FIFO."""
import argparse,os,stat,time
from pathlib import Path
from az_mixer_packet import crc16
p=argparse.ArgumentParser();p.add_argument('--button',choices=['play','cue','primary','secondary','mastertempo']);p.add_argument('--group',type=int,choices=[0,1],default=0);a=p.parse_args()
fifo=Path(__file__).resolve().parents[1]/'xdjaz/state/tmp/erp-rx.fifo'
f=os.open(fifo,os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
try:
 if not stat.S_ISFIFO(os.fstat(f).st_mode):raise ValueError('Expected lab FIFO')
 # Offsets within each eight-byte ERP group; traced in EP147 0x21431b0.
 offset,mask={'play':(2,2),'cue':(2,4),'mastertempo':(0,8),'primary':(0,1),'secondary':(1,1)}.get(a.button,(2,0))
 for bits in ([0] if a.button is None else [0,mask,0]):
  frame=bytearray(128);frame[0]=1;frame[8+offset+8*a.group]=bits
  frame[28:30]=crc16(frame[:28]).to_bytes(2,'little')
  if os.write(f,frame)!=128:raise RuntimeError('Incomplete ERP packet')
  print(f'ERP mask={bits} bytes=128',flush=True);time.sleep(.2)
finally:os.close(f)
