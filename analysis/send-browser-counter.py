"""Send native counter samples through the RX owner socket or an exclusive FIFO.
Other fields come from --baseline, or are neutral when it is omitted.
First value is a baseline only if firmware has not already seen mixer packets.
"""
import argparse,time
from az_rx_transport import add_transport_arguments,baseline_packet,RxTransport
from az_browser_input import BrowserInput
p=argparse.ArgumentParser();p.add_argument('counter',type=int,nargs='+');p.add_argument('--flag',action='store_true');add_transport_arguments(p);a=p.parse_args()
frames=[];base=baseline_packet(a)
for value in a.counter:
 frames.append(BrowserInput(value).encode(base,flag=a.flag))
with RxTransport(a) as transport:
 for frame in frames:
  transport.send(frame)
  print('counter',int.from_bytes(frame[34:36],'little',signed=True),flush=True);time.sleep(.3)
