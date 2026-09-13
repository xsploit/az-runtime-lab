"""Resolve observed AZ slider callback targets against validated RTTI vtables."""
import re,json,struct
from pathlib import Path
b=Path(__file__).resolve().parents[1]
s=(b/'xdjaz/state/tmp/fader-dispatch.log').read_text()
blocks=[]
for m in re.finditer(r' PC=([0-9a-f]+)(.*?)(?=PSTATE=)',s,re.S):
 blocks.append((int(m[1],16),{int(k):int(v,16) for k,v in re.findall(r'X(\d+)=([0-9a-f]+)',m[2])}))
returns={0x2153c80:0,0x2153ca4:1,0x2153cc8:2,0x2153cec:3}
controls={r[0]:returns[r[30]] for pc,r in blocks if pc==0x2159560 and r.get(30) in returns}
binary=(b/'xdjaz/rootfs/home/root/pdj/EP147').read_bytes()
lookup={}
for cls in json.loads((b/'analysis/xdjaz-inheritance.json').read_text())['classes']:
 for vt in cls['vtables']:
  fn=struct.unpack_from('<Q',binary,int(vt['address_point'],16)-0x400000+16)[0]
  lookup.setdefault(fn,[]).append(dict(type=cls['type'],vtable=vt['address_point'],offset_to_top=vt['offset_to_top']))
rows=[]
for pc,r in blocks:
 if pc in (0x21f49cc,0x21f4a00) and r.get(20) in controls:
  item=dict(channel=controls[r[20]],control=hex(r[20]),observer=hex(r[19]),target=hex(r[22]),candidates=lookup.get(r[22],[]))
  if item not in rows:rows.append(item)
out=dict(receivers=rows,limitation='Positive observed callback-target candidates only; TB chaining can omit repeated blocks. Shared function pointers may identify multiple classes; no exhaustive observer inventory.')
(b/'analysis/az-fader-receivers.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
