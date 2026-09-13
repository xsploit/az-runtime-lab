"""Estimate waveform translation independently of grid lines in native clips.

Image registration is an appearance measurement, not the true playhead or an
optical panel measurement. A smoothed column profile reduces sensitivity to
individual pixel contrast changes; report the residual relative to grid motion.
Requires numpy/scipy and ffmpeg. Crop is native x420,y85,640x190.
"""
import argparse,json,subprocess
from pathlib import Path
import numpy as np
from scipy.ndimage import gaussian_filter1d,map_coordinates
from scipy.optimize import minimize_scalar
p=argparse.ArgumentParser();p.add_argument('video',type=Path);p.add_argument('--sigma',type=float,default=1.0);p.add_argument('--self-check',action='store_true');a=p.parse_args()
x=np.arange(8,632,dtype=float)
def estimate(old,new):
 target=new[8:632];target=target-target.mean();norm=np.linalg.norm(target)
 if norm<1e-9:return float('nan'),0
 coeff=old # map_coordinates performs cubic prefilter for every candidate
 def loss(dx):
  candidate=map_coordinates(coeff,[x-dx],order=3,mode='nearest');candidate-=candidate.mean()
  return 1-float(candidate@target)/(max(1e-12,np.linalg.norm(candidate))*norm)
 opt=minimize_scalar(loss,bounds=(-3,3),method='bounded',options={'xatol':1e-5})
 return float(opt.x),1-float(opt.fun)
if a.self_check:
 rng=np.random.default_rng(813);profile=gaussian_filter1d(rng.normal(size=640),3)
 checks=[]
 for dx in [-2.7,-1.2,-.65,0,.4,1.3,2.5]:
  new=1.15*map_coordinates(profile,[np.arange(640)-dx],order=3,mode='nearest')+.3
  inferred,correlation=estimate(profile,new);checks.append({'true':dx,'estimated':inferred,'error':inferred-dx,'correlation':correlation})
 assert max(abs(r['error']) for r in checks)<.001,checks
 print(json.dumps({'estimator_translation_check':checks}))
meta=json.loads(subprocess.check_output(['ffprobe','-v','error','-select_streams','v:0','-show_frames','-show_entries','frame=best_effort_timestamp_time','-of','json',str(a.video)]))
times=[float(f['best_effort_timestamp_time']) for f in meta['frames']]
raw=subprocess.check_output(['ffmpeg','-v','error','-i',str(a.video),'-vf','crop=640:84:0:43','-fps_mode','passthrough','-f','rawvideo','-pix_fmt','rgb24','-'])
frames=np.frombuffer(raw,dtype=np.uint8).reshape(len(times),84,640,3)
profiles=frames.astype(np.float32).mean(axis=(1,3))
profiles=gaussian_filter1d(profiles,a.sigma,axis=1)
grid=json.loads(a.video.with_suffix('.centroids.json').read_text())['motion'];bytime={round(m['t'],6):m for m in grid}
rows=[]
for i in range(1,len(times)):
 dx,corr=estimate(profiles[i-1],profiles[i]);g=bytime.get(round(times[i],6));same=bool(np.array_equal(frames[i-1],frames[i]))
 rows.append({'time':times[i],'waveform_dx':0 if same else dx,'correlation':corr,'identical_waveform':same,'grid_dx':None if g is None else g['dx'],'residual':None if g is None else (0 if same else dx)-g['dx']})
valid=[r for r in rows if r['residual'] is not None and r['correlation']>.98 and abs(r['waveform_dx'])<2.95]
res=np.array([r['residual'] for r in valid]);motion=np.array([r['waveform_dx'] for r in valid])
summary={'video':str(a.video),'frames':len(frames),'sigma_pixels':a.sigma,'valid_pairs':len(valid),'total_pairs':len(rows),'minimum_correlation':min(r['correlation'] for r in rows),'identical_pairs':sum(r['identical_waveform'] for r in rows),'residual_mean':float(res.mean()),'residual_stddev':float(res.std()),'residual_absolute_p95':float(np.percentile(abs(res),95)),'estimated_rightward_pairs_over_0_05px':int((motion>.05).sum()),'waveform_dx_range':[float(motion.min()),float(motion.max())],'limits':'Inferred image translation from gaussian-smoothed column intensity profile, not true source position or optical motion. Sequential clips contain different song sections. Contrast/shape changes can bias the estimator.'}
a.video.with_suffix(f'.waveform-motion-sigma{a.sigma:g}.json').write_text(json.dumps({'summary':summary,'pairs':rows},indent=2)+'\n')
print(json.dumps(summary,indent=2))
