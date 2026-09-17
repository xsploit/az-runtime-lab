import json,sys
from pathlib import Path
p=Path(sys.argv[1]);d=json.loads((p/'damage.json').read_text());ev=json.loads((p/'events.json').read_text())
start=d['start_monotonic'];views=[e for e in ev if 'kind' in e]
def view(t):
 prior=[v for v in views if v['observed_at']<=t]
 return prior[-1]['kind'] if prior else 'unknown'
commands=[{'at':e['observed_at']-start,'command':e['command']} for e in ev if 'command' in e]
gaps=[]
for a,b in zip(d['samples'],d['samples'][1:]):
 ta=start+a['local_ms']/1000;tb=start+b['local_ms']/1000
 gaps.append({'start_s':ta-start,'end_s':tb-start,'gap_ms':(tb-ta)*1000,'from':view(ta),'to':view(tb)})
print(json.dumps({'commands':commands,'largest_gaps':sorted(gaps,key=lambda g:g['gap_ms'],reverse=True)[:12]},indent=2))
