"""Summarize sampled pixel changes; does not measure completed/presented FPS."""
import argparse,json,re
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('input',type=Path);a=p.parse_args();lines=a.input.read_text().splitlines()
tb=next(re.search(r'#tb 0:\s*(\d+)/(\d+)',s) for s in lines if s.startswith('#tb 0:'));unit=int(tb[1])/int(tb[2]);rows=[s.split(',') for s in lines if s and not s.startswith('#')]
changes=[int(r[2]) for n,r in enumerate(rows) if n==0 or r[-1]!=rows[n-1][-1]];g=sorted([(b-a)*unit*1000 for a,b in zip(changes,changes[1:])]);duration=(int(rows[-1][2])+int(rows[-1][3])-int(rows[0][2]))*unit if rows else 0
result=dict(frames=len(rows),duration_seconds=duration,changed_samples=len(changes),change_rate_hz=(len(changes)-1)/duration if duration else None,interval_ms=dict(median=g[len(g)//2],p95=g[int(len(g)*.95)],max=max(g)) if g else None,note='Sampled X11 pixel changes, not panel FPS. Verify playback/view and account for capture overhead.')
a.input.with_suffix('.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
