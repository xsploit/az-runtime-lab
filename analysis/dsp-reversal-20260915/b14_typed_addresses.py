#!/usr/bin/env python3
"""Calculate TI C674x scaled B14 offsets from actual memory-access width."""
import argparse
import json
import re
from pathlib import Path

BASE = 0x11803000
WIDTH = {"LDB": 1, "LDBU": 1, "STB": 1,
         "LDH": 2, "LDHU": 2, "STH": 2,
         "LDW": 4, "STW": 4,
         "LDDW": 8, "LDNDW": 8, "STDW": 8, "STNDW": 8}
LINE = re.compile(r"^([0-9a-fA-F]{8})\s+[0-9a-fA-F]{4,8}\s+.*?\b([A-Z]+)\.[A-Z0-9]+\s+.*?\*\+B14\[(\d+)\]")
AUDIT = re.compile(r"\b(LDBU?|STB|LDHU?|STH|LDW|STW|LDDW|LDNDW|STDW|STNDW) B14\[(\d+)\] = (0x[0-9a-fA-F]+)")


def address(mnemonic, index):
    return BASE + WIDTH[mnemonic] * int(index)


def recursive_strings(value):
    if isinstance(value, str):
        yield value
    elif isinstance(value, list):
        for item in value:
            yield from recursive_strings(item)
    elif isinstance(value, dict):
        for item in value.values():
            yield from recursive_strings(item)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--listing", type=Path, required=True)
    p.add_argument("--sites", nargs="*", type=lambda s: int(s, 0))
    p.add_argument("--audit", type=Path)
    args = p.parse_args()
    rows = []
    sites = set(args.sites) if args.sites else None
    for line in args.listing.read_text().splitlines():
        m = LINE.match(line)
        if m and m.group(2) in WIDTH and (sites is None or int(m.group(1), 16) in sites):
            site, mnemonic, index = m.groups()
            rows.append({"site": "0x" + site, "access": mnemonic,
                         "index": int(index), "width": WIDTH[mnemonic],
                         "absolute": f"0x{address(mnemonic, index):08x}"})
    if sites is not None and len(rows) != len(sites):
        raise SystemExit(f"Found {len(rows)} typed B14 accesses for {len(sites)} requested sites")
    print(json.dumps(rows, indent=2))
    if args.audit:
        errors = []
        checked = 0
        for string in recursive_strings(json.loads(args.audit.read_text())):
            for m in AUDIT.finditer(string):
                checked += 1
                mnemonic, index, claimed = m.groups()
                expected = address(mnemonic, index)
                if int(claimed, 16) != expected:
                    errors.append({"claim": m.group(0), "expected": f"0x{expected:08x}"})
        if errors:
            raise SystemExit("B14 audit failures: " + json.dumps(errors))
        if not checked:
            raise SystemExit("No supported typed address claims found; nothing audited")
        print(f"B14 ledger address audit: {checked} matching claims passed; unmatched text not audited")


if __name__ == "__main__":
    main()
