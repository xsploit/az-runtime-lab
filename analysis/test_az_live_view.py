"""Reject misleading observations across native identity/pointer transitions."""
import unittest
from az_live_view import stable_view,ViewUnavailable,discover_manager
class ViewTests(unittest.TestCase):
 def setUp(self):
  self.m={0x1000:0x29cb4a0,0x1018:0x2000,0x2000:0x3000,0x31e8:0x198f468,
   0x2150:0x4000,0x40f8:0x5000,0x3baf670:0x5000,0x3baf678:0x6000,0x3baf668:0x8000,0x3baf6d0:0x9000}
 def test_distinct_names(self):
  self.assertEqual(stable_view(self.m.__getitem__,0x1000)['kind'],'browse')
  self.m[0x40f8]=0x6000
  self.assertEqual(stable_view(self.m.__getitem__,0x1000)['kind'],'pc_control')
  self.m[0x40f8]=0x7000
  self.assertEqual(stable_view(self.m.__getitem__,0x1000)['kind'],'other')
 def test_transition(self):
  count=0
  def q(a):
   nonlocal count
   count+=1
   if count==10:self.m[0x40f8]=0x6000
   return self.m[a]
  with self.assertRaises(ViewUnavailable):stable_view(q,0x1000)
 def test_manager_replaced(self):
  self.m[0x1000]=0x1234
  with self.assertRaises(ViewUnavailable):stable_view(self.m.__getitem__,0x1000)
 def test_override(self):
  self.m[0x31e8]=0x1234
  with self.assertRaises(ViewUnavailable):stable_view(self.m.__getitem__,0x1000)
 def test_missing_or_alias_names(self):
  for v in (0,0x5000):
   self.m[0x3baf678]=v
   with self.assertRaises(ViewUnavailable):stable_view(self.m.__getitem__,0x1000)
 def test_source_alias(self):
  self.m[0x3baf668]=self.m[0x3baf670]
  with self.assertRaises(ViewUnavailable):stable_view(self.m.__getitem__,0x1000)
 def test_no_current(self):
  self.m[0x2150]=0
  with self.assertRaises(ViewUnavailable):stable_view(self.m.__getitem__,0x1000)
class DiscoveryTests(unittest.TestCase):
 def setUp(self):
  self.m={0x3bd5d70:0x1000,0x1000:0x2968548,0x1110:0x2000,
   0x2000:0x29676f0,0x2010:0x3000,0x3000:0x29676d0,0x3190:0x4000,0x4000:0x29cb4a0}
 def test_chain(self):self.assertEqual(discover_manager(self.m.__getitem__),0x4000)
 def test_partial_startup(self):
  for slot in (0x3bd5d70,0x1110,0x2010,0x3190):
   with self.subTest(slot=slot):
    original=self.m[slot];self.m[slot]=0
    with self.assertRaises(ViewUnavailable):discover_manager(self.m.__getitem__)
    self.m[slot]=original
 def test_wrong_owner(self):
  self.m[0x3000]=0x29676f0
  with self.assertRaises(ViewUnavailable):discover_manager(self.m.__getitem__)
if __name__=='__main__':unittest.main()
