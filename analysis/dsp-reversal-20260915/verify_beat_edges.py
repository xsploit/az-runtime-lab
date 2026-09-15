#!/usr/bin/env python3
"""Check recorded direct calls/stubs, not predicates or complete DSP semantics."""
import argparse
import json
from pathlib import Path
import re


def verify(listing, cases):
    rows = {}
    for line in listing.splitlines():
        match = re.match(r'^([0-9a-fA-F]{8})\s', line)
        if match:
            rows[int(match[1], 16)] = line
    entries = [cases['case0']] + cases['cases']
    if not entries:
        raise ValueError('No cases supplied')
    stubs = 0
    for case in entries:
        site = int(case.get('call_site', case.get('call')), 16)
        target = int(case['direct_target'], 16)
        match = re.search(r'\bCALLP\.S2\s+(0x[0-9a-fA-F]+),B3', rows.get(site, ''))
        if not match or int(match[1], 16) != target:
            raise ValueError(f'Call mismatch at {site:#x}')
        if 'stub_destination' not in case:
            continue
        low = re.search(r'\bMVK\.S2\s+(0x[0-9a-fA-F]+),B31', rows.get(target, ''))
        high = re.search(r'\bMVKH\.S2\s+(0x[0-9a-fA-F]+),B31', rows.get(target + 4, ''))
        branch = re.search(r'\bB\.S2\s+B31\s*$', rows.get(target + 8, ''))
        delay = re.search(r'\bNOP\s+5\s*$', rows.get(target + 12, ''))
        if not all((low, high, branch, delay)):
            raise ValueError(f'Unrecognized simple stub at {target:#x}')
        destination = (int(high[1], 16) & 0xffff0000) | (int(low[1], 16) & 0xffff)
        if destination != int(case['stub_destination'], 16):
            raise ValueError(f'Stub destination mismatch at {target:#x}')
        stubs += 1
    return len(entries), stubs


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--listing', type=Path, required=True)
    parser.add_argument('--cases', type=Path, default=Path(__file__).with_name('beat-dispatch-cases.json'))
    args = parser.parse_args()
    calls, stubs = verify(args.listing.read_text(), json.loads(args.cases.read_text()))
    print(f'PASS: {calls} direct calls; {stubs} case-associated stub destinations. Predicates and numeric behavior not checked.')
