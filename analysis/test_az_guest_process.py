import tempfile,unittest
from pathlib import Path
from az_guest_process import find_guest

class GuestDiscoveryTest(unittest.TestCase):
 def test_descendants_and_ambiguity(self):
  with tempfile.TemporaryDirectory() as d:
   root=Path(d)
   def process(pid,children='',cmd=b'bwrap\0'):
    p=root/str(pid);(p/'task'/str(pid)).mkdir(parents=True)
    (p/'task'/str(pid)/'children').write_text(children)
    (p/'cmdline').write_bytes(cmd)
   guest=b'/qemu\0/home/root/pdj/EP147\0'
   process(1,'2 8');process(2,'3');process(3,cmd=guest)
   process(9,cmd=guest) # unrelated guest must not be selected
   self.assertEqual(find_guest(1,root),3)
   (root/'3/cmdline').write_bytes(b'/qemu\0/home/root/pdj/EP145\0')
   self.assertIsNone(find_guest(1,root))
   (root/'3/cmdline').write_bytes(guest)
   process(8,cmd=guest)
   with self.assertRaisesRegex(RuntimeError,'Multiple'):find_guest(1,root)
if __name__=='__main__':unittest.main()
