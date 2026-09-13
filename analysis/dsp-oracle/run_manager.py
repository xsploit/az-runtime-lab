#!/usr/bin/env python3
import hashlib,json,pathlib,struct,subprocess
here=pathlib.Path(__file__).resolve().parent;root=here.parents[2]
data=(root/'rx3-research/pi-runtime/rbp').read_bytes()
assert hashlib.sha256(data).hexdigest()=='60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09'
h=struct.unpack_from('<16sHHIIIIIHHHHHH',data)
def extract(start,end):
 for i in range(h[10]):
  typ,off,va,_,fs,_,_,_=struct.unpack_from('<IIIIIIII',data,h[5]+i*h[9])
  if typ==1 and va<=start<end<=va+fs:return data[off+start-va:off+end-va]
 raise RuntimeError('Unmapped native code')
start,end=0xbbc68,0xbc4d4;code=extract(start,end)
(here/'native-manager.bin').write_bytes(code)
(here/'native-manager-settype.bin').write_bytes(extract(0xbc708,0xbc71c))
relocs={}
for a,n in [(0xbbd9c,4),(0xbbff0,7),(0xbc0c0,7),(0xbc278,7)]:
 for j in range(n):
  loc=a+j*4;target=struct.unpack_from('<I',code,loc-start)[0];assert start<=target<end
  relocs[loc]=f'manager_native+{target-start}'
for a in [0xbc018,0xbc4d0]:relocs[a]='manager_ones'
asm=['.syntax unified','.arm','.fpu neon','.text','.balign 8','.global manager_native','manager_native:'];previous=0
for addr,value in sorted(relocs.items()):
 offset=addr-start
 if offset>previous:asm.append(f'.incbin "native-manager.bin",{previous},{offset-previous}')
 asm.append(f'.word {value}');previous=offset+4
if previous<len(code):asm.append(f'.incbin "native-manager.bin",{previous},{len(code)-previous}')
asm += [
 '.global manager_native_set_type','manager_native_set_type:', '.incbin "native-manager-settype.bin"',
 '.section .rodata','.balign 8','manager_ones:','.float 1.0,1.0','.section .note.GNU-stack,"",%progbits']
(here/'manager-native.S').write_text('\n'.join(asm)+'\n')
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
src=['cfx_manager_filter.c','cfx_manager_compare.c']
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*src,'manager-native.S','-lm','-o','manager-compare-arm'],
 ['cc',*flags,'-DHOST_REPLAY',*src,'-lm','-o','manager-compare-host'],
 ['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*src,'-lm','-o','manager-compare-host-asan']]
for c in commands:subprocess.run(c,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./manager-compare-arm','native-manager-records.bin']),('host',['./manager-compare-host','native-manager-records.bin']),('host_asan',['./manager-compare-host-asan','native-manager-records.bin'])]:
 r=subprocess.run(cmd,cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
 try:results[label]['metrics']=json.loads(r.stdout)
 except json.JSONDecodeError:pass
report={'scope':'Off/Filter manager lifecycle only; all effect virtual calls use deterministic mocks, not actual Filter DSP.',
 'native_virtual_range':[hex(start),hex(end)],'native_sha256':hashlib.sha256(code).hexdigest(),
 'data_relocations':{hex(k):v for k,v in relocs.items()},'commands':commands,'results':results}
(here/'manager-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2))
raise SystemExit(any(x['returncode'] for x in results.values()))
