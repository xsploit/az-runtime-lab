"""List direct AArch64 BL callers in AZ. Does not detect indirect calls."""
from pathlib import Path
import struct,json,sys
b=Path(__file__).resolve().parents[1];d=(b/'xdjaz/rootfs/home/root/pdj/EP147').read_bytes();target=int(sys.argv[1],0);o=struct.unpack_from('<Q',d,40)[0];z,n=struct.unpack_from('<HH',d,58);out=[]
for k in range(n):
 s=struct.unpack_from('<IIQQQQIIQQ',d,o+k*z)
 if not s[2]&4:continue
 for i in range(0,s[5]-3,4):
  w=struct.unpack_from('<I',d,s[4]+i)[0]
  if w&0xfc000000!=0x94000000:continue
  v=w&0x3ffffff;v=v-0x4000000 if v&0x2000000 else v
  if s[3]+i+4*v==target:out.append(hex(s[3]+i))
r={'target':hex(target),'direct_callers':out};(b/'analysis'/f'callers-{target:x}.json').write_text(json.dumps(r,indent=2));print(json.dumps(r))
