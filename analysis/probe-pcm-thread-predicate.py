"""Original AZ dispatch predicate with synthetic pthread identities under QEMU.

Executes 0x68f0e8 and original atomic handle getter 0x231cbe0. pthread_self
wrapper 0x232dc50 is substituted. Does not start threads or execute queues.
All extracted firmware instruction files remain temporary.
"""
import hashlib
import importlib.util
import json
from pathlib import Path
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
cases = [(0x1234,0x1234), (0x1234,0x5678), (0,0x1234),
         (0x1234,0), (0x100001234,0x200001234),
         (0xf123456789abcdef,0xf123456789abcdef)]
results = []
with tempfile.TemporaryDirectory(prefix='az-pcm-thread-') as directory:
    t = Path(directory)
    (t/'predicate.bin').write_bytes(elf.read(0x68f0e8,0x34))
    (t/'getter.bin').write_bytes(elf.read(0x231cbe0,12))
    for stored,current in cases:
        fixture = bytearray([0xa5]*0x100)
        struct.pack_into('<Q',fixture,0x70,stored)
        (t/'fixture.bin').write_bytes(fixture)
        (t/'probe.S').write_text(f'''
.text
.global _start
_start:
 ldr x0, =0x600020
 ldr x1, =0x68f0e8
 blr x1
 sub sp,sp,#16
 str x0,[sp]
 mov x0,#1
 mov x1,sp
 mov x2,#8
 mov x8,#64
 svc #0
 mov x0,#1
 ldr x1,=0x600000
 mov x2,#256
 mov x8,#64
 svc #0
 mov x0,#0
 mov x8,#93
 svc #0
.section .self,"ax"
 ldr x0, ={current}
 ret
.section .fixture,"aw"
.incbin "{t/'fixture.bin'}"
.section .predicate,"ax"
.incbin "{t/'predicate.bin'}"
.section .getter,"ax"
.incbin "{t/'getter.bin'}"
''')
        (t/'link.ld').write_text('''ENTRY(_start)
SECTIONS {
 . = 0x500000; .text : { *(.text) }
 . = 0x600000; .fixture : { *(.fixture) }
 . = 0x68f0e8; .predicate : { *(.predicate) }
 . = 0x231cbe0; .getter : { *(.getter) }
 . = 0x232dc50; .self : { *(.self) }
 /DISCARD/ : { *(.comment) *(.note*) }
}''')
        subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')],check=True,timeout=30)
        subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')],check=True,timeout=30)
        run = subprocess.run(['qemu-aarch64-static',str(t/'probe')],capture_output=True,check=True,timeout=10)
        assert len(run.stdout) == 264
        result = struct.unpack_from('<Q',run.stdout)[0]
        assert result == int(stored != current)
        assert run.stdout[8:] == fixture
        results.append(dict(stored_handle=hex(stored),current_handle=hex(current),
                            queue_required=bool(result),passed=True))
out = dict(scope=__doc__,firmware_sha256=sha,tests=len(results),results=results,
           source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
path = HERE/'pcm-pool-live/thread-predicate-oracle.json'
path.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(dict(passed=True,tests=len(results),output=str(path))))
