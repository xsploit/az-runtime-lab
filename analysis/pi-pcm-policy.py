"""Read AZ scheduler policy/container counts without changing playback.

Pinned to the verified timing-patched image. Initial discovery scans only present
anonymous pages; subsequent --scheduler reads avoid scanning. No audio is saved.
Locked-range count is registered objects, not a count of currently pinned pages.
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
p.add_argument('--pool', type=lambda s: int(s, 0), required=True)
p.add_argument('--scheduler', type=lambda s: int(s, 0))
p.add_argument('--ranges', action='store_true', help='Read registered range metadata; no audio payload')
a = p.parse_args()
proc = Path(f'/proc/{a.pid}')
identity = (proc/'stat').read_text().rsplit(')', 1)[1].split()[19]
assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest() == '137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
started = time.monotonic()
fd = os.open(proc/'mem', os.O_RDONLY)
pg = os.open(proc/'pagemap', os.O_RDONLY)
page = os.sysconf('SC_PAGE_SIZE')

def read(addr, n):
    assert (proc/'stat').read_text().rsplit(')', 1)[1].split()[19] == identity
    b = os.pread(fd, n, addr)
    assert len(b) == n
    return b

def u64(addr):
    return struct.unpack('<Q', read(addr, 8))[0]

try:
    assert u64(a.pool) == 0x25f9c00
    hits = []
    scanned = 0
    if a.scheduler:
        hits = [a.scheduler]
    else:
        needle = struct.pack('<Q', 0x25f9c70)
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
                        candidate = base+offset
                        if candidate % 8 == 0 and candidate+0x380 <= hi:
                            if u64(candidate+0x308) == a.pool:
                                hits.append(candidate)
                        offset += 8
    assert len(hits) == 1, hits
    scheduler = hits[0]
    assert u64(scheduler) == 0x25f9c70
    assert u64(scheduler+0x308) == a.pool
    assert u64(scheduler+0x330) == a.pool
    for attempt in range(100):
        data = read(scheduler+0x2d8, 0xa0)
        if data == read(scheduler+0x2d8, 0xa0):
            break
    else:
        raise RuntimeError('Scheduler metadata remained busy')
    def uint(offset):
        return struct.unpack_from('<I', data, offset-0x2d8)[0]
    policy = struct.unpack_from('<6I', data)
    assert policy[:2] == (9, 96)
    count, capacity, maximum = uint(0x350), uint(0x348), uint(0x35c)
    assert 0 <= count <= capacity < 10000 and count <= maximum == 96
    result = dict(pid=a.pid, start_id=identity, scheduler=hex(scheduler),
                  pool=hex(a.pool), policy_u32=list(policy),
                  registered_locked_ranges=count, locked_range_capacity=capacity,
                  max_locked_ranges=maximum, parallel_unit_count=uint(0x370),
                  scanned_present_mib=scanned/1024**2,
                  elapsed_seconds=time.monotonic()-started, scope=__doc__)
    if a.ranges:
        vector = u64(scheduler+0x340)
        assert vector and count > 0
        for attempt in range(100):
            pointers = read(vector, count*8)
            addresses = struct.unpack('<'+'Q'*count, pointers)
            assert len(set(addresses)) == count and all(v and v % 8 == 0 for v in addresses)
            records = [read(v, 64) for v in addresses]
            if (pointers == read(vector, count*8)
                    and records == [read(v, 64) for v in addresses]
                    and data == read(scheduler+0x2d8, 0xa0)):
                break
        else:
            raise RuntimeError('Locked range records remained busy')
        groups = {}
        rows = []
        for index, record in enumerate(records):
            assert struct.unpack_from('<Q', record)[0] == a.pool
            assert struct.unpack_from('<Q', record, 8)[0] == a.pool+8
            begin, end = struct.unpack_from('<ii', record, 0x30)
            assert 0 <= begin <= end < 2**30
            source = record[0x18:0x24]
            token = struct.unpack_from('<I', record, 0x20)[0]
            group = None
            if begin != end:
                assert token != 0
                if source not in groups:
                    groups[source] = []
                group = list(groups).index(source)
                groups[source].append((begin, end))
            rows.append(dict(slot=index, source_group=group, begin_page=begin,
                             end_page=end, nonempty=begin != end))
        union_pages = 0
        for spans in groups.values():
            cursor = -1
            for begin, end in sorted(spans):
                union_pages += max(0, end-max(begin, cursor))
                cursor = max(cursor, end)
        result['ranges'] = dict(rows=rows, nonempty_count=sum(r['nonempty'] for r in rows),
                                source_groups=len(groups), union_page_coordinates=union_pages,
                                scope='Stable registered range coordinates grouped by source. These are requested protected ranges, not a resident page census or proof that all ranges are currently backed. No source identifiers or audio contents emitted.')
        result['elapsed_seconds'] = time.monotonic()-started
    a.output.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps(result))
finally:
    os.close(fd)
    os.close(pg)
