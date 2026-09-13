"""End-to-end FIFO/E1/P1 test: native-reconstructed Echo and cue isolation."""
from pathlib import Path
import math,os,socket,struct,subprocess,tempfile,time,json,resource
b=Path(__file__).resolve().parent
with tempfile.TemporaryDirectory(prefix='az-dsp-stream-') as tmp:
 p=Path(tmp);exe=p/'mix';ctl=p/'ctl';os.mkfifo(p/'in')
 sources=['deck_mix.c','mix_stream.c','dsp_control.c','dsp_graph.c','channel_eq.c','beat_fx.c','beat_echo.c','beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c','cfx_filter.c','cfx_crush.c','cfx_noise.c','cfx_sweep.c','cfx_dubecho.c','cfx_space.c','cfx_manager.c']
 subprocess.run(['cc','-D_GNU_SOURCE','-DLAB_DSP_GRAPH','-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror',*[str(b/x) for x in sources],'-lm','-o',str(exe)],check=True)
 stack_limit=int(os.environ.get('LAB_TEST_STACK_LIMIT','0'))
 def set_stack_limit():resource.setrlimit(resource.RLIMIT_STACK,(stack_limit,stack_limit))
 proc=subprocess.Popen([str(exe),str(p/'in'),str(p/'out'),str(ctl)],stderr=subprocess.PIPE,preexec_fn=set_stack_limit if stack_limit else None)
 def wait_for(test):
  deadline=time.monotonic()+5
  while not test():
   assert proc.poll() is None and time.monotonic()<deadline
   time.sleep(.002)
 try:
  wait_for(ctl.exists)
  sock=socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM);sock.connect(str(ctl))
  # Cue deck2; Filter acts only on deck1.
  sock.send(b'M1 0 1 1 1 1 0 0 0 0 1 .5 .25 .5 0')
  sock.send(b'P1 3 12000 0 0 1 0')
  sock.send(b'E1 5 0 0 .8')
  samples=[]
  with (p/'in').open('wb',buffering=0) as w:
   for block in range(220):
    data=[]
    for i in range(64):
     a=1.0 if block==10 and i==0 else 0.0
     row=(a,a,0,0,0,0,0,0,0,0);samples.append(row);data.extend(row)
    packet=struct.pack('<640f',*data)
    w.write(packet[:73]);w.write(packet[73:])
    wait_for(lambda:(p/'out').stat().st_size>=(block+1)*64*16)
  proc.terminate();_,err=proc.communicate(timeout=5);assert proc.returncode==0,err
  out=list(struct.iter_unpack('<4f',(p/'out').read_bytes()));assert len(out)==len(samples)
  assert all(math.isfinite(v) for row in out for v in row)
  cue_error=max(abs(row[2]-.5*src[0]) for row,src in zip(out,samples));assert cue_error<1e-8,cue_error
  delayed=sum(row[0]**2 for row in out[12*64:]);assert delayed>1e-5,delayed
  events=[json.loads(line) for line in err.decode().splitlines()];fx=[x for x in events if 'beat_frame' in x];source=[x for x in events if 'source_frame' in x]
  assert [x['result'] for x in fx]==[1] and [x['result'] for x in source]==[1],events
  print(json.dumps({'frames':len(out),'cue_max_error':cue_error,'delayed_master_energy':delayed,'effect':fx,'source':source,'status':'pass','stack_limit_bytes':stack_limit or None}))
 finally:
  if proc.poll() is None:proc.kill();proc.wait()
