"""Private FLX6 MIDI datagrams -> native AZ packets through RX owner.

One navigation/EQ producer per RX session. Optional --eq-controls preserves
BiteDJ EQ bindings in the same persistent frame. Complete three-byte messages;
no physical MIDI device is opened. Other full-frame control writers must not
run concurrently because this producer owns the persistent navigation state.
"""
import argparse,json,os,select,signal,socket,stat,time
from pathlib import Path
from az_live_view import LiveView,ViewUnavailable
from az_live_navigation import LiveNavigation
from az_mixer_packet import inspect
from flx6_navigation import Navigation

def run(a):
 baseline=a.baseline.read_bytes()
 if len(baseline)!=128 or not inspect(baseline)['checksum_valid']:raise ValueError('Valid RX baseline required')
 initial=a.rx_socket.lstat()
 if not stat.S_ISSOCK(initial.st_mode):raise ValueError('Expected RX owner socket')
 epoch=(initial.st_dev,initial.st_ino);stopping=False;count=rejected=0
 def stop(*_):
  nonlocal stopping
  stopping=True
 signal.signal(signal.SIGTERM,stop);signal.signal(signal.SIGINT,stop)
 reader=None;deadline=time.monotonic()+30
 while not stopping:
  try:reader=LiveView(a.pid);break
  except ViewUnavailable:
   if time.monotonic()>deadline:raise
   time.sleep(.05)
 if reader is None:return
 with reader,socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as incoming,socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as output:
  output.setblocking(False);output.connect(str(a.rx_socket))
  nav=Navigation(a.mapping,baseline,eq_controls=getattr(a,'eq_controls',False));adapter=LiveNavigation(nav,reader)
  incoming.bind(str(a.midi_socket));os.chmod(a.midi_socket,0o600);incoming.setblocking(False)
  def send(packet):
   nonlocal count
   if packet is not None:
    if output.send(packet)!=128:raise RuntimeError('Incomplete RX datagram')
    count+=1
  print(json.dumps(dict(event='ready',midi_socket=str(a.midi_socket),pid=a.pid)),flush=True)
  try:
   deadline=time.monotonic()+a.seconds
   while not stopping and time.monotonic()<deadline:
    reader._alive()
    current=a.rx_socket.lstat()
    if (current.st_dev,current.st_ino)!=epoch:raise RuntimeError('RX owner replaced')
    if not select.select([incoming],[],[],.02)[0]:continue
    for _ in range(32):
     try:message=incoming.recv(4)
     except BlockingIOError:break
     if len(message)!=3:rejected+=1;continue
     try:packet=adapter.message(*message)
     except (ValueError,ViewUnavailable) as exc:
      reader._alive();rejected+=1
      print(json.dumps(dict(event='rejected',reason=str(exc))),flush=True);continue
     send(packet)
  finally:
   # Release only this producer's held buttons, without requiring page reads.
   try:
    for status,control in list(nav.down):send(nav.message(status,control,0))
   finally:
    a.midi_socket.unlink(missing_ok=True)
    print(json.dumps(dict(event='stopped',packets=count,rejected=rejected)),flush=True)

def main():
 p=argparse.ArgumentParser(description=__doc__)
 p.add_argument('pid',type=int)
 for name in ('baseline','rx_socket','midi_socket'):p.add_argument(name,type=Path)
 p.add_argument('--eq-controls',action='store_true',help='Map saved FLX6 EQ CC pairs into shared native RX state')
 p.add_argument('--mapping',required=True,type=Path);p.add_argument('--seconds',type=float,default=120)
 a=p.parse_args()
 if not 0<a.seconds<=300:p.error('seconds must be0..300')
 run(a)
if __name__=='__main__':main()
