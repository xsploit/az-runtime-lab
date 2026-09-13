"""Exercise real capture follower and MIDI socket together, including failures."""
from pathlib import Path
import json,socket,subprocess,sys,tempfile,time
b=Path(__file__).resolve().parent
sys.path.insert(0,str(b.parent/'analysis'))
from az_mixer_packet import crc16
xml=b.parents[1]/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml'
with tempfile.TemporaryDirectory() as t:
 p=Path(t);capture=p/'tx';capture.touch();out=p/'out';midi=p/'midi'
 with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sink,socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as source:
  sink.bind(str(out));sink.settimeout(3)
  proc=subprocess.Popen([sys.executable,str(b/'live_routing.py'),str(capture),str(out),str(midi),'--mapping',str(xml),'--seconds','10','--ramp','0'],stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
  try:
   deadline=time.monotonic()+3
   while not midi.exists():
    assert time.monotonic()<deadline and proc.poll() is None;time.sleep(.005)
   packet=bytearray(128);packet[6]=0x60 # A,B,THRU,THRU
   packet[104:106]=crc16(packet[:104]).to_bytes(2,'little')
   with capture.open('ab',buffering=0) as f:
    f.write(packet[:71]);time.sleep(.02);f.write(packet[71:])
    first=sink.recv(1024).decode().split();assert first[6:10]==['-1','1','0','0'],first
    source.sendto(bytes([0xb0,0x13,32]),str(midi));source.sendto(bytes([0xb0,0x33,0]),str(midi))
    second=sink.recv(1024).decode().split();assert abs(float(second[2])-4096/16383)<1e-9;assert second[6:10]==first[6:10]
    source.sendto(bytes([0x92,0x54,127]),str(midi))
    third=sink.recv(1024).decode().split();assert third[10]=='5';assert third[2:10]==second[2:10]
    packet[6]=0x90 # B,A,THRU,THRU
    packet[104:106]=crc16(packet[:104]).to_bytes(2,'little');f.write(packet)
    fourth=sink.recv(1024).decode().split();assert fourth[6:10]==['1','-1','0','0'];assert fourth[2:6]==third[2:6] and fourth[10:]==third[10:]
    packet[104]^=1;f.write(packet)
    sink.settimeout(.05)
    try:sink.recv(1024);raise AssertionError('Corrupt packet emitted state')
    except TimeoutError:pass
   # A new capture session must not reuse the old state silently.
   capture.write_bytes(b'')
   stdout,stderr=proc.communicate(timeout=3);assert proc.returncode!=0 and 'replaced/truncated' in stderr
   assert not midi.exists()
   print('PASS: fragmented TX, MIDI fader/cue + native assignments preserve each other, corrupt ignored, capture reset stops bridge')
  finally:
   if proc.poll() is None:proc.kill();proc.wait()
