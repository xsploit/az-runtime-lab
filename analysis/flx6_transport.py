"""Saved FLX6 transport bindings to persistent native AZ ERP packets.

Supports verified ERP groups for logical decks 1/2. Decks 3/4 require native
layer selection research and raise explicitly, rather than controlling 1/2.
Accepts complete MIDI messages; no device, UI, FIFO or runtime memory access.
"""
import re
import xml.etree.ElementTree as ET
from az_mixer_packet import crc16


class Transport:
    BUTTONS = {
        'play': (2, 2), 'cue_default': (2, 4), 'keylock': (0, 8),
        'sync_enabled': (0, 2), 'sync_leader': (0, 16),
        'loop_in': (0, 64), 'loop_out': (0, 32),
        'reloop_toggle': (1, 8), 'slip_enabled': (0, 4),
        'reverseroll': (0, 128),
        'PioneerDDJFLX6.cycleTempoRange': (1, 16),
        'beatloop_4_toggle': (4, 4), 'beatloop_8_toggle': (4, 8),
        **{f'hotcue_{i+1}_activate': (6, 1<<i) for i in range(8)},
    }

    def __init__(self, xml, base=None):
        self.frame = bytearray(bytes(128) if base is None else base)
        if len(self.frame) != 128:
            raise ValueError('Expected 128-byte ERP frame')
        self.frame[0:2] = (1).to_bytes(2, 'little')
        self.bindings = {}
        self.held = set()
        for control in ET.parse(xml).findall('.//controls/control'):
            key = control.findtext('key')
            group = re.fullmatch(r'\[Channel([1-4])\]', control.findtext('group', ''))
            if key not in self.BUTTONS or group is None:
                continue
            address = (int(control.findtext('status'), 0), int(control.findtext('midino'), 0))
            if address[0] & 0xf0 != 0x90 or not 0 <= address[1] < 128:
                raise ValueError('Expected note-on binding for transport button')
            binding = (int(group[1]), key)
            if address in self.bindings and self.bindings[address] != binding:
                raise ValueError('Conflicting FLX6 transport binding')
            self.bindings[address] = binding

    def packet(self):
        self.frame[28:30] = crc16(self.frame[:28]).to_bytes(2, 'little')
        return bytes(self.frame)

    def _target(self, binding):
        deck, key = binding
        if deck not in (1, 2):
            raise NotImplementedError('Native AZ deck 3/4 layer selection is not mapped')
        offset, mask = self.BUTTONS[key]
        return 8 + 8 * (deck - 1) + offset, mask

    def message(self, status, control, value):
        if any(type(v) is not int for v in (status, control, value)) or not (
                0x80 <= status <= 0xef and 0 <= control < 128 and 0 <= value < 128):
            raise ValueError('Expected complete valid MIDI channel message')
        if status & 0xf0 == 0x80:
            status += 0x10
            value = 0
        address = (status, control)
        binding = self.bindings.get(address)
        if binding is None:
            return None
        offset, mask = self._target(binding)
        if value:
            if address in self.held:
                return None
            self.held.add(address)
            self.frame[offset] |= mask
        else:
            if address not in self.held:
                return None
            self.held.remove(address)
            # More than one saved binding may refer to the same native button.
            if not any(self._target(self.bindings[a]) == (offset, mask) for a in self.held):
                self.frame[offset] &= ~mask
        return self.packet()

    def release_all(self):
        """Return a release snapshot for held inputs when the caller disconnects.
        Delivery/acknowledgement is the transport owner's responsibility.
        """
        if not self.held:
            return None
        for address in self.held:
            offset, mask = self._target(self.bindings[address])
            self.frame[offset] &= ~mask
        self.held.clear()
        return self.packet()
