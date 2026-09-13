"""Original AZ onPageFilled task and PositionWithSourceInfo destruction.

Initialized type guards, valid source-reference tags and controlled fixtures;
source last-reference disposal is observed, not executed. No real PCM return,
queue, decoder, allocator free, diagnostic failure or concurrency is simulated.
"""
import hashlib, importlib.util, json, resource, struct, subprocess, tempfile
from pathlib import Path
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('helpers',HERE/'cdj-render-compare/helpers.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
e=m.ELF('az');sha=hashlib.sha256(e.d).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
BASE,SIZE=0x4000000,0x8000
SOURCE,WRAPPER,PCM,POOL,META=BASE+0x200,BASE+0x400,BASE+0x1000,BASE+0x6000,BASE+0x7000
GLOBALS,GSIZE=0x3b48000,0x2000
TYPE=0x12345678;ALLOC=BASE+0x800
# name, source refs (None = null), raw page, error status, initial task counter
cases=[('retained_source_page',2,WRAPPER,0,2),('last_source_page',1,WRAPPER,0,1),
 ('many_source_refs',9,WRAPPER,0,7),('null_source_page',None,WRAPPER,0,1),
 ('retained_source_null_page',2,0,0,1),('last_source_null_page',1,0,0,1),
 ('error_completion_page',2,WRAPPER,5,1),('error_last_source_page',1,WRAPPER,5,1)]
results=[]
with tempfile.TemporaryDirectory(prefix='az-discarded-completion-') as directory:
 t=Path(directory)
 ranges=[(0x76ebf0,0x76ecd0,'task'),(0x759260,0x7593c4,'position'),(0x6b0db8,0x6b0ea4,'release')]
 for a,z,n in ranges:(t/(n+'.bin')).write_bytes(e.read(a,z-a))
 for name,refs,page,error,count in cases:
  b=bytearray((i*17+31)&255 for i in range(SIZE));g=bytearray(GSIZE)
  def put(addr,fmt,*values):struct.pack_into(fmt,b,addr-BASE,*values)
  put(BASE,'Q',0x25f8d78);put(BASE+8,'I',0x76543210)
  put(BASE+0x20,'Q',0x25eb320);put(BASE+0x40,'I',TYPE)
  put(BASE+0x48,'Q',SOURCE if refs is not None else 0)
  put(BASE+0x50,'II',error,0);put(BASE+0x60,'Q',page)
  put(SOURCE+0xc,'II',refs or 0,0x52434f58);put(SOURCE+0x18,'Q',ALLOC)
  put(WRAPPER,'QQ',PCM+8,1764)
  b[PCM-BASE:PCM-BASE+8]=bytes([0xaf])*8
  b[PCM-BASE+14120:PCM-BASE+14128]=bytes([0xef])*8
  b[META-BASE:]=bytes(SIZE-(META-BASE))
  g[0xd68]=1;struct.pack_into('<I',g,0xd70,TYPE)
  g[0x13c0]=1;struct.pack_into('<I',g,0x13c8,count)
  expected=bytearray(b);eg=bytearray(g)
  struct.pack_into('<I',expected,8,0);struct.pack_into('<I',expected,0x40,0)
  struct.pack_into('<I',eg,0x13c8,count-1)
  if refs is not None:struct.pack_into('<I',expected,SOURCE-BASE+0xc,refs-1)
  if refs==1:
   struct.pack_into('<Q',expected,META-BASE,1)
   struct.pack_into('<QQQQ',expected,META-BASE+8,ALLOC,SOURCE,0,page)
  (t/'fixture.bin').write_bytes(b);(t/'globals.bin').write_bytes(g)
  asm=f'''.text
.global _start
_start:
 ldr x0,={BASE}
 ldr x1,=0x76ebf0
 blr x1
 mov x0,#1
 ldr x1,={BASE}
 ldr x2,={SIZE}
 mov x8,#64
 svc #0
 mov x0,#1
 ldr x1,={GLOBALS}
 ldr x2,={GSIZE}
 mov x8,#64
 svc #0
 mov x0,#0
 mov x8,#93
 svc #0
.section .dispose,"ax"
 ldr x9,={META}
 mov x10,#1
 str x10,[x9]
 stp x0,x1,[x9,#8]
 ldr w10,[x1,#0xc]
 ldr x11,={BASE}
 ldr x11,[x11,#0x60]
 stp x10,x11,[x9,#24]
 ret
'''
  for a,z,n in ranges:asm+=f'.section .{n},"ax"\n.incbin "{t/(n+".bin")}"\n'
  asm+=f'.section .fixture,"aw"\n.incbin "{t/"fixture.bin"}"\n.section .globals,"aw"\n.incbin "{t/"globals.bin"}"\n'
  (t/'probe.S').write_text(asm)
  layout=[(0x500000,'text'),(0x22043f0,'dispose'),(GLOBALS,'globals'),(BASE,'fixture')]+[(a,n) for a,z,n in ranges]
  (t/'link.ld').write_text('ENTRY(_start)\nSECTIONS {\n'+''.join(f'. = {hex(a)}; .{n} : {{ *(.{n}) }}\n' for a,n in sorted(layout))+' /DISCARD/ : { *(.comment) *(.note*) }\n}')
  subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')],check=True,timeout=30)
  subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')],check=True,timeout=30)
  r=subprocess.run(['qemu-aarch64-static',str(t/'probe')],capture_output=True,cwd=t,timeout=10,preexec_fn=lambda:resource.setrlimit(resource.RLIMIT_CORE,(0,0)))
  assert r.returncode==0 and len(r.stdout)==SIZE+GSIZE,(name,r.returncode,len(r.stdout),r.stderr)
  exp=expected+eg;diff=[hex(i) for i,(a,z) in enumerate(zip(r.stdout,exp)) if a!=z]
  assert not diff,(name,diff[:30])
  results.append(dict(case=name,source_refs_before=refs,source_dispose_observed=refs==1,raw_page_unchanged=True,payload_and_guards_unchanged=True,whole_fixture_and_globals_matched=True,passed=True))
p=HERE/'pcm-pool-live/discarded-completion-oracle.json'
p.write_text(json.dumps(dict(scope=__doc__,firmware_sha256=sha,source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),tests=len(results),results=results),indent=2)+'\n')
print(json.dumps(dict(tests=len(results),passed=True,output=str(p))))
