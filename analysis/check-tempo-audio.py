"""Measure active duration and interpolated zero-crossing frequency of a captured tone."""
from pathlib import Path
from array import array
import sys,json,argparse
p=argparse.ArgumentParser();p.add_argument("--output",type=Path);args=p.parse_args()
b=Path(__file__).resolve().parents[1];data=(b/'xdjaz/state/tmp/az-output.raw').read_bytes();a=array('f');a.frombytes(data[:len(data)//40*40]);del data
if sys.byteorder!='little':a.byteswap()
x=a[0::10];y=a[1::10];active=[i for i,v in enumerate(x) if abs(v)>1e-5]
if not active:raise RuntimeError('No active deck1 audio')
start,end=active[0],active[-1]+1
segment=x[start+4410:min(start+48510,end)]
c=[i-v/(segment[i+1]-v) for i,v in enumerate(segment[:-1]) if v<=0<segment[i+1]]
if len(c)<2:raise RuntimeError('Insufficient crossings')
duration=(end-start)/44100;hz=(len(c)-1)*44100/(c[-1]-c[0])
r=dict(active_duration_seconds=duration,expected_duration_seconds=10/1.051,measured_hz=hz,expected_resampled_hz=440*1.051,unchanged_pitch_hz=440,stereo_max_difference=max(abs(v-w) for v,w in zip(x,y)),peaks=[max(map(abs,a[i::10])) for i in range(10)],limitation='Generated sine, deck1, PC null-sink capture. Does not assess music quality, underruns, or Pi performance.')
(args.output or b/'analysis/az-tempo-audio-verification.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
