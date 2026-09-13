"""Summarize timer and position observations without claiming panel FPS."""
import json,statistics
from pathlib import Path
b=Path(__file__).resolve().parent;out={}
for label in ('original','candidate','restored'):
 rows=json.loads((b/f'az-position-rate-fields-{label}.json').read_text());assert len(rows)>1
 elapsed=rows[-1][0]-rows[0][0];r={'observed_seconds':elapsed}
 for idx,name in [(1,'repaint'),(2,'blit'),(3,'position')]:
  changes=[x for n,x in enumerate(rows) if not n or x[idx]!=rows[n-1][idx]]
  intervals=[(y[0]-x[0])*1000 for x,y in zip(changes,changes[1:])]
  deltas=[y[idx]-x[idx] for x,y in zip(changes,changes[1:])]
  r[name]={'changes':len(changes)-1,'observed_change_hz':(len(changes)-1)/elapsed,'observed_interval_ms_median':statistics.median(intervals) if intervals else None,'observed_interval_ms_max':max(intervals) if intervals else None,'value_delta_median':statistics.median(deltas) if deltas else None,'first':changes[0][idx],'last':changes[-1][idx]}
 r['position_units_per_second']=(rows[-1][3]-rows[0][3])/elapsed
 out[label]=r
(b/'az-position-rate-summary.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
