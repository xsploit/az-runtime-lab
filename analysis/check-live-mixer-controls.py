"""Verify the recorded native deck1 test against applied host control offsets."""
from pathlib import Path
from array import array
import json,math,sys
b=Path(__file__).resolve().parents[1]
events=[json.loads(x) for x in (b/'xdjaz/mixer-stream.log').read_text().splitlines() if x.startswith('{')]
events=[e for e in events if 'control_frame' in e]
assert len(events)==4,events
v=array('f');v.frombytes((b/'xdjaz/state/tmp/mixed-output.raw').read_bytes())
if sys.byteorder!='little':v.byteswap()
results=[]
for i,e in enumerate(events):
 # Exclude ramp and settling; first second excludes transport startup.
 start=e['control_frame']+44100 if i==0 else e['control_frame']+4410
 end=min(start+44100,(events[i+1]['control_frame']-441 if i<3 else len(v)//4))
 assert end-start>=22050,(start,end)
 ch=[v[start*4+c:end*4:4] for c in range(4)]
 rms=[math.sqrt(sum(x*x for x in a)/len(a)) for a in ch]
 peak=[max(map(abs,a)) for a in ch]
 expected=[(True,True),(False,True),(True,False),(True,True)][i]
 assert (rms[0]>.005)==expected[0] and (rms[2]>.01)==expected[1],rms
 if not expected[0]:assert peak[0]==peak[1]==0
 if not expected[1]:assert peak[2]==peak[3]==0
 ratioerr=max(abs(h-2*m) for h,m in zip(ch[2],ch[0])) if all(expected) else None
 if ratioerr is not None:assert ratioerr<1e-7
 results.append(dict(control_frame=e['control_frame'],window=[start,end],rms=rms,peaks=peak,cue_double_master_error=ratioerr))
r=dict(verified=True,stages=results,scope='Native AZ generated deck1 tone through host mixer. No physical audio or native UI synchronization; does not measure end-to-end latency.')
(b/'analysis/az-live-controls-verification.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(r,indent=2))
