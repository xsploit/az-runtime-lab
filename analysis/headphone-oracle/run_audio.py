from pathlib import Path
import hashlib,json,struct,subprocess
here=Path(__file__).resolve().parent;root=here.parents[2]
d=(root/'rx3-research/pi-runtime/rbp').read_bytes();digest=hashlib.sha256(d).hexdigest()
assert digest=='60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09'
h=struct.unpack_from('<16sHHIIIIIHHHHHH',d);a,z=0x5a580,0x5aa28
for i in range(h[10]):
 t,o,v,_,size,_,_,_=struct.unpack_from('<IIIIIIII',d,h[5]+i*h[9])
 if t==1 and v<=a<z<=v+size:code=d[o+a-v:o+z-v];break
else:raise ValueError('Unmapped code')
assert struct.unpack_from('<I',code,0x50)[0]==0xeb00ac3c
(here/'native-audio.bin').write_bytes(code)
(here/'native-audio.S').write_text('.syntax unified\n.arm\n.fpu neon\n.text\n.balign 8\n.global native_audio\n.type native_audio,%function\nnative_audio:\n.incbin "native-audio.bin",0,80\nbl fixture_output\n.incbin "native-audio.bin",84\n.section .note.GNU-stack,"",%progbits\n')
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
commands=[[str(root/'rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc'),*flags,'-static','-mfpu=neon','-mfloat-abi=softfp','audio_compare.c','setters.c','native-audio.S','-o','audio-arm'],['cc',*flags,'-DHOST_REPLAY','audio_compare.c','setters.c','-o','audio-host'],['cc',*flags,'-DHOST_REPLAY','-fsanitize=address,undefined','audio_compare.c','setters.c','-o','audio-sanitized']]
for c in commands:subprocess.run(c,cwd=here,check=True)
results={}
for name,cmd in [('arm',['qemu-arm-static','./audio-arm']),('host',['./audio-host']),('sanitized',['./audio-sanitized'])]:
 p=subprocess.run([*cmd,'audio-records.bin'],cwd=here,capture_output=True,text=True);results[name]={'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
report={'scope':'Audio update with fixture device output and variable split calibration; normal finite fixtures, no physical calibration claim','firmware_sha256':digest,'range':[hex(a),hex(z)],'relocations':[{'address':'0x5a5d0','target':'fixture_output','purpose':'output device pointer only'}],'commands':commands,'results':results}
(here/'audio-results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(v['returncode'] for v in results.values()))
