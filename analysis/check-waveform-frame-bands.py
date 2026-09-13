"""Inspect separate waveform row bands around image-registration outliers."""
import json,subprocess
from pathlib import Path
import numpy as np
from scipy.ndimage import gaussian_filter1d,map_coordinates
from scipy.optimize import minimize_scalar
root=Path(__file__).resolve().parent/'grid-waveform-blend/az-grid-curve-motion'
x=np.arange(8,632,dtype=float)
def shift(a,b):
 a=gaussian_filter1d(a,1);b=gaussian_filter1d(b,1)[8:632];b-=b.mean();norm=np.linalg.norm(b)
 if norm<1e-9:return None
 def loss(dx):
  c=map_coordinates(a,[x-dx],order=3,mode='nearest');c-=c.mean()
  return 1-float(c@b)/(max(1e-12,np.linalg.norm(c))*norm)
 r=minimize_scalar(loss,bounds=(-3,3),method='bounded');return {'dx':float(r.x),'correlation':1-float(r.fun)}
out={}
for name in ['grid-and-smooth-curve','grid-only-restored']:
 d=json.loads((root/f'{name}.waveform-motion-sigma1.json').read_text());indices=[i+1 for i,r in enumerate(d['pairs']) if abs(r['residual'])>.3]
 raw=subprocess.check_output(['ffmpeg','-v','error','-i',str(root/f'{name}.mkv'),'-frames:v',str(max(indices)+2),'-fps_mode','passthrough','-f','rawvideo','-pix_fmt','rgb24','-'])
 frames=np.frombuffer(raw,dtype=np.uint8).reshape(-1,190,640,3)
 rows=[]
 for i in indices:
  old,new=frames[i-1],frames[i];same=np.all(old==new,axis=(1,2))
  result={'frame':i,'global_pair':d['pairs'][i-1],'identical_rows_in_waveform':[int(k) for k in range(43,127) if same[k]],'bands':[]}
  for lo,hi in [(43,64),(64,85),(85,106),(106,127)]:
   estimate=shift(old[lo:hi].astype(float).mean(axis=(0,2)),new[lo:hi].astype(float).mean(axis=(0,2)))
   result['bands'].append({'rows':[lo,hi-1],'estimate':estimate})
  rows.append(result)
 out[name]=rows
(root/'waveform-outlier-bands.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
