import unittest
from az_fx_feedback import encode_feedback,encode_applied_echo
from az_mixer_packet import crc16,inspect
class Feedback(unittest.TestCase):
 def test_applied_timing_regression_uses_effect_beat(self):
  # Actual Q1 regression: requested beat8 at40BPM resolves to Echo beat6/3000ms.
  b=bytearray(128);b[0]=1;b[96:98]=crc16(b[:96]).to_bytes(2,'little')
  q=dict(version=1,attached=1,active_type=5,phase=0,delay_change_pending=0,
         quantize_requested=0,source_bpm100=4000,effect_beat=6,time_ms=3000,
         scheduled_beat=8)
  p=encode_applied_echo(b,q,tap=False)
  self.assertEqual(p[86],12) # Native AZ screenshot: wire12 displays2beats.
  self.assertEqual(int.from_bytes(p[90:92],'little'),3000)
  self.assertEqual(int.from_bytes(p[88:90],'little'),400)
  self.assertTrue(inspect(p)['checksum_valid'])
  for key,value in (('attached',0),('active_type',0),('phase',1),
                    ('delay_change_pending',1),('quantize_requested',1),
                    ('source_bpm100',4294967295),('effect_beat',10),('version',2)):
   with self.assertRaises(ValueError):encode_applied_echo(b,{**q,key:value},tap=False)
 def test_all_echo_presets_match_native_ui_evidence(self):
  import json
  from pathlib import Path
  labels=json.loads((Path(__file__).parent/'az-echo-preset-enum.json').read_text())['preset_labels']
  for fraction,wire in (((1,16),1),((1,8),3),((1,4),5),((1,3),6),((1,2),7),
                        ((2,3),8),((3,4),9),((1,1),10),((2,1),12),((4,1),14),((8,1),16),((16,1),17)):
   b=bytearray(128);b[96:98]=crc16(b[:96]).to_bytes(2,'little')
   p=encode_feedback(b,effect=1,bpm_tenths=1200,tap=False,time_ms=250,beat_fraction=fraction)
   label=str(fraction[0]) if fraction[1]==1 else f'{fraction[0]}/{fraction[1]}'
   self.assertEqual(labels[str(p[86])],label)
   self.assertEqual(p[86],wire)
 def test_preserves_packet(self):
  b=bytearray(range(128));b[96:98]=crc16(b[:96]).to_bytes(2,'little')
  for effect in (0,1):
   for tap in (False,True):
    p=encode_feedback(b,effect=effect,bpm_tenths=1280,tap=tap,time_ms=375);self.assertTrue(inspect(p)['checksum_valid'])
    for i in range(128):
     if i not in (84,85,88,89,90,91,96,97):self.assertEqual(p[i],b[i])
    self.assertEqual(p[84]&~64,b[84]&~64);self.assertEqual(p[85]&15,b[85]&15)
    self.assertEqual(p[85]>>4,effect);self.assertEqual((p[84]>>6)&1,tap)
 def test_reject_unknown(self):
  b=bytearray(128);b[96:98]=crc16(b[:96]).to_bytes(2,'little')
  for args in ({'effect':5},{'bpm_tenths':10000},{'tap':1},{'time_ms':-1}):
   kw=dict(effect=1,bpm_tenths=1280,tap=False,time_ms=375);kw.update(args)
   with self.assertRaises(ValueError):encode_feedback(b,**kw)
 def test_observed_adjusted_packet_returns_to_presets(self):
  from pathlib import Path
  # Captured baseline ended in an adjusted half-beat display (RX92=50).
  b=(Path(__file__).parent/'az-fraction-adjusted-captured.raw').read_bytes()
  self.assertTrue(inspect(b)['checksum_valid'])
  for fraction,observed_wire in (((1,3),6),((1,2),7),((2,3),8)):
   p=encode_feedback(b,effect=1,bpm_tenths=1280,tap=True,time_ms=375,beat_fraction=fraction)
   state=inspect(p)['beat_fx_receive_raw']
   self.assertEqual(state['state2_byte'],observed_wire)
   self.assertFalse(state['state2_flags_nonzero'])
   self.assertEqual(state['state2_signed_byte'],0)
   self.assertTrue(inspect(p)['checksum_valid'])
   for i in range(128):
    if i not in (84,85,86,88,89,90,91,92,96,97):self.assertEqual(p[i],b[i])
   self.assertEqual(p[84]&~76,b[84]&~76)
 def test_unverified_fraction_cannot_be_silently_substituted(self):
  b=bytearray(128);b[96:98]=crc16(b[:96]).to_bytes(2,'little')
  for fraction in ((1,5),(1,0),(True,2),[1,2],.5,(2,4)):
   with self.assertRaises(ValueError):
    encode_feedback(b,effect=1,bpm_tenths=1280,tap=False,time_ms=375,beat_fraction=fraction)
if __name__=='__main__':unittest.main()
