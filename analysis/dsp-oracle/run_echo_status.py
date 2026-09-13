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
ranges=[('native_status',0x98d14,0x98d70),('native_manager_on',0x89940,0x89964),('native_quantize_set',0x9885c,0x989dc),('native_time_update',0x989dc,0x98b24),('native_quantize_check',0x98fa0,0x99030),('native_beat_position',0x99060,0x990a4),('native_adjust',0xb5b38,0xb5c80),('echo_execute',0xb6f68,0xb7530)]
targets={a:name for name,a,b in ranges}
targets.update({0xb600c:'fixture_channel',0xb5e94:'fixture_engine',0xb5f50:'fixture_engine',0x5f5bc:'fixture_beat',0x5731c:'fixture_quantize',0x5e03c:'fixture_reverse',0x5e3cc:'fixture_scratch',0x5e408:'fixture_spin',0x5e10c:'fixture_scan',0x5d9cc:'fixture_time',0x5dd24:'fixture_tempo',0xf24c:'__aeabi_uidiv',0xed30:'ceil',0xf870:'floor'})
literals={0x989d0:'quant_min_bpm',0x989d4:'quant_numerators',0x989d8:'quant_denominators'}
asm='.syntax unified\n.arm\n.fpu neon\n.text\n';relocations=[]
for name,start,end in ranges:
 code=extract(start,end);fname=f'native-echo-q-{name}.bin';(here/fname).write_bytes(code)
 asm+=f'.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n.type {name},%function\n{name}:\n';pos=0
 for off in range(0,len(code),4):
  addr=start+off;word=struct.unpack_from('<I',code,off)[0];replacement=None
  if addr in literals:replacement='.word '+literals[addr]
  elif word&0x0f000000==0x0b000000:
   imm=word&0xffffff
   if imm&0x800000:imm-=0x1000000
   target=addr+8+imm*4
   if start<=target<end:continue
   if target not in targets:raise RuntimeError(f'unknown BL {addr:x}->{target:x}')
   assert word>>28==14
   replacement='bl '+targets[target]
  if replacement:
   if off>pos:asm+=f'.incbin "{fname}",{pos},{off-pos}\n'
   asm+=replacement+'\n';pos=off+4;relocations.append({'site':hex(addr),'replacement':replacement})
 if pos<len(code):asm+=f'.incbin "{fname}",{pos},{len(code)-pos}\n'
asm+='\n.balign 4\nquant_min_bpm:.word 4000\nquant_numerators:.word '+','.join(map(str,struct.unpack('<12I',extract(0x420010,0x420040))))+'\nquant_denominators:.word '+','.join(map(str,struct.unpack('<12I',extract(0x41ffe0,0x420010))))+'\n.section .note.GNU-stack,"",%progbits\n'
(here/'echo-status-native.S').write_text(asm)
code=extract(0xb6d40,0xb6ef8);(here/'native-echo-control.bin').write_bytes(code)
asm='.syntax unified\n.arm\n.fpu neon\n.text\n.balign 8\necho_base:\n.incbin "native-echo-control.bin"\n'
for name,a in [('init',0xb6d40),('keep',0xb6d58),('time',0xb6d64),('on',0xb6d70),('off',0xb6dc4),('depth',0xb6e04)]:asm+=f'.global echo_{name}\n.type echo_{name},%function\n.set echo_{name},echo_base+{a-0xb6d40}\n'
asm+='.section .note.GNU-stack,"",%progbits\n';(here/'echo-control-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DECHO_NATIVE_QUANTIZE','-DECHO_STATUS_ORACLE']
files=['echo_quantize_compare.c','echo_quantize.c','echo_audio.c','echo_control.c']
gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'echo-control-native.S','echo-status-native.S','-lm','-o','echo-status-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','echo-status-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','echo-status-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./echo-status-arm']),('host',['./echo-status-host']),('sanitized',['./echo-status-host-asan'])]:
 p=subprocess.run([*cmd,'native-echo-status-records.bin'],cwd=here,capture_output=True,text=True)
 results[label]={'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'relocations':relocations,'compiler_commands':commands,'results':results,'scope':'Real native manager setOnOff, QuantizedBeatEffect status switch, Echo, quantize checks/time update/set-time/beat lookup/parameter dispatch. Player getters are fixtures. Generic other-effect scheduler and remaining outer manager not covered.'}
report['source_hashes']={n:hashlib.sha256((here/n).read_bytes()).hexdigest() for n in files+['echo_quantize.h','echo_audio.h','echo_audio_compare.c','run_echo_status.py','echo-status-native.S']}
(here/'echo-status-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(p['returncode'] for p in results.values()))
