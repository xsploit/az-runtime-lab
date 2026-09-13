#!/usr/bin/env python3
import hashlib,json,pathlib,struct,subprocess,sys
here=pathlib.Path(__file__).resolve().parent;root=here.parents[2]
for dependency in ['run_manager.py','run_cfx.py','run_crush.py','run_noise.py','run_sweep_composite.py','run_dubecho_control.py','run_dubecho_audio.py','run_space.py']:
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
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ','-I../../mixer']
src=['cfx_space_compare.c','../../mixer/cfx_manager.c','../../mixer/cfx_space.c','../../mixer/cfx_dubecho.c','../../mixer/cfx_sweep.c','../../mixer/cfx_filter.c','../../mixer/cfx_crush.c','../../mixer/cfx_noise.c']
gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
commands=[[str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp',*src,'manager-native.S','cfx-native.S','cfx-control.S','native.S','crush-native.S','noise-native.S','sweep-composite-native.S','dubecho-control-native.S','dubecho-audio-native.S','space-native.S','-lm','-o','cfx-space-arm'],
 ['cc',*flags,'-DHOST_REPLAY',*src,'-lm','-o','cfx-space-host'],
 ['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',*src,'-lm','-o','cfx-space-host-asan']]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./cfx-space-arm','native-cfx-space-records.bin']),('host',['./cfx-space-host','native-cfx-space-records.bin']),('host_asan',['./cfx-space-host-asan','native-cfx-space-records.bin'])]:
 r=subprocess.run(cmd,cwd=here,capture_output=True,text=True);results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
 try:results[label]['metrics']=json.loads(r.stdout)
 except json.JSONDecodeError:pass
report={'scope':'Native all-six-CFX plus Off manager and actual effect callbacks versus shared AZ modules, including Space six full rings/mono-IIR state, repeated Off and tail resume. EQ audio remains absent.',
 'firmware_sha256':hashlib.sha256(data).hexdigest(),'commands':commands,'results':results,'source_hashes':{n:hashlib.sha256((here/n).read_bytes()).hexdigest() for n in src+['../../mixer/cfx_manager.h','../../mixer/cfx_crush.h','../../mixer/cfx_noise.h','../../mixer/cfx_sweep.h','../../mixer/cfx_dubecho.h','../../mixer/cfx_space.h','run_cfx_space.py']}}
(here/'cfx-space-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2))
raise SystemExit(any(x['returncode'] for x in results.values()))
