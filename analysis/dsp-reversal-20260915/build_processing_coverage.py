#!/usr/bin/env python3
"""Build a bounded IRQ8 syntactic coverage ledger from an explicit TI dis6x listing.

Windows count decoded opcode instructions, not file lines or function bodies.
No firmware bytes/opcode encodings are included in the JSON output.
"""
import argparse
import collections
import json
import re
from pathlib import Path

from group_packets import LINE

WRAPPER_CALL_START = 0x1181AE78
WRAPPER_CALL_END = 0x1181AFD4
KNOWN = {
    '0x1181d5ac': ('transport', 'SPI receive/checksum and staged transfer path; SPI-AND-INTERRUPTS.md', 'high'),
    '0x1180e644': ('control_state', 'staged control reader writes B14 indices 11-14; BUFFER-MAP.md', 'high'),
    '0x1181a310': ('numeric_processing', 'McASP RX 704-byte ping-pong reader with SHR/INTSP; BUFFER-CONSUMERS.md', 'high'),
}
FLOAT_OPS = {'INTSP','INTSPU','SPINT','SPINTU','MPYSP','ADDSP','SUBSP','MPYDP','ADDDP','SUBDP',
             'CMPGTSP','CMPLTSP','CMPGTDP','CMPLTDP','RCPSP','RCPDP','RSQRSP','RSQRDP','MPYSPDP'}
STATE_LIKE = {'0x11819420','0x11819880','0x11818f88','0x1180e8d0','0x1181b700',
              '0x1181b784','0x1181b7c8','0x1181b80c','0x11818558'}
REGISTER = re.compile(r'^(?:A\d+|B\d+|IRP|NRP)(?:,|\s|$)')


def decode(lines):
    instructions = []
    for line in lines:
        m = LINE.match(line)
        if not m:
            continue  # labels, section headings, blank lines
        address, parallel, predicate, mnemonic, operands = m.groups()
        if mnemonic == '.fphead':
            continue  # fetch header, not an opcode instruction
        instructions.append({'address': int(address, 16), 'site': '0x' + address,
                             'mnemonic': mnemonic, 'operands': operands.strip(),
                             'predicate': predicate.strip() if predicate else None,
                             'parallel_with_previous': bool(parallel)})
    return instructions


def direct_target(inst):
    if not inst['mnemonic'].startswith(('CALLP.', 'CALL.')):
        return None
    m = re.match(r'^(0x[0-9a-fA-F]+)(?:,|\s|$)', inst['operands'])
    return m.group(1).lower() if m else None


def indirect_branch(inst):
    mnemonic = inst['mnemonic']
    if not mnemonic.startswith(('B.', 'BNOP.', 'CALLP.', 'CALL.')):
        return None
    m = REGISTER.match(inst['operands'])
    if not m:
        return None
    operand = m.group(0).rstrip(', ')
    return {'site': inst['site'], 'operation': mnemonic.split('.')[0],
            'target_register': operand, 'possible_return': operand in {'A3','B3','IRP','NRP'}}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--listing', required=True, type=Path, help='Explicit TI dis6x listing to inspect')
    ap.add_argument('--output', required=True, type=Path, help='Private JSON ledger output path')
    ap.add_argument('--window-instructions', type=int, default=120)
    args = ap.parse_args()
    if args.window_instructions <= 0:
        ap.error('--window-instructions must be positive')
    instructions = decode(args.listing.read_text().splitlines())
    by_address = {inst['address']: i for i, inst in enumerate(instructions)}
    seq = []
    for inst in instructions:
        if WRAPPER_CALL_START <= inst['address'] <= WRAPPER_CALL_END:
            target = direct_target(inst)
            if target:
                seq.append({'site': inst['site'], 'operation': inst['mnemonic'].split('.')[0],
                            'target': target, 'predicate': inst['predicate'],
                            'parallel_with_previous': inst['parallel_with_previous']})
    if len(seq) != 53:
        raise SystemExit(f'Expected 53 direct IRQ8 calls from listing, found {len(seq)}')
    ordered = list(dict.fromkeys(edge['target'] for edge in seq))
    if len(ordered) != 45:
        raise SystemExit(f'Expected 45 distinct IRQ8 targets from listing, found {len(ordered)}')
    routines = []
    for target in ordered:
        address = int(target, 16)
        if address not in by_address:
            raise SystemExit(f'Target {target} absent from listing')
        window = instructions[by_address[address]:by_address[address]+args.window_instructions]
        if len(window) != args.window_instructions:
            raise SystemExit(f'Target {target} has only {len(window)} decoded instructions left')
        ops = collections.Counter(inst['mnemonic'].split('.')[0] for inst in window)
        numeric = {op: ops[op] for op in sorted(FLOAT_OPS) if ops[op]}
        calls = list(dict.fromkeys(t for inst in window if (t := direct_target(inst))))
        register_branches = [branch for inst in window if (branch := indirect_branch(inst))]
        if target in KNOWN:
            category, semantics, confidence = KNOWN[target]
        elif target in STATE_LIKE:
            category, semantics, confidence = ('control_state', 'state-like candidate from bounded instruction sample; exact state ownership unresolved', 'low')
        elif numeric:
            category, semantics, confidence = ('numeric_processing', 'floating-point instructions in bounded sample; effect identity unresolved', 'low')
        elif calls:
            category, semantics, confidence = ('wrapper', 'direct subcalls in bounded sample; routine boundary unresolved', 'low')
        else:
            category, semantics, confidence = ('unknown', 'no decisive role in bounded sample', 'low')
        routines.append({'address': target,
                         'irq8_call_sites': [edge['site'] for edge in seq if edge['target'] == target],
                         'category': category, 'confidence': confidence,
                         'semantic_evidence': semantics,
                         'listing_review_window': {'start': target,
                                                   'decoded_instruction_count': len(window),
                                                   'end_instruction_site': window[-1]['site'],
                                                   'is_function_extent': False},
                         'numeric_opcode_counts': numeric,
                         'direct_calls_observed_in_window': calls,
                         'register_target_branches_observed_in_window': register_branches,
                         'unresolved': ['Window may cross function boundaries and omits descendants outside it.',
                                        'Register-target branch purpose, runtime branch frequency, memory ownership and acoustic identity unresolved.']})
    out = {'scope': 'Static IRQ8 direct call listing plus bounded decoded-instruction target samples; not complete functions, transitive graph, or runtime trace.',
           'source_listing': str(args.listing),
           'handler': '0x1181ada4', 'sequence': seq,
           'unique_target_count': len(ordered), 'direct_call_site_count': len(seq),
           'sample_instruction_count_per_target': args.window_instructions,
           'routines': routines,
           'coverage_gaps': ['Indirect/register-target branches seen in samples are indexed but not resolved globally.',
                             'Packet issue, branch delay slots and loop-buffer scheduling require separate control-flow analysis.',
                             'A sample window is not a function extent; opcode counts or nested calls can cross a boundary.',
                             'Acoustic effect identities and full numeric formulas remain unresolved.']}
    args.output.write_text(json.dumps(out, indent=2) + '\n')
    print(len(seq), len(ordered), collections.Counter(r['category'] for r in routines))


if __name__ == '__main__':
    main()
