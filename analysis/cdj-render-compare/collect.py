"""Read-only, pinned-image disassembly excerpts for local comparison."""
from helpers import *
import hashlib,json
out=Path(__file__).resolve().parent
specs={
 'az':('736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6',[
  ('config',0x1e262e0,0x1e26328),('local-player-timer',0x1e236d0,0x1e23708),
  ('display-delay',0x212f300,0x212f3d0),('display-callback',0x212fb40,0x212fc80),
  ('image-gate',0x23fad60,0x23fae80)]),
 'cdj':('97413d309b2bc2527bc38644245e7f1cb52e0d8de33dc48bc029048c81e9f378',[
  ('config',0x1f6acd8,0x1f6ad28),('config-callers',0x1f5d868,0x1f5d970),
  ('collection-constructor',0x1f6f750,0x1f6f8bc),('local-player-factory',0x1f6f1c8,0x1f6f460),
  ('hz-helper',0x24bcfb0,0x24bcfc4),('display-factory-call',0x2269d6c,0x2269d80),
  ('display-delay',0x22773c0,0x22773e0),('on-image-blit',0x22773e0,0x227747c),
  ('display-thunks-callback',0x2277618,0x2277778),('display-constructor-factory',0x22778d0,0x2277a34),
  ('display-hooks',0x22d6590,0x22d6618),('x11-delay-use',0x261abc8,0x261ac10),
  ('image-gate',0x251aa30,0x251ab54)])}
manifest={}
for model,(expected,ranges) in specs.items():
 e=ELF(model);sha=hashlib.sha256(e.d).hexdigest();assert sha==expected
 manifest[model]={'path':str(e.path),'sha256':sha}
 for name,start,end in ranges:(out/(model+'-'+name+'.asm')).write_text(e.dis(start,end))
c=ELF('cdj');hz=struct.unpack('<d',c.read(0x303ed98,8))[0]
manifest['cdj']['display_hz']=hz;manifest['cdj']['period_ms']=1000/hz
manifest['cdj']['display_type']=c.read(0x3040a00,80).split(b'\0')[0].decode()
manifest['cdj']['display_vtables']={hex(va):[hex(v) for v in struct.unpack('<'+str(n)+'Q',c.read(va,n*8))] for va,n in [(0x3040b00,9),(0x3040b58,3),(0x3040bb0,3)]}
# Gate comparison is exact code comparison including branches relative to gate.
a=ELF('az');assert a.read(0x23fadf8,0x3c)==c.read(0x251aac8,0x3c)
manifest['identical_image_gate']={'az_start':'0x23fadf8','cdj_start':'0x251aac8','length':60}
(out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print(json.dumps(manifest,indent=2))
