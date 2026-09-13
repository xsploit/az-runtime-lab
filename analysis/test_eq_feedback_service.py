"""Actual service sockets/FIFO: EQ packet ordering, incomplete and corrupt TX."""
import json,os,select,socket,subprocess,tempfile,time
from pathlib import Path
from az_mixer_packet import crc16
from probe_eq_packet_delivery import packet
root=Path(__file__).resolve().parent

def tx(mode):
 f=bytearray(128);f[8]=mode<<4;f[104:106]=crc16(f[:104]).to_bytes(2,'little');return bytes(f)

with tempfile.TemporaryDirectory(prefix='az-eq-service-') as td:
 p=Path(td);(p/'baseline').write_bytes(packet([512]*12));(p/'tx').write_bytes(tx(0))
 os.mkfifo(p/'fifo');fd=os.open(p/'fifo',os.O_RDWR|os.O_NONBLOCK)
 with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as mixer,socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sender:
  mixer.bind(str(p/'mixer'));mixer.setblocking(False)
  proc=subprocess.Popen(['python3',str(root/'run_rx_feedback.py'),str(p/'baseline'),str(p/'mixer'),str(p/'input'),str(p/'fifo'),'--mode','tap','--seconds','5','--eq-tx-capture',str(p/'tx')],stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
  commands=[]
  def collect(duration=.1):
   end=time.monotonic()+duration;found=[]
   while time.monotonic()<end:
    if select.select([mixer,fd],[],[],.01)[0]:
     try:
      while True:
       value=mixer.recv(256)
       if value.startswith(b'EQ1'):found.append(value.decode())
     except BlockingIOError:pass
     try:os.read(fd,8192)
     except BlockingIOError:pass
   commands.extend(found);return found
  def append(data):
   with (p/'tx').open('ab',buffering=0) as f:f.write(data)
  try:
   deadline=time.monotonic()+3
   while not (p/'input').exists():
    assert proc.poll() is None and time.monotonic()<deadline;time.sleep(.005)
   sender.sendto(packet([512]*12),str(p/'input'))
   assert collect()==[], 'Historical TX must not initialize mode'
   append(tx(1)[:63]);assert collect()==[], 'Partial TX cannot select a mode'
   append(tx(1)[63:]);initial=collect(.2)
   assert len(initial)==4 and all(c.split()[2]=='1' for c in initial),initial
   bad=bytearray(tx(0));bad[104]^=1;append(bad);assert collect()==[]
   sender.sendto(packet([0]*3+[512]*9),str(p/'input'));one=collect(.2)
   assert one==['EQ1 0 1 0 0 0'],one
   append(tx(0));changed=collect(.2)
   assert len(changed)==4 and all(c.split()[2]=='0' for c in changed),changed
   append(tx(2));assert collect()==[]
   sender.sendto(packet([1023]*12),str(p/'input'));assert collect()==[]
   append(tx(1));restored=collect(.2)
   assert restored==[f'EQ1 {ch} 1 1 1 1' for ch in range(4)],restored
   # Replacing a capture must terminate instead of merging sessions.
   (p/'replacement').write_bytes(tx(0));os.replace(p/'replacement',p/'tx')
   out,err=proc.communicate(timeout=3)
   assert proc.returncode!=0 and 'replaced/truncated' in err,(out,err)
   report={'passed':True,'commands':commands,'historical_and_partial_tx_ignored':True,'bad_crc_ignored':True,'unknown_mode_suspends':True,'replacement_terminates':True,'scope':'Real service I/O with synthetic RX/TX and controlled mixer receiver, not live AZ or audio.'}
   (root/'eq-feedback-service-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
  finally:
   if proc.poll() is None:proc.kill();proc.wait()
   os.close(fd)
