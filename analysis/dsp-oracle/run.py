#!/usr/bin/env python3
"""Extract a private native instruction oracle, then compare reconstructed C."""
import hashlib,json,pathlib,struct,subprocess
here=pathlib.Path(__file__).resolve().parent
root=here.parents[2]
firmware=root/'rx3-research/pi-runtime/rbp'
data=firmware.read_bytes()
expected='60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09'
if hashlib.sha256(data).hexdigest()!=expected:
    raise RuntimeError('Different RX3 binary: revalidate addresses before extracting instructions')
header=struct.unpack_from('<16sHHIIIIIHHHHHH',data)
assert header[0][:5]==b'\x7fELF\x01' and header[2]==40
start,end=0xb5788,0xb5934
for i in range(header[10]):
    typ,offset,va,_,filesize,_,_,_=struct.unpack_from('<IIIIIIII',data,header[5]+i*header[9])
    if typ==1 and va<=start<end<=va+filesize:
        code=data[offset+start-va:offset+end-va]
        break
else: raise RuntimeError('Native kernel not backed by a load segment')
(here/'native-iir.bin').write_bytes(code)
gcc=root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-DRX3_NEON_FZ']
commands=[
 [str(gcc),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp','compare.c','iir_reconstructed.c','native.S','-lm','-o','compare-arm'],
 ['cc',*flags,'-DHOST_REPLAY','compare.c','iir_reconstructed.c','-lm','-o','compare-host'],
 ['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','-fno-omit-frame-pointer',
  'compare.c','iir_reconstructed.c','-lm','-o','compare-host-asan'],
]
for cmd in commands:subprocess.run(cmd,cwd=here,check=True)
results={}
for label,cmd in [('arm',['qemu-arm-static','./compare-arm','native-records.bin']),
                  ('host',['./compare-host','native-records.bin']),
                  ('host_asan',['./compare-host-asan','native-records.bin'])]:
    r=subprocess.run(cmd,cwd=here,capture_output=True,text=True)
    (here/(label+'.stderr')).write_text(r.stderr)
    results[label]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
    try:results[label]['metrics']=json.loads(r.stdout)
    except json.JSONDecodeError:pass
report={'firmware_sha256':hashlib.sha256(data).hexdigest(),'native_virtual_range':[hex(start),hex(end)],
        'native_instruction_sha256':hashlib.sha256(code).hexdigest(),'compiler_commands':commands,
        'results':results,'scope':'Standalone stereo IIR recurrence only; not full CFX or mixer equivalence.'}
report['source_hashes']={n:hashlib.sha256((here/n).read_bytes()).hexdigest()
                         for n in ['compare.c','iir_reconstructed.c','iir_reconstructed.h','native.S','run.py']}
report['host_compiler']=subprocess.check_output(['cc','--version'],text=True).splitlines()[0]
report['qemu']=subprocess.check_output(['qemu-arm-static','--version'],text=True).splitlines()[0]
(here/'results.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(results,indent=2))
raise SystemExit(any(r['returncode'] for r in results.values()))
