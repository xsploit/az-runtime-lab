#!/usr/bin/env python3
"""Compare original EQ/equalizer control callbacks against independent reconstruction."""
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

ranges=[('native_eq_volume',0xb9d88,0xb9de4),('native_eq_execute',0xb97c8,0xb9d14),('native_eq_reset',0xb9d14,0xb9d50)]
asm='.syntax unified\n.arm\n.fpu neon\n.text\n'
for name,start,end in ranges:
 code=extract(start,end);fname='native-equalizer-'+name+'.bin';(here/fname).write_bytes(code);asm+='.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n{name}:\n';pos=0
 for offset in range(0,len(code),4):
  word=struct.unpack_from('<I',code,offset)[0];replacement=None
  if word==0x425650:replacement='.word native_equalizer_tables'
  elif word==0x426a50:replacement='.word native_equalizer_tables+5120'
  elif word&0xff000000==0xeb000000:
   imm=word&0xffffff
   if imm&0x800000:imm-=0x1000000
   target=start+offset+8+imm*4
   if not start<=target<end:
    assert target==0xf108,(hex(start+offset),hex(target));replacement='bl __aeabi_idivmod'
  if replacement:
   if offset>pos:asm+=f'.incbin "{fname}",{pos},{offset-pos}\n'
   asm+=replacement+'\n';pos=offset+4
 if pos<len(code):asm+=f'.incbin "{fname}",{pos},{len(code)-pos}\n'
(here/'native-equalizer-tables.bin').write_bytes(extract(0x425650,0x429250))
asm+='.balign 8\n.global native_equalizer_tables\nnative_equalizer_tables:\n.incbin "native-equalizer-tables.bin"\n.section .note.GNU-stack,"",%progbits\n';(here/'equalizer-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['eq_control.c','equalizer.c','equalizer_compare.c','../../mixer/cfx_filter.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'equalizer-native.S','native.S','-lm','-o','equalizer-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','equalizer-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','equalizer-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./equalizer-arm']),('host',['./equalizer-host']),('sanitized',['./equalizer-host-asan'])]:
 r=subprocess.run([*cmd,'native-equalizer-records.bin','native-equalizer-tables.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results,'scope':'Native Equalizer execute, volume and assignReset composite: output, three IIR histories/coefficients, two padded scratch buffers, cached indices and complete index ramp states. Constructor fixture inferred; native constructor and channel mode transitions pending.'};(here/'equalizer-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
