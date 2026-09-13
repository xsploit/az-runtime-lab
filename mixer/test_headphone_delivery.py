"""Replay actual AZ native-mode TX transitions through live Unix socket bridge."""
from pathlib import Path
import hashlib,json,socket,subprocess,sys,tempfile,time
b=Path(__file__).resolve().parent
sys.path.insert(0,str(b.parent/'analysis'))
from az_mixer_packet import inspect_tx
sources=[]
for filename in ('headphone-mono-native-tx.raw','headphone-stereo-native-tx.raw'):
 path=b.parent/'xdjaz'/filename;data=path.read_bytes();assert len(data)%128==0
 transitions=[];previous=None
 for offset in range(0,len(data),128):
  frame=data[offset:offset+128];packet=inspect_tx(frame);assert packet['checksum_valid']
  mode=packet['routing_settings']['headphone_mode'];assert mode in ('stereo','mono_split')
  if mode!=previous:transitions.append((offset//128,frame,mode));previous=mode
 sources.append((filename,hashlib.sha256(data).hexdigest(),transitions))
reports=[]
with tempfile.TemporaryDirectory() as t:
 p=Path(t);tx=p/'tx';out=p/'out';midi=p/'midi'
 with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sink,socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as source:
  sink.bind(str(out));sink.settimeout(3)
  proc=subprocess.Popen([sys.executable,str(b/'live_routing.py'),str(tx),str(out),str(midi),'--datagram','--headphone-control','--mapping',str(b.parents[1]/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml'),'--seconds','30'],stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
  try:
   deadline=time.monotonic()+5
   while not midi.exists():
    assert proc.poll() is None and time.monotonic()<deadline;time.sleep(.005)
   previous=None
   for filename,digest,transitions in sources:
    delivered=[]
    for index,frame,mode in transitions:
     if mode==previous:continue
     source.sendto(frame,str(tx));expected='H1 '+str(int(mode=='mono_split'))
     while True:
      command=sink.recv(1024).decode()
      if command.startswith('H1 '):break
      assert command.startswith('M1 ')
     assert command==expected,(command,expected)
     delivered.append({'frame':index,'command':command});previous=mode
    reports.append({'source':filename,'sha256':digest,'delivered':delivered})
   source.sendto(bytes([0xb0,0x13,32]),str(midi));source.sendto(bytes([0xb0,0x33,0]),str(midi))
   while True:
    command=sink.recv(1024).decode()
    assert command.startswith('M1 '),command
    if abs(float(command.split()[2])-4096/16383)<1e-9:break
   proc.terminate();stdout,stderr=proc.communicate(timeout=5);assert proc.returncode==0,stderr
   assert not tx.exists() and not midi.exists()
  finally:
   if proc.poll() is None:proc.kill();proc.wait()
report={'scope':'Captured actual native AZ settings transitions replayed to bridge H1 socket; no H1 audio receiver or physical headphone claim','sources':reports,'midi_fader_preserved':True,'socket_cleanup':True}
(b.parent/'analysis/az-headphone-delivery-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
