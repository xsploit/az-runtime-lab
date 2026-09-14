import unittest
from flx6_fx_feedback import EffectFeedback
class TestFeedback(unittest.TestCase):
 def sample(self,**kw):return dict(version=1,attached=1,audio_frame=0,active_type=5,on=1,source_bpm100=12000,**kw)
 def test_only_applied_fresh_state_blinks(self):
  f=EffectFeedback();a={(0x94,0x47),(0x94,0x48)};selected=(0x94,0x48)
  self.assertEqual(f.messages(1,a,selected),[bytes((0x94,0x47,0)),bytes((0x94,0x48,0))])
  self.assertTrue(f.accept(self.sample(),1))
  self.assertEqual(f.messages(1,a,selected),[bytes((0x94,0x48,127))])
  self.assertEqual(f.messages(1.3,a,selected),[bytes((0x94,0x48,0))])
  self.assertEqual(f.messages(1.55,a,selected),[bytes((0x94,0x48,127))])
  self.assertEqual(f.messages(2.1,a,selected),[bytes((0x94,0x48,0))])
 def test_tail_and_out_of_order(self):
  f=EffectFeedback();s=self.sample();f.accept(s,1)
  self.assertFalse(f.accept(s,1.2))
  s.update(audio_frame=64,on=0);self.assertTrue(f.accept(s,1.3))
  self.assertEqual(f.messages(1.3,{(0x94,0x47)},(0x94,0x47)),[bytes((0x94,0x47,0))])
 def test_focus_change_clears_previous_light(self):
  f=EffectFeedback();f.accept(self.sample(),1);a={(0x94,0x47),(0x95,0x49)}
  f.messages(1,a,(0x94,0x47))
  self.assertEqual(f.messages(1.01,a,(0x95,0x49)),[bytes((0x94,0x47,0)),bytes((0x95,0x49,127))])
 def test_invalid_does_not_acknowledge_effect(self):
  f=EffectFeedback();s=self.sample();s['on']=True;self.assertFalse(f.accept(s,1))
  self.assertFalse(f.accept({},1))
if __name__=='__main__':unittest.main()
