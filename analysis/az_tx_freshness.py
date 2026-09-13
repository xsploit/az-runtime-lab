"""Diagnostic capture reader. Reports fresh raw groups, never universal page identity.

First observation/replacement/truncation establishes a baseline only. Caller must
supply monotonic time. Capture growth is evidence of new data, not proof of a live
player; enforce a caller-selected short age limit and don't use for auth/state.
"""
import os
from az_mixer_packet import inspect_tx

class TxFreshness:
    def __init__(self, max_age=0.25):
        if max_age <= 0: raise ValueError('Positive max_age required')
        self.max_age = max_age
        self.identity = None
        self.size = 0
        self.updated = None
        self.group = None

    def poll(self, path, now):
        try:
            with open(path, 'rb') as f:
                s = os.fstat(f.fileno())
                identity = (s.st_dev, s.st_ino)
                if identity != self.identity or s.st_size < self.size:
                    self.identity, self.size = identity, s.st_size
                    self.updated = self.group = None
                    return None
                previous_complete = self.size // 128
                complete = s.st_size // 128
                self.size = s.st_size
                if complete > previous_complete:
                    # Require two newly completed consecutive records agreeing.
                    self.updated = self.group = None
                    if complete - previous_complete < 2: return None
                    f.seek((complete - 2) * 128)
                    raw = f.read(256)
                    if len(raw) != 256: return None
                    decoded = [inspect_tx(raw[i:i+128]) for i in (0, 128)]
                    if not all(d['checksum_valid'] for d in decoded): return None
                    states = [d['browser_indicator_states_raw']['BrowseViewGroup'] for d in decoded]
                    if states[0] == states[1] and states[0] in (1, 2):
                        self.group, self.updated = states[0], now
        except OSError:
            self.identity = self.updated = self.group = None
            self.size = 0
            return None
        if self.updated is None or not 0 <= now - self.updated <= self.max_age:
            return None
        return self.group
