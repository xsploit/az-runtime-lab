#!/usr/bin/env python3
"""Group TI dis6x C674x instruction listing by execute-packet || markers.

The output contains instruction mnemonics/operands and sites, never opcode bytes.
It does not decode latency, delayed writes, branch behavior or SPLOOP scheduling.
"""
import argparse
import json
import re
from pathlib import Path

LINE = re.compile(r"^([0-9a-fA-F]{8})\s+[0-9a-fA-F]{4,8}\s+(\|\|\s+)?(\[[^]]+\]\s+)?(\.?[A-Za-z][A-Za-z0-9.]*)\s*(.*)$")


def packets(lines):
    lines = list(lines)
    headers = {}
    for line in lines:
        match = LINE.match(line)
        if match and match.group(4) == ".fphead":
            raw = line.split()[1]
            headers[int(match.group(1), 16) & ~31] = bool(int(raw, 16) & (1 << 20))
    result = []
    current = None
    for line in lines:
        m = LINE.match(line)
        if not m:
            continue
        address, parallel, predicate, mnemonic, operands = m.groups()
        if mnemonic == ".fphead":
            continue  # fetch-packet header word, not an execute instruction
        if parallel and current is not None:
            packet = current
        else:
            packet = {"packet_start": "0x" + address, "instructions": []}
            result.append(packet)
            current = packet
        packet["instructions"].append({"site": "0x" + address,
                                        "parallel_with_previous": bool(parallel),
                                        "predicate": predicate.strip() if predicate else None,
                                        "mnemonic": mnemonic,
                                        "operands": operands.strip(),
                                        "protected_load": mnemonic.startswith("LD") and headers.get(int(address,16) & ~31, False)})
    return result


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--listing", type=Path, required=True)
    ap.add_argument("--start", type=lambda s: int(s, 0), required=True)
    ap.add_argument("--end", type=lambda s: int(s, 0), required=True)
    ap.add_argument("--json", action="store_true")
    args = ap.parse_args()
    if args.end < args.start:
        ap.error("--end must be at least --start")
    # Select after grouping: starting at a parallel instruction must retain
    # its earlier packet peers, including those across a fetch header.
    grouped = [p for p in packets(args.listing.read_text().splitlines())
               if any(args.start <= int(i['site'], 16) <= args.end
                      for i in p['instructions'])]
    if args.json:
        print(json.dumps(grouped, indent=2))
    else:
        for packet in grouped:
            print(packet["packet_start"])
            for inst in packet["instructions"]:
                cond = (inst["predicate"] + " ") if inst["predicate"] else ""
                print(f'  {inst["site"]} {cond}{inst["mnemonic"]} {inst["operands"]}')


if __name__ == "__main__":
    main()
