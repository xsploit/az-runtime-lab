"""Send explicit on-air masks to the private AZ lab, with no hardware access."""
import argparse,os,stat,time
from pathlib import Path
from az_mixer_packet import crc16
p=argparse.ArgumentParser();p.add_argument('--mask',type=lambda s:int(s,0),choices=range(16),action='append',required=True);a=p.parse_args()
fifo=Path(__file__).resolve().parents[1]/'xdjaz/state/tmp/mixer-rx.fifo'
f=os.open(fifo,os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
try:
 if not stat.S_ISFIFO(os.fstat(f).st_mode):raise ValueError('Expected lab FIFO')
 for mask in a.mask:
  packet=bytearray(128);packet[0]=1;packet[94]=mask<<4
  packet[96:98]=crc16(packet[:96]).to_bytes(2,'little')
  if os.write(f,packet)!=128:raise RuntimeError('Incomplete packet')
  print(f'byte94={packet[94]:02x}',flush=True);time.sleep(.5)
finally:os.close(f)
