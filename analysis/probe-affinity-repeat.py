"""Private AZ lab: same-start alternating main-thread affinity measurements."""
from pathlib import Path
import argparse,os,subprocess,time,json
b=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('--display',default=':0');a=p.parse_args();original=os.sched_getaffinity(a.pid);fast={0,2,4,6,8,10};results=[]
def erp(button):subprocess.run(['python',str(b/'analysis/send-erp-button.py'),'--button',button],stdout=subprocess.DEVNULL,check=True)
try:
 for i,cores in enumerate([original,fast,original,fast]):
  os.sched_setaffinity(a.pid,cores)
  erp('cue');erp('play');time.sleep(1)
  stem=b/'analysis'/f'az-affinity-repeat-{i}';path=stem.with_suffix('.framemd5')
  start=time.monotonic()
  subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-framerate','60','-video_size','1280x800','-i',a.display,'-t','6','-vf','crop=850:170:180:90','-f','framemd5',str(path)],check=True)
  hashes=[x.split(',')[-1].strip() for x in path.read_text().splitlines() if x and not x.startswith('#')]
  changes=sum(x!=y for x,y in zip(hashes,hashes[1:]))
  subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',a.display,'-frames:v','1',str(stem.with_suffix('.png'))],check=True)
  r=dict(index=i,cores=sorted(cores),samples=len(hashes),changes=changes,changes_per_second=changes/6,capture_wall_seconds=time.monotonic()-start,affinity_after=sorted(os.sched_getaffinity(a.pid)))
  results.append(r);print(json.dumps(r),flush=True)
finally:
 try:os.sched_setaffinity(a.pid,original)
 except ProcessLookupError:pass
 (b/'analysis/az-affinity-repeat.json').write_text(json.dumps(dict(pid=a.pid,measurements=results,scope='Same cue restart per sample, main-thread affinity only. Visual checkpoints need review; no physical audio/Pi claim.'),indent=2)+'\n')
