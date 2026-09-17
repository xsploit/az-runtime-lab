"""Boundary vectors for source-derived conversion, not native DSP proof."""
import unittest
from probe_fixfu import convert


class ConversionTests(unittest.TestCase):
    def test_boundaries(self):
        cases={0:0,0x80000000:0,1:0,0x807fffff:0,
               0x3f7fffff:0,0xbf7fffff:0,0x3f800000:1,0xbf800000:0xffffffff,
               0x3fc00000:1,0xbfc00000:0xffffffff,
               0x4effffff:0x7fffff80,0xceffffff:0x80000080,
               0x4f000000:0x80000000,0xcf000000:0x80000000,
               0x4f7fffff:0xffffff00,0xcf7fffff:0x80000000,
               0x4f800000:0xffffffff,0xcf800000:0x80000000,
               0x7f800000:0xffffffff,0xff800000:0x80000000,
               0x7fc00001:0xffffffff,0xffc00001:0x80000000}
        for bits,result in cases.items():
            with self.subTest(bits=hex(bits)):self.assertEqual(convert(bits),result)

    def test_rejects_non_bit_patterns(self):
        for value in (-1,1<<32,1.5,True):
            with self.assertRaises(ValueError):convert(value)


if __name__=='__main__':unittest.main()
