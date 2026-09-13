"""Summarize QEMU register observations at AZ mount-query return sites.

Counts are emitted trace blocks, not exhaustive call counts with TB chaining.
No firmware data or pointed-to memory is copied to the report.
"""
import argparse
import collections
import json
import re
from pathlib import Path

p = argparse.ArgumentParser()
p.add_argument('trace', type=Path)
p.add_argument('--output', type=Path, required=True)
a = p.parse_args()
sites = {0x2070758: collections.Counter(), 0x754aa8: collections.Counter()}
entries = collections.Counter()
with a.trace.open() as f:
    for line in f:
        match = re.search(r' PC=([0-9a-fA-F]+) X00=([0-9a-fA-F]+)', line)
        if not match:
            continue
        pc, x0 = (int(v, 16) for v in match.groups())
        if pc in sites:
            w0 = x0 & 0xffffffff
            sites[pc][w0 if w0 < 0x80000000 else w0 - 0x100000000] += 1
        if pc in (0xa6d308, 0xa6c808, 0xa318a0):
            entries[hex(pc)] += 1
report = {'mount_query_return_values': {hex(pc): dict(c) for pc, c in sites.items()},
          'load_entry_trace_blocks': dict(entries),
          'limitation': 'Trace observations only; no exhaustive call counts or key-to-result association.'}
a.output.write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report, indent=2))
