"""Find direct ADRP+ADD address materializations; no dataflow across branches."""
from pathlib import Path
import struct,json
b=Path(__file__).resolve().parents[1];p=b/'xdjaz/rootfs/home/root/pdj/EP147';d=p.read_bytes();o=struct.unpack_from('<Q',d,40)[0];sz,n=struct.unpack_from('<HH',d,58);ss=[struct.unpack_from('<IIQQQQIIQQ',d,o+i*sz) for i in range(n)]
targets={0x3b86458:'Mic1 ID storage',0x3b86460:'Mic2 ID storage',0x3b86468:'Both ID storage'};out=[]
for s in ss:
 if not s[2]&4:continue
 for i in range(0,s[5]-32,4):
  w=struct.unpack_from('<I',d,s[4]+i)[0]
  if w&0x9f000000!=0x90000000:continue
  imm=((w>>29)&3)|(((w>>5)&0x7ffff)<<2)
  if imm&0x100000:imm-=0x200000
  page=((s[3]+i)&~4095)+(imm<<12);reg=w&31
  if not any((t&~4095)==page for t in targets):continue
  for j in range(1,9):
   x=struct.unpack_from('<I',d,s[4]+i+j*4)[0]
   if x&0xffc00000 in (0xf9000000,0xf9400000) and (x>>5)&31==reg:
    dest=page+(((x>>10)&4095)*8)
    if dest in targets:out.append(dict(adrp=hex(s[3]+i),instruction=hex(s[3]+i+j*4),operation='STR' if x&0xffc00000==0xf9000000 else 'LDR',target=hex(dest),label=targets[dest],caveat='Validate register survival in disassembly'))
(b/'analysis/az-mic-id-storage-xrefs.json').write_text(json.dumps(out,indent=2));print(json.dumps(out,indent=2))
