"""Render a private AZ ten-channel capture through the original lab mixer.

Demo routing: all four decks to master at 0.25 gain; deck1 to pre-fader
headphones at0.5 gain. Output WAV channels: masterL/R,headphonesL/R.
No real-time, FLX6 mapping, effects or native DSP equivalence claim.
"""
import argparse,array,ctypes,gzip,json,math,subprocess,sys,tempfile,wave
from pathlib import Path
p=argparse.ArgumentParser(description=__doc__);p.add_argument('capture',type=Path);p.add_argument('output',type=Path);a=p.parse_args()
class Settings(ctypes.Structure):
 _fields_=[('channel_gain',ctypes.c_float*4),('cross_assign',ctypes.c_int*4),('cue_mask',ctypes.c_uint),('cross_position',ctypes.c_float),('master_gain',ctypes.c_float),('headphones_gain',ctypes.c_float),('cue_master_mix',ctypes.c_float)]
s=Settings((1,1,1,1),(0,0,0,0),1,.5,.25,.5,0)
base=Path(__file__).resolve().parent
peaks=[0.]*4;power=[0.]*4;count=0;clipped=0;error=0.
with tempfile.TemporaryDirectory(prefix='az-mix-') as tmp:
 libpath=Path(tmp)/'mix.so'
 subprocess.run(['cc','-shared','-fPIC','-O2',str(base/'deck_mix.c'),'-lm','-o',str(libpath)],check=True)
 lib=ctypes.CDLL(str(libpath));lib.lab_mix.argtypes=[ctypes.POINTER(Settings),ctypes.POINTER(ctypes.c_float),ctypes.POINTER(ctypes.c_float),ctypes.c_size_t];lib.lab_mix.restype=None
 with gzip.open(a.capture,'rb') as src,wave.open(str(a.output),'wb') as dst:
  dst.setnchannels(4);dst.setsampwidth(2);dst.setframerate(44100)
  while data:=src.read(40*4096):
   if len(data)%40:raise ValueError('Truncated interleaved frame')
   v=array.array('f');v.frombytes(data)
   if sys.byteorder!='little':v.byteswap()
   frames=len(v)//10;inp=(ctypes.c_float*len(v)).from_buffer(v);out=(ctypes.c_float*(frames*4))()
   lib.lab_mix(ctypes.byref(s),inp,out,frames)
   pcm=array.array('h')
   for n in range(frames):
    reference=[sum(v[n*10+c*2+side] for c in range(4))*.25 for side in range(2)]+[v[n*10]*.5,v[n*10+1]*.5]
    for c in range(4):
     x=out[n*4+c]
     if not math.isfinite(x):raise ValueError('Non-finite output')
     error=max(error,abs(x-reference[c]));peaks[c]=max(peaks[c],abs(x));power[c]+=x*x
     clipped+=abs(x)>1
     pcm.append(round(max(-1,min(1,x))*32767))
   if sys.byteorder!='little':pcm.byteswap()
   dst.writeframesraw(pcm.tobytes());count+=frames
r=dict(frames=count,seconds=count/44100,channel_order=['masterL','masterR','headphonesL','headphonesR'],peak=peaks,rms=[math.sqrt(x/count) for x in power],samples_clipped=clipped,max_reference_error=error,scope=__doc__)
a.output.with_suffix('.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
if error>1e-6:raise SystemExit('Reference mismatch')
