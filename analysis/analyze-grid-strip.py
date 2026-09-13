"""Measure red grid-line displacement in a native X11 strip, not panel FPS.
Rejects frames without detectable grid and ambiguous/nonmatching transitions.
"""
import argparse,collections,json,subprocess,statistics,itertools
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('capture',type=Path);a=p.parse_args()
probe=json.loads(subprocess.check_output(['ffprobe','-v','error','-select_streams','v:0','-show_frames','-show_streams','-of','json',str(a.capture)]))
s=probe['streams'][0];w,h=s['width'],s['height'];assert h==1
raw=subprocess.check_output(['ffmpeg','-v','error','-i',str(a.capture),'-fps_mode','passthrough','-f','rawvideo','-pix_fmt','rgb24','-'])
size=w*3;assert len(raw)%size==0
frames=[raw[i:i+size] for i in range(0,len(raw),size)]
times=[float(f['best_effort_timestamp_time']) for f in probe['frames']];assert len(times)==len(frames)
colors=collections.Counter();widths=collections.Counter();steps=[];changes=[];rejected=[];last=None
for i,f in enumerate(frames):
 points=set()
 for x in range(w):
  r,g,b=f[3*x:3*x+3]
  if r>100 and g<50 and b<50:points.add(x);colors[(r,g,b)]+=1
 for _,run in itertools.groupby(enumerate(sorted(points)),lambda pair:pair[1]-pair[0]):
  widths[sum(1 for _ in run)]+=1
 if len(points)<3:rejected.append({'frame':i,'reason':'too few red lines'});last=None;continue
 if last is not None and points!=last:
  # Match only central source points so cropping does not affect the score.
  src={x for x in last if 12<=x<w-12}
  scores={d:sum(x+d in points for x in src) for d in range(-12,13)}
  best=max(scores.values());ds=[d for d,v in scores.items() if v==best]
  if len(ds)==1 and best==len(src):steps.append(ds[0]);changes.append(times[i])
  else:rejected.append({'frame':i,'reason':'ambiguous or imperfect shift','best_matches':best,'source_lines':len(src)})
 last=points
intervals=[(b-a)*1000 for a,b in zip(changes,changes[1:])]
r={'capture':str(a.capture),'scope':'Native X11 red-grid strip only; sampled transitions, not physical display FPS','width':w,'samples':len(frames),'duration_first_to_last_seconds':times[-1]-times[0],'unique_frames':len(set(frames)),'accepted_transitions':len(steps),'line_width_pixels_histogram':dict(widths),'interval_rounded_ms_histogram':dict(collections.Counter(round(v) for v in intervals)),'shift_pixels_histogram':dict(collections.Counter(steps)),'red_pixel_colors':{str(k):v for k,v in colors.items()},'interval_ms_median':statistics.median(intervals) if intervals else None,'interval_ms_max':max(intervals) if intervals else None,'rejected':rejected}
a.capture.with_suffix('.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
