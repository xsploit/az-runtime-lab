"""Correlate AZ raw fader calls with shared slider notification execution."""
import re,json
from pathlib import Path
b=Path(__file__).resolve().parents[1]
text=(b/'xdjaz/state/tmp/fader-dispatch.log').read_text()
blocks=[]
for m in re.finditer(r' PC=([0-9a-f]+)(.*?)(?=PSTATE=)',text,re.S):
 regs={int(k):int(v,16) for k,v in re.findall(r'X(\d+)=([0-9a-f]+)',m[2])}
 blocks.append((int(m[1],16),regs))
returns={0x2153c80:0,0x2153ca4:1,0x2153cc8:2,0x2153cec:3}
controls={};calls=[]
for pc,r in blocks:
 if pc==0x2159560 and r.get(30) in returns:
  controls[r[0]]=returns[r[30]]
  calls.append(dict(channel=returns[r[30]],raw=r[2],control=hex(r[0])))
counts={}
for pc,r in blocks:
 if r.get(20) in controls:
  k=(controls[r[20]],hex(pc));counts[k]=counts.get(k,0)+1
result={'raw_calls':calls,'per_control_blocks':[dict(channel=k[0],pc=k[1],count=v) for k,v in sorted(counts.items())], 'scope':'Observed basic-block entry registers; callback block 0x21596f0 invokes slot2. TB chaining can suppress repeated block entries: counts are observed entries, not total executions. Does not identify downstream DSP or observer implementation.'}
(b/'analysis/az-fader-dispatch-trace.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
