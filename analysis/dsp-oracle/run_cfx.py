#!/usr/bin/env python3
import hashlib,json,pathlib,struct,subprocess
here=pathlib.Path(__file__).resolve().parent;root=here.parents[2]
data=(root/'rx3-research/pi-runtime/rbp').read_bytes()
assert hashlib.sha256(data).hexdigest()=='60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09'
h=struct.unpack_from('<16sHHIIIIIHHHHHH',data);start,end=0xce154,0xce994
for i in range(h[10]):
    typ,off,va,_,fs,_,_,_=struct.unpack_from('<IIIIIIII',data,h[5]+i*h[9])
    if typ==1 and va<=start<end<=va+fs:
        code=data[off+start-va:off+end-va];break
else:raise RuntimeError('Unmapped native code')
(here/'native-cfx-calc-init.bin').write_bytes(code)
# The CFX oracle's virtual process methods call the separately validated native
# IIR. Extract it here as well so this runner does not depend on prior runs.
for i in range(h[10]):
    typ,off,va,_,fs,_,_,_=struct.unpack_from('<IIIIIIII',data,h[5]+i*h[9])
    if typ==1 and va<=0xb5788<0xb5934<=va+fs:
        (here/'native-iir.bin').write_bytes(data[off+0xb5788-va:off+0xb5934-va]);break
else:raise RuntimeError('Unmapped IIR code')
gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
sources=['cfx_compare.c','cfx_filter.c','cfx_process.c','iir_reconstructed.c']
commands=[
 [str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*sources,'cfx-native.S','native.S','-lm','-o','cfx-compare-arm'],
 ['cc',*flags,'-DHOST_REPLAY',*sources,'-lm','-o','cfx-compare-host'],
 ['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*sources,'-lm','-o','cfx-compare-host-asan'],
]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./cfx-compare-arm','native-cfx-records.bin']),('host',['./cfx-compare-host','native-cfx-records.bin']),('host_asan',['./cfx-compare-host-asan','native-cfx-records.bin'])]:
 r=subprocess.run(cmd,cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stderr':r.stderr,'stdout':r.stdout}
 try:results[label]['metrics']=json.loads(r.stdout)
 except json.JSONDecodeError:pass
report={'scope':'CFX Filter coefficient/init/execute state and audio; coefficient setters and clearDelayBuffer use mocks, process calls native IIR. Native global ones pointer relocated, no DSP instructions changed. CFX manager/type transition orchestration excluded.',
 'native_virtual_range':[hex(start),hex(end)],'native_instruction_sha256':hashlib.sha256(code).hexdigest(),
 'firmware_sha256':hashlib.sha256(data).hexdigest(),'relocations':[{'address':'0xce990','kind':'absolute constant pointer','target':'private pair of float 1.0 values'}],
 'source_hashes':{n:hashlib.sha256((here/n).read_bytes()).hexdigest() for n in ['cfx_filter.c','cfx_filter.h','cfx_process.c','cfx_compare.c','cfx-native.S','run_cfx.py']},
 'commands':commands,'results':results}
(here/'cfx-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2))
raise SystemExit(any(x['returncode'] for x in results.values()))
