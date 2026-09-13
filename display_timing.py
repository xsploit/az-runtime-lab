"""Publish the lab's synthetic timing sample without transient empty reads.

AZ divides this integer nanosecond sample by 1,000,000 to obtain milliseconds.
Use CLOCK_MONOTONIC (time.monotonic_ns), matching its scheduling clock.

This does not measure DRM/compositor vblank. The sandbox must bind the parent
folder, not a single inode, so each native open observes the replaced file.
"""
import os
import tempfile
from pathlib import Path


def publish_timing(path, monotonic_ns):
    path = Path(path)
    staging = None
    try:
        with tempfile.NamedTemporaryFile(mode='w', dir=path.parent,
                                         prefix='.vsync-', delete=False) as out:
            staging = Path(out.name)
            out.write(f'{int(monotonic_ns)}\n')
        os.replace(staging, path)
    finally:
        if staging is not None:
            staging.unlink(missing_ok=True)


class SyntheticVsync:
    """Phase-locked synthetic clock; not physical vblank or presentation feedback.

    Delayed callers skip elapsed ticks instead of shifting every future tick.
    A published tick never describes a future instant. Keep frequency explicit
    when testing: the AZ v1.30 timer requests59.24Hz, existing lab loops use60.
    """
    def __init__(self, hz, epoch_ns):
        from fractions import Fraction
        rate = Fraction(str(hz))
        if not 1 <= rate <= 240:
            raise ValueError('Synthetic rate must be between1 and240Hz')
        self.numerator = rate.numerator
        self.denominator_ns = 1_000_000_000 * rate.denominator
        self.epoch_ns = int(epoch_ns)

    def sample(self, now_ns):
        elapsed = int(now_ns) - self.epoch_ns
        if elapsed < 0:
            raise ValueError('Clock moved before epoch')
        tick = elapsed * self.numerator // self.denominator_ns
        stamp = self.epoch_ns + tick * self.denominator_ns // self.numerator
        # Ceiling keeps the next integer-ns deadline beyond now, including when
        # ideal boundaries fall between two integer nanoseconds.
        deadline = self.epoch_ns + ((tick + 1) * self.denominator_ns + self.numerator - 1) // self.numerator
        return stamp, deadline
