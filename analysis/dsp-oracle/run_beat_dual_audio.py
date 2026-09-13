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
ranges=[('direct_delay_execute',0xb6404,0xb68b8),('direct_delay_init',0xb6168,0xb6180),('direct_delay_time',0xb6180,0xb618c),('direct_delay_on',0xb618c,0xb6200),('direct_delay_off',0xb6200,0xb62a8),('direct_delay_depth',0xb62a8,0xb639c),('direct_delay_notify',0xb6d18,0xb6d34),('direct_delay_keep',0x8b080,0x8b084),('native_manager_operate',0x8a52c,0x8ace8),('native_switch_type',0x8a07c,0x8a470),('native_switch_beat',0x8a470,0x8a528),('native_switch_target',0x8ace8,0x8ad5c),('native_off_execute',0x8af90,0x8afb4),('native_off_status',0x8b108,0x8b148),('native_off_beat',0x8b0fc,0x8b108),('native_noop',0x8b0a8,0x8b0ac),('native_echo_notify',0xb79b8,0xb79d4),('native_echo_beat',0x98b24,0x98c24),('native_range_check',0xb5c80,0xb5d94),('native_status',0x98d14,0x98d70),('native_manager_on',0x89940,0x89964),('native_quantize_set',0x9885c,0x989dc),('native_time_update',0x989dc,0x98b24),('native_quantize_check',0x98fa0,0x99030),('native_beat_position',0x99060,0x990a4),('native_adjust',0xb5b38,0xb5c80),('echo_execute',0xb6f68,0xb7530)]
targets={a:name for name,a,b in ranges}
targets.update({0x516b4:'fixture_engine',0x53eb4:'fixture_bfx_bpm',0xb600c:'fixture_channel',0xb5e94:'fixture_engine',0xb5f50:'fixture_engine',0x5f5bc:'fixture_beat',0x5731c:'fixture_quantize',0x5e03c:'fixture_reverse',0x5e3cc:'fixture_scratch',0x5e408:'fixture_spin',0x5e10c:'fixture_scan',0x5d9cc:'fixture_time',0x5dd24:'fixture_tempo',0xf24c:'__aeabi_uidiv',0xed30:'ceil',0xf870:'floor'})
literals={0x8a954:'manager_ones',0xb5d88:'manager_cache',0xb5d8c:'manager_bpm_sentinel',0xb5d90:'manager_beat_ratios',0x989d0:'quant_min_bpm',0x989d4:'quant_numerators',0x989d8:'quant_denominators'}
asm='.syntax unified\n.arm\n.fpu neon\n.text\n';relocations=[]
for name,start,end in ranges:
 code=extract(start,end);fname=f'native-echo-q-{name}.bin';(here/fname).write_bytes(code)
 asm+=f'.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n.type {name},%function\n{name}:\n';pos=0
 for off in range(0,len(code),4):
  addr=start+off;word=struct.unpack_from('<I',code,off)[0];replacement=None
  if 0x8a0c8<=addr<0x8a104:replacement=f'.word native_switch_type+{word-0x8a07c}'
  elif addr==0x8b104:replacement='b native_range_check'
  elif addr in literals:replacement='.word '+literals[addr]
  elif word&0x0e000000==0x0a000000:
   imm=word&0xffffff
   if imm&0x800000:imm-=0x1000000
   target=addr+8+imm*4
   if start<=target<end:continue
   if target not in targets:raise RuntimeError(f'unknown BL {addr:x}->{target:x}')
   assert word>>28==14
   replacement=('bl ' if word&0x01000000 else 'b ')+targets[target]
  if replacement:
   if off>pos:asm+=f'.incbin "{fname}",{pos},{off-pos}\n'
   asm+=replacement+'\n';pos=off+4;relocations.append({'site':hex(addr),'replacement':replacement})
 if pos<len(code):asm+=f'.incbin "{fname}",{pos},{len(code)-pos}\n'
asm+='\n.balign 4\nquant_min_bpm:.word 4000\nquant_numerators:.word '+','.join(map(str,struct.unpack('<12I',extract(0x420010,0x420040))))+'\nquant_denominators:.word '+','.join(map(str,struct.unpack('<12I',extract(0x41ffe0,0x420010))))+'\n.section .note.GNU-stack,"",%progbits\n'
asm=asm.replace('.section .note.GNU-stack', '.balign 8\nmanager_ones:.float 1,1\nmanager_cache:.word 1,0,0\nmanager_bpm_sentinel:.word '+str(struct.unpack('<I',extract(0x417334,0x417338))[0])+'\nmanager_beat_ratios:.space 80\n.word '+','.join(hex(x) for x in struct.unpack('<12I',extract(0x4252e0,0x425310)))+'\n.section .note.GNU-stack')
(here/'beat-dual-audio-native.S').write_text(asm)
code=extract(0xb6d40,0xb6ef8);(here/'native-echo-control.bin').write_bytes(code)
asm='.syntax unified\n.arm\n.fpu neon\n.text\n.balign 8\necho_base:\n.incbin "native-echo-control.bin"\n'
for name,a in [('init',0xb6d40),('keep',0xb6d58),('time',0xb6d64),('on',0xb6d70),('off',0xb6dc4),('depth',0xb6e04)]:asm+=f'.global echo_{name}\n.type echo_{name},%function\n.set echo_{name},echo_base+{a-0xb6d40}\n'
asm+='.section .note.GNU-stack,"",%progbits\n';(here/'echo-control-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DECHO_NATIVE_QUANTIZE','-DECHO_STATUS_ORACLE','-DBEAT_MANAGER_COMPARE_BUILD']
files=['beat_dual_audio_probe.c','echo_quantize.c','echo_audio.c','echo_control.c']
gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
cmd=[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'echo-control-native.S','beat-dual-audio-native.S','-lm','-o','beat-dual-audio-arm']
subprocess.run(cmd,cwd=here,check=True)
p=subprocess.run(['qemu-arm-static','./beat-dual-audio-arm'],cwd=here,capture_output=True,text=True)
report={'firmware_sha256':sha,'native_ranges':ranges,'relocations':relocations,'command':cmd,'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr,'scope':'Native outer operate with actual Echo and Delay audio loops, independent rings, controls and quantize. Finite-output and transition coverage checks only; no host reconstruction comparison.'}
report['source_hashes']={n:hashlib.sha256((here/n).read_bytes()).hexdigest() for n in files+['run_beat_dual_audio.py','beat_manager_probe.c','echo_quantize_compare.c','echo_audio_compare.c','echo_quantize.h','echo_audio.h','echo_control.h','beat-dual-audio-native.S']}
(here/'beat-dual-audio-switch-results.json').write_text(json.dumps(report,indent=2)+'\n')
print(p.stdout,p.stderr);raise SystemExit(p.returncode)
