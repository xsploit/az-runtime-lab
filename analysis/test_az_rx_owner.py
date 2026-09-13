import unittest
from az_rx_owner import RxOwner,FX_MASKS
from az_browser_input import BrowserInput
from az_mixer_packet import crc16,inspect

def baseline():
 b=bytearray(range(128));b[0]=1;b[96:98]=crc16(b[:96]).to_bytes(2,'little');return bytes(b)
def reply(frame=64,**updates):
 s=dict(version=1,audio_frame=frame,attached=1,active_type=5,phase=0,
        delay_change_pending=0,quantize_requested=0,source_bpm100=12000,effect_beat=3,time_ms=250)
 s.update(updates);return s

class Owner(unittest.TestCase):
 def test_interleaved_browser_press_release_and_echo_update(self):
  b=baseline();owner=RxOwner(b,epoch='run1',tap=True);browser=BrowserInput(0)
  down=owner.controls(browser.encode(b,delta=2,flag=True))
  effect=owner.feedback(reply(),epoch='run1',received_at=1,now=1)
  up=owner.controls(browser.encode(b,flag=False))
  self.assertEqual([p[31]&1 for p in (down,effect,up)],[1,1,0])
  for p in (down,effect,up):
   self.assertTrue(inspect(p)['checksum_valid']);self.assertEqual(p[34:36],b'\x02\0')
  self.assertEqual(up[86],7);self.assertEqual(up[90:92],b'\xfa\0')
  # Both packets used the old browser baseline; feedback must survive release.
  for i,mask in FX_MASKS.items():self.assertEqual(up[i]&mask,effect[i]&mask)
  for i in range(128):
   if i not in FX_MASKS and i not in (31,34,35,96,97):self.assertEqual(up[i],b[i])
 def test_old_epoch_expiry_and_reordered_reply_cannot_roll_back(self):
  o=RxOwner(baseline(),epoch='run1',tap=False)
  o.feedback(reply(128),epoch='run1',received_at=2,now=2)
  applied=o.frame
  for snapshot,epoch,received,now in ((reply(192),'old',2,2),(reply(192),'run1',0,2),
                                     (reply(64),'run1',2,2),(reply(128),'run1',2,2)):
   self.assertIsNone(o.feedback(snapshot,epoch=epoch,received_at=received,now=now))
   self.assertEqual(o.frame,applied)
 def test_transition_prevents_late_older_settled_reply(self):
  o=RxOwner(baseline(),epoch='run1',tap=False)
  o.feedback(reply(64),epoch='run1',received_at=1,now=1);applied=o.frame
  self.assertIsNone(o.feedback(reply(192,phase=1),epoch='run1',received_at=2,now=2))
  self.assertIsNone(o.feedback(reply(128,time_ms=999),epoch='run1',received_at=2,now=2))
  self.assertEqual(o.frame,applied)
 def test_stale_state_preserved_but_not_reported_current(self):
  o=RxOwner(baseline(),epoch='run1',tap=False)
  o.feedback(reply(),epoch='run1',received_at=1,now=1);applied=o.frame
  self.assertTrue(o.current(1.5));self.assertFalse(o.current(3))
  self.assertEqual(o.frame,applied);self.assertEqual(o.status,'stale')
 def test_bad_control_crc_leaves_owner_unchanged(self):
  o=RxOwner(baseline(),epoch='run1',tap=False);before=o.frame
  b=bytearray(before);b[34]^=1
  with self.assertRaises(ValueError):o.controls(b)
  self.assertEqual(o.frame,before)
if __name__=='__main__':unittest.main()
