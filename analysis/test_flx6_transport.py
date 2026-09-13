"""Offline saved-binding/state checks; no physical-controller verification."""
import hashlib
import json
from pathlib import Path
import unittest
from az_mixer_packet import crc16
from flx6_transport import Transport

HERE = Path(__file__).resolve().parent
XML = HERE.parents[1] / 'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml'


class TransportChecks(unittest.TestCase):
    def setUp(self):
        base = bytearray(128)
        base[5] = 0x55
        base[10] = 0x80
        self.transport = Transport(XML, base)

    def check_packet(self, packet):
        self.assertEqual(len(packet), 128)
        self.assertEqual(packet[28:30], crc16(packet[:28]).to_bytes(2, 'little'))
        self.assertEqual(packet[5], 0x55)
        self.assertEqual(packet[10] & 0x80, 0x80)

    def test_both_decks_and_all_mapped_buttons(self):
        for deck in range(2):
            for control, offset, mask in [(0x0b, 2, 2), (0x0c, 2, 4), (0x3e, 0, 8)]:
                packet = self.transport.message(0x90 + deck, control, 127)
                self.check_packet(packet)
                self.assertTrue(packet[8 + deck * 8 + offset] & mask)
                packet = self.transport.message(0x90 + deck, control, 0)
                self.assertFalse(packet[8 + deck * 8 + offset] & mask)

    def test_held_cue_survives_play_and_other_deck(self):
        self.transport.message(0x90, 0x0c, 127)
        self.transport.message(0x91, 0x0b, 127)
        packet = self.transport.message(0x90, 0x0b, 127)
        self.assertEqual(packet[10] & 6, 6)
        self.assertEqual(packet[18] & 2, 2)
        packet = self.transport.message(0x80, 0x0b, 64)
        self.assertEqual(packet[10] & 6, 4)
        self.assertEqual(packet[18] & 2, 2)
        self.check_packet(packet)

    def test_repeats_and_disconnect_release(self):
        self.transport.message(0x90, 0x0c, 127)
        self.assertIsNone(self.transport.message(0x90, 0x0c, 100))
        self.transport.message(0x91, 0x3e, 127)
        packet = self.transport.release_all()
        self.assertEqual(packet[10] & 6, 0)
        self.assertEqual(packet[16] & 8, 0)
        self.check_packet(packet)
        self.assertIsNone(self.transport.release_all())
        self.assertIsNone(self.transport.message(0x80, 0x0c, 0))

    def test_unknown_and_unmapped_layers_preserve_state(self):
        before = self.transport.packet()
        self.assertIsNone(self.transport.message(0xb6, 0x40, 1))
        for status in (0x92, 0x93):
            with self.assertRaises(NotImplementedError):
                self.transport.message(status, 0x0b, 127)
        self.assertEqual(self.transport.packet(), before)
        self.assertFalse(self.transport.held)

    def test_invalid_input(self):
        for message in [(0x90, 0x0b, 128), (0xf0, 0, 0), (0x90, 0x0b, 1.5)]:
            with self.assertRaises(ValueError):
                self.transport.message(*message)


result = unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(TransportChecks))
(HERE / 'flx6-transport-tests.json').write_text(json.dumps(dict(
    scope=__doc__, mapping_sha256=hashlib.sha256(XML.read_bytes()).hexdigest(),
    tests=result.testsRun, passed=result.wasSuccessful(), failures=len(result.failures),
    errors=len(result.errors)), indent=2) + '\n')
raise SystemExit(0 if result.wasSuccessful() else 1)
