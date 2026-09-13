"""Real FIFO EQ1 delivery: selected channel cut, retained independent cue, malformed input."""
from pathlib import Path
import hashlib,json,math,os,socket,struct,subprocess,tempfile,time
b=Path(__file__).resolve().parent
tables=b.parent/'analysis/dsp-oracle/native-channel-eq-tables.bin'
assert hashlib.sha256(tables.read_bytes()).hexdigest()=='128b43f2ef274904136e6570257a6aa6dc38c6fd65642ea102308f8fde5f3a7f'
sources=['deck_mix.c','mix_stream.c','dsp_control.c','dsp_graph.c','channel_eq.c','beat_fx.c','beat_echo.c','beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c','cfx_filter.c','cfx_crush.c','cfx_noise.c','cfx_sweep.c','cfx_dubecho.c','cfx_space.c','cfx_manager.c']
with tempfile.TemporaryDirectory(prefix='az-eq-stream-') as d:
 p=Path(d);exe=p/'mix'
 subprocess.run(['cc','-D_GNU_SOURCE','-DLAB_DSP_GRAPH','-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror',*[str(b/x) for x in sources],'-lm','-o',str(exe)],check=True)
 # Reject truncated, trailing and nonfinite fixtures before audio FIFO open.
 for label,data in [('short',tables.read_bytes()[:-1]),('long',tables.read_bytes()+b'x'),('nan',struct.pack('<f',float('nan'))+tables.read_bytes()[4:])]:
  fixture=p/(label+'.bin');fixture.write_bytes(data)
  env=os.environ.copy();env['LAB_EQ_TABLES']=str(fixture)
  rejected=subprocess.run([str(exe),str(p/'absent-fifo'),str(p/(label+'.out'))],env=env,timeout=5,capture_output=True)
  assert rejected.returncode==14,(label,rejected.returncode)
 def run(name,commands,attach=True):
  folder=p/name;folder.mkdir();os.mkfifo(folder/'in');ctl=folder/'ctl';out=folder/'out'
  env=os.environ.copy();env.pop('LAB_EQ_TABLES',None)
  if attach:env['LAB_EQ_TABLES']=str(tables)
  proc=subprocess.Popen([str(exe),str(folder/'in'),str(out),str(ctl)],env=env,stderr=subprocess.PIPE)
  try:
   deadline=time.monotonic()+5
   while not ctl.exists():
    assert proc.poll() is None and time.monotonic()<deadline;time.sleep(.002)
   with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sock:
    sock.connect(str(ctl))
    # Master channel1 only; cue channel2 isolates unaffected deck.
    sock.send(b'M1 0 1 0 0 0 0 0 0 0 2 .5 .5 .5 0')
    sock.send(b'EQ1 1 1 .5 .5 .5')
    for c in commands:sock.send(c)
   with (folder/'in').open('wb',buffering=0) as f:
    for block in range(320):
     vals=[]
     for i in range(64):
      t=(block*64+i)/44100;x=.1*math.sin(2*math.pi*440*t);y=.1*math.sin(2*math.pi*900*t)
      vals.extend([x,x,y,y,0,0,0,0,0,0])
     f.write(struct.pack('<640f',*vals))
   deadline=time.monotonic()+5
   while not out.exists() or out.stat().st_size<320*64*16:
    assert proc.poll() is None and time.monotonic()<deadline;time.sleep(.002)
   proc.terminate();_,log=proc.communicate(timeout=5);assert proc.returncode==0
   data=list(struct.iter_unpack('<4f',out.read_bytes()));assert len(data)==20480
   assert all(math.isfinite(x) for row in data for x in row)
   if os.environ.get('LAB_AUDIO_STATS') is not None:
    stats=[json.loads(line) for line in log.decode().splitlines() if 'input_audio_channel' in line]
    assert len(stats)==10 and {x['input_audio_channel'] for x in stats}==set(range(10))
    assert all(x['frames']==20480 and x['nonfinite']==0 for x in stats)
    assert all(.099<x['peak']<=.100001 and x['energy']>1 for x in stats[:4])
    assert all(x['peak']==0 and x['energy']==0 for x in stats[4:])
   return data,log.decode()
  finally:
   if proc.poll() is None:proc.kill();proc.wait()
 normal,nlog=run('normal',[b'EQ1 0 1 .5 .5 .5'])
 cut,clog=run('cut',[b'EQ1 0 1 0 0 0',b'EQ1 0 1 nan .5 .5'])
 assert all(a[2:]==c[2:] for a,c in zip(normal,cut))
 energy=lambda rows:sum(r[0]*r[0] for r in rows[1024:])
 assert energy(normal)>1e-3 and energy(cut)<energy(normal)*1e-9
 unattached,ulog=run('unattached',[b'EQ1 0 1 0 0 0'],False)
 assert '"result":-1' in ulog
 assert '"channel":0,"mode":1,"result":1' in clog
 assert sum('eq_frame' in x for x in clog.splitlines())==2
 report=dict(frames_per_case=20480,normal_master_energy=energy(normal),cut_master_energy=energy(cut),independent_cue_bit_identical=True,malformed_command_rejected=True,unattached_command_rejected=True)
 # Exercise decoded native packet state through the same real audio FIFO.
 from native_eq import NativeEq
 from az_mixer_packet import crc16
 from probe_eq_packet_delivery import packet
 def native_commands(values,mode):
  state=NativeEq();state.accept_rx(packet(values))
  tx=bytearray(128);tx[8]=mode<<4;tx[104:106]=crc16(tx[:104]).to_bytes(2,'little')
  state.accept_tx(tx)
  return [command.encode() for _,_,command in state.pending()]
 native_normal,_=run('native-normal',native_commands([512]*12,1))
 native_cut,_=run('native-cut',native_commands([0]*3+[512]*9,1))
 native_eq,_=run('native-eq',native_commands([0]*3+[512]*9,0))
 # Native mode is global: switching to EQ also changes the cue channel filter.
 assert all(a[2:]==c[2:] for a,c in zip(native_normal,native_cut))
 assert energy(native_normal)>1e-3 and energy(native_cut)<energy(native_normal)*1e-9
 assert energy(native_eq)>energy(native_cut)+1e-6
 report['decoded_native_packets']={'normal_energy':energy(native_normal),'isolator_cut_energy':energy(native_cut),'eq_cut_energy':energy(native_eq),'independent_cue_bit_identical':True,'scope':'Synthetic valid RX/TX packets decoded to EQ1, then actual mixer FIFO audio; not a live AZ mode-toggle test.'}
 (b.parent/'analysis/eq-stream-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
