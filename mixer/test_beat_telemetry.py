"""Q1 returns applied timing; a full reply queue must not stall PCM output."""
from pathlib import Path
import json,os,socket,struct,subprocess,tempfile,time
b=Path(__file__).resolve().parent
blocks=int(Path('/proc/sys/net/unix/max_dgram_qlen').read_text())+32
with tempfile.TemporaryDirectory(prefix='beat-telemetry-') as td:
 p=Path(td);os.mkfifo(p/'in')
 files=['deck_mix.c','mix_stream.c','dsp_control.c','dsp_graph.c','channel_eq.c','beat_fx.c','beat_echo.c',
        'beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c',
        'cfx_filter.c','cfx_crush.c','cfx_noise.c','cfx_sweep.c','cfx_dubecho.c','cfx_space.c','cfx_manager.c']
 subprocess.run(['cc','-D_GNU_SOURCE','-DLAB_DSP_GRAPH','-std=c11','-O2',
  '-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror',
  *[str(b/f) for f in files],'-lm','-o',str(p/'mix')],check=True)
 proc=subprocess.Popen([str(p/'mix'),str(p/'in'),str(p/'out'),str(p/'ctl')],stderr=subprocess.PIPE)
 def wait_for(test):
  deadline=time.monotonic()+5
  while not test():
   assert proc.poll() is None and time.monotonic()<deadline,'Mixer stalled or exited'
   time.sleep(.002)
 try:
  wait_for((p/'ctl').exists)
  with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as ctl:
   ctl.bind(str(p/'client'));ctl.connect(str(p/'ctl'));ctl.settimeout(1)
   ctl.send(b'P1 0 4000 0 0 1 0');ctl.send(b'E1 5 0 8 .5')
   block=struct.pack('<640f',*([.01]*640))
   with (p/'in').open('wb',buffering=0) as stream:
    for i in range(blocks):
     ctl.send(b'Q1');stream.write(block)
     wait_for(lambda:(p/'out').stat().st_size>=(i+1)*1024)
     # Deliberately do not receive: kernel reply queue fills, snapshots drop.
    ctl.setblocking(False);received=[]
    while True:
     try:received.append(json.loads(ctl.recv(2048)))
     except BlockingIOError:break
    assert 0<len(received)<blocks,'Expected bounded queue and dropped replies'
    ctl.settimeout(1);ctl.send(b'Q1');stream.write(block)
    wait_for(lambda:(p/'out').stat().st_size>=(blocks+1)*1024)
    s=json.loads(ctl.recv(2048))
    assert s['audio_frame']==blocks*64 and s['attached']==1,s
    assert s['active_type']==5 and s['phase']==0,s
    assert s['time_ms']==3000 and s['delay_samples']==132300 and s['effect_beat']==6,s
    assert s['source_bpm100']==4000,s
   proc.terminate();_,err=proc.communicate(timeout=5);assert proc.returncode==0,err
   print(json.dumps({'status':'pass','pcm_frames':(blocks+1)*64,'queued_replies':len(received),
                     'dropped_replies':blocks-len(received),'applied':s}))
 finally:
  if proc.poll() is None:proc.kill();proc.wait()
