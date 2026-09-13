"""Look for split updates in lossless native x420,y85,640x190 captures.

Top and bottom red grid rows should agree when they represent one completed
waveform rectangle. This is a recording observation, not a panel measurement.
"""
import argparse,json,subprocess
from pathlib import Path
import numpy as np
p=argparse.ArgumentParser();p.add_argument('video',type=Path);a=p.parse_args()
raw=subprocess.check_output(['ffmpeg','-v','error','-i',str(a.video),'-fps_mode','passthrough','-f','rawvideo','-pix_fmt','rgb24','-'])
v=np.frombuffer(raw,np.uint8).reshape(-1,190,640,3)
def reds(row):
 rgb=v[:,row];mask=(rgb[:,:,0]>0)&(rgb[:,:,1]==0)&(rgb[:,:,2]==0)
 return np.where(mask,rgb[:,:,0],0)
top,bottom=reds(15),reds(155)
valid=(top.sum(axis=1)>0)&(bottom.sum(axis=1)>0)
mismatch=np.any(top!=bottom,axis=1)&valid
changed=np.any(v[1:]!=v[:-1],axis=(2,3))
# The observed first request boundary is crop-relative y76 (native y161).
complement=[]
for i in range(len(changed)-1):
 if changed[i,43:76].any() and not changed[i,76:127].any() and not changed[i+1,43:76].any() and changed[i+1,76:127].any():
  complement.append(i+1)
summary={'video':str(a.video),'frames':len(v),'frames_with_both_red_rows':int(valid.sum()),'top_bottom_red_mismatch_frames':int(mismatch.sum()),'mismatch_frame_indices':np.where(mismatch)[0].tolist(),'complementary_waveform_split_pairs':len(complement),'split_first_frame_indices':complement,'limits':'Native X11 readback. Top/bottom red-grid comparison depends on matching layout; raw row differences can also come from labels or clipping and are NOT a count of partial frames. Complementary row changes are a targeted heuristic at the independently observed upload boundary.'}
a.video.with_suffix('.upload-bands.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary,indent=2))
