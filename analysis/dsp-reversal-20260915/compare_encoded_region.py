#!/usr/bin/env python3
"""Compare complete TI dis6x encoded regions without printing payload bytes."""
import argparse
import re
from pathlib import Path

LINE = re.compile(r'^([0-9a-fA-F]{8})\s+([0-9a-fA-F]{4}|[0-9a-fA-F]{8})\s+')


def region(path, base, size):
    result = {}
    for line in path.read_text().splitlines():
        match = LINE.match(line)
        if not match:
            continue
        address = int(match[1],16)
        width = len(match[2])//2
        if address < base+size and address+width > base:
            if address < base or address+width > base+size:
                raise ValueError('region boundary splits encoded record')
            value = int(match[2],16).to_bytes(width,'little')
            for index,byte in enumerate(value):
                offset=address-base+index
                if offset in result:
                    raise ValueError('overlapping encoded records')
                result[offset]=byte
    if set(result)!=set(range(size)):
        raise ValueError('region has missing bytes')
    return bytes(result[i] for i in range(size))


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('left',type=Path);p.add_argument('right',type=Path)
    p.add_argument('--left-base',type=lambda x:int(x,0),required=True)
    p.add_argument('--right-base',type=lambda x:int(x,0),required=True)
    p.add_argument('--size',type=lambda x:int(x,0),required=True)
    a=p.parse_args()
    if a.size<=0:p.error('size must be positive')
    try:
        left=region(a.left,a.left_base,a.size)
        right=region(a.right,a.right_base,a.size)
    except (OSError,ValueError) as exc:p.error(str(exc))
    if left!=right:
        print('MISMATCH: encoded regions differ');return 1
    print(f'MATCH: all {a.size} bytes covered and identical');return 0


if __name__=='__main__':raise SystemExit(main())
