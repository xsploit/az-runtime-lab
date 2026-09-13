"""H1 receiver and recovered headphone DSP with synthetic audio buses."""
from pathlib import Path
import json,os,socket,struct,subprocess,tempfile,time
b=Path(__file__).resolve().parent
sources=['headphone_dsp.c','deck_mix.c','mix_stream.c','dsp_control.c','dsp_graph.c','channel_eq.c','beat_fx.c','beat_echo.c','beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c','cfx_filter.c','cfx_crush.c','cfx_noise.c','cfx_sweep.c','cfx_dubecho.c','cfx_space.c','cfx_manager.c']
with tempfile.TemporaryDirectory() as tmp:
 p=Path(tmp);exe=p/'mix';ctl=p/'ctl';os.mkfifo(p/'in')
 subprocess.run(['cc','-D_GNU_SOURCE','-DLAB_DSP_GRAPH','-DLAB_HEADPHONE_DSP','-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror',*[str(b/x) for x in sources],'-lm','-o',str(exe)],check=True)
 calibration=struct.unpack('<f',struct.pack('<I',0xc0eff755))[0]
 env=dict(os.environ,LAB_HEADPHONE_TABLES=str(b.parent/'analysis/headphone-oracle/tables.bin'),LAB_HEADPHONE_SCALE=str(1/calibration))
 proc=subprocess.Popen([str(exe),str(p/'in'),str(p/'out'),str(ctl)],stderr=subprocess.PIPE,env=env)
 def wait(test):
  deadline=time.monotonic()+5
  while not test():
   assert proc.poll() is None and time.monotonic()<deadline;time.sleep(.002)
 try:
  wait(ctl.exists)
  with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sock:
   sock.connect(str(ctl));sock.send(b'M1 0 0 1 0 0 0 0 0 0 1 .5 .25 1 .5')
   segments=[];blocks=0
   with (p/'in').open('wb',buffering=0) as writer:
    for mode in (0,1,0):
     sock.send(f'H1 {mode}'.encode())
     for _ in range(40):
      writer.write(struct.pack('<640f',*([.2,.6,.8,.4,0,0,0,0,0,0]*64)));blocks+=1
      wait(lambda:(p/'out').stat().st_size>=blocks*64*16)
     row=struct.unpack('<4f',(p/'out').read_bytes()[-16:]);expected=(.2,.1,.4,.15) if mode else (.2,.1,.4,.7)
     assert max(abs(a-e) for a,e in zip(row,expected))<2e-6,(row,expected)
     segments.append({'mode':mode,'last_frame':row})
  proc.terminate();_,err=proc.communicate(timeout=5);assert proc.returncode==0,err
  events=[json.loads(x) for x in err.decode().splitlines()];modes=[x for x in events if 'headphone_frame' in x];assert len(modes)==3 and all(x['result']==1 for x in modes),events
  report={'frames':blocks*64,'segments':segments,'accepted':modes,'scope':'FIFO/H1/recovered headphone audio; synthetic buses, explicit digital unity scale, no physical hardware claim'}
  (b.parent/'analysis/az-headphone-stream-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
 finally:
  if proc.poll() is None:proc.kill();proc.wait()
