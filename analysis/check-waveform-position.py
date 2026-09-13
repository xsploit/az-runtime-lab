"""Check native fraction/base reconstruction against explicit ordered inputs.

Does not test drawing, provider timing, source audio, or optical presentation.
"""
import argparse,json,math,struct
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('inputs',type=Path);p.add_argument('native',type=Path);p.add_argument('candidate',type=Path);p.add_argument('--output',type=Path,required=True);a=p.parse_args()
inputs=json.loads(a.inputs.read_text());native=json.loads(a.native.read_text());candidate=json.loads(a.candidate.read_text())
assert len(inputs)==len(native)==len(candidate)>0
changed=0
for inp,orig,test in zip(inputs,native,candidate):
 zoom=struct.unpack('<f',struct.pack('<f',inp['zoom']))[0]
 for row in (orig,test):
  assert row['position']==inp['position'] and row['zoom']==zoom
  assert math.isfinite(row['base_sample']) and 0<=row['fraction']<=1
 if any(orig[k]!=test[k] for k in ('position','zoom','base_sample','fraction')):changed+=1
results=[]
for z in sorted({r['zoom'] for r in native}):
 rows=sorted((r for r in native if r['zoom']==z),key=lambda r:r['position']);effective=max(z,.01)
 errors=[r['base_sample']*effective+r['fraction']-r['position']*150/1000*effective for r in rows]
 coords=[r['base_sample']*effective+r['fraction'] for r in rows]
 results.append({'zoom_f32':z,'samples':len(rows),'max_absolute_coordinate_error_px':max(map(abs,errors)),'backward_steps_in_ordered_inputs':sum(y<x for x,y in zip(coords,coords[1:]))})
report={'samples':len(native),'positions_match_between_modes':changed==0,'rows':results,'limits':'Original position setup and selected RGB blend fragments; constructed sorted positions. Not full renderer, scheduler, audible transport or optical screen.'}
a.output.write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
assert not changed,'Contrast candidate changed position calculation'
assert all(r['backward_steps_in_ordered_inputs']==0 and r['max_absolute_coordinate_error_px']<1e-7 for r in results),'Position setup does not match scaled position'
