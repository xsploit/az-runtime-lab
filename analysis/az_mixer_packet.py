#!/usr/bin/env python3
"""Read-only AZ 1.30 mixer receive-buffer checksum inspector.

Derived from EP147 0x2159a08; not a transport decoder or hardware emulator.
Accepts one already-delimited 128-byte buffer, not a raw SPI capture stream.
"""
import argparse
import json
from pathlib import Path


def crc16(data: bytes) -> int:
    """Reflected polynomial 0x8408, initial/final XOR 0xffff."""
    crc = 0xffff
    for byte in data:
        crc ^= byte
        for _ in range(8):
            crc = (crc >> 1) ^ (0x8408 if crc & 1 else 0)
    return crc ^ 0xffff


def inspect_tx(frame: bytes) -> dict:
    """Player-to-mixer checksum layout; not the receive control map."""
    if len(frame) != 128:
        return {'length': len(frame), 'length_valid': False, 'checksum_valid': None}
    stored = int.from_bytes(frame[104:106], 'little')
    calculated = crc16(frame[:104])
    # Availability is separate from value: absent records must not become zeros.
    words = lambda offset, count: [int.from_bytes(frame[i:i+4], 'little')
                                    for i in range(offset, offset+count*4, 4)]
    pending = frame[39]
    return {'direction': 'tx', 'length': 128, 'length_valid': True,
            # Unknown/corrupt packets must not select a microphone implicitly.
            'beat_fx_mic_target': ({0: 'both', 1: 'mic1', 2: 'mic2'}.get(frame[16])
                                  if stored == calculated else None),
            # Native TX builder215a2f8 receives packet+4; channel order0..3.
            'eq_iso_mode_raw': (frame[8] >> 4) & 3,
            'eq_iso_mode': ({0: 'eq', 1: 'isolator'}.get((frame[8] >> 4) & 3)
                            if stored == calculated else None),
            'routing_settings': ({
                'channel_assign': [{0: 'thru', 1: 'a', 2: 'b'}.get((frame[6] >> (6-2*g)) & 3) for g in range(4)],
                'headphone_mode': {0: 'stereo', 1: 'mono_split'}.get((frame[8] >> 6) & 3),
                'link_volume_db': {0: 0, 1: -3, 2: -6, 3: -9}.get(frame[9]),
            } if stored == calculated else None),
            'channel_assign_raw': [(frame[6] >> (6-2*g)) & 3 for g in range(4)],
            'headphone_settings_raw': {'mode': (frame[8] >> 6) & 3, 'link_volume': frame[9]},
            'beat_fx_controls_raw': {'mic_select': frame[16], 'quantize': frame[17], 'channel_select': frame[18]},
            'deck_shift_bits_raw': [(frame[24] >> 1) & 1, frame[24] & 1],
            'browser_indicator_states_raw': {
                'PlaylistView': frame[26] & 3,
                'TagListView': (frame[26] >> 2) & 3,
                'BrowseViewGroup': (frame[26] >> 4) & 3,
            },
            'stored_crc': f'0x{stored:04x}', 'calculated_crc': f'0x{calculated:04x}',
            'checksum_valid': stored == calculated,
            'unnamed_word_updates': [words(88+4*g, 1)[0]
                                     if pending & (1 << g) else None for g in range(4)],
            'unnamed_record_updates': [words(40+12*g, 3)
                                       if pending & (16 << g) else None for g in range(4)],
            'scope': 'Transmit checksum, named raw controls/indicators and conditional raw records; physical LED state meanings unverified.'}


def inspect(frame: bytes) -> dict:
    if len(frame) != 128:
        return {'length': len(frame), 'length_valid': False,
                'checksum_valid': None}
    actual = int.from_bytes(frame[96:98], 'little')
    expected = crc16(frame[:96])
    groups = [[(frame[36 + 5*g + lane] << 2) |
               ((frame[40 + 5*g] >> (6 - 2*lane)) & 3)
               for lane in range(4)] for g in range(4)]
    return {'length': 128, 'length_valid': True,
            'stored_crc': f'0x{actual:04x}',
            'calculated_crc': f'0x{expected:04x}',
            'checksum_valid': actual == expected,
            'header_words_le': [int.from_bytes(frame[i:i+2], 'little')
                                for i in (0, 2, 4)],
            'dispatcher_header_nonzero': frame[0:2] != b'\x00\x00',
            'unnamed_10bit_groups': groups,  # Kept for existing local readers.
            'mixer_knobs_raw': [dict(channel_index=g, **dict(zip(
                ('trim', 'eqIsoHi', 'eqIsoMid', 'eqIsoLow'), values)))
                for g, values in enumerate(groups)],
            'channel_faders_raw': [(frame[10+g] << 2) |
                ((frame[14] >> (6-2*g)) & 3) for g in range(4)],
            'channel_color_raw': [(frame[61+g] << 2) |
                ((frame[65] >> (6-2*g)) & 3) for g in range(4)],
            'channel_onair_bits_raw': [(frame[94] >> (7-g)) & 1 for g in range(4)],
            'channel_cue_bits_raw': [(frame[20] >> (3-g)) & 1
                                     for g in range(4)],
            'crossfader_raw': (frame[15] << 2) | (frame[16] & 3),
            # Native dispatcher2154850 passes frame+84 to21545e8.
            # These names describe storage, not yet musical semantics.
            'beat_fx_receive_raw': {
                'state0_low2': frame[84]&3,
                'state1_value_u16': int.from_bytes(frame[88:90], 'little'),
                'state1_flag_bit6': (frame[84]>>6)&1,
                'state2_value_i16': int.from_bytes(frame[90:92], 'little', signed=True),
                'state2_byte': frame[86],
                'state2_flags_nonzero': bool(frame[84]&12),
                'state2_representation': frame[85]>>4,
                'state2_signed_byte': int.from_bytes(frame[92:93], 'little', signed=True),
                'state2_high_nibble': frame[93]>>4,
                'state3_bits4_5': (frame[84]>>4)&3,
                'state4_bit7': frame[84]>>7,
            },
            # EP147 0x2154418 receives frame+31. Missing mappings stay absent.
            'load_buttons_raw': {'deck1': (frame[33] >> 3) & 1,
                                 'deck2': (frame[33] >> 2) & 1,
                                 'deck3': (frame[33] >> 1) & 1,
                                 'deck4': frame[33] & 1},
            'encoder_member_208_raw': {
                'pressed': frame[31] & 1,
                'counter_signed16': int.from_bytes(frame[34:36], 'little', signed=True),
            },
            'scope': 'Static receive map; DSP curves and transport unverified.'}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('packet', type=Path)
    parser.add_argument('--direction', choices=('rx', 'tx'), default='rx')
    args = parser.parse_args()
    reader = inspect if args.direction == 'rx' else inspect_tx
    print(json.dumps(reader(args.packet.read_bytes()), indent=2))
