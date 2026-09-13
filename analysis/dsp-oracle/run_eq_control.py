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

ranges=[('native_eq_volume',0xb9d88,0xb9de4),('native_iso_volume',0xba758,0xba7c0)]
asm='.syntax unified\n.arm\n.fpu neon\n.text\n'
for name,start,end in ranges:
 fname='native-eq-control-'+name+'.bin';(here/fname).write_bytes(extract(start,end));asm+='.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n.type {name},%function\n{name}:\n.incbin "{fname}"\n'
asm+='.section .note.GNU-stack,"",%progbits\n';(here/'eq-control-native.S').write_text(asm)
(here/'native-eq-control-gain.bin').write_bytes(extract(0x42a2f8,0x42a6f8))
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['eq_control.c','eq_control_compare.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'eq-control-native.S','-lm','-o','eq-control-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','eq-control-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','eq-control-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./eq-control-arm']),('host',['./eq-control-host']),('sanitized',['./eq-control-host-asan'])]:
 r=subprocess.run([*cmd,'native-eq-control-records.bin','native-eq-control-gain.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results,'scope':'Native EQ index and isolator gain setters across all three bands, repeated targets and mid-ramp states. Audio, constructor, mode transitions and shared graph integration remain pending.'};(here/'eq-control-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
