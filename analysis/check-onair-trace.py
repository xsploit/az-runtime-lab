"""Report positive native mixer and OnAirManager callback observations."""
from pathlib import Path
import re,json
b=Path(__file__).resolve().parents[1]
s=(b/'xdjaz/state/tmp/onair-dispatch.log').read_text();rows=[]
for m in re.finditer(r' PC=([0-9a-f]+)(.*?)(?=PSTATE=)',s,re.S):
 pc=int(m[1],16)
 if pc not in (0x2132268,0x101e6d0,0x101db38):continue
 r={int(k):int(v,16) for k,v in re.findall(r'X(\d+)=([0-9a-f]+)',m[2])}
 rows.append(dict(pc=hex(pc),channel=r[1]&0xffffffff,state=r[2]&255))
masks=[0,8,4,2,1,15,0]
expected_raw=[(c,(mask>>(3-c))&1) for mask in masks for c in range(4)]
last={};expected_changes=[]
for c,state in expected_raw:
 if last.get(c)!=state:expected_changes.append((c,state));last[c]=state
actual_raw=[(r['channel'],r['state']) for r in rows if r['pc']=='0x2132268']
actual_changes=[(r['channel'],r['state']) for r in rows if r['pc']=='0x101e6d0']
result={'expected_masks':masks,'raw_sequence_matches':actual_raw==expected_raw,'listener_changes_match':actual_changes==expected_changes,'events':rows,'scope':'Native callback entry registers. Does not prove visible on-air indicator, network output, or audio gain.'}
(b/'analysis/az-onair-runtime.json').write_text(json.dumps(result,indent=2)+'\n')
for pc in ('0x2132268','0x101e6d0','0x101db38'):
 print(pc,[(r['channel'],r['state']) for r in rows if r['pc']==pc])
