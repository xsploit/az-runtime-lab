"""Validate ELF64 Itanium class typeinfo against relocated ABI vtable addresses.
Extract direct bases, offset flags and candidate vtable address points.
No recovered source/member layout or virtual method semantics are claimed.
"""
from pathlib import Path
import struct,json,subprocess,re,hashlib
b=Path(__file__).resolve().parents[1]
for model,exe in [('xdjaz','EP147'),('cdj3000x','EP145')]:
 data=(b/model/'rootfs/home/root/pdj'/exe).read_bytes()
 off=struct.unpack_from('<Q',data,40)[0];size,num=struct.unpack_from('<HH',data,58)
 ss=[struct.unpack_from('<IIQQQQIIQQ',data,off+i*size) for i in range(num)]
 def pos(va,n=8):
  for s in ss:
   if s[1]!=8 and s[3]<=va and va+n<=s[3]+s[5]:return s[4]+va-s[3]
  raise ValueError(hex(va))
 def q(va):return struct.unpack_from('<Q',data,pos(va))[0]
 rel=subprocess.check_output(['readelf','-rW',str(b/model/'rootfs/home/root/pdj'/exe)],text=True)
 kinds={}
 for line in rel.splitlines():
  for label in ['__class_type_info','__si_class_type_info','__vmi_class_type_info']:
   if label+'E@' in line and 'R_AARCH64_COPY' in line:kinds[int(line.split()[0],16)+16]=label
 names=json.loads((b/'analysis'/f'{model}-rtti.json').read_text())['types'];classes={}
 for r in names:
  for ref in r['references']:
   addr=int(ref,16)-8
   try:kind=kinds.get(q(addr))
   except ValueError:continue
   if not kind:continue
   bases=[]
   if kind=='__si_class_type_info':bases=[dict(address=hex(q(addr+16)),offset_flags=None)]
   if kind=='__vmi_class_type_info':
    count=struct.unpack_from('<I',data,pos(addr+20,4))[0]
    if count>128:continue
    for i in range(count):
     bp=q(addr+24+i*16);flags=q(addr+32+i*16);signed=flags if flags<2**63 else flags-2**64
     bases.append(dict(address=hex(bp),offset_flags=hex(flags),public=bool(flags&2),virtual=bool(flags&1),offset_or_vtable_slot=signed>>8))
   classes[addr]=dict(type=r['type'],typeinfo=hex(addr),kind=kind,bases=bases,vtables=[])
 for c in classes.values():
  for x in c['bases']:x['type']=classes.get(int(x['address'],16),{}).get('type')
 for s in ss:
  if s[1]==8 or not s[2]&2 or s[2]&4:continue
  for i in range(8,s[5]-15,8):
   addr=s[3]+i;v=q(addr)
   if v not in classes:continue
   offset=struct.unpack_from('<q',data,pos(addr-8))[0];first=q(addr+8)
   executable=any(t[2]&4 and t[3]<=first<t[3]+t[5] for t in ss)
   if executable and abs(offset)<1048576:classes[v]['vtables'].append(dict(address_point=hex(addr+8),offset_to_top=offset,first_function=hex(first)))
 out=dict(binary=exe,sha256=hashlib.sha256(data).hexdigest(),validation='ABI vptr + type-name pointer; direct base records decoded; vtable candidates require executable first slot',classes=list(classes.values()))
 (b/'analysis'/f'{model}-inheritance.json').write_text(json.dumps(out,indent=2))
 print(model,len(classes),'class typeinfo records;',sum(len(c['bases']) for c in classes.values()),'direct bases;',sum(len(c['vtables']) for c in classes.values()),'vtable candidates')
