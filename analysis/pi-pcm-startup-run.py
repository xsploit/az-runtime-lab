"""Run one isolated, time-limited startup comparison; call from staging dir."""
import json
import os
import signal
from pathlib import Path
import subprocess
import sys
import time
mode=sys.argv[1]
assert mode in ('baseline','template')
base=Path.cwd()
env=os.environ.copy()
for key in list(env):
    if key.startswith('LAB_') or key in ('PROFILE','PLAYER'): env.pop(key)
env.update(NULL_AUDIO='1',OFFLINE_MIDI='1',PACED_AUDIO='1',USB_FIXTURE='1',
           MIXER_FIXTURE='1',ERP_FIXTURE='1',XIMAGE_FAST24='1',
           LAB_XIMAGE_PRESENT='1',LAB_AZ_SMOOTH_SCROLL='1',LAB_VSYNC_HZ='59.24',
           LAB_AZ_FRACTIONAL_GRID='1',LAB_DURATION_SECONDS='24',
           LAB_PI_JEMALLOC='/home/pompu_5/az-native-lab/libjemalloc-pi.so.2')
if mode=='template': env['LAB_AZ_PCM_TEMPLATE']='1'
def descendants(pid):
    result=[]
    try: children=Path(f'/proc/{pid}/task/{pid}/children').read_text().split()
    except FileNotFoundError: return result
    for child in children:
        n=int(child); result.append(n); result.extend(descendants(n))
    return result
samples=[]
with (base/f'{mode}-launch.log').open('w') as log:
    process=subprocess.Popen([sys.executable,'run-az-pi-probe.py'],env=env,stdout=log,stderr=log,start_new_session=True)
    try:
        for delay in (6,6,6):
            time.sleep(delay)
            if process.poll() is not None: break
            players=[]
            for pid in descendants(process.pid):
                try:
                    if Path(f'/proc/{pid}/comm').read_text().strip()=='EP147': players.append(pid)
                except FileNotFoundError: pass
            assert len(players)==1,players
            capture=subprocess.run(['sudo','-n',sys.executable,'pi-pcm-startup-metrics.py',str(players[0]),
                                    str(base/'shims/pcm-template-hook.so')],text=True,capture_output=True,timeout=15)
            if capture.returncode: raise RuntimeError(capture.stderr)
            sample=json.loads(capture.stdout); samples.append(sample)
            if mode=='template': assert sample.get('lab_pcm_installed')==1,sample
            print(json.dumps({'mode':mode,**sample}),flush=True)
        process.wait(timeout=30)
    finally:
        if process.poll() is None:
            os.killpg(process.pid,signal.SIGTERM)
            try: process.wait(timeout=8)
            except subprocess.TimeoutExpired: os.killpg(process.pid,signal.SIGKILL); process.wait()
result={'mode':mode,'launcher_exit':process.returncode,'samples':samples}
(base/f'{mode}-metrics.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'mode':mode,'launcher_exit':process.returncode,'samples':len(samples)}),flush=True)
assert process.returncode==0 and len(samples)==3
