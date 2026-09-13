"""Original AZ task queue enqueue wrapper and tagged-node push under QEMU.

Tests sequential fixtures, spare-node exhaustion/allocation and lagging-tail
helping. Does not test allocator exceptions, live contention or queue shutdown.
The wrapper returns task IDs, including synthetic ID zero after a successful push.
"""
import hashlib, importlib.util, json, resource, struct, subprocess, tempfile
from pathlib import Path
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('helpers',HERE/'cdj-render-compare/helpers.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
e=m.ELF('az');sha=hashlib.sha256(e.d).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
BASE,SIZE=0x600000,0x8000
HEAD,FREE,NEXT,EXISTING,ALLOC,TASK,META= [BASE+o for o in [0x1000,0x2000,0x3000,0x4000,0x5000,0x6000,0x7000]]
def tagged(ptr,tag):return ptr | ((tag & 65535)<<48)
cases=[('spare_node',True,False,False,123,False,False),
 ('spare_chain',True,True,False,123,False,False),
 ('allocate_when_spares_empty',False,False,False,123,False,False),
 ('help_lagging_tail',True,False,True,123,False,False),
 ('allocate_and_help',False,False,True,123,False,False),
 ('tag_wrap',True,False,False,123,True,False),
 ('high_task_id',True,False,False,0xfedcba9876543210,False,False),
 ('zero_task_id',True,False,False,0,False,False),
 ('null_task',True,False,False,123,False,True)]
results=[]
with tempfile.TemporaryDirectory(prefix='az-task-enqueue-') as directory:
 t=Path(directory)
 ranges=[(0x220c820,0x220c914,'wrapper'),(0x22122d0,0x221245c,'push')]
 for a,z,n in ranges:(t/(n+'.bin')).write_bytes(e.read(a,z-a))
 for name,spare,chain,help_tail,tid,wrap,null_task in cases:
  b=bytearray(SIZE)
  def put(addr,fmt,*values):struct.pack_into(fmt,b,addr-BASE,*values)
  tag=65535 if wrap else 3;ftag=65535 if wrap else 7;ttag=65535 if wrap else 5
  put(BASE+0x38,'Q',tagged(HEAD,1))
  put(BASE+0x78,'Q',tagged(HEAD,ttag))
  put(BASE+0xb8,'Q',tagged(FREE if spare else 0,ftag))
  put(HEAD,'Q',tagged(EXISTING if help_tail else 0,tag))
  put(EXISTING,'QQ',tagged(0,9),TASK+0x100)
  put(FREE,'Q',tagged(NEXT if chain else 0,2))
  put(TASK+0x10,'Q',tid)
  expected=bytearray(b)
  def exp(addr,fmt,*values):struct.pack_into(fmt,expected,addr-BASE,*values)
  exp(META+8,'Q',0 if null_task else tid)
  if not null_task:
   node=FREE if spare else ALLOC
   if spare:exp(BASE+0xb8,'Q',tagged(NEXT if chain else 0,ftag+1))
   else:exp(META,'Q',64)
   exp(node,'QQ',tagged(0,3 if spare else 1),TASK)
   exp(EXISTING if help_tail else HEAD,'Q',tagged(node,10 if help_tail else tag+1))
   exp(BASE+0x78,'Q',tagged(node,ttag+(2 if help_tail else 1)))
  (t/'fixture.bin').write_bytes(b)
  asm=f'''.text
.global _start
_start:
 ldr x0,={BASE}
 ldr x1,={0 if null_task else TASK}
 ldr x2,=0x220c820
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
.section .alloc,"ax"
 ldr x9,={META}
 str x0,[x9]
 ldr x0,={ALLOC}
 ret
'''
  for a,z,n in ranges:asm+=f'.section .{n},"ax"\n.incbin "{t/(n+".bin")}"\n'
  asm+=f'.section .fixture,"aw"\n.incbin "{t/"fixture.bin"}"\n'
  (t/'probe.S').write_text(asm)
  layout=[(0x424d40,'alloc'),(0x500000,'text'),(BASE,'fixture')]+[(a,n) for a,z,n in ranges]
  (t/'link.ld').write_text('ENTRY(_start)\nSECTIONS {\n'+''.join(f'. = {hex(a)}; .{n} : {{ *(.{n}) }}\n' for a,n in sorted(layout))+' /DISCARD/ : { *(.comment) *(.note*) }\n}')
  subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')],check=True,timeout=30)
  subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')],check=True,timeout=30)
  r=subprocess.run(['qemu-aarch64-static',str(t/'probe')],capture_output=True,cwd=t,timeout=10,preexec_fn=lambda:resource.setrlimit(resource.RLIMIT_CORE,(0,0)))
  assert r.returncode==0 and len(r.stdout)==SIZE,(name,r.returncode,len(r.stdout),r.stderr)
  diff=[hex(BASE+i) for i,(a,z) in enumerate(zip(r.stdout,expected)) if a!=z]
  assert not diff,(name,diff[:30])
  results.append(dict(case=name,task_id=tid,returned=0 if null_task else tid,queued=not null_task,allocated_bytes=64 if not spare and not null_task else 0,whole_fixture_matched=True,passed=True))
p=HERE/'pcm-pool-live/task-enqueue-oracle.json'
p.write_text(json.dumps(dict(scope=__doc__,firmware_sha256=sha,source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),tests=len(results),results=results),indent=2)+'\n')
print(json.dumps(dict(tests=len(results),passed=True,output=str(p))))
