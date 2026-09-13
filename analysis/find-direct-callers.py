"""Find AArch64 BL callsites to exact ELF virtual addresses. No indirect-call inference."""
import argparse,struct,json,hashlib
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('binary',type=Path);p.add_argument('targets',nargs='+',type=lambda x:int(x,0));a=p.parse_args();d=a.binary.read_bytes()
assert d[:6]==b'\x7fELF\x02\x01' and struct.unpack_from('<H',d,18)[0]==183
o=struct.unpack_from('<Q',d,40)[0];z,n=struct.unpack_from('<HH',d,58);out={hex(t):[] for t in a.targets}
for i in range(n):
 s=struct.unpack_from('<IIQQQQIIQQ',d,o+i*z)
 if not s[2]&4 or s[1]==8:continue
 for j in range(0,s[5]-3,4):
  w=struct.unpack_from('<I',d,s[4]+j)[0]
  if w>>26!=0b100101:continue
  rel=w&0x3ffffff
  if rel&(1<<25):rel-=1<<26
  va=s[3]+j;t=hex(va+4*rel)
  if t in out:out[t].append(hex(va))
print(json.dumps({'sha256':hashlib.sha256(d).hexdigest(),'direct_bl_callers':out},indent=2))
