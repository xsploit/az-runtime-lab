"""Extract audio processor virtual slots for subsequent method identification."""
from pathlib import Path
import json,struct
b=Path(__file__).resolve().parents[1]
for model,exe in [('xdjaz','EP147'),('cdj3000x','EP145')]:
 d=(b/model/'rootfs/home/root/pdj'/exe).read_bytes();o=struct.unpack_from('<Q',d,40)[0];sz,n=struct.unpack_from('<HH',d,58);ss=[struct.unpack_from('<IIQQQQIIQQ',d,o+i*sz) for i in range(n)]
 def q(a):
  for s in ss:
   if s[1]!=8 and s[3]<=a and a+8<=s[3]+s[5]:return struct.unpack_from('<Q',d,s[4]+a-s[3])[0]
  return 0
 targets=['combo_system::AudioSystem','dj_player::DjPlayerAudioProcessor','dj_player::DjPlayerUnit','meow::SimpleAudioMixer','meow::SimpleAudioSwitcher','meow::AudioProcessorBase']
 cs=json.loads((b/'analysis'/f'{model}-inheritance.json').read_text())['classes'];out=[]
 for c in cs:
  if c['type'] not in targets:continue
  for v in c['vtables']:
   if v['offset_to_top']!=0:continue
   ap=int(v['address_point'],16);slots=[]
   for i in range(128):
    f=q(ap+i*8)
    if not any(s[2]&4 and s[3]<=f<s[3]+s[5] for s in ss):break
    slots.append({'slot':i,'function':hex(f)})
   out.append({'type':c['type'],'address_point':hex(ap),'slots':slots})
 (b/'analysis'/f'{model}-audio-vtables.json').write_text(json.dumps(out,indent=2))
 print(model,[(x['type'],len(x['slots'])) for x in out])
