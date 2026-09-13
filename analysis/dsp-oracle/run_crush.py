#!/usr/bin/env python3
"""Run real Echo/quantize routines against explicit player-state fixtures."""
import hashlib,json,pathlib,struct,subprocess
here=pathlib.Path(__file__).resolve().parent;root=here.parents[2]
data=(root/'rx3-research/pi-runtime/rbp').read_bytes();sha=hashlib.sha256(data).hexdigest()
assert sha=='60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09'
h=struct.unpack_from('<16sHHIIIIIHHHHHH',data)
def extract(start,end):
 for i in range(h[10]):
  t,o,v,_,sz,_,_,_=struct.unpack_from('<IIIIIIII',data,h[5]+i*h[9])
  if t==1 and v<=start<end<=v+sz:return data[o+start-v:o+end-v]
 raise RuntimeError('unmapped code')

ranges=[('native_crush_color',0xcbd38,0xcbd6c),('native_crush_parameter',0xcbd6c,0xcbe38),('native_crush_core',0xcbedc,0xcc7d0)]
asm='.syntax unified\n.arm\n.fpu neon\n.text\n'
for name,start,end in ranges:
 code=extract(start,end);fname='native-crush-'+name+'.bin';(here/fname).write_bytes(code)
 asm+='.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n.type {name},%function\n{name}:\n';pos=0
 for off in range(0,len(code),4):
  word=struct.unpack_from('<I',code,off)[0];addr=start+off;replacement=None
  if addr==0xcc6e4:replacement='.word crush_tmp'
  elif word&0xff000000==0xeb000000:
   imm=word&0xffffff
   if imm&0x800000:imm-=0x1000000
   target=addr+8+imm*4
   if start<=target<end:continue
   assert target==0xf2e8,(hex(addr),hex(target));replacement='bl powf'
  if replacement:
   if off>pos:asm+=f'.incbin "{fname}",{pos},{off-pos}\n'
   asm+=replacement+'\n';pos=off+4
 if pos<len(code):asm+=f'.incbin "{fname}",{pos},{len(code)-pos}\n'
for name,addr in [('init',0xcc144),('execute',0xcc30c)]:asm+=f'.global native_crush_{name}\n.set native_crush_{name},native_crush_core+{addr-0xcbedc}\n'
asm+='.bss\n.balign 8\ncrush_tmp:.space 512\n.section .note.GNU-stack,"",%progbits\n';(here/'crush-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
files=['crush.c','crush_compare.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'crush-native.S','-lm','-o','crush-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','crush-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','crush-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./crush-arm']),('host',['./crush-host']),('sanitized',['./crush-host-asan'])]:
 r=subprocess.run([*cmd,'native-crush-records.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results};(here/'crush-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
