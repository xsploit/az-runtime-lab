"""Private AZ differential RX probe; raw field names until UI semantics verified.
Explicit packet file is the sole baseline; this tool never invents musical state.
"""
import argparse,os,stat
from pathlib import Path
from az_mixer_packet import crc16,inspect
p=argparse.ArgumentParser();p.add_argument('packet',type=Path);p.add_argument('--state1',type=int);p.add_argument('--flag6',type=int,choices=[0,1]);p.add_argument('--value2',type=int);p.add_argument('--representation',type=int,choices=range(16));p.add_argument('--byte2',type=int);p.add_argument('--signed-byte',type=int);p.add_argument('--high-nibble',type=int,choices=range(16));p.add_argument('--xpad-value',type=int,choices=range(256));p.add_argument('--xpad-area',type=int,choices=range(16));a=p.parse_args()
f=bytearray(a.packet.read_bytes())
if len(f)!=128 or not inspect(f)['checksum_valid']:p.error('Expected valid complete128-byte RX baseline')
if a.state1 is not None:
 if not 0<=a.state1<=65535:p.error('state1 u16')
 f[88:90]=a.state1.to_bytes(2,'little')
if a.flag6 is not None:f[84]=(f[84]&~64)|(a.flag6<<6)
if a.value2 is not None:
 if not -32768<=a.value2<=32767:p.error('value2 signed16')
 f[90:92]=a.value2.to_bytes(2,'little',signed=True)
if a.representation is not None:f[85]=(f[85]&15)|(a.representation<<4)
if a.byte2 is not None:
 if not 0<=a.byte2<=255:p.error('byte2 unsigned8')
 f[86]=a.byte2
if a.signed_byte is not None:
 if not -128<=a.signed_byte<=127:p.error('signed-byte signed8')
 f[92]=a.signed_byte&255
if a.high_nibble is not None:f[93]=(f[93]&15)|(a.high_nibble<<4)
if a.xpad_value is not None:f[87]=a.xpad_value
if a.xpad_area is not None:f[85]=(f[85]&240)|a.xpad_area
f[96:98]=crc16(f[:96]).to_bytes(2,'little')
fifo=Path(__file__).resolve().parents[1]/'xdjaz/state/tmp/mixer-rx.fifo'
fd=os.open(fifo,os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
try:
 if not stat.S_ISFIFO(os.fstat(fd).st_mode):raise ValueError('Expected lab FIFO')
 if os.write(fd,f)!=128:raise RuntimeError('Short write')
finally:os.close(fd)
a.packet.write_bytes(f);print(inspect(f)['beat_fx_receive_raw'])
