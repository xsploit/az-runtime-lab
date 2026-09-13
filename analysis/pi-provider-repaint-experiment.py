"""Bounded, reversible AZ LocalPlayer timer/repaint comparison; private lab only.

Requires already moving deck 1. Discovers LocalPlayer timers through the JUCE
registry; session-specific source/cache addresses must be supplied explicitly.
Never writes the firmware file. SIGKILL/power loss cannot execute cleanup.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import signal
import statistics
import struct
import subprocess
import time
from fractions import Fraction

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('pid', type=int)
p.add_argument('--source', type=lambda s: int(s, 0), required=True)
p.add_argument('--cache', type=lambda s: int(s, 0), required=True)
p.add_argument('--out', type=Path, required=True)
a = p.parse_args()
a.out.mkdir(parents=True, exist_ok=True)
assert hashlib.sha256(Path(f'/proc/{a.pid}/exe').read_bytes()).hexdigest() == '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
statpath = Path(f'/proc/{a.pid}/stat')
def stat():
    return statpath.read_text().rsplit(')', 1)[1].split()
start_id = stat()[19]
mem = os.open(f'/proc/{a.pid}/mem', os.O_RDONLY)
def read(addr, fmt='<Q'):
    assert stat()[19] == start_id
    return struct.unpack(fmt, os.pread(mem, struct.calcsize(fmt), addr))[0]

registry = read(0x3bd7830)
lo, hi = read(registry + 0x1a0), read(registry + 0x1a8)
assert 0 < hi - lo < 16000 and (hi - lo) % 16 == 0
players = []
for entry in range(lo, hi, 16):
    obj = read(entry)
    if read(obj) == 0x2da1c28:
        assert read(obj + 0x10, '<I') == 33
        players.append(obj)
assert len(players) == 4
assert a.source in [read(o + 0xb0) for o in players]
assert read(a.source) == 0x25eb390
timer = read(0x3bd6708) - 0x28
assert read(timer) == 0x2e414e0
patches = [(0x212fb94, 0x7100041f, 0x7100001f),
           (0x212f344, 0x7100041f, 0x7100001f),
           (0x212f974, 0x11000673, 0x52800033),
           (0x212f9ac, 0x11000673, 0x52800033),
           (0x212fc1c, 0x1e632800, 0xd503201f),
           (0x212fc44, 0x52800022, 0x52800002),
           (0x212f358, 0x52800022, 0x52800002)]
assert all(read(addr, '<I') == old for addr, old, new in patches)
def change(label, interval, faster):
    assert stat()[19] == start_id
    lines = ['set pagination off', 'set confirm off', 'set auto-load off',
             'set print thread-events off', f'attach {a.pid}']
    for obj in players:
        assert read(obj) == 0x2da1c28 and read(obj + 16, '<I') in (16, 33)
        lines.append(f'set {{unsigned int}}{obj + 16:#x} = {interval}')
    for addr, old, new in patches:
        assert read(addr, '<I') in (old, new)
        lines.append(f'set {{unsigned int}}{addr:#x} = {(new if faster else old):#x}')
    lines += ['detach', 'quit']
    script = a.out / f'{label}.gdb'
    script.write_text('\n'.join(lines) + '\n')
    r = subprocess.run(['gdb', '-q', '-nx', '-batch', '-x', str(script)],
                       capture_output=True, text=True, timeout=10)
    (a.out / f'{label}.log').write_text(r.stdout + r.stderr)
    r.check_returncode()
    assert all(read(o + 16, '<I') == interval for o in players)
    assert all(read(addr, '<I') == (new if faster else old) for addr, old, new in patches)

def interrupt(sig, frame):
    raise InterruptedError(sig)
for sig in (signal.SIGINT, signal.SIGTERM):
    signal.signal(sig, interrupt)

def fields():
    return [read(timer + 0x78, '<d'), read(a.source + 0xe8, '<q'), read(a.cache + 0xf8, '<q')]

v = fields()[-1]
time.sleep(.3)
assert fields()[-1] > v, 'Deck 1 must be moving before the experiment'
results = []
try:
    for label, interval, faster in [('original', 33, False), ('provider_only', 16, False),
                                     ('combined', 16, True), ('restored', 33, False)]:
        change(label, interval, faster)
        time.sleep(.3)
        cpu0 = sum(map(int, stat()[11:13]))
        started = time.monotonic()
        records = []
        while time.monotonic() - started < 4:
            records.append([time.monotonic(), *fields()])
            time.sleep(.001)
        elapsed = records[-1][0] - records[0][0]
        summary = {}
        for col, name in enumerate(['repaint', 'source', 'cache'], 1):
            diffs = [b[col] - a[col] for a, b in zip(records, records[1:]) if b[col] != a[col]]
            summary[name] = {'hz': len(diffs) / elapsed,
                             'negative_steps': sum(d < 0 for d in diffs),
                             'median_step': statistics.median(diffs) if diffs else None}
        summary['cpu_percent_one_core_memory_sample'] = 100 * (sum(map(int, stat()[11:13])) - cpu0) / os.sysconf('SC_CLK_TCK') / (time.monotonic() - started)
        summary['cache_units_per_second'] = (records[-1][-1] - records[0][-1]) / elapsed
        (a.out / f'{label}.json').write_text(json.dumps(records))
        assert records[-1][-1] > records[0][-1], 'Track stopped; not a motion benchmark'
        capture = a.out / f'{label}.framemd5'
        subprocess.run(['ffmpeg', '-y', '-v', 'error', '-f', 'x11grab', '-framerate', '120',
                        '-video_size', '400x32', '-i', ':0+450,140', '-t', '4', '-f', 'framemd5', str(capture)],
                       check=True, timeout=10)
        tb = None
        frames = []
        for line in capture.read_text().splitlines():
            if line.startswith('#tb 0:'):
                tb = Fraction(line.split(':', 1)[1].strip())
            elif line and not line.startswith('#'):
                x = [s.strip() for s in line.split(',')]
                frames.append((int(x[2]), x[-1]))
        assert tb is not None and len(frames) > 300
        duration = float((frames[-1][0] - frames[0][0]) * tb)
        assert 3.8 < duration < 4.2
        summary['distinct_pixel_hz'] = sum(a[1] != b[1] for a, b in zip(frames, frames[1:])) / duration
        summary['capture_frames'] = len(frames)
        results.append({'phase': label, 'interval_ms': interval, 'fast_repaint': faster, **summary})
        print(json.dumps(results[-1]), flush=True)
finally:
    change('final_restore', 33, False)
    (a.out / 'results.json').write_text(json.dumps({'pid': a.pid, 'player_objects': [hex(o) for o in players],
        'source': hex(a.source), 'cache': hex(a.cache), 'phases': results, 'restored': True}, indent=2))
    os.close(mem)
