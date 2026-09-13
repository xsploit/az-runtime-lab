#!/usr/bin/env python3
"""Local private native Echo callback oracle; no firmware included in source."""
import hashlib,json,pathlib,struct,subprocess
here=pathlib.Path(__file__).resolve().parent
root=here.parents[2]
data=(root/'rx3-research/pi-runtime/rbp').read_bytes()
assert hashlib.sha256(data).hexdigest()=='60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09'
h=struct.unpack_from('<16sHHIIIIIHHHHHH',data)
start,end=0xb6d40,0xb6ef8
for i in range(h[10]):
 t,off,va,_,sz,_,_,_=struct.unpack_from('<IIIIIIII',data,h[5]+i*h[9])
 if t==1 and va<=start<end<=va+sz:code=data[off+start-va:off+end-va];break
else:raise RuntimeError('No mapped native callbacks')
(here/'native-echo-control.bin').write_bytes(code)
asm='.syntax unified\n.arm\n.fpu neon\n.text\n.balign 4\necho_base:\n.incbin "native-echo-control.bin"\n'
for name,addr in [('init',0xb6d40),('keep',0xb6d58),('time',0xb6d64),('on',0xb6d70),('off',0xb6dc4),('depth',0xb6e04)]:
 asm+=f'.global echo_{name}\n.type echo_{name}, %function\n.set echo_{name},echo_base+{addr-start}\n'
asm+='.section .note.GNU-stack,"",%progbits\n'
(here/'echo-control-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
files=['echo_control_compare.c','echo_control.c']
gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[ [str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'echo-control-native.S','-lm','-o','echo-control-arm'], ['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','echo-control-host'], ['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','echo-control-host-asan'] ]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for name,cmd in [('arm',['qemu-arm-static','./echo-control-arm']),('host',['./echo-control-host']),('sanitized',['./echo-control-host-asan'])]:
 p=subprocess.run([*cmd,'native-echo-control-records.bin'],cwd=here,text=True,capture_output=True)
 results[name]={'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
report={'scope':'Echo initialize/keep/time-change/depth/on/off callbacks only; no delay audio loop or BeatFX manager/quantize integration.', 'firmware_sha256':hashlib.sha256(data).hexdigest(),'native_range':[hex(start),hex(end)],'native_code_sha256':hashlib.sha256(code).hexdigest(),'native_code_relocations':0,'compiler_commands':commands,'results':results}
report['source_hashes']={n:hashlib.sha256((here/n).read_bytes()).hexdigest() for n in [*files,'echo_control.h','echo-control-native.S','run_echo_control.py']}
(here/'echo-control-results.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(results,indent=2));raise SystemExit(any(p['returncode'] for p in results.values()))
