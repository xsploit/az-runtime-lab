import unittest
from native_eq import NativeEq
from az_mixer_packet import crc16
from probe_eq_packet_delivery import packet


def tx(mode):
    f = bytearray(128)
    f[8] = mode << 4
    f[104:106] = crc16(f[:104]).to_bytes(2, 'little')
    return bytes(f)


class NativeEqTests(unittest.TestCase):
    def test_waits_for_both_directions_and_retries_until_delivered(self):
        s = NativeEq(); s.accept_rx(packet([512] * 12))
        self.assertEqual(s.pending(), [])
        s.accept_tx(tx(1)); first = s.pending()
        self.assertEqual(len(first), 4)
        self.assertEqual(s.pending(), first)
        for ch, state, command in first:
            self.assertTrue(command.startswith(f'EQ1 {ch} 1 '))
            s.delivered(ch, state)
        self.assertEqual(s.pending(), [])
        s.accept_rx(packet([0] * 3 + [512] * 9))
        self.assertEqual([c for c, _, _ in s.pending()], [0])
        s.accept_tx(tx(0))
        self.assertEqual(len(s.pending()), 4)

    def test_invalid_and_unknown_never_become_valid_defaults(self):
        s = NativeEq(); s.accept_tx(tx(1))
        f = bytearray(packet([1023] * 12)); f[96] ^= 1
        self.assertFalse(s.accept_rx(f)); self.assertEqual(s.pending(), [])
        f = bytearray(packet([1023] * 12)); f[:2] = b'\0\0'
        f[96:98] = crc16(f[:96]).to_bytes(2, 'little')
        self.assertFalse(s.accept_rx(f)); self.assertEqual(s.pending(), [])
        s.accept_rx(packet([1023] * 12))
        self.assertEqual(s.pending()[0][2], 'EQ1 0 1 1 1 1')
        bad = bytearray(tx(0)); bad[104] ^= 1
        self.assertFalse(s.accept_tx(bad)); self.assertEqual(s.mode, 1)
        for mode in (2, 3):
            s.accept_tx(tx(mode)); self.assertEqual(s.pending(), [])
        s.accept_tx(tx(0)); self.assertEqual(len(s.pending()), 4)
        self.assertEqual(NativeEq().pending(), [])


if __name__ == '__main__':
    unittest.main()
