import unittest
from pathlib import Path
from flx6_eq import EqMidi
from flx6_navigation import Navigation
from az_mixer_packet import inspect
from probe_eq_packet_delivery import packet
MAPPING=Path(__file__).resolve().parents[2]/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml'

class EqTests(unittest.TestCase):
 def test_all_saved_pairs_and_other_fields(self):
  for value in (0,1,15,16,8191,8192,16383):
   eq=EqMidi(MAPPING);f=bytearray(packet([400]*12));f[31]=1;f[34:36]=b'\x34\x12';before=bytes(f)
   for ch in range(4):
    for cc in (7,11,15):
     self.assertFalse(eq.update(f,0xb0+ch,cc,value>>7))
   self.assertEqual(bytes(f),before)
   for ch in range(4):
    for cc in (39,43,47):eq.update(f,0xb0+ch,cc,value&127)
   decoded=inspect(f)['mixer_knobs_raw']
   for ch in decoded:
    self.assertEqual(ch['trim'],512)
    for key in ('eqIsoHi','eqIsoMid','eqIsoLow'):self.assertEqual(ch[key],value>>4)
   changed={i for i,(a,b) in enumerate(zip(f,before)) if a!=b}
   self.assertTrue(changed<=set(i for ch in range(4) for i in range(37+5*ch,41+5*ch)))

 def test_single_owner_navigation_preserves_eq(self):
  nav=Navigation(MAPPING,packet([512]*12),eq_controls=True)
  self.assertIsNone(nav.message(0xb0,7,127))
  out=nav.message(0xb0,39,127);self.assertTrue(inspect(out)['checksum_valid'])
  self.assertEqual(inspect(out)['mixer_knobs_raw'][0]['eqIsoHi'],1023)
  # Actual saved encoder CC; use parsed binding to avoid guessing address.
  address=next(k for k,v in nav.bindings.items() if v=='rotate')
  out=nav.message(*address,1)
  self.assertEqual(int.from_bytes(out[34:36],'little'),1)
  self.assertEqual(inspect(out)['mixer_knobs_raw'][0]['eqIsoHi'],1023)
  out=nav.message(0xb0,7,0)
  self.assertEqual(int.from_bytes(out[34:36],'little'),1)
  self.assertEqual(inspect(out)['mixer_knobs_raw'][0]['eqIsoHi'],7)
  self.assertIsNone(nav.message(0xb0,39,126)) # same10-bit bucket

 def test_reset_and_validation(self):
  eq=EqMidi(MAPPING);f=bytearray(packet([512]*12))
  self.assertFalse(eq.update(f,0xb0,39,127)) # LSB first also waits
  self.assertTrue(eq.update(f,0xb0,7,127))
  self.assertFalse(EqMidi(MAPPING).update(f,0xb0,7,0))
  self.assertFalse(eq.update(f,0x90,7,127))
  with self.assertRaises(ValueError):eq.update(f,0xb0,7,128)

if __name__=='__main__':unittest.main()
