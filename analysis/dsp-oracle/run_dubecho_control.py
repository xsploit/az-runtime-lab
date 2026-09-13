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

ranges=[('native_dub_color',0xcc7d8,0xcc838),('native_dub_inner',0xcc980,0xcccfc),('native_dub_calculate',0xcdd3c,0xcdf68)]
asm='.syntax unified\n.arm\n.fpu neon\n.text\n'
for name,start,end in ranges:
 fname='native-dubecho-'+name+'.bin';(here/fname).write_bytes(extract(start,end));asm+='.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n.type {name},%function\n{name}:\n'
 if start==0xcdd3c:
  offset=0xcdd58-start;asm+=f'.incbin "{fname}",0,{offset}\nb native_dub_inner\n.incbin "{fname}",{offset+4},{end-start-offset-4}\n'
 else:asm+=f'.incbin "{fname}"\n'
for name,base,offset in [('on','color',0x24),('off','color',0x3c),('feedback','calculate',0x2c),('parameter','calculate',0x208)]:asm+=f'.global native_dub_{name}\n.set native_dub_{name},native_dub_{base}+{offset}\n'
asm+='.section .note.GNU-stack,"",%progbits\n';(here/'dubecho-control-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['dubecho.c','dubecho_control_compare.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'dubecho-control-native.S','-lm','-o','dubecho-control-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','dubecho-control-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','dubecho-control-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./dubecho-control-arm']),('host',['./dubecho-control-host']),('sanitized',['./dubecho-control-host-asan'])]:
 r=subprocess.run([*cmd,'native-dubecho-control-records.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results,'scope':'Native Dub Echo parameter/chase/feedback/on-off state only; audio and outer manager pending.'};(here/'dubecho-control-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
