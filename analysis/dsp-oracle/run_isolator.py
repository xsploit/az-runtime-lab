#!/usr/bin/env python3
"""Compare original EQ/isolator control callbacks against independent reconstruction."""
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

ranges=[('native_iso_volume',0xba758,0xba7c0),('native_iso_execute',0xba518,0xba758),('native_iso_reset',0xba450,0xba4dc)]
asm='.syntax unified\n.arm\n.fpu neon\n.text\n'
for name,start,end in ranges:
 fname='native-isolator-'+name+'.bin';(here/fname).write_bytes(extract(start,end));asm+='.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n.type {name},%function\n{name}:\n.incbin "{fname}"\n'
asm+='.section .note.GNU-stack,"",%progbits\n';(here/'isolator-native.S').write_text(asm)
(here/'native-isolator-gain.bin').write_bytes(extract(0x42a2f8,0x42a6f8)+extract(0x42a6f8,0x42a748))
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['eq_control.c','isolator.c','isolator_compare.c','../../mixer/cfx_filter.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'isolator-native.S','native.S','-lm','-o','isolator-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','isolator-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','isolator-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./isolator-arm']),('host',['./isolator-host']),('sanitized',['./isolator-host-asan'])]:
 r=subprocess.run([*cmd,'native-isolator-records.bin','native-isolator-gain.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results,'scope':'Native isolator execute, volume and assignReset composite: output, all eight IIR histories/coefficients, five padded scratch buffers and three complete gain ramps. Constructor fixture inferred from disassembly; native constructor, EQ mode and channel transitions remain pending.'};(here/'isolator-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
