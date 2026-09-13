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

ranges=[('native_sweep_parameters',0xbf8dc,0xbff1c)]
asm='.syntax unified\n.arm\n.fpu neon\n.text\n'
for name,start,end in ranges:
 code=extract(start,end);fname='native-sweep-'+name+'.bin';(here/fname).write_bytes(code)
 asm+='.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n.type {name},%function\n{name}:\n'
 pos=0
 for address,label in [(0xbfc50,'sweep_hpf_endpoint'),(0xbfc54,'sweep_lpf_endpoint')]:
  offset=address-start
  if offset>pos:asm+=f'.incbin "{fname}",{pos},{offset-pos}\n'
  asm+=f'.word {label}\n';pos=offset+4
 asm+=f'.incbin "{fname}",{pos},{end-start-pos}\n'
for name,address in [('sweep_hpf_endpoint',0x42d338),('sweep_lpf_endpoint',0x42d320)]:
 fname='native-sweep-'+name+'.bin';(here/fname).write_bytes(extract(address,address+20))
 asm+=f'.balign 4\n.global {name}\n{name}:\n.incbin "{fname}"\n' 
asm+='.section .note.GNU-stack,"",%progbits\n';(here/'sweep-coeff-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['sweep.c','sweep_coeff_compare.c','iir_reconstructed.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'sweep-coeff-native.S','-lm','-o','sweep-coeff-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','sweep-coeff-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','sweep-coeff-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./sweep-coeff-arm']),('host',['./sweep-coeff-host']),('sanitized',['./sweep-coeff-host-asan'])]:
 r=subprocess.run([*cmd,'native-sweep-coeff-records.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results,'scope':'Sweep four-stage dynamic coefficient state only; not complete Sweep audio or manager integration.'};(here/'sweep-coeff-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
