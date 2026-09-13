#!/usr/bin/env python3
import hashlib,json,pathlib,struct,subprocess,sys
here=pathlib.Path(__file__).resolve().parent;root=here.parents[2]
for dependency in ['run_manager.py','run_cfx.py']:
 subprocess.run([sys.executable,str(here/dependency)],check=True,stdout=subprocess.DEVNULL)
data=(root/'rx3-research/pi-runtime/rbp').read_bytes();h=struct.unpack_from('<16sHHIIIIIHHHHHH',data)
assert hashlib.sha256(data).hexdigest()=='60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09'
def extract(a,b):
 for i in range(h[10]):
  t,o,v,_,f,_,_,_=struct.unpack_from('<IIIIIIII',data,h[5]+i*h[9])
  if t==1 and v<=a<b<=v+f:return data[o+a-v:o+b-v]
 raise RuntimeError('Unmapped code')
(here/'native-cfx-controls.bin').write_bytes(extract(0xcdfd4,0xce014))
(here/'native-cfx-adjust.bin').write_bytes(extract(0xbc7c0,0xbc848))
(here/'cfx-control.S').write_text('''\
.syntax unified
.arm
.fpu neon
.text
.balign 8
.global cfx_native_color
cfx_native_color:
.incbin "native-cfx-controls.bin"
.global cfx_native_parameter
.set cfx_native_parameter,cfx_native_color+0x24
.global cfx_native_adjust
cfx_native_adjust:
.incbin "native-cfx-adjust.bin"
.section .note.GNU-stack,"",%progbits
''')
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
src=['composite_compare.c','cfx_composed.c','cfx_manager_filter.c','cfx_filter.c','cfx_process.c','iir_reconstructed.c']
gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*src,'manager-native.S','cfx-native.S','cfx-control.S','native.S','-lm','-o','composite-arm'],
 ['cc',*flags,'-DHOST_REPLAY',*src,'-lm','-o','composite-host'],
 ['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*src,'-lm','-o','composite-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./composite-arm','native-composite-records.bin']),('host',['./composite-host','native-composite-records.bin']),('host_asan',['./composite-host-asan','native-composite-records.bin'])]:
 r=subprocess.run(cmd,cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
 try:results[label]['metrics']=json.loads(r.stdout)
 except json.JSONDecodeError:pass
report={'scope':'Native manager plus real native Filter/IIR/control callbacks; Off uses equivalent copy/no-op, Sweep tick mocked. Portable full manager/filter audio+state comparison.',
 'commands':commands,'results':results}
(here/'composite-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2))
raise SystemExit(any(x['returncode'] for x in results.values()))
