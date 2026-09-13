"""Original AZ thread-stop control flow with simulated OS and worker events.

Executes stop helper 0x23383f0 and cancellation helper 0x232d830. Mutex, wake,
wait, logging and pthread_cancel are deterministic substitutes. No OS thread is
started or cancelled; this verifies state/return semantics, not safe termination.
"""
import hashlib
import importlib.util
import json
from pathlib import Path
import resource
import struct
import subprocess
import tempfile

HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('elf_helpers',HERE/'cdj-render-compare/helpers.py')
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
elf=module.ELF('az')
sha=hashlib.sha256(elf.d).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
BASE,SIZE,META=0x600000,0x4000,0x601000
HANDLE,IDENTITY=0x1111222233334444,0xaaaabbbbccccdddd
# name, initial handle, timeout, clear during wait, wait return, cancel return
cases=[('already_stopped',0,3000,False,0,0),
       ('cooperative',HANDLE,3000,True,1,0),
       ('timeout',HANDLE,3000,False,0,0),
       ('zero_timeout',HANDLE,0,False,0,0),
       ('negative_timeout_cooperative',HANDLE,-1,True,1,0),
       ('cancel_reports_error',HANDLE,8000,False,0,22),
       ('wait_success_but_handle_live',HANDLE,3000,False,1,0),
       ('wait_false_but_handle_cleared',HANDLE,3000,True,0,0)]
results=[]
with tempfile.TemporaryDirectory(prefix='az-thread-stop-') as directory:
    t=Path(directory)
    (t/'stop.bin').write_bytes(elf.read(0x23383f0,0x100))
    (t/'cancel.bin').write_bytes(elf.read(0x232d830,0x44))
    for name,handle,timeout,clear,wait_result,cancel_result in cases:
        b=bytearray(SIZE)
        struct.pack_into('<QQ',b,0x10,handle,IDENTITY)
        expected=bytearray(b)
        events=[(1,BASE+0x20)] # lock
        forced=bool(handle and not clear)
        if handle:
            struct.pack_into('<I',expected,0x138,1)
            events += [(2,BASE+0x140),(3,BASE+0xb8)]
            if timeout: events.append((4,timeout & 0xffffffff))
            if forced: events += [(5,0),(6,0),(5,1),(7,HANDLE)]
            struct.pack_into('<QQ',expected,0x10,0,0)
        events.append((8,BASE+0x20)) # unlock
        struct.pack_into('<QQ',expected,META-BASE,len(events),int(not forced))
        for i,event in enumerate(events):
            struct.pack_into('<QQ',expected,META-BASE+0x100+i*16,*event)
        (t/'fixture.bin').write_bytes(b)
        simple=[]
        for section,tag in [('lock',1),('signal',2),('wake',3),('log',5),('log_string',6),('unlock',8)]:
            simple.append(f'''.section .{section},"ax"
 mov x9,#{tag}
 {'mov x0,#0' if section=='log_string' else 'nop'}
 b record
''')
        (t/'probe.S').write_text(f'''
.text
.global _start
_start:
 ldr x0,={BASE}
 ldr w1,={timeout & 0xffffffff}
 ldr x2,=0x23383f0
 blr x2
 ldr x1,={META}
 str x0,[x1,#8]
 mov x0,#1
 ldr x1,={BASE}
 ldr x2,={SIZE}
 mov x8,#64
 svc #0
 mov x0,#0
 mov x8,#93
 svc #0
.section .record,"ax"
record:
 ldr x10,={META}
 ldr x11,[x10]
 add x12,x10,#0x100
 add x12,x12,x11,lsl #4
 stp x9,x0,[x12]
 add x11,x11,#1
 str x11,[x10]
 mov x0,#0
 ret
{''.join(simple)}
.section .wait,"ax"
 stp x29,x30,[sp,#-16]!
 mov w0,w1
 mov x9,#4
 bl record
 {f'ldr x9,={BASE}\n stp xzr,xzr,[x9,#0x10]' if clear else 'nop'}
 mov x0,#{wait_result}
 ldp x29,x30,[sp],#16
 ret
.section .os_cancel,"ax"
 stp x29,x30,[sp,#-16]!
 mov x9,#7
 bl record
 mov x0,#{cancel_result}
 ldp x29,x30,[sp],#16
 ret
.section .string_build,"ax"
 ldr x9,=0x312f260
 str x9,[x8]
 ret
.section .fixture,"aw"
.incbin "{t/'fixture.bin'}"
.section .stop,"ax"
.incbin "{t/'stop.bin'}"
.section .cancel,"ax"
.incbin "{t/'cancel.bin'}"
''')
        layout=[(0x425830,'os_cancel'),(0x426a40,'unlock'),(0x426f90,'lock'),
                (0x500000,'text'),(0x501000,'record'),(BASE,'fixture'),
                (0x22006c0,'log'),(0x22fc8b0,'signal'),(0x231ecb0,'wait'),
                (0x232c770,'wake'),(0x232d830,'cancel'),(0x232e4f0,'log_string'),
                (0x23383f0,'stop'),(0x236be60,'string_build')]
        (t/'link.ld').write_text('ENTRY(_start)\nSECTIONS {\n'+''.join(
            f' . = {hex(a)}; .{section} : {{ *(.{section}) }}\n' for a,section in layout)+
            ' /DISCARD/ : { *(.comment) *(.note*) }\n}')
        subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')],check=True,timeout=30)
        subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')],check=True,timeout=30)
        run=subprocess.run(['qemu-aarch64-static',str(t/'probe')],capture_output=True,
            cwd=t,timeout=10,preexec_fn=lambda:resource.setrlimit(resource.RLIMIT_CORE,(0,0)))
        assert run.returncode==0 and len(run.stdout)==SIZE,(name,run.returncode,len(run.stdout),run.stderr)
        diffs=[hex(BASE+i) for i,(a,z) in enumerate(zip(run.stdout,expected)) if a!=z]
        assert not diffs,(name,diffs[:30])
        results.append(dict(case=name,timeout_argument=timeout,forced_cancel=forced,
            wait_return=wait_result,cancel_return=cancel_result,stop_return=not forced,
            whole_fixture_matched=True,passed=True))
out=dict(scope=__doc__,firmware_sha256=sha,tests=len(results),results=results,
         source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
path=HERE/'pcm-pool-live/thread-stop-oracle.json'
path.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(dict(tests=len(results),passed=True,output=str(path))))
