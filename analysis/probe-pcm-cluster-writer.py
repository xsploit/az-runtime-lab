"""Original AZ cluster retirement under controlled local QEMU interleavings.

Executes writer, exitRead/exitWrite and pool push instructions. Sleep is replaced
by a deterministic hook, and three post-retirement range/index helpers record
arguments instead of mutating their unrelated structures. Two observer branches
record state before write unlock and before page enqueue. No live threads, Pi,
kernel timing, full range publication, or application shutdown is tested.
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
BASE, SIZE = 0x600000, 0x20000
CONFIG, BLOCK, CLUSTER = BASE+0x100,BASE+0x200,BASE+0x400
PPOOL,CPOOL,PNODE,CNODE = BASE+0x600,BASE+0x800,BASE+0x1000,BASE+0x2000
ENTRIES,PAGES,META,RAW = BASE+0xa00,BASE+0xb00,BASE+0x3000,BASE+0x8000


def put(b, va, fmt, *args):
    struct.pack_into('<'+fmt,b,va-BASE,*args)


def branch(code, base, address, target, expected, link=False):
    assert struct.unpack_from('<I',code,address-base)[0] == expected
    struct.pack_into('<I',code,address-base,(0x94000000 if link else 0x14000000)|(((target-address)//4)&0x3ffffff))


cases = [
    ('uncontended',0,(),False,False), ('reader_held',1,(),False,False),
    ('two_readers_held',2,(),False,False), ('writer_held',-1,(),False,False),
    ('reader_releases_first',1,(1,),False,False),
    ('reader_releases_fifth',1,(5,),False,False),
    ('reader_releases_tenth',1,(10,),False,False),
    ('two_readers_release',2,(1,5),False,False),
    ('only_one_of_two_releases',2,(1,),False,False),
    ('writer_releases',-1,(3,),False,False),
    ('empty_cluster',0,(),True,False), ('absent_cluster',0,(),False,True),
    ('absent_cluster_reader_held',1,(),False,True),
    ('absent_cluster_writer_held',-1,(),False,True),
]
results=[]
with tempfile.TemporaryDirectory(prefix='az-cluster-writer-') as directory:
    t=Path(directory)
    writer=bytearray(elf.read(0x7745f8,0x270))
    pool=bytearray(elf.read(0x7734d0,0x4c))
    branch(writer,0x7745f8,0x774668,0x501000,0x97fbef88,True)
    branch(pool,0x7734d0,0x7734d0,0x501100,0xa9ba7bfd)
    for name,data in [('writer',writer),('pool',pool),
                      ('exit_write',elf.read(0x670488,0x20)),
                      ('exit_read',elf.read(0x684480,0x2c))]:
        (t/(name+'.bin')).write_bytes(data)
    for name,initial,releases,empty,absent in cases:
        b=bytearray(SIZE)
        put(b,BASE+8,'QQ',CONFIG,CPOOL)
        put(b,BASE+0x38,'Q',BLOCK)
        put(b,BASE+0x50,'Q',CONFIG)
        put(b,CONFIG,'3I',1764,3,1)
        put(b,CONFIG+0x18,'I',1)
        put(b,BLOCK,'QQiI',CONFIG,0 if absent else CLUSTER,initial,3)
        put(b,CLUSTER,'4Q',CONFIG,PPOOL,ENTRIES,ENTRIES+48)
        put(b,CLUSTER+0x28,'I',0 if empty else 2)
        for pool_addr,node in ((PPOOL,PNODE),(CPOOL,CNODE)):
            put(b,pool_addr+0x30,'3Q',node,node,node+512)
        for i,page in enumerate((PAGES,0,PAGES+16)):
            put(b,ENTRIES+16*i,'QQ',1,0 if empty else page)
        for i in range(2):
            raw=RAW+0x4000*i
            put(b,PAGES+16*i,'QI',raw+8,1764)
            b[raw-BASE:raw-BASE+8]=b'\xaf'*8
            b[raw-BASE+8:raw-BASE+14120]=bytes([0x31+i])*14112
            b[raw-BASE+14120:raw-BASE+14128]=b'\xef'*8
        expected=bytearray(b)
        remaining = (0 if releases else -1) if initial<0 else initial-len(releases)
        success = not absent and remaining==0
        waits=0 if initial==0 or absent else (max(releases) if success else 10)
        put(expected,META,'Q',waits)
        if waits: put(expected,META+8,'Q',1)  # last requested sleep argument
        if not absent: put(expected,BLOCK+16,'i',remaining)
        if success:
            put(expected,BLOCK+8,'Qi',0,0)
            put(expected,CLUSTER+0x28,'I',0)
            for i in range(3): put(expected,ENTRIES+16*i,'QQ',0,0)
            page_count=0 if empty else 2
            if page_count: put(expected,PNODE,'QQ',PAGES,PAGES+16)
            put(expected,PPOOL+0x30,'Q',PNODE+8*page_count)
            put(expected,CNODE,'Q',CLUSTER)
            put(expected,CPOOL+0x30,'Q',CNODE+8)
            put(expected,META+16,'4Q',1,0,0xffffffff,page_count)
            # Per-page enqueue observer: cluster detached and lock released.
            for i in range(page_count): put(expected,META+64+32*i,'4Q',PPOOL,PAGES+16*i,0,0)
            # Calls to range and occupancy publication helpers.
            put(expected,META+160,'4Q',BASE+0x70,0,3,1)
            put(expected,META+192,'3Q',BASE+0x50,0,1)
            put(expected,META+216,'Q',1)
        (t/'fixture.bin').write_bytes(b)
        release_code='\n'.join(f' cmp x10,#{n}\n b.eq release_lock' for n in releases)
        (t/'probe.S').write_text(f'''
.text
.global _start
_start:
 ldr x0,={BASE}
 mov x1,#0
 ldr x2,=0x7745f8
 blr x2
 mov x0,#1
 ldr x1,={BASE}
 ldr x2,={SIZE}
 mov x8,#64
 svc #0
 mov x0,#0
 mov x8,#93
 svc #0
.section .unlock_observer,"ax"
 ldr x9,={META}
 mov x10,#1
 str x10,[x9,#16]
 ldr x10,={BLOCK}
 ldr x11,[x10,#8]
 ldr w12,[x10,#16]
 stp x11,x12,[x9,#24]
 b native_exit_write
.section .push_observer,"ax"
 ldr x9,={META}
 ldr x10,[x9,#40]
 cmp x10,#2
 b.hs fail
 add x11,x9,#64
 add x11,x11,x10,lsl #5
 stp x0,x1,[x11]
 ldr x12,={BLOCK}
 ldr x13,[x12,#8]
 ldr w14,[x12,#16]
 stp x13,x14,[x11,#16]
 add x10,x10,#1
 str x10,[x9,#40]
 stp x29,x30,[sp,#-0x60]!
 b resume_push
.section .sleep,"ax"
 ldr x9,={META}
 ldr x10,[x9]
 str x0,[x9,#8]
 add x10,x10,#1
 str x10,[x9]
 {release_code}
 ret
release_lock:
 ldr x0,={BLOCK+16}
 b {'native_exit_write' if initial<0 else 'native_exit_read'}
.section .range,"ax"
 ldr x9,={META+160}
 ldp w10,w11,[x1]
 stp x0,x10,[x9]
 str x11,[x9,#16]
 mov x10,#1
 str x10,[x9,#24]
 ret
.section .occupancy,"ax"
 ldr x9,={META+192}
 stp x0,x1,[x9]
 mov x10,#1
 str x10,[x9,#16]
 ret
.section .publish,"ax"
 ldr x9,={META+216}
 mov x10,#1
 str x10,[x9]
 ret
.section .fail,"ax"
fail:
 mov x0,#99
 mov x8,#93
 svc #0
.section .fixture,"aw"
.incbin "{t/'fixture.bin'}"
.section .writer,"ax"
.incbin "{t/'writer.bin'}"
.section .pool,"ax"
.incbin "{t/'pool.bin'}"
.section .exit_write,"ax"
.incbin "{t/'exit_write.bin'}"
.section .exit_read,"ax"
.incbin "{t/'exit_read.bin'}"
''')
        (t/'link.ld').write_text('''ENTRY(_start)
native_exit_write = 0x670488; native_exit_read = 0x684480; resume_push = 0x7734d4;
SECTIONS {
 . = 0x500000; .text : { *(.text) }
 . = 0x501000; .unlock_observer : { *(.unlock_observer) }
 . = 0x501100; .push_observer : { *(.push_observer) }
 . = 0x501300; .fail : { *(.fail) }
 . = 0x600000; .fixture : { *(.fixture) }
 . = 0x670488; .exit_write : { *(.exit_write) }
 . = 0x684480; .exit_read : { *(.exit_read) }
 . = 0x76b3a8; .publish : { *(.publish) }
 . = 0x76b4d0; .occupancy : { *(.occupancy) }
 . = 0x76c218; .range : { *(.range) }
 . = 0x7734d0; .pool : { *(.pool) }
 . = 0x7745f8; .writer : { *(.writer) }
 . = 0x232cad0; .sleep : { *(.sleep) }
 /DISCARD/ : { *(.comment) *(.note*) }
}''')
        subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')],check=True,timeout=30)
        subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')],check=True,timeout=30)
        run=subprocess.run(['qemu-aarch64-static',str(t/'probe')],capture_output=True,timeout=10,
            cwd=t,preexec_fn=lambda:resource.setrlimit(resource.RLIMIT_CORE,(0,0)))
        assert run.returncode==0 and len(run.stdout)==SIZE,(name,run.returncode,len(run.stdout),run.stderr)
        changes=[hex(BASE+i) for i,(a,z) in enumerate(zip(run.stdout,expected)) if a!=z]
        assert not changes,(name,changes[:30])
        results.append(dict(case=name,initial_lock=initial,release_wait_calls=list(releases),
            sleep_calls=waits,cluster_retired=success,whole_fixture_matched=True,passed=True))
out=dict(scope=__doc__,firmware_sha256=sha,tests=len(results),results=results,
         source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
path=HERE/'pcm-pool-live/cluster-writer-oracle.json'
path.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(dict(tests=len(results),passed=True,output=str(path))))
