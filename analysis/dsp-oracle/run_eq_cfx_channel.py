#!/usr/bin/env python3
"""Compare original EQ/equalizer control callbacks against independent reconstruction."""
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

ranges=[('native_channel_execute',0x9e3fc,0x9e890),('native_channel_mode',0x9ed58,0x9edb8),('native_channel_volume',0x9ecdc,0x9ed30)]
asm='.syntax unified\n.arm\n.fpu neon\n.text\n'
for name,start,end in ranges:
 code=extract(start,end);fname='native-eq-cfx-channel-'+name+'.bin';(here/fname).write_bytes(code);asm+='.balign 8\n'
 if start%8:asm+='.space 4\n'
 asm+=f'.global {name}\n{name}:\n';pos=0
 for offset in range(0,len(code),4):
  word=struct.unpack_from('<I',code,offset)[0];replacement=None
  if word&0xff000000 in (0xeb000000,0xea000000):
   imm=word&0xffffff
   if imm&0x800000:imm-=0x1000000
   target=start+offset+8+imm*4
   if not start<=target<end:
    names={0xbc780:'native_channel_cfx_position',0x89904:'native_channel_no_effect',0x8991c:'native_channel_no_effect',0xbbc68:'native_channel_cfx',0x8a52c:'native_eq_abort',0x8af50:'native_eq_abort'}
    assert target in names,(hex(start+offset),hex(target));replacement=('bl ' if word&0xff000000==0xeb000000 else 'b ')+names[target]
  if replacement:
   if offset>pos:asm+=f'.incbin "{fname}",{pos},{offset-pos}\n'
   asm+=replacement+'\n';pos=offset+4
 if pos<len(code):asm+=f'.incbin "{fname}",{pos},{len(code)-pos}\n'
asm+='.section .note.GNU-stack,"",%progbits\n';(here/'eq-cfx-channel-native.S').write_text(asm)
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
files=['eq_control.c','equalizer.c','isolator.c','eq_channel.c','eq_cfx_channel_compare.c','../../mixer/cfx_filter.c','../../mixer/cfx_manager.c','../../mixer/cfx_noise.c','../../mixer/cfx_crush.c','../../mixer/cfx_sweep.c','../../mixer/cfx_dubecho.c','../../mixer/cfx_space.c'];gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*files,'equalizer-native.S','isolator-native.S','eq-ctor-native.S','eq-cfx-channel-native.S','manager-native.S','native.S','-lm','-o','eq-cfx-channel-arm'],['cc',*flags,'-DHOST_REPLAY',*files,'-lm','-o','eq-cfx-channel-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*files,'-lm','-o','eq-cfx-channel-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./eq-cfx-channel-arm']),('host',['./eq-cfx-channel-host']),('sanitized',['./eq-cfx-channel-host-asan'])]:
 r=subprocess.run([*cmd,'native-eq-cfx-channel-records.bin','native-isolator-gain.bin','native-equalizer-tables.bin'],cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
report={'firmware_sha256':sha,'native_ranges':ranges,'commands':commands,'results':results,'scope':'Original channel updateFilter plus actual CFX manager lifecycle and original EQ/isolator DSP. Filter/Sweep callbacks deliberately identity processors to isolate EQ insertion/reset ordering; actual CFX audio separately verified. BeatFX disabled. Includes simultaneous EQ mode switches and direct Filter/Sweep type transitions, full mode/manager/EQ states and audio.'};(here/'eq-cfx-channel-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
