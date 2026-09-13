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

ranges=[('native_space_init',0xbd4d8,0xbd6f0),('native_space_execute',0xbd7d0,0xbea28),('native_space_iir',0x9af98,0x9b17c)]
asm='.syntax unified\n.arm\n.fpu neon\n.text\n'
for name,start,end in ranges:
 code=extract(start,end);fname='native-space-'+name+'.bin';(here/fname).write_bytes(code);asm+='.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n{name}:\n';pos=0
 for offset in range(0,len(code),4):
  address=start+offset;word=struct.unpack_from('<I',code,offset)[0];replacement=None
  if word in [0x42d200,0x42d218,0x42d230,0x42d248]:replacement='.word native_space_coefficients+'+str([0x42d200,0x42d218,0x42d230,0x42d248].index(word)*20)
  elif 0x114b534<=word<=0x114bd38:replacement='.word native_space_scratch+'+str(word-0x114b538)
  elif word&0xff000000==0xeb000000:
   imm=word&0xffffff
   if imm&0x800000:imm-=0x1000000
   target=address+8+imm*4
   if start<=target<end:continue
   assert target==0xf300,(hex(address),hex(target));replacement='bl memcpy'
  if replacement:
   if offset>pos:asm+=f'.incbin "{fname}",{pos},{offset-pos}\n'
   asm+=replacement+'\n';pos=offset+4
 if pos<len(code):asm+=f'.incbin "{fname}",{pos},{len(code)-pos}\n'
for name,address in [('on',0xbd6c8),('off',0xbd6dc)]:asm+=f'.global native_space_{name}\n.set native_space_{name},native_space_init+{address-0xbd4d8}\n'
asm+='.balign 8\n.global native_space_coefficients\nnative_space_coefficients:\n'
for i,address in enumerate([0x42d200,0x42d218,0x42d230,0x42d248]):
 fname=f'native-space-coeff-{i}.bin';(here/fname).write_bytes(extract(address,address+20));asm+=f'.incbin "{fname}"\n'
asm+='.section .note.GNU-stack,"",%progbits\n';(here/'space-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['space.c','space_compare.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'space-native.S','-lm','-o','space-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','space-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','space-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./space-arm']),('host',['./space-host']),('sanitized',['./space-host-asan'])]:
 r=subprocess.run([*cmd,'native-space-records.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results,'scope':'Space complete processor/state/ring/mono-IIR original comparison; manager pending.'};(here/'space-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
