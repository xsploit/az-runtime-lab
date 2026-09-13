"""AZ EP147 static 211-entry thread table; raw unknown fields retained."""
from pathlib import Path
import struct,json,collections
b=Path(__file__).resolve().parents[1];d=(b/'xdjaz/rootfs/home/root/pdj/EP147').read_bytes();o=struct.unpack_from('<Q',d,32)[0];sz,n=struct.unpack_from('<HH',d,54);segments=[struct.unpack_from('<IIQQQQQQ',d,o+i*sz) for i in range(n)]
def offset(va):
 for typ,flags,off,v,_,fs,_,_ in segments:
  if typ==1 and v<=va<v+fs:return off+va-v
 raise ValueError(hex(va))
def string(va):
 p=offset(va);return d[p:d.index(b'\0',p)].decode('utf-8')
rows=[]
for i in range(211):
 va=0x2988ad0+48*i;p=offset(va);key,name,mask,p24,p32,p40=struct.unpack_from('<6Q',d,p)
 rows.append(dict(index=i,address=hex(va),id=hex(key),name=string(name),mask=hex(mask),raw24=hex(p24),label32=string(p32),raw40=hex(p40),reversed_mask20=hex(sum(((mask>>(19-j))&1)<<j for j in range(20)))))
(b/'analysis/az-thread-config-table.json').write_text(json.dumps(rows,indent=2)+'\n')
print('rows',len(rows),'mask counts',dict(collections.Counter(r['mask'] for r in rows)))
for r in rows:
 if any(x.lower() in r['name'].lower() for x in ('main','alsa','hui','indicator','display')):print(r)
