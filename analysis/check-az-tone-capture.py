"""Check captured AZ float32/44100Hz/10-channel PCM against a sine fixture."""
from pathlib import Path
from array import array
import math,json,sys,wave,argparse
parser=argparse.ArgumentParser();parser.add_argument("--channel",type=int,choices=range(1,10),default=1);parser.add_argument("--label",default="deck1");args=parser.parse_args()
if not args.label.isalnum():raise ValueError("Alphanumeric label required")
base=Path(__file__).resolve().parents[1]
p=base/'xdjaz/state/tmp/az-output.raw'
data=p.read_bytes()
a=array('f');a.frombytes(data[:len(data)//40*40])
del data
if sys.byteorder!='little':a.byteswap()
left=a[args.channel-1::10];right=a[args.channel::10]
active=[i for i,v in enumerate(left) if abs(v)>1e-5]
if not active:raise RuntimeError(f'No active channel{args.channel} samples')
start=active[0];end=active[-1]+1
segment=left[start+4410:min(start+4410+44100,end)]
if len(segment)<22050:raise RuntimeError('Not enough tone samples')
crossings=[i for i,(x,y) in enumerate(zip(segment,segment[1:])) if x<=0<y]
n=len(segment);energy=sum(x*x for x in segment)
c=sum(x*math.cos(2*math.pi*440*i/44100) for i,x in enumerate(segment))
s=sum(x*math.sin(2*math.pi*440*i/44100) for i,x in enumerate(segment))
r={'first_channel':args.channel,'rate':44100,'channels':10,'format':'float32 little endian','active_start_seconds':start/44100,'active_duration_seconds':(end-start)/44100,'channel_peaks':[max(map(abs,a[k::10])) for k in range(10)],'stereo_max_difference':max(abs(x-y) for x,y in zip(left,right)),'positive_zero_crossing_hz':(len(crossings)-1)*44100/(crossings[-1]-crossings[0]),'energy_fraction_at_440_hz':2*(c*c+s*s)/(n*energy),'limitation':'Single generated tone and selected output pair; no speakers, hardware mixer, other decks, or Pi performance tested'}
(base/f'analysis/az-audio-{args.label}-tone-verification.json').write_text(json.dumps(r,indent=2)+'\n')
clip=array('h',(int(max(-1,min(1,v))*32767) for v in left[start:min(start+88200,end)]))
if sys.byteorder!='little':clip.byteswap()
with wave.open(str(base/f'xdjaz/decoded-{args.label}-tone-preview.wav'),'wb') as w:w.setnchannels(1);w.setsampwidth(2);w.setframerate(44100);w.writeframes(clip.tobytes())
print(json.dumps(r,indent=2))
