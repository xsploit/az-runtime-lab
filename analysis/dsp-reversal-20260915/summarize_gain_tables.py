#!/usr/bin/env python3
"""Summarize known AZ DSP gain banks in a caller-supplied AIS section.

Read-only. Does not extract or print complete tables. This checks static data,
not firmware identity, CRC, runtime selection, position bounds, or audio parity.
"""
import argparse
import json
import math
import struct
from pathlib import Path


def summarize(data, section_address):
    result = []
    for bank in range(3):
        address = 0x80004000 + 4096 * bank
        offset = address - section_address
        if offset < 0 or offset + 4096 > len(data):
            raise ValueError(f"section does not contain complete bank {bank}")
        values = struct.unpack_from('<1024f', data, offset)
        finite = all(math.isfinite(v) for v in values)
        bounded = finite and all(0 <= v <= 1 for v in values)
        monotonic = finite and all(a <= b for a, b in zip(values, values[1:]))
        strict = finite and all(a < b for a, b in zip(values, values[1:]))
        plateau = next((i for i, v in enumerate(values)
                        if v == 1 and all(x == 1 for x in values[i:])), None)
        result.append(dict(bank=bank, address=hex(address), count=len(values),
                           finite=finite, bounded_0_1=bounded,
                           nondecreasing=monotonic, strictly_increasing=strict,
                           distinct_levels=len(set(values)) if finite else None,
                           endpoints=[values[0], values[-1]] if finite else None,
                           unity_plateau_start=plateau,
                           valid_gain_data=bounded and monotonic and
                           values[0] == 0 and values[-1] == 1))
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('section', type=Path)
    parser.add_argument('--section-address', type=lambda v: int(v, 0), required=True)
    args = parser.parse_args()
    try:
        result = summarize(args.section.read_bytes(), args.section_address)
    except (OSError, ValueError) as exc:
        parser.error(str(exc))
    print(json.dumps(result, indent=2, allow_nan=False))
    return 0 if all(row['valid_gain_data'] for row in result) else 1


if __name__ == '__main__':
    raise SystemExit(main())
