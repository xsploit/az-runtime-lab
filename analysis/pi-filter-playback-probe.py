"""Session-specific AZ compositor-filter A/B/A; no persistent config edits.
Requires verified moving tracks and the listed process identities. Reports
native pixel changes separately from CPU samples; does not measure panel FPS.
"""
import os,json,subprocess,time
from pathlib import Path
out=Path('/tmp');env=os.environ.copy();env.update(XDG_RUNTIME_DIR='/run/user/1000',WAYLAND_DISPLAY='wayland-1',SWAYSOCK='/run/user/1000/sway-ipc.1000.1143.sock')
pids={'az':9262,'xwayland':9256,'sway':1143}
for name,pid in pids.items():assert Path(f'/proc/{pid}/comm').read_text().strip()=={'az':'EP147','xwayland':'Xwayland','sway':'sway'}[name]
def stat(pid):
 fields=Path(f'/proc/{pid}/stat').read_text().rsplit(')',1)[1].split()
 return int(fields[11])+int(fields[12]),fields[19]
def filt(value):
 r=json.loads(subprocess.check_output(['swaymsg','output','DSI-2','scale_filter',value],env=env,timeout=5));assert all(x['success'] for x in r)
original=next(x['scale_filter'] for x in json.loads(subprocess.check_output(['swaymsg','-t','get_outputs'],env=env)) if x['name']=='DSI-2')
results=[]
try:
 for label,value in [('linear-before','linear'),('nearest','nearest'),('linear-after','linear')]:
  filt(value);time.sleep(.2)
  before={k:stat(v) for k,v in pids.items()};start=time.monotonic()
  subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-framerate','120','-video_size','850x170','-i',':0+180,90','-t','6','-f','framemd5',str(out/f'az-filter-play-{label}.framemd5')],check=True,timeout=12)
  elapsed=time.monotonic()-start;after={k:stat(v) for k,v in pids.items()}
  assert all(before[k][1]==after[k][1] for k in pids)
  results.append({'label':label,'filter':value,'elapsed_seconds':elapsed,'cpu_percent_one_core':{k:100*(after[k][0]-before[k][0])/os.sysconf('SC_CLK_TCK')/elapsed for k in pids}})
  subprocess.run(['grim',str(out/f'az-filter-play-{label}.png')],check=True,env=env,timeout=5)
finally:filt(original)
(out/'az-filter-playback-results.json').write_text(json.dumps({'scope':'Sequential same-session samples with ffmpeg capture overhead; native pixel changes, not panel FPS','restored_filter':original,'results':results},indent=2)+'\n')
print(json.dumps(results))
