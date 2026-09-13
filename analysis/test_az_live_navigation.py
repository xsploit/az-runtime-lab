import unittest
from pathlib import Path
from flx6_navigation import Navigation
from az_live_navigation import LiveNavigation
from az_live_view import ViewUnavailable
xml=Path(__file__).resolve().parents[2]/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml'
class Observer:
 kind='waveform';observed_at=10;fail=False;reads=0
 def sample(self):
  self.reads+=1
  if self.fail:raise ViewUnavailable('unavailable')
  return dict(kind=self.kind,observed_at=self.observed_at)
class Tests(unittest.TestCase):
 def setUp(self):self.o=Observer();self.n=Navigation(xml);self.a=LiveNavigation(self.n,self.o,clock=lambda:10)
 def test_view_and_back(self):
  self.assertTrue(self.a.message(0x96,0x7a,127)[32]&64)
  self.a.message(0x96,0x7a,0);self.o.kind='browse'
  self.assertIsNone(self.a.message(0x96,0x7a,127));self.a.message(0x96,0x7a,0)
  self.assertTrue(self.a.message(0x96,0x65,127)[33]&128)
 def test_release_when_unavailable(self):
  self.a.message(0x96,0x7a,127);self.o.fail=True
  self.assertIsNone(self.a.message(0x96,0x7a,127))
  self.assertFalse(self.a.message(0x86,0x7a,64)[32]&64)
  self.assertEqual(self.o.reads,1)
 def test_stale_and_unknown_do_not_press(self):
  for kind,stamp in [('browse',9),('browse',11),('pc_control',10),('other',10)]:
   self.o.kind=kind;self.o.observed_at=stamp
   with self.assertRaises(ViewUnavailable):self.a.message(0x96,0x65,127)
   self.assertEqual(self.n.down,{})
 def test_rotation_needs_no_page(self):
  self.o.fail=True
  self.assertEqual(self.a.message(0xb6,0x40,1)[34:36],b'\x01\x00')
if __name__=='__main__':unittest.main()
