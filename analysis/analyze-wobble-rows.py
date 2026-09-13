"""Compare sampled native grid and waveform row translations; not optical panel motion."""
import collections,json,subprocess,sys
from pathlib import Path
p=Path(sys.argv[1])
info=json.loads(subprocess.check_output(['ffprobe','-v','error','-show_streams','-of','json',str(p)]))['streams'][0]
w,h=info['width'],info['height']
raw=subprocess.check_output(['ffmpeg','-v','error','-i',str(p),'-fps_mode','passthrough','-pix_fmt','rgb24','-f','rawvideo','-'])
size=w*h*3
assert len(raw)%size==0
out={'scope':'Native X11 sampled row shifts; positive means rightward. Not physical panel capture.', 'samples':len(raw)//size,'rows':{}}
for y in [10,40,60,75]:
 assert y<h
 last=None; shifts=collections.Counter(); rejected=0; changed=0; fractions=[]
 for off in range(0,len(raw),size):
  row=raw[off+y*w*3:off+(y+1)*w*3]
  if last is not None and row!=last:
   changed+=1
   # Nonblack source pixels avoid a spurious match dominated by background.
   points=[x for x in range(8,w-8) if any(last[3*x:3*x+3])]
   if len(points)<3: rejected+=1
   else:
    scores={d:sum(last[3*x:3*x+3]==row[3*(x+d):3*(x+d)+3] for x in points) for d in range(-4,5)}
    best=max(scores.values()); winners=[d for d,s in scores.items() if s==best]
    if len(winners)==1 and best/len(points)>=.95:
     shifts[winners[0]]+=1;fractions.append(best/len(points))
    else:rejected+=1
  last=row
 out['rows'][y]={'changed_samples':changed,'accepted_shift_histogram':dict(shifts),'rejected':rejected,'minimum_accepted_match':min(fractions) if fractions else None}
p.with_suffix('.rows.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
