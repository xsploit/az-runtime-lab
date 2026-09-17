import math
import unittest

from native_cfx import NativeCfx, parse_selector_map
from az_mixer_packet import (SOUND_COLOR_HUI_SOURCES,
                             SOUND_COLOR_SELECTOR_BITS, crc16)


MAPPING = {1: 6, 2: 5, 3: 4, 4: 3, 5: 2, 6: 1}


def packet(selectors=(), colors=(0, 0, 0, 0), *, header=True):
    frame = bytearray(128)
    if header:
        frame[0:2] = b'\x34\x12'
    for selector in selectors:
        frame[21] |= 1 << SOUND_COLOR_SELECTOR_BITS[selector - 1]
    for channel, raw in enumerate(colors):
        frame[61 + channel] = raw >> 2
        frame[65] |= (raw & 3) << (6 - 2 * channel)
    frame[96:98] = crc16(frame[:96]).to_bytes(2, 'little')
    return bytes(frame)


def hui_packet(suffixes):
    frame = bytearray(packet())
    for suffix in suffixes:
        offset, bit = SOUND_COLOR_HUI_SOURCES[suffix]
        frame[offset] |= 1 << bit
    frame[96:98] = crc16(frame[:96]).to_bytes(2, 'little')
    return bytes(frame)


def deliver_all(state, entries):
    for channel, snapshot, _ in entries:
        state.delivered(channel, snapshot)


class NativeCfxTests(unittest.TestCase):
    def test_policy_parser_requires_all_six_without_inference(self):
        expected = {index: index for index in range(1, 7)}
        self.assertEqual(parse_selector_map('1:1,2:2,3:3,4:4,5:5,6:6'), expected)
        for value in ('', '1:1', '1:1,1:2,2:2,3:3,4:4,5:5,6:6',
                      '1:0,2:2,3:3,4:4,5:5,6:6', 'identity'):
            with self.assertRaises(ValueError, msg=value):
                parse_selector_map(value)
        with self.assertRaises(ValueError):
            NativeCfx(MAPPING, None)
        with self.assertRaises(ValueError):
            NativeCfx(None, .5)
        for parameter in (-.1, 1.1, math.inf, math.nan):
            with self.assertRaises(ValueError):
                NativeCfx(MAPPING, parameter)

    def test_invalid_packets_do_not_mutate_or_create_defaults(self):
        state = NativeCfx(MAPPING, .25)
        bad_crc = bytearray(packet([1], (1, 2, 3, 4)))
        bad_crc[96] ^= 1
        self.assertFalse(state.accept_rx(bad_crc))
        self.assertIsNone(state.buttons)
        self.assertIsNone(state.colors_raw)
        self.assertIsNone(state.observed_selector)
        self.assertEqual(state.pending(), [])
        self.assertFalse(state.accept_rx(packet([1], (1, 2, 3, 4), header=False)))
        self.assertIsNone(state.buttons)

    def test_first_valid_packet_is_only_a_baseline(self):
        state = NativeCfx(MAPPING, .25)
        self.assertTrue(state.accept_rx(packet([4], (1, 2, 3, 4))))
        self.assertIsNone(state.observed_selector)
        self.assertIsNone(state.desired_f1_type)
        self.assertEqual(state.pending(), [])
        self.assertTrue(state.accept_rx(packet([], (1, 2, 3, 4))))
        self.assertIsNone(state.observed_selector)
        state.accept_rx(packet([4], (1, 2, 3, 4)))
        self.assertEqual(state.observed_selector, 4)
        self.assertEqual(state.desired_f1_type, MAPPING[4])

    def test_all_six_rising_edges_keep_raw_and_policy_separate(self):
        for selector in range(1, 7):
            state = NativeCfx(MAPPING, .25)
            state.accept_rx(packet())
            state.accept_rx(packet([selector]))
            self.assertEqual(state.observed_selector, selector)
            self.assertEqual(state.desired_f1_type, MAPPING[selector])
            entries = state.pending(1)
            self.assertEqual(len(entries), 4)
            self.assertTrue(all(command.startswith(
                f'F1 {channel} {MAPPING[selector]} ')
                for channel, _, command in entries))

    def test_release_does_not_retrigger_and_same_press_toggles_off(self):
        state = NativeCfx(MAPPING, .75)
        state.accept_rx(packet())
        state.accept_rx(packet([2]))
        first = state.pending(1)
        deliver_all(state, first)
        self.assertTrue(state.accept_rx(packet()))
        self.assertEqual(state.observed_selector, 2)
        self.assertEqual(state.pending(1.1), [])
        state.accept_rx(packet([2]))
        self.assertEqual(state.observed_selector, 0)
        self.assertEqual(state.desired_f1_type, 0)
        self.assertEqual([entry[2] for entry in state.pending(1.1)], [
            f'F1 {channel} 0 0 0.75' for channel in range(4)])

    def test_simultaneous_edges_follow_selector_scan_order(self):
        state = NativeCfx(MAPPING, .5)
        state.accept_rx(packet())
        state.accept_rx(packet([1, 4, 6]))
        self.assertEqual(state.observed_selector, 6)
        state.accept_rx(packet())
        state.accept_rx(packet([2, 6]))
        # Selector 2 is applied first, then selector 6 becomes the final value.
        self.assertEqual(state.observed_selector, 6)

    def test_color_changes_emit_latest_full_snapshot_after_selection(self):
        state = NativeCfx(MAPPING, .125)
        state.accept_rx(packet(colors=(0, 1, 510, 1023)))
        state.accept_rx(packet([1], (0, 1, 510, 1023)))
        first = state.pending(1)
        self.assertEqual([entry[2] for entry in first], [
            'F1 0 6 0 0.125',
            'F1 1 6 0.000977517106 0.125',
            'F1 2 6 0.498533726 0.125',
            'F1 3 6 1 0.125',
        ])
        deliver_all(state, first)
        state.accept_rx(packet([1], (0, 2, 510, 1023)))
        self.assertEqual(len(state.pending(1.1)), 4)
        self.assertEqual(state.colors_raw, (0, 2, 510, 1023))

    def test_observation_only_never_emits_f1(self):
        state = NativeCfx()
        state.accept_rx(packet())
        state.accept_rx(packet([3], (1, 2, 3, 4)))
        self.assertEqual(state.observed_selector, 3)
        self.assertIsNone(state.desired_f1_type)
        self.assertEqual(state.pending(), [])

    def test_hui_suffix_zero_one_are_observed_without_selector_output(self):
        state = NativeCfx(MAPPING, .5)
        state.accept_rx(packet())
        self.assertTrue(state.accept_rx(hui_packet([0, 1])))
        self.assertEqual(state.hui_bits[:2], (1, 1))
        self.assertEqual(state.buttons, (0,) * 6)
        self.assertIsNone(state.observed_selector)
        self.assertEqual(state.pending(), [])

    def test_failed_socket_delivery_retries_then_success_still_repeats_bounded(self):
        now = [1.0]
        state = NativeCfx(MAPPING, .5, clock=lambda: now[0])
        state.accept_rx(packet())
        state.accept_rx(packet([1]))
        first = state.pending()
        self.assertEqual(len(first), 4)
        self.assertEqual(state.pending(), first)
        # Socket backpressure may outlast the nominal mixer-busy window. The
        # full snapshot remains pending and starts that window only on delivery.
        now[0] = 2.0
        self.assertEqual(state.pending(), first)
        deliver_all(state, first)
        now[0] = 2.1
        self.assertEqual(state.pending(), [])
        now[0] = 2.21
        repeat = state.pending()
        self.assertEqual(repeat, first)
        deliver_all(state, repeat)
        now[0] = 2.81
        self.assertEqual(state.pending(), [])

    def test_newer_state_replaces_an_undelivered_retry_snapshot(self):
        state = NativeCfx(MAPPING, .5)
        state.accept_rx(packet())
        state.accept_rx(packet([1]))
        stale = state.pending(1)
        state.accept_rx(packet())
        state.accept_rx(packet([2], (1, 2, 3, 4)))
        current = state.pending(1.01)
        self.assertTrue(all(command.split()[2] == str(MAPPING[2])
                            for _, _, command in current))
        self.assertFalse(state.delivered(stale[0][0], stale[0][1]))
        self.assertEqual(state.pending(1.01), current)


if __name__ == '__main__':
    unittest.main()
