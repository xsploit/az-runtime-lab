import unittest
from pathlib import Path
from flx6_fx import Effects
M=Path(__file__).resolve().parents[2]/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml'
class TestEffects(unittest.TestCase):
 def test_filter_and_center(self):
  f=Effects(M);f.message(0xb6,0x17,0);self.assertEqual(f.colors[0],.5)
  f.message(0xb6,0x37,0);self.assertEqual(f.colors[0],0)
  f.message(0xb6,0x17,64);f.message(0xb6,0x37,0);self.assertEqual(f.colors[0],.5)
 def test_overlap_and_release(self):
  f=Effects(M);f.message(0x97,0x11,127);self.assertIn('F1 0 3 0.80000000 .5',f.commands())
  f.message(0x97,0x14,127);self.assertIn('E1 5 0 2 0.50000000',f.commands())
  f.message(0x97,0x15,127);f.message(0x87,0x14,64)
  self.assertIn('E1 5 0 3 0.50000000',f.commands())
  f.release();self.assertIn('E1 0 0 5 0.50000000',f.commands())
 def test_buttons_and_unsupported(self):
  f=Effects(M);f.message(0x94,0x47,127);f.message(0x94,0x47,127);self.assertTrue(f.enabled)
  with self.assertRaises(NotImplementedError):f.message(0x97,0x12,127)
  self.assertFalse(f.held)
 def test_inactive_unit_does_not_steal_target(self):
  f=Effects(M);f.message(0x94,0x1d,127);f.message(0x95,0x14,127)
  self.assertEqual(f.target,1)
  f.message(0x95,0x70,127);self.assertEqual(f.target,4)
 def test_retry_latest(self):
  f=Effects(M);self.assertEqual(len(f.commands(1)),6);self.assertEqual(f.commands(1.1),[])
  self.assertEqual(len(f.commands(1.21)),5)
if __name__=='__main__':unittest.main()
