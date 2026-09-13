"""Execute original AZ page return/retention instructions locally under QEMU.

Single-thread synthetic fixtures, not the full player. Deque allocation returns
fixed writable fixture blocks; delete records its argument; memmove is a local
implementation. Track range publication is recorded, not executed. Diagnostic,
exception, concurrent reader and scheduler behavior is outside this test.
Temporary proprietary instruction extracts are deleted on exit.
"""
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
DATA = (ROOT / 'xdjaz/rootfs/home/root/pdj/EP147').read_bytes()
SHA = hashlib.sha256(DATA).hexdigest()
assert SHA == '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
off = struct.unpack_from('<Q', DATA, 32)[0]
size, count = struct.unpack_from('<HH', DATA, 54)
SEGS = [struct.unpack_from('<IIQQQQQQ', DATA, off+i*size) for i in range(count)]


def read(va, length):
    for s in SEGS:
        if s[0] == 1 and s[3] <= va and va+length <= s[3]+s[5]:
            return DATA[s[2]+va-s[3]:s[2]+va-s[3]+length]
    raise ValueError(hex(va))


BASE, LENGTH = 0x600000, 0x20000
POOL, MAP, NODE = BASE, BASE+0x100, BASE+0x1000
CLUSTER, RESERVATION, ENTRIES = BASE+0x3000, BASE+0x3100, BASE+0x4000
PAGE, TRACK, TRES, CONFIG = BASE+0x5000, BASE+0x6000, BASE+0x6100, BASE+0x6200
META, ARENA, PAYLOAD = BASE+0xf00, BASE+0x8000, BASE+0x10000


def put(b, va, fmt, *values):
    struct.pack_into('<'+fmt, b, va-BASE, *values)


def u64(b, va):
    return struct.unpack_from('<Q', b, va-BASE)[0]


def fixture(boundary=False, growth=False):
    b = bytearray(LENGTH)
    index, capacity = (0, 1) if growth else (3, 8)
    put(b, POOL, 'QQ', MAP, capacity)
    put(b, MAP+8*index, 'Q', NODE)
    put(b, POOL+0x10, '4Q', NODE, NODE, NODE+512, MAP+8*index)
    put(b, POOL+0x30, '4Q', NODE+(504 if boundary else 0), NODE, NODE+512, MAP+8*index)
    put(b, CLUSTER, 'QQQQ', CONFIG, POOL, ENTRIES, ENTRIES+48)
    put(b, CONFIG+4, 'I', 3)
    put(b, RESERVATION, 'QQ', CLUSTER, ENTRIES)
    b[ENTRIES-BASE] = 1
    for i in range(2):
        raw = PAYLOAD+0x4000*i
        put(b, PAGE+16*i, 'QI', raw+8, 1764)
        b[raw-BASE:raw-BASE+8] = b'\xaf'*8
        b[raw-BASE+8:raw-BASE+14120] = bytes([0x31+i])*14112
        b[raw-BASE+14120:raw-BASE+14128] = b'\xef'*8
    put(b, TRACK+0x20, 'QI', 0x12345678, 9)
    put(b, TRES, 'QQI', TRACK, 0x12345678, 9)
    put(b, TRES+0x18, 'QQI', CLUSTER, ENTRIES, 2)
    return b


def returned(expected, page=PAGE, boundary=False, growth=False):
    if not boundary:
        where = u64(expected, POOL+0x30)
        put(expected, where, 'Q', page)
        put(expected, POOL+0x30, 'Q', where+8)
        return
    put(expected, NODE+504, 'Q', page)
    if growth:
        # Capacity 1 -> 4 map entries. Existing node shifts to map slot 1.
        put(expected, POOL, 'QQ', ARENA, 4)
        put(expected, ARENA+8, 'QQ', NODE, ARENA+0x1000)
        put(expected, POOL+0x28, 'Q', ARENA+8)
        put(expected, POOL+0x30, '4Q', ARENA+0x1000, ARENA+0x1000,
            ARENA+0x1200, ARENA+16)
        put(expected, META+8, '3Q', 2, MAP, 0)
        put(expected, META+32, '2Q', 32, 512)
    else:
        put(expected, MAP+32, 'Q', ARENA)
        put(expected, POOL+0x30, '4Q', ARENA, ARENA, ARENA+512, MAP+32)
        put(expected, META+8, 'Q', 1)
        put(expected, META+32, 'Q', 512)


CASES = ['push', 'push_node_boundary', 'push_map_growth', 'cluster_accept',
         'cluster_unreserved', 'cluster_occupied', 'cluster_reject_boundary',
         'track_accept', 'track_identity_mismatch', 'track_generation_mismatch',
         'track_reject', 'cluster_trim_tail', 'cluster_trim_all', 'cluster_trim_empty']
results = []
with tempfile.TemporaryDirectory(prefix='az-pcm-return-') as directory:
    t = Path(directory)
    for name, va, length in [('pool', 0x772000, 0x2000), ('reservation', 0x77c000, 0x2000)]:
        (t/(name+'.bin')).write_bytes(read(va, length))
    for case in CASES:
        boundary = case in ('push_node_boundary', 'push_map_growth', 'cluster_reject_boundary')
        growth = case == 'push_map_growth'
        b = fixture(boundary, growth)
        entry, arg0, arg1 = 0x7734d0, POOL, PAGE
        if case.startswith('cluster_') and not case.startswith('cluster_trim'):
            entry, arg0 = 0x77cf98, RESERVATION
            if case in ('cluster_unreserved', 'cluster_reject_boundary'):
                b[ENTRIES-BASE] = 0
            if case == 'cluster_occupied': put(b, ENTRIES+8, 'Q', PAGE+16)
        if case.startswith('track_'):
            entry, arg0 = 0x77d128, TRES
            if case == 'track_identity_mismatch': put(b, TRES+8, 'Q', 0x87654321)
            if case == 'track_generation_mismatch': put(b, TRES+0x10, 'I', 8)
            if case == 'track_reject': b[ENTRIES-BASE] = 0
        if case.startswith('cluster_trim'):
            entry, arg0 = 0x773620, CLUSTER
            arg1 = {'cluster_trim_tail': 1, 'cluster_trim_all': 0, 'cluster_trim_empty': 3}[case]
            put(b, CLUSTER+0x28, 'I', 2)
            for i, page in enumerate((PAGE, 0, PAGE+16)):
                put(b, ENTRIES+16*i, 'QQ', 1, page)
        expected = bytearray(b)
        expected_return = None
        if case.startswith('push'):
            returned(expected, boundary=boundary, growth=growth)
        elif case in ('cluster_accept', 'track_accept'):
            expected[ENTRIES-BASE] = 0
            put(expected, ENTRIES+8, 'Q', PAGE)
            put(expected, CLUSTER+0x28, 'I', 1)
            put(expected, (TRES+0x20 if case.startswith('track') else RESERVATION+8), 'Q', 0)
            if case == 'cluster_accept': expected_return = 1
            else: put(expected, META+24, 'Q', 1)  # intercepted range publication
        elif case in ('cluster_unreserved', 'cluster_occupied', 'cluster_reject_boundary', 'track_reject'):
            returned(expected, boundary=boundary)
            put(expected, (TRES+0x20 if case.startswith('track') else RESERVATION+8), 'Q', 0)
            if case.startswith('cluster'): expected_return = 0
        elif case.startswith('cluster_trim'):
            retained = 2
            for i in range(arg1, 3):
                page = u64(expected, ENTRIES+16*i+8)
                if page:
                    returned(expected, page)
                    put(expected, ENTRIES+16*i+8, 'Q', 0)
                    retained -= 1
                expected[ENTRIES+16*i-BASE] = 0
            put(expected, CLUSTER+0x28, 'I', retained)
        (t/'fixture.bin').write_bytes(b)
        asm = f'''
.text
.global _start
_start:
 ldr x0, ={arg0}
 ldr x1, ={arg1}
 ldr x2, ={entry}
 blr x2
 ldr x9, ={META}
 str x0, [x9]
 mov x0, #1
 ldr x1, ={BASE}
 ldr x2, ={LENGTH}
 mov x8, #64
 svc #0
 cmp x0, x2
 b.ne fail
 mov x0, #0
 mov x8, #93
 svc #0
fail:
 mov x0, #99
 mov x8, #93
 svc #0
.section .new,"ax"
 ldr x9, ={META}
 ldr x10, [x9,#8]
 cmp x10, #2
 b.hs fail
 add x11, x9, #32
 str x0, [x11,x10,lsl #3]
 ldr x0, ={ARENA}
 add x0, x0, x10, lsl #12
 add x10, x10, #1
 str x10, [x9,#8]
 ret
.section .delete,"ax"
 ldr x9, ={META}
 str x0, [x9,#16]
 ret
.section .publish,"ax"
 ldr x9, ={META}
 ldr x10, [x9,#24]
 add x10, x10, #1
 str x10, [x9,#24]
 ret
.section .move,"ax"
 cbz x2, 4f
 cmp x0, x1
 b.lo 2f
 mov x9, x2
1: sub x9,x9,#1
 ldrb w10,[x1,x9]
 strb w10,[x0,x9]
 cbnz x9,1b
 ret
2: mov x9,#0
3: ldrb w10,[x1,x9]
 strb w10,[x0,x9]
 add x9,x9,#1
 cmp x9,x2
 b.lo 3b
4: ret
.section .fixture,"aw"
.incbin "{t/'fixture.bin'}"
.section .pool,"ax"
.incbin "{t/'pool.bin'}"
.section .reservation,"ax"
.incbin "{t/'reservation.bin'}"
'''
        (t/'probe.S').write_text(asm)
        (t/'link.ld').write_text('''ENTRY(_start)
SECTIONS {
 . = 0x424000; .move : { *(.move) }
 . = 0x424d40; .new : { *(.new) }
 . = 0x424e50; .delete : { *(.delete) }
 . = 0x500000; .text : { *(.text) }
 . = 0x600000; .fixture : { *(.fixture) }
 . = 0x7701f0; .publish : { *(.publish) }
 . = 0x772000; .pool : { *(.pool) }
 . = 0x77c000; .reservation : { *(.reservation) }
 /DISCARD/ : { *(.comment) *(.note*) }
}''')
        subprocess.run(['clang', '--target=aarch64-linux-gnu', '-c', str(t/'probe.S'), '-o', str(t/'probe.o')], check=True, timeout=30)
        subprocess.run(['ld.lld', '-T', str(t/'link.ld'), str(t/'probe.o'), '-o', str(t/'probe')], check=True, timeout=30)
        run = subprocess.run(['qemu-aarch64-static', str(t/'probe')], capture_output=True, timeout=10)
        if run.returncode or len(run.stdout) != LENGTH:
            raise AssertionError((case, run.returncode, len(run.stdout), run.stderr.decode(errors='replace')))
        actual = bytearray(run.stdout)
        returned_value = u64(actual, META)
        if expected_return is not None: assert returned_value == expected_return, (case, returned_value)
        put(actual, META, 'Q', 0)  # void return registers are not semantic output
        changes = [hex(BASE+i) for i, (a, e) in enumerate(zip(actual, expected)) if a != e]
        assert not changes, (case, 'unexpected fixture bytes', changes[:30])
        results.append(dict(case=case, passed=True, entry=hex(entry),
                            expected_boolean=expected_return,
                            allocations=u64(actual, META+8),
                            fixture_sha256=hashlib.sha256(actual).hexdigest(),
                            payloads_and_guards_unchanged=True))
output = dict(scope=__doc__, firmware_sha256=SHA, tests=len(results), results=results,
              source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
path = ROOT/'analysis/pcm-pool-live/return-oracle.json'
path.write_text(json.dumps(output, indent=2)+'\n')
print(json.dumps(dict(tests=len(results), passed=True, output=str(path))))
