"""Compare captured channel levels away from injected fader transitions."""
import json,sys,math
from array import array
from pathlib import Path
b=Path(__file__).resolve().parents[1]
rows=json.loads((b/'analysis/az-fader-output-events.json').read_text())
with (b/'xdjaz/state/tmp/az-output.raw').open('rb') as f:
 for row in rows:
  # Exclude 0.5 sec after enqueue and 0.25 sec before next packet.
  start=row['start_frame']+22050;end=row['end_frame']-11025
  if end<=start:raise ValueError('Capture interval too short')
  f.seek(start*40);v=array('f');v.frombytes(f.read((end-start)*40))
  if len(v)!=(end-start)*10:raise ValueError('Incomplete capture')
  if sys.byteorder!='little':v.byteswap()
  row['measured_start_frame']=start;row['measured_end_frame']=end
  row['channels']=[dict(channel=c+1,peak=max(map(abs,v[c::10])),rms=math.sqrt(sum(x*x for x in v[c::10])/(end-start))) for c in range(10)]
r={'intervals':rows,'limitation':'FIFO enqueue and raw capture offsets; no dispatcher receipt acknowledgement. Single deck tone, all four faders changed together; does not prove hardware mixer semantics.'}
(b/'analysis/az-fader-output-comparison.json').write_text(json.dumps(r,indent=2)+'\n')
for row in rows:print(row['raw_faders'],row['channels'][:2], 'other_peak',max(x['peak'] for x in row['channels'][2:]))
