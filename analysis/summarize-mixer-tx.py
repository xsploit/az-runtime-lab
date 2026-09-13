"""Summarize complete captured mixer TX frames without assigning unknown field meanings."""
from pathlib import Path
from collections import Counter
import json,argparse
from az_mixer_packet import inspect_tx
p=argparse.ArgumentParser();p.add_argument('capture',type=Path);p.add_argument('--output',type=Path,required=True);a=p.parse_args()
raw=a.capture.read_bytes()
if len(raw)%128:raise ValueError('Capture ends with partial frame')
frames=[raw[i:i+128] for i in range(0,len(raw),128)]
updates=[];bad=[];masks=Counter();changes=Counter()
for i,f in enumerate(frames):
 d=inspect_tx(f);masks[f'{f[39]:02x}']+=1
 if not d['checksum_valid']:bad.append(i)
 if f[39]:updates.append(dict(frame_index=i,mask=f'{f[39]:02x}',words=d['unnamed_word_updates'],records=d['unnamed_record_updates']))
 if i:
  for j,(x,y) in enumerate(zip(frames[i-1],f)):
   if x!=y:changes[j]+=1
r=dict(frames=len(frames),invalid_checksum_indices=bad,availability_masks=dict(masks),byte_change_counts=dict(changes),updates=updates,limitation='Frame indices are not timestamps; diagnostic capture can skip overlapping writes. Numeric fields remain unnamed.')
a.output.write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k!='updates'},indent=2));print('update_records',len(updates))
