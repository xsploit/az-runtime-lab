"""Original AZ TrashBox push and lifetime guard acquisition under QEMU.

Controls guard lifetime, valid TrashBox token, sequential tagged nodes and
nonnull virtual-deletion targets. Allocation, notification and deleting virtual
calls are observers; actual source-specific destruction and concurrency omitted.
"""
import hashlib, importlib.util, json, resource, struct, subprocess, tempfile
from pathlib import Path
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('helpers',HERE/'cdj-render-compare/helpers.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
e=m.ELF('az');sha=hashlib.sha256(e.d).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
BASE,SIZE=0x4000000,0x8000
GATE,HEAD,FREE,ALLOC,SOURCE,VT,META=[BASE+v for v in [0x800,0x1000,0x2000,0x3000,0x4000,0x5000,0x7000]]
GLOBALS,GSIZE=0x3bd5000,0x2000
TYPE=0x12345678
cases=[('guard_absent',None,True,False),('guard_closing',-1,True,False),
 ('guard_other_negative',-2,True,False),('deferred_spare',3,True,False),
 ('deferred_allocated',3,False,False),('guard_zero_active',0,True,False),
 ('null_source_guard_absent',None,True,True),('null_source_guard_active',3,True,True)]
def tag(p,n):return p | n<<48
results=[]
with tempfile.TemporaryDirectory(prefix='az-source-disposal-') as directory:
 t=Path(directory)
 ranges=[(0x218d5e0,0x218d640,'guard'),(0x22043f0,0x2204d94,'push')]
 for a,z,n in ranges:(t/(n+'.bin')).write_bytes(e.read(a,z-a))
 for name,count,spare,null in cases:
  b=bytearray(SIZE);g=bytearray(GSIZE)
  def put(a,fmt,*v):struct.pack_into(fmt,b,a-BASE,*v)
  put(BASE+8,'I',TYPE);put(BASE+0x10,'Q',HEAD)
  put(BASE+0x50,'Q',tag(HEAD,5));put(BASE+0x90,'Q',tag(FREE if spare else 0,7))
  put(HEAD,'Q',tag(0,3));put(FREE,'Q',tag(0,2))
  put(GATE+0x28,'i',count or 0);put(SOURCE,'Q',VT);put(VT+8,'Q',0x501000)
  struct.pack_into('<Q',g,0xd70,GATE if count is not None else 0)
  g[0x1e50]=1;struct.pack_into('<I',g,0x1e58,TYPE)
  expected=bytearray(b);active=count is not None and count>=0;events=[]
  if not null:
   if active:
    node=FREE if spare else ALLOC
    if spare:struct.pack_into('<Q',expected,0x90,tag(0,8))
    else:events.append((3,64,count+1))
    struct.pack_into('<QQ',expected,node-BASE,tag(0,3 if spare else 1),SOURCE)
    struct.pack_into('<Q',expected,HEAD-BASE,tag(node,4))
    struct.pack_into('<Q',expected,0x50,tag(node,6))
    events.append((2,BASE,count+1))
   else:events.append((1,SOURCE,count or 0))
  result=not(active and null)
  struct.pack_into('<QQ',expected,META-BASE,len(events),result)
  for i,(k,a,c) in enumerate(events):struct.pack_into('<QQq',expected,META-BASE+0x100+i*24,k,a,c)
  (t/'fixture.bin').write_bytes(b);(t/'globals.bin').write_bytes(g)
  asm=f'''.text
.global _start
_start:
 ldr x0,={BASE}
 ldr x1,={0 if null else SOURCE}
 ldr x2,=0x22043f0
 blr x2
 ldr x1,={META}
 str x0,[x1,#8]
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
.section .record,"ax"
record:
 ldr x10,={META}
 ldr x11,[x10]
 mov x12,#24
 mul x12,x11,x12
 add x12,x12,#0x100
 add x12,x12,x10
 stp x9,x0,[x12]
 ldr x13,={GATE}
 ldrsw x13,[x13,#0x28]
 str x13,[x12,#16]
 add x11,x11,#1
 str x11,[x10]
 ret
.section .delete,"ax"
 mov x9,#1
 b record
.section .notify,"ax"
 mov x9,#2
 b record
.section .alloc,"ax"
 stp x29,x30,[sp,#-16]!
 mov x9,#3
 bl record
 ldr x0,={ALLOC}
 ldp x29,x30,[sp],#16
 ret
'''
  for a,z,n in ranges:asm+=f'.section .{n},"ax"\n.incbin "{t/(n+".bin")}"\n'
  asm+=f'.section .fixture,"aw"\n.incbin "{t/"fixture.bin"}"\n.section .globals,"aw"\n.incbin "{t/"globals.bin"}"\n'
  (t/'probe.S').write_text(asm)
  layout=[(0x424d40,'alloc'),(0x500000,'text'),(0x501000,'delete'),(0x502000,'record'),(0x22040e0,'notify'),(GLOBALS,'globals'),(BASE,'fixture')]+[(a,n) for a,z,n in ranges]
  (t/'link.ld').write_text('ENTRY(_start)\nSECTIONS {\n'+''.join(f'. = {hex(a)}; .{n} : {{ *(.{n}) }}\n' for a,n in sorted(layout))+' /DISCARD/ : { *(.comment) *(.note*) }\n}')
  subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')],check=True,timeout=30)
  subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')],check=True,timeout=30)
  r=subprocess.run(['qemu-aarch64-static',str(t/'probe')],capture_output=True,cwd=t,timeout=10,preexec_fn=lambda:resource.setrlimit(resource.RLIMIT_CORE,(0,0)))
  assert r.returncode==0 and len(r.stdout)==SIZE+GSIZE,(name,r.returncode,len(r.stdout),r.stderr)
  diff=[hex(i) for i,(a,z) in enumerate(zip(r.stdout,expected+g)) if a!=z]
  assert not diff,(name,diff[:30])
  results.append(dict(case=name,lifetime_count=count,deferred=active and not null,immediate_delete_observed=not active and not null,returned=result,whole_fixture_and_globals_matched=True,passed=True))
p=HERE/'pcm-pool-live/source-disposal-oracle.json'
p.write_text(json.dumps(dict(scope=__doc__,firmware_sha256=sha,source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),tests=len(results),results=results),indent=2)+'\n')
print(json.dumps(dict(tests=len(results),passed=True,output=str(p))))
