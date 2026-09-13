"""Native CLI producers through real RX owner: edges and applied FX survive."""
import json,os,socket,subprocess,sys,tempfile,threading,time
from pathlib import Path
from az_mixer_packet import crc16,inspect
root=Path(__file__).resolve().parent
with tempfile.TemporaryDirectory(prefix='rx-cli-') as td:
 p=Path(td);packet=bytearray(128);packet[0]=1;packet[33]=0xa0;packet[40]=77
 packet[96:98]=crc16(packet[:96]).to_bytes(2,'little');(p/'base').write_bytes(packet)
 os.mkfifo(p/'fifo');fd=os.open(p/'fifo',os.O_RDWR|os.O_NONBLOCK)
 done=threading.Event();errors=[]
 with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as server:
  server.bind(str(p/'mix'));server.settimeout(.1)
  def reply():
   frame=0
   while not done.is_set():
    try:request,peer=server.recvfrom(32)
    except socket.timeout:continue
    try:
     assert request==b'Q1';frame+=64
     server.sendto(json.dumps(dict(version=1,audio_frame=frame,attached=1,active_type=5,
      phase=0,delay_change_pending=0,quantize_requested=0,source_bpm100=4000,
      effect_beat=6,time_ms=3000)).encode(),peer)
    except FileNotFoundError:pass
    except BaseException as exc:errors.append(str(exc));return
  thread=threading.Thread(target=reply);thread.start()
  proc=subprocess.Popen([sys.executable,str(root/'run_rx_feedback.py'),str(p/'base'),str(p/'mix'),str(p/'input'),str(p/'fifo'),'--mode','tap','--seconds','4'],stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
  try:
   deadline=time.monotonic()+3
   while not (p/'input').exists():
    assert proc.poll() is None and time.monotonic()<deadline;time.sleep(.01)
   time.sleep(.15) # Establish applied feedback before neutral-baseline controls.
   common=['--input-socket',str(p/'input'),'--baseline',str(p/'base')]
   for name,args in [('send-browser-counter.py',['2','--flag']),('send-browser-counter.py',['2']),('send-mixer-load.py',['--deck','1','--deck','4','--counter','2'])]:
    subprocess.run([sys.executable,str(root/name),*args,*common],check=True,timeout=3,capture_output=True)
   proc.terminate();out,err=proc.communicate(timeout=3);assert proc.returncode==0,(out,err)
   data=bytearray()
   while True:
    try:data.extend(os.read(fd,8192))
    except BlockingIOError:break
   assert len(data)%128==0
   frames=[data[i:i+128] for i in range(0,len(data),128)]
   assert len(frames)==6,len(frames)
   assert all(inspect(x)['checksum_valid'] for x in frames)
   assert all(x[86]==12 and int.from_bytes(x[90:92],'little')==3000 for x in frames)
   assert all(x[40]==77 and x[33]&240==0xa0 for x in frames)
   assert [x[31]&1 for x in frames]==[0,1,0,0,0,0]
   assert [x[33]&15 for x in frames]==[0,0,0,0,9,0]
   assert all(int.from_bytes(x[34:36],'little')==2 for x in frames[1:])
   assert not errors,errors
   assert not (p/'input').exists()
   print(json.dumps(dict(status='pass',packets=len(frames),browse_edges=True,load_edges=True,applied_echo_preserved=True,baseline_fields_preserved=True)))
  finally:
   if proc.poll() is None:proc.kill();proc.wait()
   done.set();thread.join(timeout=2);os.close(fd)
