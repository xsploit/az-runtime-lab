"""Recover AZ EQ HUI registration IDs from pinned code and adjacent diagnostics.
This establishes static registration identities, not a safe live injection API.
"""
import hashlib,json,re,struct
from pathlib import Path
base=Path(__file__).resolve().parents[1]
d=(base/'xdjaz/rootfs/home/root/pdj/EP147').read_bytes()
sha=hashlib.sha256(d).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
o=struct.unpack_from('<Q',d,40)[0];z,n=struct.unpack_from('<HH',d,58)
ss=[struct.unpack_from('<IIQQQQIIQQ',d,o+i*z) for i in range(n)]
def va(off):
 for s in ss:
  if s[1]!=8 and s[4]<=off<s[4]+s[5]:return s[3]+off-s[4]
 raise ValueError(off)
targets={va(m.start()):m.group().decode() for m in re.finditer(rb'linkToObserver<IHuiKnob> \(huiid::Mixer::Ch<[0-3]>::eqIso(?:Hi|Mid|Low)\(\), this\)',d)}
assert len(targets)==12
rows=[]
for s in ss:
 if not s[2]&4:continue
 words=struct.unpack_from('<'+'I'*(s[5]//4),d,s[4])
 for i,w in enumerate(words):
  if w&0x9f000000!=0x90000000:continue
  imm=((w>>5&0x7ffff)<<2)|(w>>29&3);imm=imm-(1<<21) if imm&(1<<20) else imm
  page=((s[3]+i*4)&~4095)+(imm<<12);reg=w&31
  if page not in {a&~4095 for a in targets}:continue
  for j in range(i+1,min(i+10,len(words))):
   v=words[j]
   if v&0x7f000000!=0x11000000 or (v>>5&31)!=reg:continue
   addr=page+((v>>10&4095)<<(12 if v>>22&1 else 0))
   if addr not in targets:continue
   calls=[]
   for k in range(max(0,i-40),i):
    ins=words[k]
    if ins&0xfc000000!=0x94000000:continue
    rel=ins&0x3ffffff;rel=rel-(1<<26) if rel&(1<<25) else rel
    if s[3]+k*4+rel*4==0x6c5330:calls.append(k)
   assert len(calls)==1,(hex(addr),calls)
   k=calls[0];value=None;parts=[]
   for q in range(k-8,k):
    ins=words[q]
    if ins&31!=2:continue
    op=ins&0xff800000;shift=(ins>>21&3)*16;v16=ins>>5&65535
    if op==0xd2800000:value=v16<<shift;parts=[q]
    elif op==0xf2800000 and value is not None:value=(value&~(65535<<shift))|(v16<<shift);parts.append(q)
   assert value is not None and len(parts)==4
   rows.append(dict(diagnostic=targets[addr],diagnostic_va=hex(addr),reference=hex(s[3]+j*4),registration_call=hex(s[3]+k*4),hui_id=f'0x{value:016x}'))
assert len(rows)==12 and len({r['hui_id'] for r in rows})==12
out=dict(sha256=sha,scope='Static registration identity: nearest checked linkToObserver call and all four MOVZ/MOVK halfwords. No runtime ownership or knob payload semantics proven.',registrations=rows)
(base/'analysis/az-eq-hui-ids.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
