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

ranges=[('native_dub_audio_inner',0xcc980,0xcccfc),('native_dub_init',0xcccfc,0xcda4c),('native_dub_delay',0x9c1d0,0x9c2cc)]
asm='.syntax unified\n.arm\n.fpu neon\n.text\n'
external={0xcc980:'native_dub_audio_inner',0xf06c:'dub_free',0xeaa8:'dub_alloc',0xeebc:'abort',0x9c1d0:'native_dub_delay',0x9c250:'native_dub_read',0x9c2a8:'native_dub_read_one'}
for name,start,end in ranges:
 code=extract(start,end);fname='native-dubecho-'+name+'.bin';(here/fname).write_bytes(code);asm+='.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n{name}:\n';pos=0
 for offset in range(0,len(code),4):
  address=start+offset;word=struct.unpack_from('<I',code,offset)[0];replacement=None
  if address in [0xcd1e0,0xcd9b4]:replacement='.word dub_ones'
  elif word&0xff000000==0xeb000000:
   imm=word&0xffffff
   if imm&0x800000:imm-=0x1000000
   target=address+8+imm*4
   if start<=target<end:continue
   assert target in external,(hex(address),hex(target))
   replacement='bl '+external[target]
  if replacement:
   if offset>pos:asm+=f'.incbin "{fname}",{pos},{offset-pos}\n'
   asm+=replacement+'\n';pos=offset+4
 if pos<len(code):asm+=f'.incbin "{fname}",{pos},{len(code)-pos}\n'
for name,base,offset in [('execute','init',0xc8),('read','delay',0x80),('read_one','delay',0xd8)]:asm+=f'.global native_dub_{name}\n.set native_dub_{name},native_dub_{base}+{offset}\n'
asm+='.balign 8\ndub_ones:.float 1,1\n.global dub_coefficients\ndub_coefficients:\n'
for i,address in enumerate([0x42d8e0,0x42d8f8,0x42d910,0x42d928]):
 fname=f'native-dubecho-coeff-{i}.bin';(here/fname).write_bytes(extract(address,address+20));asm+=f'.incbin "{fname}"\n'
asm+='.section .note.GNU-stack,"",%progbits\n';(here/'dubecho-audio-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['dubecho.c','dubecho_audio.c','dubecho_audio_compare.c','iir_reconstructed.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'dubecho-audio-native.S','native.S','-lm','-o','dubecho-audio-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','dubecho-audio-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','dubecho-audio-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./dubecho-audio-arm']),('host',['./dubecho-audio-host']),('sanitized',['./dubecho-audio-host-asan'])]:
 r=subprocess.run([*cmd,'native-dubecho-audio-records.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results,'scope':'Dub Echo audio/state/ring/IIR original comparison; outer manager pending.'};(here/'dubecho-audio-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
