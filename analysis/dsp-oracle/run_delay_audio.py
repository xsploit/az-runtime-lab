#!/usr/bin/env python3
"""Local private native Delay audio oracle; no firmware included in source."""
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
asm+='.section .note.GNU-stack,"",%progbits\n'
(here/'delay-control-native.S').write_text(asm)
exec_start,exec_end=0xb6404,0xb68b8
for i in range(h[10]):
 t,off,va,_,sz,_,_,_=struct.unpack_from('<IIIIIIII',data,h[5]+i*h[9])
 if t==1 and va<=exec_start<exec_end<=va+sz:execute=data[off+exec_start-va:off+exec_end-va];break
(here/'native-delay-execute.bin').write_bytes(execute)
patches={0xb6504:'ceil',0xb6710:'floor',0xb6810:'ceil',0xb6880:'floor',0xb675c:'oracle_quantize',0xb6790:'oracle_time'}
asm='.syntax unified\n.arm\n.fpu neon\n.text\n.balign 8\n.global delay_execute\n.type delay_execute,%function\ndelay_execute:\n'
pos=0
for address,name in sorted(patches.items()):
 offset=address-exec_start
 branch='b' if address==0xb6790 else 'bl'
 asm+=f'.incbin "native-delay-execute.bin",{pos},{offset-pos}\n{branch} {name}\n'
 pos=offset+4
asm+=f'.incbin "native-delay-execute.bin",{pos},{len(execute)-pos}\n.section .note.GNU-stack,"",%progbits\n'
(here/'delay-execute-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
files=['delay_audio_compare.c','delay_audio.c','delay_control.c']
gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[ [str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'delay-control-native.S','delay-execute-native.S','-lm','-o','delay-audio-arm'], ['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','delay-audio-host'], ['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','delay-audio-host-asan'] ]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for name,cmd in [('arm',['qemu-arm-static','./delay-audio-arm']),('host',['./delay-audio-host']),('sanitized',['./delay-audio-host-asan'])]:
 p=subprocess.run([*cmd,'native-delay-audio-records.bin'],cwd=here,text=True,capture_output=True)
 results[name]={'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
report={'scope':'Delay sample loop and controls, full represented state/ring and PCM. Quantize external calls use scripted hooks; actual quantize and outer manager remain pending.', 'firmware_sha256':hashlib.sha256(data).hexdigest(),'native_range':[hex(start),hex(end)],'native_code_sha256':hashlib.sha256(code).hexdigest(),'native_code_relocations':{hex(k):v for k,v in patches.items()},'execute_range':[hex(exec_start),hex(exec_end)],'compiler_commands':commands,'results':results}
report['source_hashes']={n:hashlib.sha256((here/n).read_bytes()).hexdigest() for n in [*files,'delay_control.h','delay_audio.h','delay-control-native.S','delay-execute-native.S','run_delay_audio.py']}
(here/'delay-audio-results.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(results,indent=2));raise SystemExit(any(p['returncode'] for p in results.values()))
