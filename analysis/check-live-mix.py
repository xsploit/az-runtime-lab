"""Check the fixed live mixer demo after loading/playing only deck1 tone."""
from pathlib import Path
from array import array
import sys,json,math
b=Path(__file__).resolve().parents[1]
data=(b/'xdjaz/state/tmp/mixed-output.raw').read_bytes()
if len(data)%16:raise ValueError('Partial output frame')
v=array('f');v.frombytes(data)
if sys.byteorder!='little':v.byteswap()
channels=[v[c::4] for c in range(4)]
active=[i for i,x in enumerate(channels[0]) if abs(x)>1e-6]
r={'frames':len(v)//4,'active_span_seconds':(active[-1]-active[0]+1)/44100 if active else 0,'peaks':[max(map(abs,c),default=0) for c in channels], 'master_stereo_error':max((abs(a-b) for a,b in zip(channels[0],channels[1])),default=0),'cue_stereo_error':max((abs(a-b) for a,b in zip(channels[2],channels[3])),default=0),'cue_vs_master_times_two_error':max((abs(c-2*m) for c,m in zip(channels[2],channels[0])),default=0),'scope':'Single generated deck1 tone with fixed master0.25/cue0.5. No physical device, latency or underrun guarantee.'}
if active:
 x=channels[0][active[0]+44100:active[0]+2*44100]
 crossings=[i-z/(x[i+1]-z) for i,z in enumerate(x[:-1]) if z<=0<x[i+1]]
 if len(crossings)>1:r['interior_tone_hz']=(len(crossings)-1)*44100/(crossings[-1]-crossings[0])
(b/'analysis/az-live-mixer-verification.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
if not active or r['cue_vs_master_times_two_error']>1e-6:raise SystemExit('Tone/routing check failed')
