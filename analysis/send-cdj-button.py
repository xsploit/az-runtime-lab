"""Send a mapped button to the private CDJ3000X 64-byte ERP fixture."""
import argparse,os,stat,time
from pathlib import Path
from az_mixer_packet import crc16
p=argparse.ArgumentParser();p.add_argument('--button',choices=['play','cue','browse','back']);a=p.parse_args()
fifo=Path(__file__).resolve().parents[1]/'cdj3000x/state/tmp/cdj-erp-rx.fifo'
fd=os.open(fifo,os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
try:
 if not stat.S_ISFIFO(os.fstat(fd).st_mode):raise ValueError('Expected lab FIFO')
 offset,mask={'play':(9,1),'cue':(9,2),'browse':(14,2),'back':(15,1)}.get(a.button,(9,0))
 for value in ([0,mask,0] if a.button else [0]):
  frame=bytearray(64);frame[0]=1;frame[offset]=value;frame[62:64]=crc16(frame[:62]).to_bytes(2,'little')
  if os.write(fd,frame)!=64:raise RuntimeError('Incomplete packet')
  print(f'CDJ ERP byte{offset}={value}',flush=True);time.sleep(.2)
finally:os.close(fd)
