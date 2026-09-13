#!/usr/bin/env python3
"""Verify the AZ 1.30 tempo converter using original ARM64 instructions.

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
        if kind == 1 and flags & 1 and va <= 0x216b000 and 0x216d000 <= va+length:
            code = data[offset+0x216b000-va:offset+0x216d000-va]
            break
    if code is None:
        parser.error('Executable code page was not found.')
    with tempfile.TemporaryDirectory(prefix='az-tempo-probe-') as temp:
        temp = Path(temp)
        page = temp/'code.bin'
        executable = temp/'probe'
        page.write_bytes(code)
        subprocess.run([args.cc, '-static', '-O2', str(Path(__file__).with_name('probe-tempo-converter.c')),
                        '-o', str(executable)], check=True, timeout=60)
        run = subprocess.run([args.qemu, str(executable), str(page)],
                             check=True, capture_output=True, text=True, timeout=15)
    rows = [line.split(',') for line in run.stdout.splitlines()]
    fresh=[r for r in rows if r[0]=='fresh']
    if len(fresh)!=1024:raise RuntimeError('Incomplete sweep')
    failures=[]
    for _,raw,value in fresh:
        a=int(raw)*64;b=512*64
        expected=max(-1,min(1,(a-b)/(b-768) if a<=b else (a-b)/(64767-b)))
        if not math.isfinite(float(value)) or abs(float(value)-expected)>1e-7:failures.append(raw)
    report={'firmware_sha256':digest,'samples':len(fresh),'mismatches':failures,'sequence':rows[1024:], 'selected':[r for r in fresh if int(r[1]) in (0,12,256,511,512,513,768,1012,1023)],'scope':'Original unpatched converter, initialized bounds -1/+1, threshold96/adjust48, reference512. No invalid event/domain or full-player tempo test.'}
    args.output.write_text(json.dumps(report,indent=2)+'\n')
    args.output.with_suffix('.csv').write_text(run.stdout)
    print(json.dumps(report,indent=2))
    if failures:raise SystemExit(1)


if __name__ == '__main__':
    main()
