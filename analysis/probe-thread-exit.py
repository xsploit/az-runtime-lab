"""Execute original AZ thread entry and existing-node TLS lookup under QEMU.

Thread run, owner acquisition, startup wait, naming, affinity and destruction
are controlled substitutes. No real thread, cancellation or queue runs here.
Full fixtures and callback-time handle observations check normal-path ordering.
"""
import hashlib, importlib.util, json, resource, struct, subprocess, tempfile
from pathlib import Path
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('helpers',HERE/'cdj-render-compare/helpers.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
e=m.ELF('az');sha=hashlib.sha256(e.d).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
BASE,SIZE=0x600000,0x4000
OWNER,NODE,NAME,TVT,OVT,META=BASE+0x400,BASE+0x500,BASE+0x600,BASE+0x700,BASE+0x800,BASE+0x1000
IDENT=0xaaaabbbbccccdddd;HANDLE=0x1111222233334444
# name, startup wait result, self-delete flag, acquired owner refs, name/affinity
cases=[('normal',1,0,2,0,0),('last_owner_ref',1,0,1,0,0),
 ('self_delete',1,1,2,0,0),('self_delete_last_ref',1,1,1,0,0),
 ('startup_wait_false',0,0,2,0,0),('named_affinity',1,0,2,1,1),
 ('wait_false_self_delete',0,1,1,0,0)]
results=[]
with tempfile.TemporaryDirectory(prefix='az-thread-exit-') as directory:
 t=Path(directory)
 ranges=[(0x2347340,0x23474e8,'entry'),(0x2375330,0x2375414,'tls')]
 for a,z,n in ranges:(t/(n+'.bin')).write_bytes(e.read(a,z-a))
 for name,wait,delete,refs,named,affinity in cases:
  b=bytearray(SIZE)
  def put(addr,fmt,*values):struct.pack_into(fmt,b,addr-BASE,*values)
  put(BASE,'QQQQ',TVT,NAME,HANDLE,IDENT)
  put(BASE+0x130,'I',affinity);put(BASE+0x134,'B',delete)
  put(OWNER,'QI',OVT,refs);put(OWNER+0x10,'Q',NODE)
  put(NODE,'QQQ',IDENT,0,0);put(NAME,'B',named)
  put(TVT+8,'QQ',0x502000,0x503000);put(OVT+8,'Q',0x504000)
  expected=bytearray(b);events=[]
  def event(tag,arg,live=True):events.append((tag,arg,HANDLE if live else 0,IDENT if live else 0))
  if named:event(1,NAME)
  event(2,10000)
  if wait:
   if affinity:event(3,affinity)
   event(4,BASE)
  if delete:event(5,BASE,False)
  if refs==1:event(6,OWNER,False)
  struct.pack_into('<QQ',expected,0x10,0,0)
  struct.pack_into('<I',expected,OWNER-BASE+8,refs-1)
  struct.pack_into('<Q',expected,NODE-BASE,0)
  struct.pack_into('<Q',expected,NODE-BASE+16,BASE)
  struct.pack_into('<QQ',expected,META-BASE,len(events),0)
  for i,v in enumerate(events):struct.pack_into('<QQQQ',expected,META-BASE+0x100+i*32,*v)
  (t/'fixture.bin').write_bytes(b)
  stubs={
   'self':f'ldr x0,={IDENT}\n ret',
   'acquire':f'ldr x9,={OWNER}\n str x9,[x8]\n ret',
   'name':'mov x0,x1\n mov x9,#1\n b record',
   'wait':f'stp x29,x30,[sp,#-16]!\n mov w0,w1\n mov x9,#2\n bl record\n mov x0,#{wait}\n ldp x29,x30,[sp],#16\n ret',
   'affinity':'mov x9,#3\n b record',
   'run':'mov x9,#4\n b record',
   'delete_thread':'mov x9,#5\n b record',
   'delete_owner':'mov x9,#6\n b record'}
  asm=f'''.text
.global _start
_start:
 ldr x0,={BASE}
 ldr x1,=0x23474d0
 blr x1
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
 add x12,x12,x11,lsl #5
 stp x9,x0,[x12]
 ldr x13,={BASE}
 ldp x14,x15,[x13,#0x10]
 stp x14,x15,[x12,#16]
 add x11,x11,#1
 str x11,[x10]
 mov x0,#0
 ret
'''
  for n,s in stubs.items():asm+=f'.section .{n},"ax"\n{s}\n'
  for a,z,n in ranges:asm+=f'.section .{n},"ax"\n.incbin "{t/(n+".bin")}"\n'
  asm+=f'.section .fixture,"aw"\n.incbin "{t/"fixture.bin"}"\n'
  (t/'probe.S').write_text(asm)
  layout=[(0x423e50,'self'),(0x424730,'name'),(0x500000,'text'),(0x501000,'record'),
   (0x502000,'delete_thread'),(0x503000,'run'),(0x504000,'delete_owner'),(BASE,'fixture'),
   (0x232c2b0,'wait'),(0x232dc70,'affinity'),(0x2335890,'acquire')]+[(a,n) for a,z,n in ranges]
  (t/'link.ld').write_text('ENTRY(_start)\nSECTIONS {\n'+''.join(f'. = {hex(a)}; .{n} : {{ *(.{n}) }}\n' for a,n in sorted(layout))+' /DISCARD/ : { *(.comment) *(.note*) }\n}')
  subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')],check=True,timeout=30)
  subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')],check=True,timeout=30)
  r=subprocess.run(['qemu-aarch64-static',str(t/'probe')],capture_output=True,cwd=t,timeout=10,preexec_fn=lambda:resource.setrlimit(resource.RLIMIT_CORE,(0,0)))
  assert r.returncode==0 and len(r.stdout)==SIZE,(name,r.returncode,len(r.stdout),r.stderr)
  diff=[hex(BASE+i) for i,(a,z) in enumerate(zip(r.stdout,expected)) if a!=z]
  assert not diff,(name,diff[:30])
  results.append(dict(case=name,run_called=bool(wait),self_delete=bool(delete),owner_refs=refs,whole_fixture_matched=True,passed=True))
p=HERE/'pcm-pool-live/thread-exit-oracle.json'
p.write_text(json.dumps(dict(scope=__doc__,firmware_sha256=sha,source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),tests=len(results),results=results),indent=2)+'\n')
print(json.dumps(dict(tests=len(results),passed=True,output=str(p))))
