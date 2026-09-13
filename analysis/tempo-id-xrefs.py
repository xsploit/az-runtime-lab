"""Candidate MOVZ/MOVK materializations, requiring manual dataflow validation."""
from pathlib import Path
import struct, json
base=Path(__file__).resolve().parents[1]
d=(base/'xdjaz/rootfs/home/root/pdj/EP147').read_bytes()
o=struct.unpack_from('<Q',d,40)[0];sz,n=struct.unpack_from('<HH',d,58)
sections=[struct.unpack_from('<IIQQQQIIQQ',d,o+i*sz) for i in range(n)]
ids=[0xce526aad3c48b600,0xce526aad3c48b601]
hits=[]
for s in sections:
 if not s[2]&4:continue
 for i in range(0,s[5]-64,4):
  w=struct.unpack_from('<I',d,s[4]+i)[0]
  if w&0xff800000!=0xd2800000:continue
  reg=w&31;value=((w>>5)&65535)<<(((w>>21)&3)*16)
  for j in range(1,17):
   x=struct.unpack_from('<I',d,s[4]+i+j*4)[0]
   if x&0xff800000==0xf2800000 and x&31==reg:
    shift=((x>>21)&3)*16
    value=(value&~(65535<<shift))|(((x>>5)&65535)<<shift)
    if value in ids:
     hits.append({'start':hex(s[3]+i),'end':hex(s[3]+i+j*4),'register':reg,'value':hex(value),'lane':ids.index(value),'caveat':'Validate register writes and control flow'})
     break
out=base/'analysis/az-tempo-id-xrefs.json';out.write_text(json.dumps(hits,indent=2)+'\n')
print(json.dumps(hits,indent=2))
