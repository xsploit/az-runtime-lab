from pathlib import Path
import tempfile,subprocess,struct,hashlib,json,argparse,os
base=Path(__file__).resolve().parents[2]
p=argparse.ArgumentParser(description='Compare grid math against locally supplied AZ instructions; no Pi access')
p.add_argument('--firmware',type=Path,required=True);p.add_argument('--cc',default=os.environ.get('AZ_CC'));a=p.parse_args()
blob=a.firmware.read_bytes();out=base/'local/grid-oracle';out.mkdir(parents=True,exist_ok=True)
assert hashlib.sha256(blob).hexdigest()=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
phoff=struct.unpack_from('<Q',blob,32)[0];ents,num=struct.unpack_from('<HH',blob,54)
segments=[struct.unpack_from('<IIQQQQQQ',blob,phoff+i*ents) for i in range(num)]
with tempfile.TemporaryDirectory(prefix='az-raster-oracle-') as td:
 t=Path(td);asm=[];sections=[]
 for name,va,end in [('affine',0x23f7050,0x23f70cc),('generate',0x241e480,0x241e9cc)]:
  seg=next(s for s in segments if s[0]==1 and s[3]<=va and end<=s[3]+s[5]);off=seg[2]+va-seg[3]
  (t/(name+'.bin')).write_bytes(blob[off:off+end-va]);asm.append(f'.section .{name},"ax"\n.incbin "{t}/{name}.bin"\n');sections.append(f'. = {va}; .{name} : {{ *(.{name}) }}')
 (t/'native.S').write_text('\n'.join(asm));(t/'link.ld').write_text('ENTRY(_start)\nSECTIONS { . = 0x500000; .text : { *(.text*) } . = ALIGN(0x10000); .rodata : { *(.rodata*) } . = ALIGN(0x10000); .data : { *(.data*) } .bss : { *(.bss*) *(COMMON) } '+''.join(sections)+' /DISCARD/ : { *(.comment) *(.note*) *(.eh_frame*) } }')
 for variant in ("scalar","neon","gcc_neon","hook","negative"):
  if variant=="gcc_neon" and not a.cc:continue
  scalar=variant=="scalar"
  if variant=='hook':
   native=(t/'generate.bin').read_bytes()
   # Relocate the sole external BL in the golden copy; intra-function branches stay relative.
   golden=bytearray(native);delta=(0x23f7050-(0x2600000+0x54))//4
   assert struct.unpack_from('<I',golden,0x54)[0]>>26==0x25
   struct.pack_into('<I',golden,0x54,0x94000000|(delta&0x3ffffff));(t/'gold.bin').write_bytes(golden)
   (t/'native.S').write_text(f'.section .affine,"ax"\n.incbin "{t}/affine.bin"\n.section .generate,"ax"\nb oracle_dispatch\n.incbin "{t}/generate.bin",4\n.section .gold,"ax"\n.incbin "{t}/gold.bin"\n.section .trampoline,"ax"\n.incbin "{t}/generate.bin",0,8\nldr x16,1f\nbr x16\n1: .quad 0x241e488\n')
   ld=(t/'link.ld').read_text().replace(' /DISCARD/', ' . = 0x2500000; .trampoline : { *(.trampoline) } . = 0x2600000; .gold : { *(.gold) } /DISCARD/')
   (t/'link-hook.ld').write_text(ld)
  else:(t/'native.S').write_text('\n'.join(asm))
  flags=['clang','--target=aarch64-linux-gnu','-ffreestanding','-fno-builtin','-fno-stack-protector','-ffp-contract=off','-O2','-I'+str(base/'shims')]
  for src,name in [(base/'shims/grid_span.c','candidate'),(base/'tests/native-performance/oracle.c','test'),(t/'native.S','native')]:
   use=flags
   if variant=='gcc_neon' and name=='candidate':
    gcc=a.cc
    use=[str(gcc),'-std=c11',*flags[2:]]
   subprocess.run(use+(['-DLAB_SCALAR'] if scalar else ['-DLAB_ROUND=127'] if variant=='negative' else [])+(['-DHOOK_ORACLE'] if variant=='hook' else [])+['-c',str(src),'-o',str(t/(name+'.o'))],check=True)
  subprocess.run(['ld.lld','-T',str(t/('link-hook.ld' if variant=='hook' else 'link.ld')),*[str(t/(n+'.o')) for n in ('candidate','test','native')],'-o',str(t/'oracle')],check=True)
  r=subprocess.run(['qemu-aarch64-static',str(t/'oracle')],capture_output=True,timeout=60)
  if len(r.stdout)!=56:
   import shutil
   shutil.copy2(t/'oracle',out/'oracle-failed.private')
   raise RuntimeError((r.returncode,r.stderr,r.stdout))
  result=dict(zip(['tests','accepted','rejected','pixel_errors','state_errors','guard_errors','first_bad'],struct.unpack('<7Q',r.stdout)));result['variant']=variant;result['returncode']=r.returncode
  print(json.dumps(result),flush=True);(out/('oracle-'+result['variant']+'.json')).write_text(json.dumps(result,indent=2)+'\n');assert (r.returncode!=0 and result['pixel_errors']>0) if variant=='negative' else r.returncode==0,result
