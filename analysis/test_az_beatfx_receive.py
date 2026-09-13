import unittest
from az_mixer_packet import inspect,crc16
class Receive(unittest.TestCase):
 def test_bitfields_and_signed_edges(self):
  for flags in range(256):
   for signed in (-32768,-1,0,32767):
    b=bytearray(128);b[84]=flags;b[85]=0xa7;b[86]=231;b[88:90]=(49152).to_bytes(2,'little');b[90:92]=signed.to_bytes(2,'little',signed=True);b[92]=0xfe;b[93]=0xd6;b[96:98]=crc16(b[:96]).to_bytes(2,'little')
    p=inspect(b);self.assertTrue(p['checksum_valid']);r=p['beat_fx_receive_raw']
    self.assertEqual(r,{'state0_low2':flags%4,'state1_value_u16':49152,'state1_flag_bit6':(flags//64)%2,'state2_value_i16':signed,'state2_byte':231,'state2_flags_nonzero':bool(flags&12),'state2_representation':10,'state2_signed_byte':-2,'state2_high_nibble':13,'state3_bits4_5':(flags//16)%4,'state4_bit7':flags//128})
if __name__=='__main__':unittest.main()
