"""Send one synthetic deck tempo event to the isolated lab FIFO."""
from pathlib import Path
import argparse,os,stat
from az_mixer_packet import crc16
p=argparse.ArgumentParser();p.add_argument('--group',type=int,choices=[0,1],default=0);p.add_argument('--position',type=int,choices=range(1024),required=True);p.add_argument('--reference',type=int,choices=range(13,1012),default=512);a=p.parse_args()
fifo=Path(__file__).resolve().parents[1]/f'xdjaz/state/tmp/deck{a.group}-rx.fifo'
f=os.open(fifo,os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
try:
 if not stat.S_ISFIFO(os.fstat(f).st_mode):raise ValueError('Expected lab FIFO')
 frame=bytearray(152);frame[0]=1
 frame[16:18]=a.position.to_bytes(2,'little');frame[18:20]=a.reference.to_bytes(2,'little')
 frame[38:40]=crc16(frame[:38]).to_bytes(2,'little')
 if os.write(f,frame)!=152:raise RuntimeError('Incomplete packet')
 print(f'group={a.group} position={a.position} reference={a.reference} bytes=152')
finally:os.close(f)
