"""Private lab single RX writer: ordered control datagrams + applied Q1 feedback.

All native input producers must send their full128-byte packets to input_socket,
not directly to rx_fifo. Mixer replacement or FIFO backpressure terminates this
service explicitly; it does not silently drop control edges or mix sessions.
"""
import argparse,json,os,select,signal,socket,stat,tempfile,time,sys
from pathlib import Path
from az_rx_owner import RxOwner

def run(a):
 initial=os.stat(a.mixer_socket,follow_symlinks=False)
 if not stat.S_ISSOCK(initial.st_mode):raise ValueError('Expected mixer socket')
 identity=(initial.st_dev,initial.st_ino)
 owner=RxOwner(a.baseline.read_bytes(),epoch=str(identity),tap=a.mode=='tap')
 stopping=False
 def stop(*_):
  nonlocal stopping
  stopping=True
 signal.signal(signal.SIGTERM,stop);signal.signal(signal.SIGINT,stop)
 fd=os.open(a.rx_fifo,os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
 if not stat.S_ISFIFO(os.fstat(fd).st_mode):os.close(fd);raise ValueError('Expected RX FIFO')
 count=0;invalid=0;query=None;query_path=None;serial=0;deadline=0;next_query=0
 def emit(frame):
  nonlocal count
  if os.write(fd,frame)!=128:raise RuntimeError('Incomplete RX write')
  count+=1
 def close_query():
  nonlocal query,query_path
  if query is not None:query.close();query=None
  if query_path is not None:query_path.unlink(missing_ok=True);query_path=None
 bound=False;eq=None;eq_fd=None;eq_output=None;eq_pending=b'';eq_offset=0
 try:
  if getattr(a,'eq_tx_capture',None):
   sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'mixer'))
   from native_eq import NativeEq
   eq=NativeEq()
   eq_fd=os.open(a.eq_tx_capture,os.O_RDONLY|os.O_NOFOLLOW)
   eq_stat=os.fstat(eq_fd)
   if not stat.S_ISREG(eq_stat.st_mode):raise ValueError('Expected regular EQ TX capture')
   # Skip historical records; only consume complete records starting after setup.
   eq_offset=((eq_stat.st_size+127)//128)*128
   os.lseek(eq_fd,eq_offset,os.SEEK_SET)
   eq_output=socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM)
   eq_output.connect(str(a.mixer_socket))

  with tempfile.TemporaryDirectory(prefix='az-rx-feedback-') as td, socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as inputs:
   inputs.bind(str(a.input_socket));bound=True;os.chmod(a.input_socket,0o600);inputs.setblocking(False)
   finish=time.monotonic()+a.seconds;last_status=None
   print(json.dumps({'event':'ready','input_socket':str(a.input_socket)}),flush=True)
   try:
    while not stopping and time.monotonic()<finish:
     now=time.monotonic()
     current=os.stat(a.mixer_socket,follow_symlinks=False)
     if (current.st_dev,current.st_ino)!=identity:raise RuntimeError('Mixer socket replaced; restart owner for new session')
     if eq is not None:
      current_tx=os.stat(a.eq_tx_capture,follow_symlinks=False)
      if (current_tx.st_dev,current_tx.st_ino)!=(eq_stat.st_dev,eq_stat.st_ino) or current_tx.st_size<eq_stat.st_size:
       raise RuntimeError('EQ TX capture replaced/truncated; restart session')
      eq_stat=current_tx
      chunk=os.read(eq_fd,128*128);eq_offset+=len(chunk);eq_pending+=chunk
      complete=len(eq_pending)//128
      for i in range(complete):eq.accept_tx(eq_pending[i*128:(i+1)*128])
      eq_pending=eq_pending[complete*128:]
     if query is not None and now>=deadline:close_query()
     if query is None and now>=next_query:
      serial+=1;query_path=Path(td)/str(serial)
      query=socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM);query.bind(str(query_path));query.setblocking(False)
      try:query.connect(str(a.mixer_socket));query.send(b'Q1')
      except (BlockingIOError,ConnectionRefusedError):close_query()
      deadline=now+1;next_query=now+a.interval
     readers=[inputs]+([query] if query is not None else [])
     ready,_,_=select.select(readers,[],[],.02)
     if inputs in ready:
      for _ in range(32):
       try:packet=inputs.recv(129)
       except BlockingIOError:break
       try:merged=owner.controls(packet)
       except ValueError:invalid+=1;continue
       emit(merged)
       if eq is not None:eq.accept_rx(merged)
     if query is not None and query in ready:
      try:
       received=time.monotonic();snapshot=json.loads(query.recv(2048))
       merged=owner.feedback(snapshot,epoch=str(identity),received_at=deadline-1.0,now=received)
      except (ValueError,UnicodeDecodeError):invalid+=1;merged=None
      close_query()
      if merged is not None:emit(merged)
     if eq is not None:
      for channel,state,command in eq.pending():
       eq_output.send(command.encode())
       eq.delivered(channel,state)
       print(json.dumps({'event':'eq_delivered','channel':channel,'mode':state[0],'raw':state[1:]}),flush=True)
     owner.current(time.monotonic())
     if owner.status!=last_status:
      print(json.dumps({'event':'feedback_status','status':owner.status}),flush=True);last_status=owner.status
   finally:close_query()
 finally:
  os.close(fd)
  if eq_fd is not None:os.close(eq_fd)
  if eq_output is not None:eq_output.close()
  if bound:a.input_socket.unlink(missing_ok=True)
  print(json.dumps({'event':'stopped','packets':count,'invalid':invalid}),flush=True)

def main():
 p=argparse.ArgumentParser(description=__doc__)
 for name in ('baseline','mixer_socket','input_socket','rx_fifo'):p.add_argument(name,type=Path)
 p.add_argument('--eq-tx-capture',type=Path,help='Follow fresh delimited native TX records and emit EQ1; mixer must have EQ tables attached')
 p.add_argument('--mode',choices=('auto','tap'),required=True)
 p.add_argument('--seconds',type=float,default=120);p.add_argument('--interval',type=float,default=.1)
 a=p.parse_args()
 if not 0<a.seconds<=300 or not .05<=a.interval<=1:p.error('seconds0..300 and interval0.05..1 required')
 run(a)
if __name__=='__main__':main()
