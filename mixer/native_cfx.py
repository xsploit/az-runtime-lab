"""Session-local anonymous AZ Sound Color state and optional F1 policy.

The native selector values are not reconstructed RX3 effect identities. Command
output is enabled only by an explicit complete selector map and parameter value.
The caller owns packet ordering and calls delivered() only after socket success.
"""
import math
import struct
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'analysis'))
from az_mixer_packet import inspect


SELECTORS = frozenset(range(1, 7))
F1_TYPES = frozenset(range(1, 7))


def parse_selector_map(text):
    """Parse explicit ``selector:f1_type`` pairs for every selector 1..6."""
    if not text:
        raise ValueError('A complete Sound Color selector map is required')
    result = {}
    try:
        for item in text.split(','):
            selector, f1_type = (int(value, 10) for value in item.split(':'))
            if selector in result:
                raise ValueError('Duplicate Sound Color selector')
            result[selector] = f1_type
    except (TypeError, ValueError) as exc:
        if isinstance(exc, ValueError) and str(exc) == 'Duplicate Sound Color selector':
            raise
        raise ValueError('Expected selector:f1_type comma-separated pairs') from exc
    if set(result) != SELECTORS:
        raise ValueError('Sound Color map must define selectors 1 through 6')
    if any(f1_type not in F1_TYPES for f1_type in result.values()):
        raise ValueError('Mapped F1 types must be in 1 through 6')
    return result


def _validate_policy(selector_map, parameter):
    if selector_map is None and parameter is None:
        return None, None
    if selector_map is None or parameter is None:
        raise ValueError('Sound Color F1 output requires both map and parameter')
    selector_map = dict(selector_map)
    if set(selector_map) != SELECTORS:
        raise ValueError('Sound Color map must define selectors 1 through 6')
    if any(f1_type not in F1_TYPES for f1_type in selector_map.values()):
        raise ValueError('Mapped F1 types must be in 1 through 6')
    parameter = float(parameter)
    if not math.isfinite(parameter) or not 0 <= parameter <= 1:
        raise ValueError('Sound Color parameter must be finite and in [0,1]')
    return selector_map, parameter


class NativeCfx:
    def __init__(self, selector_map=None, parameter=None, *, clock=None,
                 retry_interval=.2, retry_window=.8):
        self.selector_map, self.parameter = _validate_policy(selector_map, parameter)
        if retry_interval <= 0 or retry_window < retry_interval:
            raise ValueError('Invalid Sound Color retry timing')
        self.clock = time.monotonic if clock is None else clock
        self.retry_interval = retry_interval
        self.retry_window = retry_window
        self.buttons = None
        self.hui_bits = None
        self.colors_raw = None
        self.observed_selector = None
        self.desired_f1_type = None
        self.sent = [None] * 4
        self.dirty = False
        self.next_send = 0.0
        self.retry_until = 0.0

    @property
    def output_enabled(self):
        return self.selector_map is not None

    def _set_desired_type(self):
        if not self.output_enabled or self.observed_selector is None:
            self.desired_f1_type = None
        elif self.observed_selector == 0:
            self.desired_f1_type = 0
        else:
            self.desired_f1_type = self.selector_map[self.observed_selector]

    def accept_rx(self, frame):
        packet = inspect(frame)
        if not packet['length_valid'] or not packet['checksum_valid']:
            return False
        if not packet['dispatcher_header_nonzero']:
            return False
        buttons = tuple(packet['sound_color_selector_bits_raw'])
        hui_bits = tuple(packet['sound_color_hui_bits_raw'])
        colors_raw = tuple(packet['channel_color_raw'])
        if self.buttons is None:
            self.buttons = buttons
            self.hui_bits = hui_bits
            self.colors_raw = colors_raw
            return True

        old_buttons = self.buttons
        old_hui_bits = self.hui_bits
        old_colors = self.colors_raw
        old_selector = self.observed_selector
        for selector, (old, new) in enumerate(zip(old_buttons, buttons), 1):
            if not old and new:
                self.observed_selector = (0 if self.observed_selector == selector
                                          else selector)
        self.buttons = buttons
        self.hui_bits = hui_bits
        self.colors_raw = colors_raw
        self._set_desired_type()

        output_changed = (self.observed_selector != old_selector or
                          (colors_raw != old_colors and
                           self.observed_selector is not None))
        if output_changed and self.output_enabled:
            self.dirty = True
            self.sent = [None] * 4
        return (buttons != old_buttons or hui_bits != old_hui_bits or
                colors_raw != old_colors)

    def _states(self):
        if self.desired_f1_type is None or self.colors_raw is None:
            return None
        return [(self.observed_selector, self.desired_f1_type, raw, self.parameter)
                for raw in self.colors_raw]

    def pending(self, now=None):
        """Return unsent/retry entries without treating send as mixer acceptance."""
        states = self._states()
        if states is None:
            return []
        now = self.clock() if now is None else now
        if self.dirty:
            self.dirty = False
            # Start the mixer-busy resend window only after the first complete
            # snapshot reaches the control socket. Socket backpressure itself
            # must not consume that bounded acceptance window.
            self.retry_until = 0.0
            self.next_send = 0.0
        elif all(self.sent[channel] == state
                 for channel, state in enumerate(states)):
            if now < self.next_send or now > self.retry_until:
                return []
            self.sent = [None] * 4
            self.next_send = now + self.retry_interval

        result = []
        for channel, state in enumerate(states):
            if self.sent[channel] == state:
                continue
            color = struct.unpack('<f', struct.pack('<f', state[2] / 1023))[0]
            command = (f'F1 {channel} {self.desired_f1_type} '
                       f'{format(color, ".9g")} {format(self.parameter, ".9g")}')
            result.append((channel, state, command))
        return result

    def delivered(self, channel, state):
        """Record socket delivery, but retain the bounded mixer-busy retry window."""
        if not 0 <= channel < 4:
            raise ValueError('Invalid Sound Color channel')
        states = self._states()
        if states is None or state != states[channel]:
            return False
        self.sent[channel] = state
        if self.retry_until == 0.0 and all(
                self.sent[index] == current
                for index, current in enumerate(states)):
            now = self.clock()
            self.retry_until = now + self.retry_window
            self.next_send = now + self.retry_interval
        return True
