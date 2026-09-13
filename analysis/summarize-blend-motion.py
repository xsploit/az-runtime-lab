"""Use each capture's declared time base; requested FPS is not its timestamp unit."""
import json,statistics,sys
from fractions import Fraction
from pathlib import Path
p=Path(sys.argv[1]);out={}
for f in sorted(p.glob('*.framemd5')):
 lines=f.read_text().splitlines()
 tb=Fraction(next(l.split(':',1)[1].strip() for l in lines if l.startswith('#tb 0:')))
 rows=[l.split(',') for l in lines if l and not l.startswith('#')]
 times=[float(int(r[2])*tb) for r in rows]
 assert all(b>=a for a,b in zip(times,times[1:]))
 duration=times[-1]-times[0];assert 5.8<duration<6.2
 changes=[times[i] for i in range(1,len(rows)) if rows[i][-1]!=rows[i-1][-1]]
 intervals=[b-a for a,b in zip(changes,changes[1:])]
 out[f.stem]={'samples':len(rows),'time_base':str(tb),'duration_seconds':duration,'change_rate_hz':len(changes)/duration,'median_interval_ms':statistics.median(intervals)*1000,'max_interval_ms':max(intervals)*1000}
(p/'cadence.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
