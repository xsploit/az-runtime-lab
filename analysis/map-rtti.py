"""Index Itanium type-name candidates and aligned references in ELF64 sections.
This does not recover methods, member layouts, or validate inheritance.
"""
import struct,re,subprocess,json,hashlib
from pathlib import Path
base=Path(__file__).resolve().parents[1]
for model,exe in [('xdjaz','EP147'),('cdj3000x','EP145')]:
 p=base/model/'rootfs/home/root/pdj'/exe; data=p.read_bytes()
 assert data[:6]==b'\x7fELF\x02\x01'
 off=struct.unpack_from('<Q',data,40)[0]; size,num,names=struct.unpack_from('<HHH',data,58)
 sections=[struct.unpack_from('<IIQQQQIIQQ',data,off+i*size) for i in range(num)]
 ns=sections[names]; table=data[ns[4]:ns[4]+ns[5]]
 def name(s):return table[s[0]:].split(b'\0',1)[0].decode()
 candidates=[]
 for s in sections:
  if name(s)!='.rodata':continue
  for m in re.finditer(rb'(?<![^\x00])[A-Za-z0-9_$.*]{3,4096}\x00',data[s[4]:s[4]+s[5]]):
   raw=m.group()[:-1].decode()
   if re.match(r'(?:N\d|\d+[A-Za-z])',raw):candidates.append((raw,s[3]+m.start(),s[4]+m.start()))
 demangled=subprocess.run(['c++filt','-t'],input='\n'.join(c[0] for c in candidates)+'\n',capture_output=True,text=True,check=True).stdout.splitlines()
 rows={va:dict(encoded=raw,type=demangled[i],address=hex(va),file_offset=hex(fo),references=[]) for i,(raw,va,fo) in enumerate(candidates) if demangled[i]!=raw}
 for s in sections:
  if s[1]==8 or not s[2]&2 or s[2]&4:continue
  for i in range(0,s[5]-7,8):
   ptr=struct.unpack_from('<Q',data,s[4]+i)[0]
   if ptr in rows:rows[ptr]['references'].append(hex(s[3]+i))
 report=dict(binary=exe,sha256=hashlib.sha256(data).hexdigest(),scope='Demangled type-name candidates and pointer references; not reconstructed source or proven class layouts',types=list(rows.values()))
 (base/'analysis'/f'{model}-rtti.json').write_text(json.dumps(report,indent=2))
 print(model,len(rows),'demangled type names;',sum(bool(x['references']) for x in rows.values()),'with aligned references')
