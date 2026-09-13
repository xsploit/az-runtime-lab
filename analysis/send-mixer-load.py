"""Send a baseline or load press/release through the RX owner or exclusive FIFO."""
import argparse,time
from az_rx_transport import add_transport_arguments,baseline_packet,RxTransport
from az_mixer_packet import crc16
p=argparse.ArgumentParser()
p.add_argument('--deck',type=int,choices=range(1,5),action='append',help='Repeat to load multiple decks in one packet')
p.add_argument('--counter',type=int,default=0,help='Current signed16 browse counter; preserve it to avoid changing selection')
add_transport_arguments(p)
a=p.parse_args()
if not -32768<=a.counter<=32767:p.error('Counter must be signed16')
base=baseline_packet(a)
with RxTransport(a) as transport:
 for bits in ([0] if a.deck is None else [0,sum(1 << (4-d) for d in set(a.deck)),0]):
  frame=bytearray(base);frame[33]=(frame[33]&240)|bits;frame[34:36]=a.counter.to_bytes(2,'little',signed=True)
  frame[96:98]=crc16(frame[:96]).to_bytes(2,'little')
  written=transport.send(frame)
  if written!=128:raise RuntimeError('Incomplete fixture packet')
  print(f'load mask={bits} bytes={written}',flush=True)
  time.sleep(.2)
