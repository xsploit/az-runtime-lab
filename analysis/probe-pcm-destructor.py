"""Run original AZ PageBuffer destructors on synthetic objects under QEMU.

Allocator calls are recorded, not executed. Guard-error reporting is intercepted
and resumed after its logging block: tests identify detection, not the real
logger's fatal/nonfatal behavior. No full player or concurrent cleanup tested.
"""
import hashlib
import json
import struct
import subprocess
import tempfile
from pathlib import Path

root = Path(__file__).resolve().parents[1]
b = (root/'xdjaz/rootfs/home/root/pdj/EP147').read_bytes()
sha = hashlib.sha256(b).hexdigest()
assert sha == '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
off = struct.unpack_from('<Q', b, 32)[0]
size, count = struct.unpack_from('<HH', b, 54)
segments = [struct.unpack_from('<IIQQQQQQ', b, off+i*size) for i in range(count)]

def read(addr, n):
    for s in segments:
        if s[0] == 1 and s[3] <= addr and addr+n <= s[3]+s[5]:
            return b[s[2]+addr-s[3]:s[2]+addr-s[3]+n]
    raise ValueError(hex(addr))

POOL, VECTOR, WRAPPERS, PAYLOADS = 0x600000, 0x601000, 0x602000, 0x610000
cases = ['normal', 'front_guard_corrupt', 'back_guard_corrupt',
         'null_payload', 'zero_count', 'empty_vector']
results = []
with tempfile.TemporaryDirectory(prefix='az-pcm-destructor-') as directory:
    t = Path(directory)
    code = bytearray(read(0x768000, 0x2000))
    for address, target in [(0x768ca0, 0x501100), (0x76907c, 0x501180)]:
        assert struct.unpack_from('<I', code, address-0x768000)[0] == 0xaa1603e1
        struct.pack_into('<I', code, address-0x768000,
                         0x14000000|(((target-address)//4)&0x3ffffff))
    (t/'code.bin').write_bytes(code)
    helper = bytearray(read(0x770000, 0x1000))
    assert struct.unpack_from('<I', helper, 0x658)[0] == 0xaa1603e1
    struct.pack_into('<I', helper, 0x658, 0x14000000|(((0x501200-0x770658)//4)&0x3ffffff))
    (t/'helper.bin').write_bytes(helper)
    for variant, entry in [('deleting', 0x768988), ('nondeleting', 0x768d70),
                           ('owner_array_cleanup', 0x7704d8)]:
        for case in cases:
            fixture = bytearray(0x20000)
            struct.pack_into('<Q', fixture, 0, 0x25f9c00)
            if case != 'empty_vector':
                struct.pack_into('<Q', fixture, 0x80, VECTOR)
                struct.pack_into('<I', fixture, 0x88, 4)
                struct.pack_into('<I', fixture, 0x90, 4)
                struct.pack_into('<4Q', fixture, VECTOR-POOL,
                                 WRAPPERS, 0, WRAPPERS+16, WRAPPERS+32)
            for index in range(3):
                raw = PAYLOADS+index*0x4000
                payload = 0 if case == 'null_payload' and index == 1 else raw+8
                n = 0 if case == 'zero_count' and index == 1 else 1764
                struct.pack_into('<QI', fixture, WRAPPERS-POOL+index*16, payload, n)
                fixture[raw-POOL:raw-POOL+8] = b'\xaf'*8
                fixture[raw-POOL+14120:raw-POOL+14128] = b'\xef'*8
            if case == 'front_guard_corrupt': fixture[PAYLOADS-POOL+3] = 0
            if case == 'back_guard_corrupt': fixture[PAYLOADS-POOL+14124] = 0
            (t/'fixture.bin').write_bytes(fixture)
            asm = f'''
.text
.global _start
_start:
 mov x0, #{POOL}
 {'add x0,x0,#0x80' if variant == 'owner_array_cleanup' else 'nop'}
 ldr x1, ={entry}
 blr x1
 mov x0, #1
 adrp x1, output
 add x1, x1, :lo12:output
 ldr x2, [x1]
 add x2, x2, #1
 lsl x2, x2, #5
 mov x8, #64
 svc #0
 mov x0, #0
 mov x8, #93
 svc #0

record:
 adrp x9, output
 add x9, x9, :lo12:output
 ldr x10, [x9]
 cmp x10, #32
 b.hs overflow
 add x11, x10, #1
 str x11, [x9]
 add x9, x9, x11, lsl #5
 stp x8, x0, [x9]
 stp x1, x30, [x9,#16]
 ret
overflow:
 mov x0, #99
 mov x8, #93
 svc #0

.section .free,"ax"
 cbz x0, 1f
 mov x1, #0
 mov x8, #1
 b record
1: ret
.section .delete_array,"ax"
 cbz x0, 1f
 mov x1, #0
 mov x8, #3
 b record
1: ret
.section .delete_sized,"ax"
 mov x8, #2
 b record
.section .guard_deleting,"ax"
 mov x0,x20
 mov x1,#0
 mov x8,#4
 bl record
 b 0x768d28
.section .guard_nondeleting,"ax"
 mov x0,x20
 mov x1,#0
 mov x8,#4
 bl record
 b 0x769104
.section .guard_helper,"ax"
 mov x0,x19
 mov x1,#0
 mov x8,#4
 bl record
 b resume_helper
.section .fixture,"aw"
.incbin "{t/'fixture.bin'}"
.section .native,"ax"
.incbin "{t/'code.bin'}"
.section .native_helper,"ax"
.incbin "{t/'helper.bin'}"
.section .output,"aw",@nobits
.balign 16
output: .skip 1056
'''
            # Absolute branches in assembly must be link-time symbol references.
            asm = asm.replace('b 0x768d28', 'b resume_deleting').replace('b 0x769104', 'b resume_nondeleting')
            (t/'probe.S').write_text(asm)
            (t/'link.ld').write_text('''ENTRY(_start)
resume_deleting = 0x768d28; resume_nondeleting = 0x769104; resume_helper = 0x7706e0;
SECTIONS {
 . = 0x424af0; .free : { *(.free) }
 . = 0x424e50; .delete_array : { *(.delete_array) }
 . = 0x426660; .delete_sized : { *(.delete_sized) }
 . = 0x500000; .text : { *(.text) }
 . = 0x501100; .guard_deleting : { *(.guard_deleting) }
 . = 0x501180; .guard_nondeleting : { *(.guard_nondeleting) }
 . = 0x501200; .guard_helper : { *(.guard_helper) }
 . = 0x600000; .fixture : { *(.fixture) }
 . = 0x700000; .output : { *(.output) }
 . = 0x768000; .native : { *(.native) }
 . = 0x770000; .native_helper : { *(.native_helper) }
 /DISCARD/ : { *(.comment) *(.note*) }
}''')
            subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')],check=True,timeout=30)
            subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')],check=True,timeout=30)
            run = subprocess.run(['qemu-aarch64-static',str(t/'probe')],capture_output=True,check=True,timeout=10)
            n = struct.unpack_from('<Q', run.stdout)[0]
            assert len(run.stdout) == (n+1)*32
            records = [struct.unpack_from('<4Q',run.stdout,(i+1)*32) for i in range(n)]
            actual = [(kind, addr, sz) for kind, addr, sz, caller in records]
            expected = []
            if case != 'empty_vector':
                for index in (2, 1, 0):
                    if index == 0 and case.endswith('guard_corrupt'):
                        expected.append((4,WRAPPERS,0))
                    if not (index == 1 and case == 'null_payload'):
                        expected.append((1,PAYLOADS+index*0x4000,0))
                    expected.append((2,WRAPPERS+index*16,16))
                if variant != 'owner_array_cleanup': expected.append((1,VECTOR,0))
            if variant == 'deleting': expected.append((2,POOL,344))
            assert actual == expected, (variant,case,actual,expected)
            results.append(dict(variant=variant,case=case,passed=True,
                                events=[dict(kind=k,address=hex(a),size=s,caller=hex(c)) for k,a,s,c in records]))
result = dict(firmware_sha256=sha, scope=__doc__, tests=len(results),
              intercepted_guard_reports=['0x768ca0','0x76907c','0x770658'], results=results)
output = root/'analysis/pcm-pool-live/destructor-oracle.json'
output.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(dict(output=str(output),tests=len(results),passed=True)))
