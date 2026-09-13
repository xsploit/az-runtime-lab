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

ranges=[('native_sweep_detector_core',0xbf3dc,0xbf750)]
start,end=ranges[0][1:];code=bytearray(extract(start,end))
# Unreachable C++ cleanup edge is relinked to abort, never executed by fixture.
(here/'native-sweep-detect.bin').write_bytes(code)
asm='.syntax unified\n.arm\n.fpu neon\n.text\n.balign 8\n.space 4\n.global native_sweep_detector_core\nnative_sweep_detector_core:\n.incbin "native-sweep-detect.bin",0,'+str(0xbf748-start)+'\nbl abort\n.incbin "native-sweep-detect.bin",'+str(0xbf74c-start)+',4\n.global native_sweep_detect\n.set native_sweep_detect,native_sweep_detector_core+'+str(0xbf43c-start)+'\n.section .note.GNU-stack,"",%progbits\n'
(here/'sweep-detect-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['sweep.c','sweep_detect_compare.c','iir_reconstructed.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'sweep-detect-native.S','-lm','-o','sweep-detect-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','sweep-detect-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','sweep-detect-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./sweep-detect-arm']),('host',['./sweep-detect-host']),('sanitized',['./sweep-detect-host-asan'])]:
 r=subprocess.run([*cmd,'native-sweep-detect-records.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results,'scope':'Actual Sweep detector envelope/history with fixed band-output callback fixtures; filtering itself tested separately, complete Sweep integration pending.'};(here/'sweep-detect-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
