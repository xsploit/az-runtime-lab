#!/usr/bin/env python3
"""Report local C674x packet stall costs, not an executed control-flow trace.

BNOP counts apply regardless of predicate. Branch targets, callee duration,
SPLOOP scheduling, fetch stalls and operand latencies are not simulated.
"""
import argparse
import json
from pathlib import Path
from group_packets import packets


def stall_cost(packet):
    costs = [1]
    notes = []
    for instruction in packet['instructions']:
        opcode = instruction['mnemonic'].split('.')[0]
        operand = instruction['operands']
        if instruction.get('protected_load'):
            costs.append(5)
            notes.append('PROT header inserts four NOP cycles after load')
        if opcode == 'BNOP':
            try:
                count = int(operand.rsplit(',', 1)[1].strip(), 0)
            except (ValueError, IndexError):
                raise ValueError('unrecognized BNOP count')
            if not 0 <= count <= 5:
                raise ValueError('BNOP counts above5 need taken-path analysis')
            costs.append(1 + count)
            notes.append('branch may redirect; NOP count is unconditional')
        elif opcode == 'NOP':
            count = int(operand or '1', 0)
            if not 1 <= count <= 9:
                raise ValueError('unsupported NOP count')
            costs.append(count)
        elif opcode == 'CALLP':
            costs.append(6)
            notes.append('callee execution omitted; no fallthrough timing claim')
        elif opcode.startswith('SPLOOP') or opcode.startswith('SPKERNEL'):
            raise ValueError('software-pipelined loop requires separate scheduling')
        elif opcode in {'B', 'BDEC', 'BPOS'}:
            notes.append('branch may redirect after delay slots')
    return dict(packet_start=packet['packet_start'], local_issue_span=max(costs),
                notes=notes)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--listing', type=Path, required=True)
    parser.add_argument('--start', type=lambda x:int(x,0), required=True)
    parser.add_argument('--end', type=lambda x:int(x,0), required=True)
    args = parser.parse_args()
    if args.end < args.start:
        parser.error('end precedes start')
    selected = [p for p in packets(args.listing.read_text().splitlines())
                if any(args.start <= int(i['site'],16) <= args.end
                       for i in p['instructions'])]
    if not selected:
        parser.error('no instruction packets in selected range')
    try:
        result = [stall_cost(p) for p in selected]
    except ValueError as exc:
        parser.error(str(exc))
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
