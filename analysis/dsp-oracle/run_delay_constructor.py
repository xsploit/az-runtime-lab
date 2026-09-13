import hashlib,json,struct,subprocess
from pathlib import Path
b=Path(__file__).resolve().parent;root=b.parents[2]
d=(root/'rx3-research/pi-runtime/rbp').read_bytes();assert hashlib.sha256(d).hexdigest()=='60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09'
h=struct.unpack_from('<16sHHIIIIIHHHHHH',d);start,end=0xb6928,0xb6cc0
for i in range(h[10]):
 t,o,v,_,sz,_,_,_=struct.unpack_from('<IIIIIIII',d,h[5]+i*h[9])
 if t==1 and v<=start<end<=v+sz:code=d[o+start-v:o+end-v];break
(b/'native-delay-constructor.bin').write_bytes(code)
targets={0x3b1188:'fixture_string',0x3b0d70:'fixture_destroy',0xe328:'fixture_allocate',0xeebc:'fixture_cleanup'}
asm='.syntax unified\n.arm\n.fpu neon\n.text\n.balign 8\n.global delay_constructor\n.type delay_constructor,%function\ndelay_constructor:\n';pos=0;rel=[]
for off in range(0,len(code),4):
 addr=start+off;word=struct.unpack_from('<I',code,off)[0];replacement=None
 if addr==0xb6ca4:replacement='.word fixture_rate'
 elif word&0x0f000000==0x0b000000:
  imm=word&0xffffff
  if imm&0x800000:imm-=0x1000000
  target=addr+8+imm*4
  if start<=target<end:continue
  assert target in targets and word>>28==14,(hex(addr),hex(target))
  replacement='bl '+targets[target]
 if replacement:
  asm+=f'.incbin "native-delay-constructor.bin",{pos},{off-pos}\n{replacement}\n';pos=off+4;rel.append([hex(addr),replacement])
asm+=f'.incbin "native-delay-constructor.bin",{pos},{len(code)-pos}\n.section .note.GNU-stack,"",%progbits\n';(b/'delay-constructor-native.S').write_text(asm)
cmd=[str(root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'),'-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-static','-mfpu=neon','-mfloat-abi=softfp','delay_constructor_probe.c','delay-constructor-native.S','-lm','-o','delay-constructor-arm']
subprocess.run(cmd,cwd=b,check=True)
p=subprocess.run(['qemu-arm-static','./delay-constructor-arm'],cwd=b,capture_output=True,text=True)
report={'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr,'native_sha256':hashlib.sha256(code).hexdigest(),'relocations':rel}
(b/'delay-constructor-results.json').write_text(json.dumps(report,indent=2)+'\n');print(p.stdout,p.stderr);raise SystemExit(p.returncode)
