#!/usr/bin/env python3
"""Verify the AZ 1.30 LED cache writer/readout using original ARM64 instructions.

Requires a user-supplied EP147, static ARM64 C compiler and qemu-aarch64-static.
Writes verification results only; extracted code and executable are temporary.
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
    pages = []
    for address in (0x21f0000, 0x21ed000):
        for i in range(count):
            kind, flags, offset, va, _, length, _, _ = struct.unpack_from('<IIQQQQQQ', data, ph+i*size)
            if kind == 1 and flags & 1 and va <= address and address+4096 <= va+length:
                pages.append(data[offset+address-va:offset+address-va+4096])
                break
        else:
            parser.error('Executable code page was not found.')
    with tempfile.TemporaryDirectory(prefix='az-led-probe-') as temp:
        temp = Path(temp)
        paths = [temp/'writer.bin', temp/'reader.bin']
        for path, code in zip(paths, pages):
            path.write_bytes(code)
        executable = temp/'probe'
        subprocess.run([args.cc, '-static', '-O2', str(Path(__file__).with_name('probe-led-cache.c')),
                        '-o', str(executable)], check=True, timeout=60)
        run = subprocess.run([args.qemu, str(executable), *map(str, paths)],
                             check=True, capture_output=True, text=True, timeout=15)
    if run.stdout.strip() != '32':
        raise RuntimeError('Unexpected probe result')
    report = {'firmware_sha256': digest, 'cases': 32, 'mismatches': 0,
              'method': 'Original writer and getter under QEMU, constructed HuiLed object',
              'scope': 'States 0..3, changed/unchanged ancillary data, repeated updates; no optional color adapter',
              'limitation': 'No refresh scheduler, full player or physical LEDs tested'}
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
