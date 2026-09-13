"""Session-local EQ state from complete native RX controls and TX settings.

No I/O, guessed defaults, memory writes or touchscreen input. The caller owns
packet ordering and must create a new instance for each player/mixer session.
Commands describe normalized RX knobs; native acceptance is tested separately.
"""
import struct
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'analysis'))
from az_mixer_packet import inspect, inspect_tx


class NativeEq:
    def __init__(self):
        self.mode = None
        self.knobs = None
        self.sent = [None] * 4

    def accept_rx(self, frame):
        packet = inspect(frame)
        if not packet['length_valid'] or not packet['checksum_valid']:
            return False
        if not packet['dispatcher_header_nonzero']:
            return False
        knobs = tuple(tuple(c[k] for k in ('eqIsoHi', 'eqIsoMid', 'eqIsoLow'))
                      for c in packet['mixer_knobs_raw'])
        changed = knobs != self.knobs
        self.knobs = knobs
        return changed

    def accept_tx(self, frame):
        packet = inspect_tx(frame)
        if not packet['length_valid'] or not packet['checksum_valid']:
            return False
        # An explicit unsupported native mode suspends output until supported.
        mode = {'eq': 0, 'isolator': 1}.get(packet['eq_iso_mode'])
        changed = mode != self.mode
        if mode is None:
            self.sent = [None] * 4
        self.mode = mode
        return changed

    def pending(self):
        """Return changed (channel, state, command) entries without marking sent."""
        if self.mode is None or self.knobs is None:
            return []
        result = []
        for channel, raw in enumerate(self.knobs):
            state = (self.mode, *raw)
            if state == self.sent[channel]:
                continue
            values = [struct.unpack('<f', struct.pack('<f', v / 1023))[0] for v in raw]
            command = f'EQ1 {channel} {self.mode} ' + ' '.join(format(v, '.9g') for v in values)
            result.append((channel, state, command))
        return result

    def delivered(self, channel, state):
        """Call only after the command was successfully sent to this mixer."""
        if not 0 <= channel < 4:
            raise ValueError('Invalid EQ channel')
        self.sent[channel] = state
