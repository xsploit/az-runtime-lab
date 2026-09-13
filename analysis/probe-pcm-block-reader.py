"""Execute original AZ Track::readFromBlocks and exitRead under local QEMU.

Synthetic two-block/two-page geometry, 1764 stereo frames per page. No live Pi,
threads, runtime patches or replacement copy routine. Checks full fixture and
returned frame count. A separate one-shot interleaving case removes the block's
cluster pointer between its initial check and read-lock acquisition; this models
a completed writer detachment, not simultaneous hardware concurrency.
"""
import hashlib
import importlib.util
import json
from pathlib import Path
import resource
import struct
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('elf_helpers', HERE/'cdj-render-compare/helpers.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
elf = module.ELF('az')
sha = hashlib.sha256(elf.d).hexdigest()
assert sha == '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
BASE, SIZE = 0x600000, 0x40000
CONFIG, BLOCKS, CLUSTERS, ENTRIES = BASE+0x100, BASE+0x200, BASE+0x400, BASE+0x600
WRAPPERS, RAW, OUTPUT = BASE+0x1000, BASE+0x8000, BASE+0x20000
N = 1764


def put(b, va, fmt, *args):
    struct.pack_into('<'+fmt, b, va-BASE, *args)


cases = [
    ('scalar',0,64,64), ('aligned_vector',1,64,64), ('odd_length',1,65,65),
    ('page_boundary',N-2,8,8), ('block_boundary',2*N-2,8,8),
    ('existing_reader',0,64,64), ('writer_first',0,64,0),
    ('writer_second',2*N-2,8,2), ('missing_first_cluster',0,64,0),
    ('missing_first_page',0,64,0), ('missing_second_page',N-2,8,2),
    ('missing_second_cluster',2*N-2,8,2), ('past_available_end',4*N-2,8,2),
    ('beyond_block_count',4*N,8,0), ('detached_before_lock',0,64,0),
]
results = []
with tempfile.TemporaryDirectory(prefix='az-block-reader-') as directory:
    t = Path(directory)
    (t/'release.bin').write_bytes(elf.read(0x684480,0x2c))
    for name, position, requested, count in cases:
        b = bytearray(SIZE)
        put(b, BASE+8, 'Q', CONFIG)
        put(b, BASE+0x38, 'Q', BLOCKS)
        put(b, BASE+0xd0, 'Q', 2*N)
        put(b, CONFIG, '3I', N,2,2)
        expected_audio = bytearray()
        for block in range(2):
            cluster = CLUSTERS+block*0x100
            entries = ENTRIES+block*0x100
            put(b, BLOCKS+block*24, 'QQII', CONFIG,cluster,0,2)
            put(b, cluster, '3Q', CONFIG,0,entries)
            for page in range(2):
                index = 2*block+page
                raw = RAW+index*0x4000
                wrapper = WRAPPERS+index*16
                put(b, entries+page*16+8, 'Q', wrapper)
                put(b, wrapper, 'QI', raw+8,N)
                samples = b''.join(struct.pack('<ff',(index*N+i)/8192,-(index*N+i+1)/8192) for i in range(N))
                b[raw-BASE:raw-BASE+8] = b'\xaf'*8
                b[raw-BASE+8:raw-BASE+8+len(samples)] = samples
                b[raw-BASE+8+len(samples):raw-BASE+16+len(samples)] = b'\xef'*8
                expected_audio += samples
        if name == 'existing_reader': put(b,BLOCKS+16,'I',2)
        if name == 'writer_first': put(b,BLOCKS+16,'i',-1)
        if name == 'writer_second': put(b,BLOCKS+24+16,'i',-1)
        if name == 'missing_first_cluster': put(b,BLOCKS+8,'Q',0)
        if name == 'missing_second_cluster': put(b,BLOCKS+24+8,'Q',0)
        if name == 'missing_first_page': put(b,ENTRIES+8,'Q',0)
        if name == 'missing_second_page': put(b,ENTRIES+24,'Q',0)
        b[OUTPUT-BASE:OUTPUT-BASE+4096] = b'\x5a'*4096
        expected = bytearray(b)
        expected[OUTPUT-BASE:OUTPUT-BASE+8*count] = expected_audio[position*8:(position+count)*8]
        code = bytearray(elf.read(0x781d60,0x2f8))
        if name == 'detached_before_lock':
            address,target = 0x781de4,0x501000
            assert struct.unpack_from('<I',code,address-0x781d60)[0] == 0x91004080
            struct.pack_into('<I',code,address-0x781d60,0x14000000|(((target-address)//4)&0x3ffffff))
            put(expected,BLOCKS+8,'Q',0)
        (t/'reader.bin').write_bytes(code)
        (t/'fixture.bin').write_bytes(b)
        (t/'probe.S').write_text(f'''
.text
.global _start
_start:
 ldr x0,={BASE}
 ldr x1,={OUTPUT}
 ldr x2,={position}
 ldr x3,={requested}
 ldr x4,=0x781d60
 blr x4
 sub sp,sp,#16
 str x0,[sp]
 mov x0,#1
 mov x1,sp
 mov x2,#8
 mov x8,#64
 svc #0
 mov x0,#1
 ldr x1,={BASE}
 ldr x2,={SIZE}
 mov x8,#64
 svc #0
 mov x0,#0
 mov x8,#93
 svc #0
.section .interleave,"ax"
 str xzr,[x4,#8]
 add x0,x4,#16
 b resume_reader
.section .fixture,"aw"
.incbin "{t/'fixture.bin'}"
.section .release,"ax"
.incbin "{t/'release.bin'}"
.section .reader,"ax"
.incbin "{t/'reader.bin'}"
''')
        (t/'link.ld').write_text('''ENTRY(_start)
resume_reader = 0x781de8;
SECTIONS {
 . = 0x500000; .text : { *(.text) }
 . = 0x501000; .interleave : { *(.interleave) }
 . = 0x600000; .fixture : { *(.fixture) }
 . = 0x684480; .release : { *(.release) }
 . = 0x781d60; .reader : { *(.reader) }
 /DISCARD/ : { *(.comment) *(.note*) }
}''')
        subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')],check=True,timeout=30)
        subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')],check=True,timeout=30)
        run = subprocess.run(['qemu-aarch64-static',str(t/'probe')],capture_output=True,timeout=10,
            cwd=t,preexec_fn=lambda:resource.setrlimit(resource.RLIMIT_CORE,(0,0)))
        assert run.returncode == 0 and len(run.stdout)==SIZE+8,(name,run.returncode,len(run.stdout),run.stderr)
        got = struct.unpack_from('<Q',run.stdout)[0]
        assert got == count,(name,got,count)
        changes = [hex(BASE+i) for i,(a,z) in enumerate(zip(run.stdout[8:],expected)) if a!=z]
        assert not changes,(name,changes[:20])
        results.append(dict(case=name,position=position,requested_frames=requested,
            returned_frames=got,passed=True,whole_fixture_matched=True,
            synthetic_interleaving=name=='detached_before_lock'))
out = dict(scope=__doc__,firmware_sha256=sha,tests=len(results),results=results,
           source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
path = HERE/'pcm-pool-live/block-reader-oracle.json'
path.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(dict(tests=len(results),passed=True,output=str(path))))
