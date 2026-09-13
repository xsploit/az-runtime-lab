"""Live stream controls: exact boundaries, smoothing, cue independence, rejection."""
import os, socket, struct, subprocess, tempfile, time
from pathlib import Path
b=Path(__file__).resolve().parent
with tempfile.TemporaryDirectory(prefix='az-controls-') as d:
 p=Path(d); exe=p/'mix'; path=p/'ctl'
 subprocess.run(['cc','-Wall','-Wextra','-Werror','-O2',str(b/'deck_mix.c'),str(b/'mix_stream.c'),'-lm','-o',str(exe)],check=True)
 os.mkfifo(p/'in'); proc=subprocess.Popen([str(exe),str(p/'in'),str(p/'out'),str(path)],stderr=subprocess.PIPE)
 try:
  deadline=time.monotonic()+3
  while not path.exists():
   assert proc.poll() is None and time.monotonic()<deadline
   time.sleep(.01)
  sock=socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM); sock.connect(str(path))
  snapshots=[None,b'M1 64 0 0 0 0 0 0 0 0 1 .5 .25 .5 0',
   b'M1 0 nan 0 0 0 0 0 0 0 1 .5 .25 .5 0',
   b'M1 0 1 1 1 1 0 0 0 0 1 .5 .25 .5 0 garbage',
   b'x'*900,b'M1 0 0 0 0 0 0 0 0 0 2 .5 .25 .5 0']
  with (p/'in').open('wb',buffering=0) as writer:
   for i,msg in enumerate(snapshots):
    if msg is not None:sock.send(msg)
    writer.write(struct.pack('<10f',.1,.2,.3,.4,.5,.6,.7,.8,90,100)*64)
    deadline=time.monotonic()+3
    while (p/'out').stat().st_size<(i+1)*64*16:
     assert proc.poll() is None and time.monotonic()<deadline
     time.sleep(.01)
  proc.terminate();_,err=proc.communicate(timeout=3);assert proc.returncode==0,err
  rows=list(struct.iter_unpack('<4f',(p/'out').read_bytes()))
  for i,row in enumerate(rows):
   gain=1 if i<64 else max(0,1-(i-63)/64)
   cue=(.05,.1) if i<320 else (.15,.2)
   expected=(.4*gain,.5*gain,*cue)
   assert all(abs(a-v)<1e-6 for a,v in zip(row,expected)),(i,row,expected)
  assert err.count(b'control_frame')==2,err
  assert b'"control_frame":64' in err and b'"control_frame":320' in err,err
  print('PASS: live fade, pre-fader cue, cue switch, malformed/NaN/oversize rejection, exact frame offsets')
 finally:
  if proc.poll() is None:proc.kill();proc.wait()
