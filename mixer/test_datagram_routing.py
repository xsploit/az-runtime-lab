"""Continuous TX datagrams beyond diagnostic cap, with shared MIDI state."""
from pathlib import Path
import json,socket,subprocess,sys,tempfile,time
b=Path(__file__).resolve().parent
sys.path.insert(0,str(b.parent/'analysis'))
from az_mixer_packet import crc16
with tempfile.TemporaryDirectory() as t:
 p=Path(t);tx=p/'tx';out=p/'out';midi=p/'midi'
 with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sink,socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as source:
  sink.bind(str(out));sink.settimeout(5);source.settimeout(5)
  proc=subprocess.Popen([sys.executable,str(b/'live_routing.py'),str(tx),str(out),str(midi),'--datagram','--mapping',str(b.parents[1]/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml'),'--seconds','30','--ramp','0'],stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
  try:
   deadline=time.monotonic()+5
   while not midi.exists():
    assert time.monotonic()<deadline and proc.poll() is None;time.sleep(.005)
   packet=bytearray(128);packet[6]=0x60;packet[104:106]=crc16(packet[:104]).to_bytes(2,'little')
   source.sendto(packet,str(tx));assert sink.recv(1024).decode().split()[6:10]==['-1','1','0','0']
   for _ in range(40000):source.sendto(packet,str(tx))
   source.sendto(packet[:70],str(tx));source.sendto(packet+bytes(128),str(tx))
   broken=packet.copy();broken[104]^=1;source.sendto(broken,str(tx))
   source.sendto(bytes([0xb0,0x13,32]),str(midi));source.sendto(bytes([0xb0,0x33,0]),str(midi))
   state=sink.recv(1024).decode().split();assert abs(float(state[2])-4096/16383)<1e-9
   packet[6]=0x90;packet[104:106]=crc16(packet[:104]).to_bytes(2,'little');source.sendto(packet,str(tx))
   state=sink.recv(1024).decode().split();assert state[6:10]==['1','-1','0','0'] and abs(float(state[2])-4096/16383)<1e-9
   proc.terminate();stdout,stderr=proc.communicate(timeout=5);assert proc.returncode==0,stderr
   report=json.loads(stdout.splitlines()[-1]);assert report['valid_tx']==40002,report;assert report['invalid_tx']==3,report
   assert not tx.exists() and not midi.exists();print(json.dumps(report))
  finally:
   if proc.poll() is None:proc.kill();proc.wait()
