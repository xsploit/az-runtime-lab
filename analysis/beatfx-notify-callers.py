from pathlib import Path
import struct,json,hashlib
b=Path(__file__).resolve().parents[1];d=(b/'xdjaz/rootfs/home/root/pdj/EP147').read_bytes();digest=hashlib.sha256(d).hexdigest();assert digest=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
o=struct.unpack_from('<Q',d,40)[0];sz,n=struct.unpack_from('<HH',d,58);targets={0x2131378:'cached-state1 notify',0x2131448:'cached-state2 notify',0x21316e0:'state1 update',0x2131848:'state2 update'};calls=[]
for k in range(n):
 s=struct.unpack_from('<IIQQQQIIQQ',d,o+k*sz)
 if not s[2]&4:continue
 for off in range(0,s[5],4):
  w=struct.unpack_from('<I',d,s[4]+off)[0]
  if w&0xfc000000 not in (0x94000000,0x14000000):continue
  imm=w&0x3ffffff
  if imm&0x2000000:imm-=0x4000000
  dest=s[3]+off+imm*4
  if dest in targets:calls.append({'address':hex(s[3]+off),'target':hex(dest),'label':targets[dest]})
r={'binary_sha256':digest,'calls':calls};(b/'analysis/az-beatfx-notify-callers.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
