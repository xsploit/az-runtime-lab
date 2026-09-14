# Historical session recipe only. Hardcoded PIDs are obsolete; do not execute.
raise SystemExit('Historical recipe: discover fresh session PIDs and paths before adapting')
import os,signal,subprocess,time,json,stat
from pathlib import Path
root=Path('/home/pompu_5/az-native-lab');state=root/'xdjaz/state/tmp'
env=dict(x.split('=',1) for x in Path('/proc/2091/environ').read_bytes().decode().split('\0') if '=' in x)
subprocess.run(['sudo','-n','kill','-TERM','2508'],check=True);time.sleep(.3)
os.kill(2091,signal.SIGTERM)
for _ in range(100):
 if not Path('/proc/2102').exists():break
 time.sleep(.1)
else:raise RuntimeError('Player did not exit')
fifo=state/'mixed-output.raw'
if fifo.exists() and not stat.S_ISFIFO(fifo.stat().st_mode):fifo.rename(state/'mixed-output-before-flx6.raw')
if not fifo.exists():os.mkfifo(fifo,0o600)
audio_log=open(root/'analysis/drm-display-clock/flx6-audio.log','wb')
audio=subprocess.Popen(['aplay','-D','plughw:CARD=DDJFLX6,DEV=0','-t','raw','-f','FLOAT_LE','-c','4','-r','44100','--buffer-time=40000','--period-time=10000',str(fifo)],stdout=audio_log,stderr=subprocess.STDOUT,start_new_session=True)
env['MIX_STREAM']='1';env['USB_FIXTURE_PATH']='/media/pompu_5/COS_2025084'
log=open(root/'analysis/drm-display-clock/flx6-audio-launch.log','wb')
p=subprocess.Popen(['python3','run-az-interactive.py'],cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
print(json.dumps({'launcher':p.pid,'audio':audio.pid}))
