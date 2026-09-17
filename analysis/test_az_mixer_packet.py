"""Synthetic checksum tests; do not imply acceptance by the real player."""
import struct
import unittest
from az_mixer_packet import (SOUND_COLOR_HUI_SOURCES,
                             SOUND_COLOR_SELECTOR_BITS, crc16, inspect,
                             inspect_tx)


class PacketTests(unittest.TestCase):
    def test_eq_iso_mode_is_independent_and_rejects_unknown_or_corrupt(self):
        frame = bytearray(128)
        for mode in range(4):
            # Preserve all unrelated bits in this shared routing byte.
            for neighbours in (0, 0xcf):
                frame[8] = neighbours | (mode << 4)
                frame[104:106] = crc16(frame[:104]).to_bytes(2, 'little')
                result = inspect_tx(frame)
                self.assertEqual(result['eq_iso_mode_raw'], mode)
                self.assertEqual(result['eq_iso_mode'], {0:'eq', 1:'isolator'}.get(mode))
                frame[104] ^= 1
                self.assertIsNone(inspect_tx(frame)['eq_iso_mode'])

    def test_named_routing_rejects_corrupt_and_unknown(self):
        frame = bytearray(128)
        frame[6] = 0b00011011 # thru,a,b,unknown
        for mode in range(4):
            frame[8] = (mode << 6) | 63
            for link in range(256):
                frame[9] = link
                frame[104:106] = crc16(frame[:104]).to_bytes(2, 'little')
                routing = inspect_tx(frame)['routing_settings']
                self.assertEqual(routing['channel_assign'], ['thru','a','b',None])
                self.assertEqual(routing['headphone_mode'], ['stereo','mono_split',None,None][mode])
                self.assertEqual(routing['link_volume_db'], {0:0,1:-3,2:-6,3:-9}.get(link))
                frame[104] ^= 1
                self.assertIsNone(inspect_tx(frame)['routing_settings'])

    def test_tx_channel_and_headphone_fields(self):
        frame = bytearray(128)
        for value in range(256):
            frame[6] = value
            frame[8] = value ^ 0x55
            frame[9] = value ^ 0xaa
            result = inspect_tx(frame)
            self.assertEqual(result['channel_assign_raw'],
                             [value // 64, value // 16 % 4, value // 4 % 4, value % 4])
            self.assertEqual(result['headphone_settings_raw'],
                             {'mode': (value ^ 0x55) // 64, 'link_volume': value ^ 0xaa})
            self.assertFalse(result['checksum_valid'])
            frame[104:106] = crc16(frame[:104]).to_bytes(2, 'little')
            self.assertTrue(inspect_tx(frame)['checksum_valid'])
            frame[104:106] = b'\0\0'

    def test_beat_fx_raw_bytes_preserve_unknown_values(self):
        frame = bytearray(128)
        for value in range(256):
            frame[16:19] = bytes((value ^ 0x55, value, value ^ 0xaa))
            frame[104:106] = crc16(frame[:104]).to_bytes(2, 'little')
            result = inspect_tx(frame)
            self.assertTrue(result['checksum_valid'])
            self.assertEqual(result['beat_fx_controls_raw'], {
                'mic_select': value ^ 0x55, 'quantize': value, 'channel_select': value ^ 0xaa})

    def test_mic_target_requires_known_value_and_valid_crc(self):
        frame = bytearray(128)
        for raw in range(256):
            frame[16] = raw
            frame[104:106] = crc16(frame[:104]).to_bytes(2, 'little')
            self.assertEqual(inspect_tx(frame)['beat_fx_mic_target'],
                             {0: 'both', 1: 'mic1', 2: 'mic2'}.get(raw))
            frame[104] ^= 1
            self.assertIsNone(inspect_tx(frame)['beat_fx_mic_target'])

    def test_onair_channel_order_and_low_bits(self):
        frame = bytearray(128)
        for value, expected in [(0x0f,[0,0,0,0]),(0x8f,[1,0,0,0]),
                                (0x4f,[0,1,0,0]),(0x2f,[0,0,1,0]),
                                (0x1f,[0,0,0,1]),(0xff,[1,1,1,1])]:
            frame[94]=value
            self.assertEqual(inspect(frame)['channel_onair_bits_raw'],expected)

    def test_browser_indicator_fields(self):
        frame = bytearray(128)
        for value in range(256):
            frame[26] = value
            self.assertEqual(inspect_tx(frame)['browser_indicator_states_raw'], {
                'PlaylistView': value & 3,
                'TagListView': (value >> 2) & 3,
                'BrowseViewGroup': (value >> 4) & 3,
            })

    def test_transmit_shift_bits(self):
        frame = bytearray(128)
        for flags in range(4):
            frame[24] = 0xfc | flags
            self.assertEqual(inspect_tx(frame)['deck_shift_bits_raw'],
                             [(flags >> 1) & 1, flags & 1])

    def test_all_transmit_availability_masks(self):
        frame = bytearray(128)
        # Zero is a legitimate present value; use distinct values in other slots.
        for offset in range(40, 104, 4):
            frame[offset:offset+4] = (offset-40).to_bytes(4, 'little')
        for mask in range(256):
            frame[39] = mask
            result = inspect_tx(frame)
            for group in range(4):
                self.assertEqual(result['unnamed_word_updates'][group],
                                 48+4*group if mask & (1 << group) else None)
                self.assertEqual(result['unnamed_record_updates'][group],
                                 [12*group, 12*group+4, 12*group+8]
                                 if mask & (16 << group) else None)

    def test_transmit_checksum_boundaries(self):
        frame = bytearray(range(128))
        frame[104:106] = crc16(frame[:104]).to_bytes(2, 'little')
        self.assertTrue(inspect_tx(frame)['checksum_valid'])
        for offset in range(106):
            changed = frame.copy()
            changed[offset] ^= 1
            self.assertFalse(inspect_tx(changed)['checksum_valid'], offset)
        for offset in range(106, 128):
            frame[offset] ^= 255
        self.assertTrue(inspect_tx(frame)['checksum_valid'])
        self.assertFalse(inspect_tx(frame[:127])['length_valid'])

    def test_standard_check_value(self):
        self.assertEqual(crc16(b'123456789'), 0x906e)

    def test_length_rejected(self):
        for length in (0, 64, 127, 129):
            self.assertFalse(inspect(bytes(length))['length_valid'])

    def test_payload_and_crc_corruption(self):
        frame = bytearray(range(128))
        frame[96:98] = crc16(frame[:96]).to_bytes(2, 'little')
        self.assertTrue(inspect(frame)['checksum_valid'])
        for offset in range(98):
            corrupt = frame.copy()
            corrupt[offset] ^= 1
            self.assertFalse(inspect(corrupt)['checksum_valid'], offset)

    def test_tail_outside_checksum(self):
        frame = bytearray(128)
        frame[96:98] = crc16(frame[:96]).to_bytes(2, 'little')
        for offset in range(98, 128):
            frame[offset] ^= 0xff
        self.assertTrue(inspect(frame)['checksum_valid'])

    def test_packed_groups(self):
        frame = bytearray(128)
        frame[0:6] = bytes.fromhex('34127856bc9a')
        # Lane upper bytes 0, 1, 127, 255; shared lower pairs 0, 1, 2, 3.
        frame[36:41] = bytes([0, 1, 127, 255, 0x1b])
        frame[51:56] = bytes([255, 127, 1, 0, 0xe4])
        result = inspect(frame)
        self.assertEqual(result['header_words_le'], [0x1234, 0x5678, 0x9abc])
        self.assertTrue(result['dispatcher_header_nonzero'])
        self.assertEqual(result['unnamed_10bit_groups'][0], [0, 5, 510, 1023])
        self.assertEqual(result['unnamed_10bit_groups'][3], [1023, 510, 5, 0])
        self.assertEqual(result['unnamed_10bit_groups'][1:3], [[0]*4, [0]*4])
        self.assertEqual(result['mixer_knobs_raw'][0], {
            'channel_index': 0, 'trim': 0, 'eqIsoHi': 5,
            'eqIsoMid': 510, 'eqIsoLow': 1023})

    def test_fader_color_regions(self):
        frame = bytearray(128)
        frame[10:15] = bytes([0, 1, 127, 255, 0x1b])
        frame[61:66] = bytes([255, 127, 1, 0, 0xe4])
        result = inspect(frame)
        self.assertEqual(result['channel_faders_raw'], [0, 5, 510, 1023])
        self.assertEqual(result['channel_color_raw'], [1023, 510, 5, 0])
        expected = [struct.unpack('<f', struct.pack('<f', raw / 1023))[0]
                    for raw in (1023, 510, 5, 0)]
        self.assertEqual(result['channel_color_normalized'], expected)
        self.assertEqual(result['unnamed_10bit_groups'], [[0]*4]*4)

    def test_sound_color_selector_order_is_mixer_mcu_order(self):
        for selected, bit in enumerate(SOUND_COLOR_SELECTOR_BITS, 1):
            frame = bytearray(128)
            frame[21] = 1 << bit
            result = inspect(frame)
            self.assertEqual(result['sound_color_selector_bits_raw'],
                             [int(index == selected) for index in range(1, 7)])

    def test_sound_color_hui_suffix_sources_are_separate(self):
        overlap = {2: 4, 3: 2, 4: 3, 5: 6}
        for suffix, (offset, bit) in enumerate(SOUND_COLOR_HUI_SOURCES):
            frame = bytearray(128)
            frame[offset] = 1 << bit
            result = inspect(frame)
            self.assertEqual(result['sound_color_hui_bits_raw'],
                             [int(index == suffix) for index in range(6)])
            self.assertEqual(result['sound_color_selector_bits_raw'],
                             [int(index == overlap.get(suffix))
                              for index in range(1, 7)])

    def test_hui_suffix_zero_one_do_not_masquerade_as_selectors_one_five(self):
        frame = bytearray(128)
        frame[23] = (1 << 2) | (1 << 1)
        result = inspect(frame)
        self.assertEqual(result['sound_color_hui_bits_raw'][:2], [1, 1])
        self.assertEqual(result['sound_color_selector_bits_raw'], [0] * 6)
        frame[23] = 0
        frame[21] = (1 << 1) | (1 << 0)
        result = inspect(frame)
        self.assertEqual(result['sound_color_hui_bits_raw'][:2], [0, 0])
        self.assertEqual(result['sound_color_selector_bits_raw'],
                         [1, 0, 0, 0, 1, 0])

    def test_cue_bit_order_and_upper_bits(self):
        for channel in range(4):
            frame = bytearray(128)
            frame[20] = 0xf0 | (1 << (3-channel))
            self.assertEqual(inspect(frame)['channel_cue_bits_raw'],
                             [int(g == channel) for g in range(4)])

    def test_crossfader_range_and_unrelated_bits(self):
        frame = bytearray(128)
        for raw in range(1024):
            frame[15] = raw >> 2
            frame[16] = 0xfc | (raw & 3)
            self.assertEqual(inspect(frame)['crossfader_raw'], raw)


if __name__ == '__main__':
    unittest.main()
