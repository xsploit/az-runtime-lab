from pathlib import Path
import hashlib,json,struct,subprocess
here=Path(__file__).resolve().parent;root=here.parents[2]
d=(root/'rx3-research/pi-runtime/rbp').read_bytes();digest=hashlib.sha256(d).hexdigest()
assert digest=='60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09'
h=struct.unpack_from('<16sHHIIIIIHHHHHH',d)
def extract(a,z):
 for i in range(h[10]):
  t,o,v,_,size,_,_,_=struct.unpack_from('<IIIIIIII',d,h[5]+i*h[9])
  if t==1 and v<=a<z<=v+size:return d[o+a-v:o+z-v]
 raise ValueError('Unmapped code')
a,z=0x5aa28,0x5ad4c;code=extract(a,z)
(here/'native-ctor.bin').write_bytes(code);(here/'native-base.bin').write_bytes(extract(0x59ec0,0x59ee0))
asm='.syntax unified\n.arm\n.fpu neon\n.text\n.balign 8\n.global native_ctor\n.type native_ctor,%function\nnative_ctor:\n';last=0;relocs=[]
for off in range(0,0x2e0,4):
 ins=struct.unpack_from('<I',code,off)[0]
 if ins>>24!=0xeb:continue
 imm=(ins&0xffffff);imm=imm-(1<<24) if imm&(1<<23) else imm
 dest=a+off+8+imm*4
 if dest==0x59ec0:target='native_base'
 elif dest in (0x3b1188,0x3b0d70):target='fixture_string'
 else:target='fixture_exception'
 asm+=f'.incbin "native-ctor.bin",{last},{off-last}\nbl {target}\n';last=off+4;relocs.append({'address':hex(a+off),'original':hex(dest),'target':target})
asm+=f'.incbin "native-ctor.bin",{last}\n.balign 4\nnative_base:\n.incbin "native-base.bin"\n.section .note.GNU-stack,"",%progbits\n';(here/'native-ctor.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
commands=[[str(root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp','ctor_compare.c','setters.c','native-ctor.S','-o','ctor-arm'],['cc',*flags,'-DHOST_REPLAY','ctor_compare.c','setters.c','-o','ctor-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','ctor_compare.c','setters.c','-o','ctor-sanitized']]
for c in commands:subprocess.run(c,cwd=here,check=True)
results={}
for name,cmd in [('arm',['qemu-arm-static','./ctor-arm']),('host',['./ctor-host']),('sanitized',['./ctor-sanitized'])]:
 p=subprocess.run([*cmd,'ctor-records.bin'],cwd=here,capture_output=True,text=True);results[name]={'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
(here/'ctor-results.json').write_text(json.dumps({'firmware_sha256':digest,'relocations':relocs,'scope':'Native constructor with original base constructor; temporary string bookkeeping stubbed, exceptions abort','results':results},indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(v['returncode'] for v in results.values()))
