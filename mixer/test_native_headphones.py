import sys,unittest
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'analysis'))
from az_mixer_packet import inspect_tx,crc16
from native_headphones import NativeHeadphones

def packet(mode,link=0):
 b=bytearray(128);b[8]=mode<<6;b[9]=link;b[104:106]=crc16(b[:104]).to_bytes(2,'little');return bytes(b)
class TestNativeHeadphones(unittest.TestCase):
 def test_no_fabricated_default(self):
  s=NativeHeadphones()
  with self.assertRaises(ValueError):s.command()
  for v in (None,{},inspect_tx(b''),inspect_tx(packet(2)),inspect_tx(packet(3))):self.assertFalse(s.accept(v))
  self.assertIsNone(s.mode)
 def test_all_mode_link_values(self):
  for mode in range(4):
   for link in range(256):
    s=NativeHeadphones();changed=s.accept(inspect_tx(packet(mode,link)))
    self.assertEqual(changed,mode<2)
    if changed:self.assertEqual(s.command(),f'H1 {mode}')
 def test_corruption_repetition_and_switch(self):
  s=NativeHeadphones();self.assertTrue(s.accept(inspect_tx(packet(1))));self.assertEqual(s.command(),'H1 1')
  for byte in range(106):
   b=bytearray(packet(0));b[byte]^=1;self.assertFalse(s.accept(inspect_tx(b)));self.assertEqual(s.command(),'H1 1')
  self.assertFalse(s.accept(inspect_tx(packet(1))))
  self.assertTrue(s.accept(inspect_tx(packet(0))));self.assertEqual(s.command(),'H1 0')
if __name__=='__main__':unittest.main()
