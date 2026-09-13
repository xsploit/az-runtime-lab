"""Private native RX3 headphone setter oracle; firmware never bundled."""
from pathlib import Path
import hashlib,json,struct,subprocess
here=Path(__file__).resolve().parent;root=here.parents[2]
d=(root/'rx3-research/pi-runtime/rbp').read_bytes();digest=hashlib.sha256(d).hexdigest()
assert digest=='60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09'
h=struct.unpack_from('<16sHHIIIIIHHHHHH',d);a,z=0x5ad4c,0x5af18
for i in range(h[10]):
 t,o,v,_,size,_,_,_=struct.unpack_from('<IIIIIIII',d,h[5]+i*h[9])
 if t==1 and v<=a<z<=v+size:code=d[o+a-v:o+z-v];break
else:raise ValueError('Unmapped code')
for i in range(h[10]):
 t,o,v,_,size,_,_,_=struct.unpack_from('<IIIIIIII',d,h[5]+i*h[9])
 if t==1 and v<=0x4193b0 and 0x4193b0+3104<=v+size:
  (here/'tables.bin').write_bytes(d[o+0x4193b0-v:o+0x4193b0-v+3104]);break
else:raise ValueError('Unmapped table')
(here/'native-setters.bin').write_bytes(code)
(here/'native-setters.S').write_text('.syntax unified\n.arm\n.fpu neon\n.text\n.balign 8\nbase:\n.incbin "native-setters.bin"\n.global native_master\n.type native_master,%function\n.set native_master,base+276\n.global native_mode\n.type native_mode,%function\n.set native_mode,base+368\n.global native_level\n.type native_level,%function\n.set native_level,base\n.global native_mix\n.type native_mix,%function\n.set native_mix,base+108\n.section .note.GNU-stack,"",%progbits\n')
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
commands=[[str(root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp','compare.c','setters.c','native-setters.S','-o','setters-arm'],['cc',*flags,'-DHOST_REPLAY','compare.c','setters.c','-o','setters-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','compare.c','setters.c','-o','setters-sanitized']]
for c in commands:subprocess.run(c,cwd=here,check=True)
results={}
for name,cmd in [('arm',['qemu-arm-static','./setters-arm']),('host',['./setters-host']),('sanitized',['./setters-sanitized'])]:
 p=subprocess.run([*cmd,'native-records.bin'],cwd=here,capture_output=True,text=True);results[name]={'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
report={'scope':'All four headphone setters; level/mix normalized finite inputs, normal ramp floats, no sample processing or subnormal equivalence claim','firmware_sha256':digest,'range':[hex(a),hex(z)],'relocations':0,'commands':commands,'results':results}
(here/'setter-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(v['returncode'] for v in results.values()))
