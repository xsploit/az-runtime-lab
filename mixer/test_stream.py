"""Exercise fragmented FIFO input, EOF/reconnect, partial blocks and shutdown."""
import tempfile,os,subprocess,struct,time
from pathlib import Path
b=Path(__file__).resolve().parent
with tempfile.TemporaryDirectory(prefix='az-stream-test-') as d:
 p=Path(d);exe=p/'stream'
 subprocess.run(['cc','-Wall','-Wextra','-Werror','-O2',str(b/'deck_mix.c'),str(b/'mix_stream.c'),'-lm','-o',str(exe)],check=True)
 os.mkfifo(p/'in');proc=subprocess.Popen([str(exe),str(p/'in'),str(p/'out')],stderr=subprocess.PIPE)
 try:
  total=0
  for count in (65,128):
   data=struct.pack('<10f',.1,.2,.3,.4,.5,.6,.7,.8,90,100)*count
   with (p/'in').open('wb',buffering=0) as out:
    for i in range(0,len(data),13):out.write(data[i:i+13])
   total+=count;deadline=time.monotonic()+3
   while (p/'out').stat().st_size<total*16:
    if proc.poll() is not None or time.monotonic()>deadline:raise RuntimeError('Reader failed to drain input')
    time.sleep(.01)
  proc.terminate();_,err=proc.communicate(timeout=3);assert proc.returncode==0
  data=(p/'out').read_bytes();assert len(data)==193*16
  for vals in struct.iter_unpack('<4f',data):assert all(abs(x-y)<1e-6 for x,y in zip(vals,(.4,.5,.05,.1)))
  print('PASS:193 frames, fragmentation, EOF/reconnect, partial block, clean stop')
 finally:
  if proc.poll() is None:proc.kill();proc.wait()
