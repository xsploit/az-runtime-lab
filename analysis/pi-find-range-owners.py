"""Find source-range wrapper references to one verified AZ scheduler.

Read-only present-page scan. Candidates require a valid registered range ID and
the adjacent RangeWithSourceInfo vtable observed in constructor disassembly.
Only addresses, IDs and adjacent type hints are saved, never audio contents.
"""
import argparse
import hashlib
import json
import os
import struct
import time
from pathlib import Path

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('pid', type=int)
p.add_argument('output', type=Path)
p.add_argument('--scheduler', type=lambda s: int(s, 0), required=True)
a = p.parse_args()
proc = Path(f'/proc/{a.pid}')
identity = (proc/'stat').read_text().rsplit(')', 1)[1].split()[19]
assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest() == '137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
fd = os.open(proc/'mem', os.O_RDONLY)
pg = os.open(proc/'pagemap', os.O_RDONLY)
page = os.sysconf('SC_PAGE_SIZE')
started = time.monotonic()

def read(addr, n):
    assert (proc/'stat').read_text().rsplit(')', 1)[1].split()[19] == identity
    b = os.pread(fd, n, addr)
    assert len(b) == n
    return b

def qword(addr):
    return struct.unpack('<Q', read(addr, 8))[0]

try:
    assert qword(a.scheduler) == 0x25f9c70
    count_bytes = read(a.scheduler+0x350, 4)
    count = struct.unpack('<I', count_bytes)[0]
    assert 0 < count <= 96
    needle = struct.pack('<Q', a.scheduler)
    hits = []
    scanned = 0
    for line in (proc/'maps').read_text().splitlines():
        fields = line.split()
        if len(fields) != 5 or fields[1] != 'rw-p' or fields[4] != '0':
            continue
        lo, hi = (int(s, 16) for s in fields[0].split('-'))
        assert hi-lo < 2**32
        for chunk in range(lo, hi, 1024*1024):
            n = (min(chunk+1024*1024, hi)-chunk)//page
            status = os.pread(pg, n*8, chunk//page*8)
            assert len(status) == n*8
            for i, (word,) in enumerate(struct.iter_unpack('<Q', status)):
                if not word >> 63:
                    continue
                base = chunk+i*page
                data = read(base, page)
                scanned += page
                offset = 0
                while True:
                    offset = data.find(needle, offset)
                    if offset < 0:
                        break
                    address = base+offset
                    offset += 8
                    if address % 8 or address+24 > hi:
                        continue
                    record = read(address, 24)
                    slot = struct.unpack_from('<i', record, 8)[0]
                    if not (0 <= slot < count and struct.unpack_from('<Q', record, 16)[0] == 0x25eb308):
                        continue
                    assert record == read(address, 24)
                    # Exact enclosing offset from the reviewed CuePropertyWithBufferLock constructor.
                    cue = address-0x118 >= lo and qword(address-0x118) == 0x288f0d0
                    hits.append(dict(scheduler_reference=hex(address), range_id=slot,
                                     cue_property_at_minus_0x118=cue))
    assert count_bytes == read(a.scheduler+0x350, 4)
    unique = sorted({r['range_id'] for r in hits})
    result = dict(pid=a.pid, start_id=identity, scheduler=hex(a.scheduler),
                  registered_ranges=count, matches=hits, unique_ids=unique,
                  missing_ids=sorted(set(range(count))-set(unique)),
                  scanned_present_mib=scanned/1024**2,
                  elapsed_seconds=time.monotonic()-started, scope=__doc__)
    a.output.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k not in ('matches', 'unique_ids')}))
finally:
    os.close(fd)
    os.close(pg)
