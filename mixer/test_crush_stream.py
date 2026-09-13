"""End-to-end FIFO/F1 test: real reconstructed Filter, cue isolation, busy policy."""
from pathlib import Path
import math,os,socket,struct,subprocess,tempfile,time,json
b=Path(__file__).resolve().parent
with tempfile.TemporaryDirectory(prefix='az-dsp-stream-') as tmp:
 p=Path(tmp);exe=p/'mix';ctl=p/'ctl';os.mkfifo(p/'in')
 sources=['deck_mix.c','mix_stream.c','dsp_control.c','dsp_graph.c','channel_eq.c','beat_fx.c','beat_echo.c','beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c','cfx_filter.c','cfx_crush.c','cfx_noise.c','cfx_sweep.c','cfx_dubecho.c','cfx_space.c','cfx_manager.c']
 subprocess.run(['cc','-D_GNU_SOURCE','-DLAB_DSP_GRAPH','-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror',*[str(b/x) for x in sources],'-lm','-o',str(exe)],check=True)
 proc=subprocess.Popen([str(exe),str(p/'in'),str(p/'out'),str(ctl)],stderr=subprocess.PIPE)
 def wait_for(test):
  deadline=time.monotonic()+5
  while not test():
   assert proc.poll() is None and time.monotonic()<deadline
   time.sleep(.002)
 try:
  wait_for(ctl.exists)
  sock=socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM);sock.connect(str(ctl))
  # Cue deck2; Filter acts only on deck1.
  sock.send(b'M1 0 1 1 1 1 0 0 0 0 2 .5 .25 .5 0')
  samples=[]
  with (p/'in').open('wb',buffering=0) as w:
   for block in range(220):
    if block==1:
     sock.send(b'F1 0 1 0 .5')
    if block==2:
     sock.send(b'F1 0 0 1 .5') # transition active: reject without replacing accepted controls
     sock.send(b'F1 1 1 nan .5')
    if block==50:sock.send(b'F1 0 6 .1 1')
    if block==51:sock.send(b'F1 0 1 .1 1')
    if block==150:sock.send(b'F1 0 1 0 .5')
    data=[]
    for i in range(64):
     n=block*64+i;a=.1*math.sin(2*math.pi*440*n/44100);c=.2*math.sin(2*math.pi*880*n/44100)
     row=(a,a,c,c,0,0,0,0,0,0);samples.append(row);data.extend(row)
    packet=struct.pack('<640f',*data)
    w.write(packet[:73]);w.write(packet[73:])
    wait_for(lambda:(p/'out').stat().st_size>=(block+1)*64*16)
  proc.terminate();_,err=proc.communicate(timeout=5);assert proc.returncode==0,err
  out=list(struct.iter_unpack('<4f',(p/'out').read_bytes()));assert len(out)==len(samples)
  assert all(math.isfinite(v) for row in out for v in row)
  cue_error=max(abs(row[2]-.5*src[2]) for row,src in zip(out,samples));assert cue_error<1e-8,cue_error
  assert all(abs(row[0]-.25*(src[0]+src[2]))<1e-8 for row,src in zip(out[:64],samples[:64]))
  tail=list(zip(out[-4096:],samples[-4096:]));delta=math.sqrt(sum((row[0]-.25*(src[0]+src[2]))**2 for row,src in tail)/len(tail));assert delta>.005,delta
  events=[json.loads(line) for line in err.decode().splitlines()];fx=[x for x in events if 'filter_frame' in x]
  assert [x['result'] for x in fx]==[1,0,1,0,1],fx
  crush=list(zip(out[70*64:140*64],samples[70*64:140*64]));crush_delta=math.sqrt(sum((row[0]-.25*(src[0]+src[2]))**2 for row,src in crush)/len(crush));assert crush_delta>.005,crush_delta
  print(json.dumps({'frames':len(out),'cue_max_error':cue_error,'filtered_master_difference_rms':delta,'crush_master_difference_rms':crush_delta,'filter_results':fx,'status':'pass'}))
 finally:
  if proc.poll() is None:proc.kill();proc.wait()
