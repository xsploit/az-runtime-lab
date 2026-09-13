"""Separate tone playbacks using silence gaps and measure interior frequency windows."""
from pathlib import Path
from array import array
import sys,json,argparse
p=argparse.ArgumentParser();p.add_argument('--output',type=Path,required=True);a=p.parse_args()
b=Path(__file__).resolve().parents[1];data=(b/'xdjaz/state/tmp/az-output.raw').read_bytes();v=array('f');v.frombytes(data[:len(data)//40*40]);del data
if sys.byteorder!='little':v.byteswap()
x=v[::10];active=[i for i,z in enumerate(x) if abs(z)>1e-5];segments=[]
if active:
 start=last=active[0]
 for i in active[1:]:
  if i-last>4410:segments.append((start,last+1));start=i
  last=i
 segments.append((start,last+1))
rows=[]
for start,end in segments:
 windows=[]
 for sec in range(1,8):
  s=x[start+sec*44100:min(end,start+(sec+1)*44100)]
  if len(s)<44100:continue
  c=[i-z/(s[i+1]-z) for i,z in enumerate(s[:-1]) if z<=0<s[i+1]]
  if len(c)>1:windows.append({'second':sec,'hz':(len(c)-1)*44100/(c[-1]-c[0])})
 rows.append(dict(start_seconds=start/44100,duration_seconds=(end-start)/44100,windows=windows))
r=dict(segments=rows,limitation='Tone frequency windows and threshold-active spans; not a general music quality or latency test.')
a.output.write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
