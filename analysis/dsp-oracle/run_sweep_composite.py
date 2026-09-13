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

ranges=[('native_sweep_core',0xbf0e8,0xc0458)]
start,end=ranges[0][1:];code=extract(start,end);fname='native-sweep-composite.bin';(here/fname).write_bytes(code)
asm='.syntax unified\n.arm\n.fpu neon\n.text\n.balign 8\n.global native_sweep_core\nnative_sweep_core:\n';pos=0
literal={0xbfc50:'sweep_hpf_endpoint',0xbfc54:'sweep_lpf_endpoint',0xc0208:'sweep_lpf_endpoint',0xc020c:'sweep_hpf_endpoint',0xc0454:'sweep_ones'}
for offset in range(0,len(code),4):
 address=start+offset;word=struct.unpack_from('<I',code,offset)[0];replacement=None
 if address in literal:replacement='.word '+literal[address]
 elif word&0xff000000==0xeb000000:
  imm=word&0xffffff
  if imm&0x800000:imm-=0x1000000
  target=address+8+imm*4
  if start<=target<end:continue
  assert target in [0xeebc,0xf06c,0xeaa8],(hex(address),hex(target))
  replacement='bl abort'
 if replacement:
  if offset>pos:asm+=f'.incbin "{fname}",{pos},{offset-pos}\n'
  asm+=replacement+'\n';pos=offset+4
if pos<len(code):asm+=f'.incbin "{fname}",{pos},{len(code)-pos}\n'
for name,address in [('init',0xbff88),('execute',0xc0210),('detect',0xbf43c)]:asm+=f'.global native_sweep_{name}\n.set native_sweep_{name},native_sweep_core+{address-start}\n'
for name,address in [('sweep_hpf_endpoint',0x42d338),('sweep_lpf_endpoint',0x42d320),('sweep_detector_lpf',0x42d2f0),('sweep_detector_hpf',0x42d308)]:
 fname='native-sweep-'+name+'.bin';(here/fname).write_bytes(extract(address,address+20));asm+=f'.balign 4\n.global {name}\n{name}:\n.incbin "{fname}"\n'
asm+='.balign 8\nsweep_ones:.float 1,1\n.section .note.GNU-stack,"",%progbits\n';(here/'sweep-composite-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['sweep.c','sweep_composite_compare.c','iir_reconstructed.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'sweep-composite-native.S','native.S','-lm','-o','sweep-composite-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','sweep-composite-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','sweep-composite-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./sweep-composite-arm']),('host',['./sweep-composite-host']),('sanitized',['./sweep-composite-host-asan'])]:
 r=subprocess.run([*cmd,'native-sweep-composite-records.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results,'scope':'Full Sweep init/detect/execute composition with original native IIR and private constant fixtures; manager integration pending.'};(here/'sweep-composite-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
