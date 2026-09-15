#!/usr/bin/env python3
"""Inventory direct C6000 branch operands from a TI dis6x listing.

This is a syntactic index, not a recovered function/call graph. Input may include
non-code sections. Parallel packets, delay slots, indirect targets and returns
must be resolved before treating edges as execution paths. No bytes are emitted.
"""
import argparse
from collections import Counter
import json
from pathlib import Path
import re

def inventory(text):
    edges=[]
    address=re.compile(r'^([0-9a-fA-F]{8})\s')
    branch=re.compile(r'\b(CALLP|CALL|BNOP|B)\.[A-Z0-9]+\s+(0x[0-9a-fA-F]+)(?:,|\s|$)')
    for line in text.splitlines():
        a=address.match(line); b=branch.search(line)
        if a and b:
            predicate=re.search(r'\[\s*(!?[AB]\d+)\s*\]',line)
            edges.append(dict(site=f'0x{int(a[1],16):08x}',operation=b[1],
                              target=f'0x{int(b[2],16):08x}',
                              predicate=predicate[1] if predicate else None))
    return {'scope':'Direct textual branch operands only; not function boundaries or proof of reachability',
            'edges':edges,'target_reference_counts':dict(Counter(e['target'] for e in edges))}

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('listing',type=Path);p.add_argument('--output',type=Path)
    a=p.parse_args();result=inventory(a.listing.read_text());text=json.dumps(result,indent=2)+'\n'
    if a.output:a.output.write_text(text)
    else:print(text,end='')

if __name__=='__main__':main()
