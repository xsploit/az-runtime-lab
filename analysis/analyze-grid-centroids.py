"""Track native red or gray grid-line coverage in a lossless RGB waveform crop.

Uses encoded red values as centroid weights, not optical luminance. Never infers
waveform motion or panel behavior from these measurements. Input: x420,y85,
640x190 native X11 capture, row15 (native y100) clear of bars labels.
"""
import argparse, json, math, statistics, subprocess
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('video',type=Path);p.add_argument('--row',type=int,default=15)
p.add_argument('--color',choices=['red','gray'],default='red')
a=p.parse_args()
meta=json.loads(subprocess.check_output(['ffprobe','-v','error','-select_streams','v:0','-show_frames',
    '-show_entries','frame=best_effort_timestamp_time','-of','json',str(a.video)],text=True))
times=[float(f['best_effort_timestamp_time']) for f in meta['frames']]
raw=subprocess.check_output(['ffmpeg','-v','error','-i',str(a.video),'-vf',f'crop=640:1:0:{a.row}',
    '-fps_mode','passthrough','-f','rawvideo','-pix_fmt','rgb24','-'])
assert len(raw)==len(times)*640*3,(len(raw),len(times))
frames=[];all_intensities=set()
for k,t in enumerate(times):
    row=raw[k*1920:(k+1)*1920]; groups=[]; group=[]; selected=bytearray(640)
    for x in range(640):
        r,g,b=row[x*3:x*3+3]
        matches=(r>0 and g==0 and b==0) if a.color=='red' else (r>0 and r==g==b)
        if matches:
            selected[x]=r
            group.append((x,r));all_intensities.add(r)
        elif group:groups.append(group);group=[]
    if group:groups.append(group)
    lines=[{'x':sum(x*r for x,r in g)/sum(r for x,r in g),'coverage_sum':sum(r for x,r in g),'width':len(g)}
           for g in groups if 0<g[0][0] and g[-1][0]<639 and len(g)<=3]
    frames.append({'t':t,'lines':lines,'rgb':bytes(selected)})
motion=[];ambiguous=0
for old,new in zip(frames,frames[1:]):
    deltas=[]
    for line in old['lines']:
        nearby=[other for other in new['lines'] if abs(other['x']-line['x'])<4]
        if len(nearby)==1:deltas.append(nearby[0]['x']-line['x'])
    if not deltas:
        ambiguous+=1;continue
    spread=max(deltas)-min(deltas)
    if spread>.025:ambiguous+=1;continue
    dx=statistics.median(deltas)
    motion.append({'t':new['t'],'dt':new['t']-old['t'],'dx':dx,'matched_lines':len(deltas)})
changes=sum(x['rgb']!=y['rgb'] for x,y in zip(frames,frames[1:]))
deltas=[m['dx'] for m in motion]
moving=[m for m in motion if abs(m['dx'])>1e-6]
coverage=[l['coverage_sum'] for f in frames for l in f['lines']]
widths=[l['width'] for f in frames for l in f['lines']]
elapsed=times[-1]-times[0]
summary={'video':str(a.video),'color':a.color,'frames':len(frames),'duration_between_first_last':elapsed,
    'grid_row_changes':changes,'grid_row_changes_per_second':changes/elapsed,
    'matched_frame_pairs':len(motion),'ambiguous_frame_pairs':ambiguous,
    'stationary_pairs':sum(abs(v)<=1e-6 for v in deltas),
    'left_pairs':sum(v < -1e-6 for v in deltas),'right_pairs':sum(v > 1e-6 for v in deltas),
    'dx_range':[min(deltas),max(deltas)] if deltas else None,
    'mean_dx':statistics.mean(deltas) if deltas else None,
    'step_stddev':statistics.pstdev(deltas) if deltas else None,
    f'encoded_{a.color}_coverage_range':[min(coverage),max(coverage)] if coverage else None,
    'line_widths':sorted(set(widths)),f'{a.color}_values':sorted(all_intensities),
    'limits':'Native software grid only; encoded channel weights, not optical luminance. Sequential clips, not identical song positions.'}
out=a.video.with_suffix('.centroids.json' if a.color=='red' else '.gray-centroids.json')
out.write_text(json.dumps({'summary':summary,'motion':motion},indent=2)+'\n')
print(json.dumps(summary,indent=2))
