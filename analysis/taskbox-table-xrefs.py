"""Find direct ADRP+ADD address materializations; no dataflow across branches."""
from pathlib import Path
import struct,json
b=Path(__file__).resolve().parents[1];p=b/'xdjaz/rootfs/home/root/pdj/EP147';d=p.read_bytes();o=struct.unpack_from('<Q',d,40)[0];sz,n=struct.unpack_from('<HH',d,58);ss=[struct.unpack_from('<IIQQQQIIQQ',d,o+i*sz) for i in range(n)]
targets={0x2e63f60:'HuiMessageThreadTaskBox table',0x2e64358:'postMessage task table'};out=[]
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
   if x&0xff000000==0x91000000 and (x>>5)&31==reg:
    dest=page+(((x>>10)&4095)<<(12 if x&(1<<22) else 0))
    if dest in targets:out.append(dict(adrp=hex(s[3]+i),add=hex(s[3]+i+j*4),target=hex(dest),label=targets[dest],caveat='Validate register survival in disassembly'))
(b/'analysis/az-taskbox-table-xrefs.json').write_text(json.dumps(out,indent=2));print(json.dumps(out,indent=2))
