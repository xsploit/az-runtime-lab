"""Private lab: follow delimited AZ TX capture and merge complete MIDI datagrams.
No physical MIDI/audio devices. One owner emits M1 snapshots to the lab mixer.
"""
import argparse,json,os,signal,socket,stat,sys,time
from pathlib import Path
from flx6_state import MixerState
from native_headphones import NativeHeadphones
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'analysis'))
from az_mixer_packet import inspect_tx

def run(args):
 state=MixerState(args.mapping);headphones=NativeHeadphones();headphone_dirty=False;stopping=False
 def stop(*_):
  nonlocal stopping
  stopping=True
 signal.signal(signal.SIGTERM,stop);signal.signal(signal.SIGINT,stop)
 tx=None;fd=None
 if args.datagram:
  tx=socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM);tx.bind(str(args.capture));os.chmod(args.capture,0o600);tx.setblocking(False)
 else:
  fd=os.open(args.capture,os.O_RDONLY|os.O_NOFOLLOW)
  initial=os.fstat(fd)
  if not stat.S_ISREG(initial.st_mode):os.close(fd);raise ValueError('Expected regular TX capture')
 pending=b'';offset=0;dirty=False;valid=invalid=midi=sent=0
 with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as output, socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as incoming:
  # Caller supplies an unused path inside a private directory; never unlink strangers.
  incoming.bind(str(args.midi_socket));os.chmod(args.midi_socket,0o600);incoming.setblocking(False)
  print(json.dumps({'event':'ready','midi_socket':str(args.midi_socket)}),flush=True)
  try:
   deadline=time.monotonic()+args.seconds
   while not stopping and time.monotonic()<deadline:
    if tx is not None:
     chunks=[]
     for _ in range(128):
      try:message=tx.recv(129)
      except BlockingIOError:break
      if len(message)==128:chunks.append(message)
      else:invalid+=1
     chunk=b''.join(chunks)
    else:
     now=os.stat(args.capture,follow_symlinks=False)
     if (now.st_dev,now.st_ino)!=(initial.st_dev,initial.st_ino) or now.st_size<offset:
      raise RuntimeError('TX capture replaced/truncated; refusing mixed-session state')
     chunk=os.read(fd,128*128);offset+=len(chunk)
    pending+=chunk
    count=len(pending)//128
    for i in range(count):
     packet=inspect_tx(pending[i*128:(i+1)*128])
     if packet['checksum_valid']:
      valid+=1;dirty=state.native_routing(packet) or dirty
      if getattr(args,'headphone_control',False):headphone_dirty=headphones.accept(packet) or headphone_dirty
     else:invalid+=1
    pending=pending[count*128:]
    for _ in range(32):
     try:message=incoming.recv(4)
     except BlockingIOError:break
     if len(message)!=3:continue
     try:changed=state.message(*message)
     except ValueError:continue
     midi+=1;dirty=changed or dirty
    if headphone_dirty:
     output.sendto(headphones.command().encode(),str(args.output_socket));headphone_dirty=False
     print(json.dumps({'event':'headphone_snapshot','mode':headphones.mode}),flush=True)
    if dirty:
     output.sendto(state.snapshot(args.ramp).encode(),str(args.output_socket));sent+=1;dirty=False
     print(json.dumps({"event":"snapshot","assign":state.assign,"cue":state.cue,"gains":state.gains}),flush=True)
    if not chunk:time.sleep(.005)
  finally:
   if fd is not None:os.close(fd)
   if tx is not None:tx.close();args.capture.unlink()
   args.midi_socket.unlink()
   print(json.dumps({'event':'stopped','valid_tx':valid,'invalid_tx':invalid,'midi_messages':midi,'snapshots':sent,'trailing_bytes':len(pending)}),flush=True)

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('capture',type=Path);p.add_argument('output_socket',type=Path);p.add_argument('midi_socket',type=Path);p.add_argument('--datagram',action='store_true',help='Bind capture path as TX socket instead of following a file');p.add_argument('--headphone-control',action='store_true',help='Emit H1 native headphone mode; requires downstream H1 support');p.add_argument('--mapping',required=True,type=Path);p.add_argument('--seconds',type=int,default=120);p.add_argument('--ramp',type=int,default=441);a=p.parse_args()
 if not 1<=a.seconds<=330 or not 0<=a.ramp<=441000:p.error('seconds1..330, ramp0..441000')
 run(a)
if __name__=='__main__':main()
