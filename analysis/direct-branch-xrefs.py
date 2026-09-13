"""List direct AArch64 B/BL references in executable ELF segments."""
import struct,sys,json
from pathlib import Path
p=Path(__file__).resolve().parents[1]/'xdjaz/rootfs/home/root/pdj/EP147';d=p.read_bytes();targets={int(x,0) for x in sys.argv[1:]};o=struct.unpack_from('<Q',d,32)[0];sz,n=struct.unpack_from('<HH',d,54);out=[]
for i in range(n):
 typ,flags,off,va,_,fs,_,_=struct.unpack_from('<IIQQQQQQ',d,o+i*sz)
 if typ!=1 or not flags&1:continue
 for j in range(0,fs-3,4):
  w=struct.unpack_from('<I',d,off+j)[0]
  if w&0x7c000000!=0x14000000:continue
  disp=w&0x3ffffff
  if disp&0x2000000:disp-=0x4000000
  target=va+j+disp*4
  if target in targets:out.append(dict(address=hex(va+j),target=hex(target),kind='BL' if w&0x80000000 else 'B'))
print(json.dumps(out,indent=2))
