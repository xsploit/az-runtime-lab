"""Original AZ reader-cache clear on synthetic entries, with no retention policy.

Runs the original clear routine and the original empty policy-reference getter.
Predicate, pthread_self, memmove and destructor/deallocator calls are substitutes.
No actual decoder destruction, mismatched-thread diagnostics, live concurrency,
policy-retained streaming reader, promise wait, or PCM-pool reclamation is tested.
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
BASE, SIZE = 0x600000, 0x8000
VECTOR, ENTRIES, FUNC, META = BASE+0x100, BASE+0x200, BASE+0x500, BASE+0x1000
THREAD = 0xf123456789abcdef

def put(b, address, fmt, *values):
    struct.pack_into('<'+fmt, b, address-BASE, *values)

cases = [(f'mask_{mask:03b}', mask, 3, THREAD, False) for mask in range(8)]
cases += [('first_use_binds_thread', 7, 3, 0, False),
          ('empty_cache', 7, 0, THREAD, False),
          ('empty_first_use', 7, 0, 0, False),
          ('null_shared_reference', 7, 3, THREAD, True)]
results = []
with tempfile.TemporaryDirectory(prefix='az-reader-clear-') as directory:
    t = Path(directory)
    (t/'clear.bin').write_bytes(elf.read(0x77e260, 0x2b0))
    (t/'getter.bin').write_bytes(elf.read(0x765af8, 0x3c))
    for name,mask,count,owner,null_shared in cases:
        b = bytearray(SIZE)
        put(b, BASE+0x10, 'Q', VECTOR)
        put(b, BASE+0x20, 'I', count)
        put(b, BASE+0x40, 'Q', owner)
        put(b, FUNC+0x10, 'QQ', 1, 0x501000)
        pointers = [ENTRIES+i*0x40 for i in range(count)]
        for i, entry in enumerate(pointers):
            put(b, VECTOR+i*8, 'Q', entry)
            put(b, entry, 'I', 0x55)
            put(b, entry+8, 'Q', i)
            put(b, entry+0x20, 'Q', 0 if null_shared else BASE+0x2000+i*0x40)
            put(b, entry+0x28, 'Q', BASE+0x3000+i*0x40)
        expected = bytearray(b)
        put(expected, BASE+0x40, 'Q', THREAD)
        put(expected, META+8, 'Q', count)
        for i in range(count):
            put(expected, META+0x20+i*8, 'Q', count-1-i)
        events = []
        remaining = pointers.copy()
        for i in reversed(range(count)):
            if not mask & (1 << i):
                continue
            entry = pointers[i]
            events.append((1,entry+0x28))
            if not null_shared:
                events.append((2,BASE+0x2000+i*0x40))
            events.append((3,entry))
            put(expected,entry,'I',0)
            # std::vector-like left shift leaves the unused trailing slot intact.
            for j in range(i,len(remaining)-1):
                put(expected,VECTOR+j*8,'Q',remaining[j+1])
            remaining.pop(i)
        put(expected,BASE+0x20,'I',len(remaining))
        put(expected,META,'Q',len(events))
        for i,event in enumerate(events):
            put(expected,META+0x100+i*16,'QQ',*event)
        (t/'fixture.bin').write_bytes(b)
        (t/'probe.S').write_text(f'''
.text
.global _start
_start:
 ldr x0, ={BASE}
 ldr x1, ={FUNC}
 ldr x2, =0x77e260
 blr x2
 mov x0,#1
 ldr x1, ={BASE}
 ldr x2, ={SIZE}
 mov x8,#64
 svc #0
 mov x0,#0
 mov x8,#93
 svc #0
.section .predicate,"ax"
 ldr x9, ={META}
 ldr x10,[x9,#8]
 ldr x11,[x1]
 add x12,x9,#0x20
 str x11,[x12,x10,lsl #3]
 add x10,x10,#1
 str x10,[x9,#8]
 mov x0,#{mask}
 lsr x0,x0,x11
 and x0,x0,#1
 ret
.section .record,"ax"
record:
 ldr x10, ={META}
 ldr x11,[x10]
 add x12,x10,#0x100
 add x12,x12,x11,lsl #4
 stp x9,x0,[x12]
 add x11,x11,#1
 str x11,[x10]
 ret
.section .string_destroy,"ax"
 mov x9,#1
 b record
.section .shared_destroy,"ax"
 mov x9,#2
 b record
.section .delete,"ax"
 cmp x1,#48
 b.ne fail
 mov x9,#3
 b record
.section .move,"ax"
 mov x9,x0
 cbz x2,move_done
move_loop:
 ldrb w10,[x1],#1
 strb w10,[x9],#1
 subs x2,x2,#1
 b.ne move_loop
move_done:
 ret
.section .self,"ax"
 ldr x0, ={THREAD}
 ret
.section .fail,"ax"
fail:
 mov x0,#99
 mov x8,#93
 svc #0
.section .fixture,"aw"
.incbin "{t/'fixture.bin'}"
.section .clear,"ax"
.incbin "{t/'clear.bin'}"
.section .getter,"ax"
.incbin "{t/'getter.bin'}"
''')
        (t/'link.ld').write_text('''ENTRY(_start)
SECTIONS {
 . = 0x424000; .move : { *(.move) }
 . = 0x426660; .delete : { *(.delete) }
 . = 0x500000; .text : { *(.text) }
 . = 0x501000; .predicate : { *(.predicate) }
 . = 0x501100; .record : { *(.record) }
 . = 0x501200; .fail : { *(.fail) }
 . = 0x600000; .fixture : { *(.fixture) }
 . = 0x6742d8; .shared_destroy : { *(.shared_destroy) }
 . = 0x765af8; .getter : { *(.getter) }
 . = 0x77e260; .clear : { *(.clear) }
 . = 0x22fc600; .string_destroy : { *(.string_destroy) }
 . = 0x232dc50; .self : { *(.self) }
 /DISCARD/ : { *(.comment) *(.note*) }
}''')
        subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')],check=True,timeout=30)
        subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')],check=True,timeout=30)
        run = subprocess.run(['qemu-aarch64-static',str(t/'probe')],capture_output=True,
            timeout=10,cwd=t,preexec_fn=lambda:resource.setrlimit(resource.RLIMIT_CORE,(0,0)))
        assert run.returncode==0 and len(run.stdout)==SIZE,(name,run.returncode,len(run.stdout),run.stderr)
        changes = [hex(BASE+i) for i,(a,z) in enumerate(zip(run.stdout,expected)) if a!=z]
        assert not changes,(name,changes[:30])
        results.append(dict(case=name,mask=mask,initial_entries=count,
                            remaining_entries=len(remaining),event_count=len(events),
                            whole_fixture_matched=True,passed=True))
out = dict(scope=__doc__,firmware_sha256=sha,tests=len(results),results=results,
           source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
path = HERE/'pcm-pool-live/reader-cache-clear-oracle.json'
path.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(dict(tests=len(results),passed=True,output=str(path))))
