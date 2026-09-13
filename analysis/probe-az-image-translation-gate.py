"""Run AZ's original fractional image-translation gate, not the full renderer."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import tempfile

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('firmware', type=Path)
p.add_argument('--output', type=Path, required=True)
a = p.parse_args()
b = a.firmware.read_bytes()
sha = hashlib.sha256(b).hexdigest()
assert sha == '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
phoff = struct.unpack_from('<Q', b, 32)[0]
phsize, phnum = struct.unpack_from('<HH', b, 54)
segments = [struct.unpack_from('<IIQQQQQQ', b, phoff + i*phsize) for i in range(phnum)]
va, size = 0x23fa000, 0x2000
s = next(s for s in segments if s[0] == 1 and s[3] <= va and va+size <= s[3]+s[5])
offset = s[2] + va - s[3]
code = bytearray(b[offset:offset+size])
for stop, expected, target in [(0x23fae34, 0xb4000d46, 0x501000),
                               (0x23fae74, 0x1e240800, 0x502000)]:
    word = struct.unpack_from('<I', code, stop-va)[0]
    assert word == expected, (hex(stop), hex(word))
    struct.pack_into('<I', code, stop-va, 0x14000000 | (((target-stop)//4) & 0x3ffffff))

asm = '''
.text
.global _start
_start:
 sub sp,sp,#512
 mov x26,#0
 adrp x27,output
 add x27,x27,:lo12:output
 adrp x19,state
 add x19,x19,:lo12:state
next:
 mov x0,#4097
 udiv x1,x26,x0
 msub x2,x1,x0,x26
 sub w2,w2,#2048
 mov w0,#3
 udiv w4,w1,w0
 msub w3,w4,w0,w1
 str w3,[x19,#0x60]
 stp w2,w3,[x27]
 str w4,[x27,#8]
 scvtf s0,w2,#10
 str s0,[sp,#0xb0]
 scvtf s1,w4,#1
 str s1,[sp,#0xbc]
 mov x0,#0x23f0000
 add x0,x0,#0xa000
 add x0,x0,#0xdf8
 br x0
.section .fast,"ax"
fast:
 mov w0,#0
 fmov w1,s8
 mov w2,w22
 b record
.section .filtered,"ax"
filtered:
 mov w0,#1
 mov w1,#0
 mov w2,#0
 b record
.section .record,"ax"
record:
 str w0,[x27,#12]
 stp w1,w2,[x27,#16]
 add x27,x27,#24
 add x26,x26,#1
 mov x0,#24582
 cmp x26,x0
 b.lt next
 mov x0,#1
 adrp x1,output
 add x1,x1,:lo12:output
 sub x2,x27,x1
 mov x8,#64
 svc #0
 mov x0,#0
 mov x8,#93
 svc #0
.bss
.balign 16
state: .skip 128
output: .skip 589968
'''
with tempfile.TemporaryDirectory(prefix='az-translation-gate-') as d:
    t = Path(d)
    (t/'native.bin').write_bytes(code)
    (t/'probe.S').write_text(asm + f'\n.section .native,"ax"\n.incbin "{t}/native.bin"\n')
    (t/'link.ld').write_text('''ENTRY(_start)
SECTIONS {
 . = 0x500000; .text : { *(.text) }
 . = 0x501000; .fast : { *(.fast) }
 . = 0x502000; .filtered : { *(.filtered) }
 . = 0x503000; .record : { *(.record) }
 . = 0x510000; .bss : { *(.bss) }
 . = 0x23fa000; .native : { *(.native) }
 /DISCARD/ : { *(.comment) *(.note*) }
}
''')
    subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')], check=True)
    subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')], check=True)
    run = subprocess.run(['qemu-aarch64-static',str(t/'probe')], capture_output=True,check=True,timeout=10)
assert len(run.stdout) == 24582*24
rows = []
mismatches = []
for i in range(24582):
    x, quality, half_y, filtered, rx, ry = struct.unpack_from('<6i', run.stdout, i*24)
    # Native fixed-point FCVTZS truncates toward zero, including negative x.
    fixed_x = abs(x)//4 * (-1 if x < 0 else 1)
    fixed_y = half_y*128
    expected_filtered = int(quality != 0 and ((fixed_x | fixed_y) & 0xe0) != 0)
    expected_xy = ((fixed_x+128)>>8, (fixed_y+128)>>8)
    if filtered != expected_filtered or (not filtered and (rx,ry) != expected_xy):
        mismatches.append(i)
    rows.append({'x':x/1024,'quality':quality,'y':half_y/2,
                 'path':'filtered' if filtered else 'integer',
                 'integer_xy':None if filtered else [rx,ry]})
summary = {'source_sha256':sha,'scope':'Original AArch64 translation-selection fragment under QEMU. Unit-scale, no-shear precondition assumed; pixel filtering not executed.',
           'samples':len(rows),'formula_mismatches':len(mismatches),
           'by_quality':{q:{path:sum(r['quality']==q and r['path']==path for r in rows) for path in ['integer','filtered']} for q in range(3)},
           'selected':[r for r in rows if r['quality']==1 and r['y']==0 and r['x'] in [-1,-.9990234375,-.875,-.5,-.125,-.0009765625,0,.0009765625,.1240234375,.125,.5,.875,1]]}
a.output.with_suffix('.samples.json').write_text(json.dumps(rows))
a.output.write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary,indent=2))
assert not mismatches
