"""Pinned AZ RTTI references and vtable candidates for native EQ/isolator mode work."""
import hashlib,json,struct
from pathlib import Path
b=Path(__file__).resolve().parents[1];d=(b/'xdjaz/rootfs/home/root/pdj/EP147').read_bytes()
sha=hashlib.sha256(d).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
o=struct.unpack_from('<Q',d,40)[0];z,n=struct.unpack_from('<HH',d,58)
ss=[struct.unpack_from('<IIQQQQIIQQ',d,o+i*z) for i in range(n)]
def read(va):
 for s in ss:
  if s[1]!=8 and s[3]<=va and va+8<=s[3]+s[5]:return struct.unpack_from('<Q',d,s[4]+va-s[3])[0]
 raise ValueError(hex(va))
def executable(va):return any(s[2]&4 and s[3]<=va<s[3]+s[5] for s in ss)
out=[]
for t in json.loads((b/'analysis/xdjaz-rtti.json').read_text())['types']:
 if t['type'] not in ['meow::HuiSlider','midi_adapter::HuiEventAdapter','midi_adapter::HuiEventHandler','midi_adapter::MidiHidAdapter','midi_adapter::OperationDataServerKnob','hui::deck::Knob']:continue
 for ref in t['references']:
  ti=int(ref,16)-8;tables=[]
  for s in ss:
   if not s[2]&2 or s[1]==8:continue
   for i in range(0,s[5]-8,8):
    if struct.unpack_from('<Q',d,s[4]+i)[0]!=ti:continue
    addr=s[3]+i;f=[]
    for j in range(1,33):
     value=read(addr+j*8)
     if not executable(value):break
     f.append(hex(value))
    if f:tables.append(dict(address_point=hex(addr+8),offset_to_top=hex(read(addr-8)),functions=f))
  out.append(dict(type=t['type'],typeinfo=hex(ti),tables=tables))
names={int(r,16)-8:t['type'] for t in json.loads((b/'analysis/xdjaz-rtti.json').read_text())['types'] for r in t['references']}
for item in out:
 ti=int(item['typeinfo'],16);count=read(ti+16)>>32
 if 0<count<32:
  item['vmi_direct_base_candidates']=[dict(type=names.get(read(ti+24+i*16),hex(read(ti+24+i*16))),offset_flags=hex(read(ti+32+i*16))) for i in range(count)]
result=dict(sha256=sha,scope='Static RTTI and contiguous executable-pointer candidates; slot semantics and runtime ownership require tracing.',classes=out)
(b/'analysis/az-knob-observer-vtables.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
