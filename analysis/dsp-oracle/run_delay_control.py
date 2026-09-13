#!/usr/bin/env python3
"""Local private native Delay callback oracle; no firmware included in source."""
import hashlib,json,pathlib,struct,subprocess
here=pathlib.Path(__file__).resolve().parent
root=here.parents[2]
data=(root/'rx3-research/pi-runtime/rbp').read_bytes()
assert hashlib.sha256(data).hexdigest()=='60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09'
h=struct.unpack_from('<16sHHIIIIIHHHHHH',data)
start,end=0xb6168,0xb639c
for i in range(h[10]):
 t,off,va,_,sz,_,_,_=struct.unpack_from('<IIIIIIII',data,h[5]+i*h[9])
 if t==1 and va<=start<end<=va+sz:code=data[off+start-va:off+end-va];break
else:raise RuntimeError('No mapped native callbacks')
(here/'native-delay-control.bin').write_bytes(code)
asm='.syntax unified\n.arm\n.fpu neon\n.text\n.balign 4\ndelay_base:\n.incbin "native-delay-control.bin"\n'
for name,addr in [('init',0xb6168),('time',0xb6180),('on',0xb618c),('off',0xb6200),('depth',0xb62a8)]:
 asm+=f'.global delay_{name}\n.type delay_{name}, %function\n.set delay_{name},delay_base+{addr-start}\n'
select_start,select_end=0xb6d18,0xb6d34
for i in range(h[10]):
 t,off,va,_,sz,_,_,_=struct.unpack_from('<IIIIIIII',data,h[5]+i*h[9])
 if t==1 and va<=select_start<select_end<=va+sz:
  selection=data[off+select_start-va:off+select_end-va];break
else:raise RuntimeError('No mapped selection callback')
(here/'native-delay-select.bin').write_bytes(selection)
asm+='.balign 4\n.global delay_select\n.type delay_select,%function\ndelay_select:\n.incbin "native-delay-select.bin"\n'
asm+='.section .note.GNU-stack,"",%progbits\n'
(here/'delay-control-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
files=['delay_control_compare.c','delay_control.c']
gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[ [str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'delay-control-native.S','-lm','-o','delay-control-arm'], ['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','delay-control-host'], ['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','delay-control-host-asan'] ]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for name,cmd in [('arm',['qemu-arm-static','./delay-control-arm']),('host',['./delay-control-host']),('sanitized',['./delay-control-host-asan'])]:
 p=subprocess.run([*cmd,'native-delay-control-records.bin'],cwd=here,text=True,capture_output=True)
 results[name]={'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
report={'scope':'Delay initialize/time-change/depth/on/off/selection callbacks only; no delay audio loop or BeatFX manager/quantize integration.', 'firmware_sha256':hashlib.sha256(data).hexdigest(),'native_range':[hex(start),hex(end)],'native_code_sha256':hashlib.sha256(code).hexdigest(),'native_code_relocations':0,'selection_range':[hex(select_start),hex(select_end)],'selection_sha256':hashlib.sha256(selection).hexdigest(),'compiler_commands':commands,'results':results}
report['source_hashes']={n:hashlib.sha256((here/n).read_bytes()).hexdigest() for n in [*files,'delay_control.h','delay-control-native.S','run_delay_control.py']}
(here/'delay-control-results.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(results,indent=2));raise SystemExit(any(p['returncode'] for p in results.values()))
