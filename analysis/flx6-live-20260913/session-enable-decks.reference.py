# Historical session recipe only. Hardcoded PIDs are obsolete; do not execute.
raise SystemExit('Historical recipe: discover fresh session PIDs and paths before adapting')
import os,signal,subprocess,time,json
from pathlib import Path
root=Path('/home/pompu_5/az-native-lab')
env=dict(x.split('=',1) for x in Path('/proc/1274/environ').read_bytes().decode().split('\0') if '=' in x)
subprocess.run(['sudo','-n','kill','-TERM','1796'],check=True)
time.sleep(.5)
os.kill(1274,signal.SIGTERM)
for _ in range(100):
 if not Path('/proc/1286').exists():break
 time.sleep(.1)
else:raise RuntimeError('Old player did not exit')
env['DECK_FIXTURE']='1'
log=open(root/'analysis/drm-display-clock/flx6-decks-launch.log','wb')
p=subprocess.Popen(['python3','run-az-interactive.py'],cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
print(json.dumps({'launcher':p.pid}))
