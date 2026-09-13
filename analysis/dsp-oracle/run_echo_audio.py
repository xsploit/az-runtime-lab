#!/usr/bin/env python3
"""Local private native Echo audio oracle; no firmware included in source."""
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
exec_start,exec_end=0xb6f68,0xb7530
for i in range(h[10]):
 t,off,va,_,sz,_,_,_=struct.unpack_from('<IIIIIIII',data,h[5]+i*h[9])
 if t==1 and va<=exec_start<exec_end<=va+sz:execute=data[off+exec_start-va:off+exec_end-va];break
(here/'native-echo-execute.bin').write_bytes(execute)
patches={0xb6fe4:'ceil',0xb7428:'ceil',0xb7460:'floor',0xb74ac:'floor',0xb7354:'oracle_quantize',0xb7364:'oracle_time'}
asm='.syntax unified\n.arm\n.fpu neon\n.text\n.balign 8\n.global echo_execute\n.type echo_execute,%function\necho_execute:\n'
pos=0
for address,name in sorted(patches.items()):
 offset=address-exec_start
 asm+=f'.incbin "native-echo-execute.bin",{pos},{offset-pos}\nbl {name}\n'
 pos=offset+4
asm+=f'.incbin "native-echo-execute.bin",{pos},{len(execute)-pos}\n.section .note.GNU-stack,"",%progbits\n'
(here/'echo-execute-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
files=['echo_audio_compare.c','echo_audio.c','echo_control.c']
gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[ [str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'echo-control-native.S','echo-execute-native.S','-lm','-o','echo-audio-arm'], ['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','echo-audio-host'], ['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','echo-audio-host-asan'] ]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for name,cmd in [('arm',['qemu-arm-static','./echo-audio-arm']),('host',['./echo-audio-host']),('sanitized',['./echo-audio-host-asan'])]:
 p=subprocess.run([*cmd,'native-echo-audio-records.bin'],cwd=here,text=True,capture_output=True)
 results[name]={'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
report={'scope':'Echo sample loop and controls, full represented state/ring and PCM. Quantize external calls use scripted hooks; actual quantize and outer manager remain pending.', 'firmware_sha256':hashlib.sha256(data).hexdigest(),'native_range':[hex(start),hex(end)],'native_code_sha256':hashlib.sha256(code).hexdigest(),'native_code_relocations':{hex(k):v for k,v in patches.items()},'execute_range':[hex(exec_start),hex(exec_end)],'compiler_commands':commands,'results':results}
report['source_hashes']={n:hashlib.sha256((here/n).read_bytes()).hexdigest() for n in [*files,'echo_control.h','echo_audio.h','echo-control-native.S','echo-execute-native.S','run_echo_audio.py']}
(here/'echo-audio-results.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(results,indent=2));raise SystemExit(any(p['returncode'] for p in results.values()))
