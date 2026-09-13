#!/usr/bin/env python3
"""Verify the AZ 1.30 default slider adapter using original ARM64 instructions.

Requires a user-supplied EP147, static ARM64 C compiler and qemu-aarch64-static.
Writes numeric results only; extracted code and executable are temporary.
"""
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import subprocess
import tempfile

EXPECTED_SHA = '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('firmware', type=Path)
    parser.add_argument('--cc', default='aarch64-linux-gnu-gcc')
    parser.add_argument('--qemu', default='qemu-aarch64-static')
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    data = args.firmware.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    if digest != EXPECTED_SHA:
        parser.error('Firmware hash differs from the analyzed AZ 1.30 EP147; refusing fixed-address execution.')
    ph = struct.unpack_from('<Q', data, 32)[0]
    size, count = struct.unpack_from('<HH', data, 54)
    code = None
    for i in range(count):
        kind, flags, offset, va, _, length, _, _ = struct.unpack_from('<IIQQQQQQ', data, ph+i*size)
        if kind == 1 and va <= 0x21ee000 and 0x21ef000 <= va+length:
            code = data[offset+0x21ee000-va:offset+0x21ef000-va]
            break
    if code is None:
        parser.error('Executable code page was not found.')
    with tempfile.TemporaryDirectory(prefix='az-slider-probe-') as temp:
        temp = Path(temp)
        page = temp/'code.bin'
        executable = temp/'probe'
        page.write_bytes(code)
        subprocess.run([args.cc, '-static', '-O2', str(Path(__file__).with_name('probe-slider-adapter.c')),
                        '-o', str(executable)], check=True, timeout=60)
        run = subprocess.run([args.qemu, str(executable), str(page)],
                             check=True, capture_output=True, text=True, timeout=15)
    rows = [line.split(',') for line in run.stdout.splitlines()]
    if len(rows) != 1025 or [int(row[0]) for row in rows] != list(range(1025)):
        raise RuntimeError('Incomplete or unexpected sample sequence')
    failures = []
    for raw, value in rows:
        expected = struct.unpack('<f', struct.pack('<f', min(int(raw)/1023, 1.0)))[0]
        observed = float(value)
        if not math.isfinite(observed) or abs(observed-expected) > 5e-10:
            failures.append(int(raw))
    report = {'firmware_sha256': digest, 'samples': len(rows), 'mismatches': failures,
              'method': 'Original code under QEMU; constructed default adapter, no full player',
              'expected': 'float32(min(raw/1023,1.0))',
              'selected': {r:v for r,v in rows if int(r) in (0,511,512,1023,1024)}}
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2)+'\n')
    args.output.with_suffix('.csv').write_text(run.stdout)
    print(json.dumps(report, indent=2))
    if failures:
        raise SystemExit(1)


if __name__ == '__main__':
    main()
