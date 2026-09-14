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


def prepare_native_timing_directory(legacy_directory):
    """Keep the native Pi's transient refresh clock off persistent storage.

    Returns (TemporaryDirectory or None, Path). Keep the temporary owner alive
    until the player exits, and bind its directory (not a single file) into the
    player's timing path so atomic replacement remains visible. Explicit
    LAB_TIMING_TMPFS=0 retains the old path for controlled comparisons.
    """
    import subprocess
    setting = os.environ.get('LAB_TIMING_TMPFS', '1')
    if setting not in ('0', '1'):
        raise ValueError('LAB_TIMING_TMPFS must be 0 or 1')
    if setting == '0':
        directory = Path(legacy_directory)
        directory.mkdir(parents=True, exist_ok=True)
        return None, directory
    candidates = []
    runtime = Path(os.environ.get('XDG_RUNTIME_DIR', f'/run/user/{os.getuid()}'))
    if runtime.is_dir() and runtime.stat().st_uid == os.getuid():
        candidates.append(runtime)
    candidates.extend([Path('/dev/shm'), Path('/tmp')])
    for parent in candidates:
        if not parent.is_dir():
            continue
        result = subprocess.run(['findmnt', '-n', '-o', 'FSTYPE', '-T', str(parent)],
                                capture_output=True, text=True, timeout=5)
        if result.returncode or result.stdout.strip() != 'tmpfs':
            continue
        try:
            owner = tempfile.TemporaryDirectory(prefix='az-display-clock-', dir=parent)
        except PermissionError:
            continue
        directory = Path(owner.name)
        # The player may read before the first recurring publisher iteration.
        import time
        publish_timing(directory / 'vsync_time', time.monotonic_ns())
        return owner, directory
    raise RuntimeError('No writable tmpfs for native display timing; '
                       'provide a valid XDG_RUNTIME_DIR or use LAB_TIMING_TMPFS=0 for comparison')
