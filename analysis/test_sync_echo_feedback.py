import json,os,socket,tempfile,threading,unittest
from pathlib import Path
from sync_echo_feedback import sync_once
from az_mixer_packet import crc16,inspect

class Sync(unittest.TestCase):
 def exercise(self,mode):
  with tempfile.TemporaryDirectory(prefix='sync-test-') as td:
   p=Path(td);baseline=bytearray(range(128));baseline[0]=1
   baseline[96:98]=crc16(baseline[:96]).to_bytes(2,'little')
   packet=p/'packet';packet.write_bytes(baseline)
   fifo=p/'rx';os.mkfifo(fifo);fd=os.open(fifo,os.O_RDWR|os.O_NONBLOCK)
   q=dict(version=1,attached=1,active_type=5,phase=0,delay_change_pending=0,
          quantize_requested=0,source_bpm100=4000,effect_beat=6,time_ms=3000)
   if mode=='transition':q['phase']=1
   with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as server:
    server.bind(str(p/'ctl'));server.settimeout(2)
    errors=[]
    def respond():
     try:
      msg,peer=server.recvfrom(32)
      if msg!=b'Q1':raise AssertionError(msg)
      if mode=='changed':packet.write_bytes(bytes(128))
      server.sendto(json.dumps(q).encode(),peer)
     except BaseException as e:errors.append(e)
    worker=threading.Thread(target=respond);worker.start()
    try:
     if mode=='ok':
      result=sync_once(packet,p/'ctl',fifo,tap=True)
      self.assertEqual(result['rx_bytes'],128)
      emitted=os.read(fd,128);self.assertEqual(emitted,packet.read_bytes())
      self.assertTrue(inspect(emitted)['checksum_valid'])
      self.assertEqual(emitted[86],12)
      self.assertEqual(emitted[34:36],baseline[34:36])
     else:
      with self.assertRaises((ValueError,RuntimeError)):sync_once(packet,p/'ctl',fifo,tap=True)
      with self.assertRaises(BlockingIOError):os.read(fd,128)
      if mode=='transition':self.assertEqual(packet.read_bytes(),baseline)
    finally:
     worker.join(timeout=3);os.close(fd)
    self.assertFalse(worker.is_alive());self.assertFalse(errors,errors)
 def test_round_trip(self):self.exercise('ok')
 def test_no_rx_write_for_transition(self):self.exercise('transition')
 def test_no_rx_write_if_baseline_changed(self):self.exercise('changed')
if __name__=='__main__':unittest.main()
