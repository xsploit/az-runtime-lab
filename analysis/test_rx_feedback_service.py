"""Exercise real service sockets/FIFO with a controlled Q1 responder."""
import json,os,select,socket,subprocess,tempfile,threading,time
from pathlib import Path
from az_browser_input import BrowserInput
from az_mixer_packet import crc16,inspect

root=Path(__file__).resolve().parent
with tempfile.TemporaryDirectory(prefix='rx-service-test-') as td:
 p=Path(td);base=bytearray(128);base[0]=1;base[96:98]=crc16(base[:96]).to_bytes(2,'little')
 (p/'baseline').write_bytes(base);os.mkfifo(p/'fifo');fd=os.open(p/'fifo',os.O_RDWR|os.O_NONBLOCK)
 done=threading.Event();errors=[]
 with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as server:
  server.bind(str(p/'mixer'));server.settimeout(.1)
  def respond():
   frame=0
   while not done.is_set():
    try:request,peer=server.recvfrom(32)
    except socket.timeout:continue
    try:
     assert request==b'Q1';frame+=64
     q=dict(version=1,audio_frame=frame,attached=1,active_type=5,phase=0,
            delay_change_pending=0,quantize_requested=0,source_bpm100=12000,
            effect_beat=3 if frame<320 else 6,time_ms=250 if frame<320 else 1000)
     server.sendto(json.dumps(q).encode(),peer)
    except FileNotFoundError:pass # Service may expire/close a request socket.
    except BaseException as e:errors.append(e);return
  worker=threading.Thread(target=respond);worker.start()
  proc=subprocess.Popen(['python',str(root/'run_rx_feedback.py'),str(p/'baseline'),str(p/'mixer'),
   str(p/'input'),str(p/'fifo'),'--mode','tap','--seconds','1.5','--interval','.05'],
   stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
  try:
   deadline=time.monotonic()+3
   while not (p/'input').exists():
    assert proc.poll() is None and time.monotonic()<deadline
    time.sleep(.005)
   with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sender:
    browser=BrowserInput(0)
    sender.sendto(browser.encode(base,delta=2,flag=True),str(p/'input'))
    sender.sendto(browser.encode(base,flag=False),str(p/'input'))
   data=bytearray()
   while proc.poll() is None:
    if select.select([fd],[],[],.05)[0]:data.extend(os.read(fd,8192))
   while select.select([fd],[],[],0)[0]:data.extend(os.read(fd,8192))
   out,err=proc.communicate(timeout=3);assert proc.returncode==0,(out,err)
   assert len(data)%128==0
   packets=[bytes(data[i:i+128]) for i in range(0,len(data),128)]
   assert all(inspect(x)['checksum_valid'] for x in packets)
   presses=[x for x in packets if x[31]&1];assert len(presses)==1
   index=packets.index(presses[0]);assert not packets[index+1][31]&1
   assert all(int.from_bytes(x[34:36],'little')==2 for x in packets[index:])
   assert {x[86] for x in packets}>={7,12}
   assert not errors,errors
   assert not (p/'input').exists(),'Owned socket must be cleaned up'
   print(json.dumps({'status':'pass','packets':len(packets),'press_release_preserved':True,
                    'feedback_presets':[7,12],'service_events':[json.loads(x) for x in out.splitlines()]}))
  finally:
   if proc.poll() is None:proc.kill();proc.wait()
   done.set();worker.join(timeout=2);os.close(fd)
