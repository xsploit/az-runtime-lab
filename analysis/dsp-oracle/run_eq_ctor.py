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

ranges=[('native_channel_ctor',0x9df8c,0x9e3a8),('native_eq_ctor',0xba068,0xba33c),('native_iso_ctor',0xba978,0xbae24),('native_eq_iir_ctor',0x9b4d0,0x9b69c),('native_eq_iir_set',0x9ac70,0x9ace0),('native_eq_resources',0xba33c,0xba3d0),('native_iso_resources',0xbae50,0xbaf80)]
asm='.syntax unified\n.arm\n.fpu neon\n.text\n'
for name,start,end in ranges:
 code=extract(start,end);fname='native-eq-ctor-'+name+'.bin';(here/fname).write_bytes(code);asm+='.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n{name}:\n';pos=0
 for offset in range(0,len(code),4):
  word=struct.unpack_from('<I',code,offset)[0];replacement=None
  if word==0x4172c0:replacement='.word native_eq_rate'
  elif word==0x420190:replacement='.word native_eq_iir_vtable'
  elif 0x425650<=word<0x42a800:replacement='.word native_eq_ctor_ro+'+str(word-0x425650)
  elif word&0xff000000==0xeb000000:
   imm=word&0xffffff
   if imm&0x800000:imm-=0x1000000
   target=start+offset+8+imm*4
   if not start<=target<end:
    names={0x9d518:'native_eq_string',0x28cd8:'native_eq_string',0x85788:'native_eq_string',0x28efc:'native_eq_string',0xbb970:'native_eq_string',0x28b78:'native_eq_string',0x9d2d0:'native_eq_string',0xba068:'native_eq_ctor',0xba978:'native_iso_ctor',0xeaa8:'native_eq_alloc',0xe328:'native_eq_alloc',0x9b4d0:'native_eq_iir_ctor',0xeebc:'native_eq_abort',0xecd0:'native_eq_string',0x3b1188:'native_eq_string',0x3b0ff8:'native_eq_string',0x3b2038:'native_eq_string',0x3b0d70:'native_eq_string'}
    assert target in names,(hex(start+offset),hex(target));replacement='bl '+names[target]
  if replacement:
   if offset>pos:asm+=f'.incbin "{fname}",{pos},{offset-pos}\n'
   asm+=replacement+'\n';pos=offset+4
 if pos<len(code):asm+=f'.incbin "{fname}",{pos},{len(code)-pos}\n'
(here/'native-eq-ctor-ro.bin').write_bytes(extract(0x425650,0x42a800))
(here/'native-eq-ctor-tables.bin').write_bytes(extract(0x42a2f8,0x42a748))
asm+='.balign 8\n.global native_eq_ctor_ro\nnative_eq_ctor_ro:\n.incbin "native-eq-ctor-ro.bin"\n.section .note.GNU-stack,"",%progbits\n';(here/'eq-ctor-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['eq_control.c','equalizer.c','isolator.c','eq_channel.c','eq_ctor_compare.c','../../mixer/cfx_filter.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'eq-ctor-native.S','native.S','-lm','-o','eq-ctor-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','eq-ctor-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','eq-ctor-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./eq-ctor-arm']),('host',['./eq-ctor-host']),('sanitized',['./eq-ctor-host-asan'])]:
 r=subprocess.run([*cmd,'native-eq-ctor-records.bin','native-eq-ctor-tables.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results,'scope':'Original EQ, isolator and second-order IIR constructors plus resource initialization; canonical DSP state at eight rates. Original channel constructor mode state additionally checked with peripheral InputChannel/GPIO/route/CFX construction hooks excluded. String bookkeeping no-op; allocations tracked and freed.'};(here/'eq-ctor-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
