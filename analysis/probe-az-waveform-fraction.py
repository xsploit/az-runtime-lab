"""Execute original AZ fractional-position coefficient selection under QEMU.

No player/device emulation. SHA-pinned executable bytes stay in a temporary dir.
Start after unrelated virtual provider call; intercept before column rendering.
Requires clang, ld.lld and qemu-aarch64-static. No libc or cross sysroot needed.
"""
import argparse,hashlib,json,struct,subprocess,tempfile
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('firmware',type=Path);p.add_argument('--output',type=Path,required=True)
p.add_argument('--inputs',type=Path,help='JSON list of {position: signed milliseconds, zoom: positive finite float}')
choice=p.add_mutually_exclusive_group()
choice.add_argument('--linear-coefficients',action='store_true',help='Isolated candidate: complementary Q15 weights')
choice.add_argument('--smooth-coefficients',action='store_true',help='Interpolate the native contrast curve between its ten steps')
a=p.parse_args()
import math
inputs=json.loads(a.inputs.read_text()) if a.inputs else [{'position':position,'zoom':zoom} for zoom in (.125,.5,1.0) for position in range(-1000,1001)]
assert isinstance(inputs,list) and 0<len(inputs)<=60000
for row in inputs:
 assert type(row['position']) is int and -(1<<63)<=row['position']<(1<<63)
 assert math.isfinite(row['zoom']) and 0<row['zoom']<=16
count=len(inputs)
b=a.firmware.read_bytes()
sha=hashlib.sha256(b).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
ph=struct.unpack_from('<Q',b,32)[0];psz,pn=struct.unpack_from('<HH',b,54)
def read(va,n):
 for i in range(pn):
  k,fl,o,v,_,l,_,_=struct.unpack_from('<IIQQQQQQ',b,ph+i*psz)
  if k==1 and v<=va and va+n<=v+l:return b[o+va-v:o+va-v+n]
 raise ValueError(hex(va))
with tempfile.TemporaryDirectory(prefix='az-waveform-fraction-') as td:
 t=Path(td);sections=[];script=['ENTRY(_start)','SECTIONS {','. = 0x500000; .text : { *(.text) }','. = 0x501000; .capture : { *(.capture) }','. = 0x502000; .blended : { *(.blended) }','. = 0x510000; .bss : { *(.bss) }']
 input_file=t/'inputs.bin';input_file.write_bytes(b''.join(struct.pack('<qfI',v['position'],v['zoom'],0) for v in inputs))
 sections.append(f'.section .inputs,"a"\ninput_records: .incbin "{input_file}"')
 script.append('. = 0x800000; .inputs : { *(.inputs) }')
 # Original code plus literal pools. Intercept coefficient setup and RGB output.
 for va,n in [(0x1e00000,0x3000)]+[(v,0x1000) for v in sorted([0x260f000,0x27a0000,0x2895000,0x2d99000,0x2900000,0x28fd000])]:
  data=bytearray(read(va,n))
  if va==0x1e00000:
   hook=0x1e00ed4;old=struct.unpack_from('<I',data,hook-va)[0]
   assert old==0x1e620269,hex(old) # scvtf d9,w19; first instruction after setup
   struct.pack_into('<I',data,hook-va,0x14000000|(((0x501000-hook)//4)&0x3ffffff))
   hook=0x1e01480
   struct.pack_into('<I',data,hook-va,0x14000000|(((0x502000-hook)//4)&0x3ffffff))
  fn=t/f'{va:x}.bin';fn.write_bytes(data)
  name=f'.blob{va:x}';sections.append(f'.section {name},"ax"\n.incbin "{fn}"')
  script.append(f'. = {va:#x}; {name} : {{ *({name}) }}')
 script+=['/DISCARD/ : { *(.comment) *(.note*) }','}']
 (t/'link.ld').write_text('\n'.join(script))
 asm='''
.text
.global _start
_start:
 sub sp,sp,#512
 mov x26,#0
 adrp x27,output
 add x27,x27,:lo12:output
next:
 // Explicit input records permit realistic long tracks and alternate zooms.
 adrp x0,input_records
 add x0,x0,:lo12:input_records
 add x0,x0,x26,lsl #4
 ldr x2,[x0]
 str x2,[sp,#0x180]
 ldr w0,[x0,#8]
 str w0,[sp,#0x194]
 str xzr,[sp,#0x198]
 add x20,sp,#0x188
 add x23,sp,#0x180
 add x21,sp,#0x198
 mov x0,#0x1e00000
 add x0,x0,#0xe44
 br x0
.section .capture,"ax"
captured:
 CANDIDATE_COEFFICIENTS
 ldr x0,[sp,#0x180]
 ldr x1,[sp,#0x130]
 ldr x2,[sp,#0x138]
 ldr w3,[sp,#0x194]
 stp x0,x1,[x27]
 stp x2,x3,[x27,#16]
 str d8,[x27,#32]
 str xzr,[x27,#40]
 stp x26,x27,[sp,#0x1b0]
 str x28,[sp,#0x1c0]
 add x6,x27,#40
 add x22,sp,#0x138
 // Three independent channel cases: (100,100), (0,255), (255,0).
 mov w27,#255
 mov w25,#0
 mov w7,#0
 mov w26,#255
 mov w9,#100
 mov w28,#100
 mov x0,#0x1e00000
 add x0,x0,#0x1000
 add x0,x0,#0x41c
 br x0
.section .blended,"ax"
blended:
 ldp x26,x27,[sp,#0x1b0]
 ldr x28,[sp,#0x1c0]
 add x27,x27,#48
 add x26,x26,#1
 mov x0,#INPUT_COUNT
 cmp x26,x0
 b.lt next
 mov x0,#1
 adrp x1,output
 add x1,x1,:lo12:output
 sub x2,x27,x1
 mov x8,#64
 svc #0
 mov x0,#0
 mov x8,#93
 svc #0
.bss
.balign 16
output: .skip OUTPUT_BYTES
'''
 candidate='''ldr d0,[sp,#0x130]
 fcvtzs w0,d0,#15
 mov w1,#32768
 sub w1,w1,w0
 str w1,[sp,#0x138]
 str w0,[sp,#0x13c]''' if a.linear_coefficients else ''
 if a.smooth_coefficients:
  macro=(Path(__file__).resolve().parents[1]/'shims/waveform-coefficients.inc').read_text()
  asm=macro+'\n'+asm
  candidate='lab_smooth_waveform_coefficients'
 asm=asm.replace('CANDIDATE_COEFFICIENTS',candidate).replace('INPUT_COUNT',str(count)).replace('OUTPUT_BYTES',str(count*48))
 (t/'probe.S').write_text(asm+'\n'+'\n'.join(sections))
 subprocess.run(['clang','--target=aarch64-linux-gnu','-c',str(t/'probe.S'),'-o',str(t/'probe.o')],check=True,timeout=30)
 subprocess.run(['ld.lld','-T',str(t/'link.ld'),str(t/'probe.o'),'-o',str(t/'probe')],check=True,timeout=30)
 r=subprocess.run(['qemu-aarch64-static',str(t/'probe')],capture_output=True,check=True,timeout=15)
 assert len(r.stdout)==count*48,(len(r.stdout),r.stderr)
 rows=[]
 for i in range(count):
  pos,phase,w0,w1,zbits,pad,base=struct.unpack_from('<qdIIIId',r.stdout,i*48)
  flat,right,left=r.stdout[i*48+40:i*48+43]
  z=struct.unpack('<f',struct.pack('<I',zbits))[0]
  rows.append({'position':pos,'zoom':z,'fraction':phase,'coefficients':[w0,w1],'base_sample':base,'blend_flat100':flat,'blend_impulse_left':left,'blend_impulse_right':right,'impulse_sum':left+right})
 failures=[v for v in rows if v['blend_flat100']!=100 or v['blend_impulse_left']!=min(255,255*v['coefficients'][0]//32768) or v['blend_impulse_right']!=min(255,255*v['coefficients'][1]//32768)]
 if a.smooth_coefficients:
  table=[(32768,0),(31129,8847),(28835,12451),(26214,16056),(24248,19333),(22282,22282),(19333,24248),(16056,26214),(12451,28835),(8847,31129),(0,32768)]
  for row in rows:
   phase=row['fraction']; assert 0<=phase<=1
   index=min(9,int(phase*10));mix=phase*10-index
   expected=[int(table[index][k]+(table[index+1][k]-table[index][k])*mix) for k in range(2)]
   if expected!=row['coefficients']:failures.append(row)
 summary={'sha256':sha,'method':'Original AArch64 fractional coefficient setup and high-contrast RGB blending under QEMU; two exit branches intercepted. Full renderer and branch selection not executed.','samples':len(rows),'formula_mismatches':len(failures),'impulse_sum_min':min(v['impulse_sum'] for v in rows),'impulse_sum_max':max(v['impulse_sum'] for v in rows),'negative_samples':sum(v['position']<0 for v in rows),'coefficient_pairs':sorted({tuple(v['coefficients']) for v in rows}),'selected':[v for v in rows if v['zoom']==1 and v['position'] in [0,1,2,3,4,5,6,7,8,9,10,-1,-2]],'raw_file':str(a.output.with_suffix('.samples.json'))}
 a.output.with_suffix('.samples.json').write_text(json.dumps(rows)+'\n')
 summary['input_file']=str(a.inputs) if a.inputs else None
 summary['candidate_linear_coefficients']=a.linear_coefficients
 summary['candidate_smooth_coefficients']=a.smooth_coefficients
 a.output.write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary,indent=2))
 assert not failures,'Native blend differs from reconstructed formula'
