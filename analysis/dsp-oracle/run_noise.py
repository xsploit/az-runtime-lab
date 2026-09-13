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

ranges=[('native_noise_color',0xbc848,0xbc86c),('native_noise_core',0xbca54,0xbd460)]
asm='.syntax unified\n.arm\n.fpu neon\n.text\n'
for name,start,end in ranges:
 code=extract(start,end);fname='native-noise-'+name+'.bin';(here/fname).write_bytes(code)
 asm+='.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n.type {name},%function\n{name}:\n';pos=0
 for off in range(0,len(code),4):
  word=struct.unpack_from('<I',code,off)[0];addr=start+off;replacement=None
  if False:replacement=None
  elif word&0xff000000==0xeb000000:
   imm=word&0xffffff
   if imm&0x800000:imm-=0x1000000
   target=addr+8+imm*4
   if start<=target<end:continue
   assert target in [0xf2e8,0xf06c,0xeaa8,0xeebc],(hex(addr),hex(target));replacement='bl '+('powf' if target==0xf2e8 else 'abort')
  if replacement:
   if off>pos:asm+=f'.incbin "{fname}",{pos},{off-pos}\n'
   asm+=replacement+'\n';pos=off+4
 if pos<len(code):asm+=f'.incbin "{fname}",{pos},{len(code)-pos}\n'
for name,addr in [('init',0xbd050),('execute',0xbd12c),('coeff',0xbcafc)]:asm+=f'.global native_noise_{name}\n.set native_noise_{name},native_noise_core+{addr-0xbca54}\n'
asm+='.section .note.GNU-stack,"",%progbits\n';(here/'noise-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['noise.c','noise_compare.c','iir_reconstructed.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'noise-native.S','native.S','-lm','-o','noise-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','noise-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','noise-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./noise-arm']),('host',['./noise-host']),('sanitized',['./noise-host-asan'])]:
 r=subprocess.run([*cmd,'native-noise-records.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results};(here/'noise-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
