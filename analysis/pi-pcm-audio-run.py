"""One isolated two-track native PCM recording. Run from the PCM test stage.
Captures ALSA file output; no physical sound device or visible-player change.
"""

# Locate shared helpers from this checkout, independent of the caller's cwd.
import sys as _az_sys
from pathlib import Path as _AzPath
_az_sys.path.insert(0, str(_AzPath(__file__).resolve().parents[1]))
from az_paths import lab_path

from array import array
import gzip
import hashlib
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time
mode=sys.argv[1]; assert mode in ('baseline','template')
base=Path.cwd(); assert base.name=='pcm-startup-test'
label=mode+'-audio'
env=os.environ.copy()
for key in list(env):
    if key.startswith('LAB_') or key in ('PROFILE','PLAYER','MIX_STREAM','AUDIO_CAPTURE'):
        env.pop(key)
env.update(NULL_AUDIO='1',OFFLINE_MIDI='1',PACED_AUDIO='1',USB_FIXTURE='1',
    USB_FIXTURE_PATH=str(lab_path('benchmark-usb')),
    MIXER_FIXTURE='1',ERP_FIXTURE='1',XIMAGE_FAST24='1',AUDIO_CAPTURE='1',
    LAB_XIMAGE_PRESENT='1',LAB_AZ_SMOOTH_SCROLL='1',LAB_VSYNC_HZ='59.24',
    LAB_AZ_FRACTIONAL_GRID='1',LAB_DURATION_SECONDS='75',
    LAB_PI_JEMALLOC=str(lab_path('libjemalloc-pi.so.2')))
if mode=='template': env['LAB_AZ_PCM_TEMPLATE']='1'
def descendants(pid):
    try: children=Path(f'/proc/{pid}/task/{pid}/children').read_text().split()
    except FileNotFoundError: return []
    result=[]
    for child in children:
        n=int(child); result.append(n); result.extend(descendants(n))
    return result
raw=base/'xdjaz/state/tmp/az-output.raw'
if raw.exists():
    assert raw.is_file() and not raw.is_symlink()
    raw.unlink() # Previous isolated capture only; never main lab output.
with (base/f'{label}-launch.log').open('w') as log:
    process=subprocess.Popen([sys.executable,'run-az-pi-probe.py'],env=env,
        stdout=log,stderr=log,start_new_session=True)
    try:
        time.sleep(18)
        assert process.poll() is None
        players=[]
        for pid in descendants(process.pid):
            try:
                if Path(f'/proc/{pid}/comm').read_text().strip()=='EP147': players.append(pid)
            except FileNotFoundError: pass
        assert len(players)==1,players
        pid=players[0]
        metrics=subprocess.check_output(['sudo','-n',sys.executable,'analysis/pi-pcm-startup-metrics.py',
            str(pid),'shims/pcm-template-hook.so'],text=True,timeout=15)
        state=json.loads(metrics)
        if mode=='template': assert state.get('lab_pcm_installed')==1 and state['store']['next']==33850
        else: assert 'lab_pcm_installed' not in state
        (base/f'{label}-hook-state.json').write_text(json.dumps(state,indent=2)+'\n')
        print(json.dumps({'event':'recording_ready','mode':mode,'pid':pid}),flush=True)
        subprocess.run([sys.executable,'analysis/pi-pcm-two-track-sequence.py',str(base),str(pid),label],
            check=True,timeout=60)
        process.wait(timeout=40)
    finally:
        if process.poll() is None:
            os.killpg(process.pid,signal.SIGTERM)
            try: process.wait(timeout=8)
            except subprocess.TimeoutExpired: os.killpg(process.pid,signal.SIGKILL); process.wait()
assert process.returncode==0
size=raw.stat().st_size
assert size%40==0 and size>40*44100*25,(size,'Expected interleaved10channel Float32')
# Search recorded output for nonzero samples in the two loaded deck pairs.
first=None; offset=0
with raw.open('rb') as f:
    while chunk:=f.read(40*44100):
        values=array('f'); values.frombytes(chunk)
        if sys.byteorder!='little': values.byteswap()
        for i in range(len(values)//10):
            if any(abs(values[i*10+c])>1e-7 for c in range(4)):
                first=offset+i; break
        if first is not None: break
        offset+=len(values)//10
assert first is not None,'No active digital deck output'
start=max(0,first-4410); frames=min(30*44100,size//40-start)
assert frames>=25*44100
with raw.open('rb') as f:
    whole_hash=hashlib.file_digest(f,'sha256').hexdigest()
    f.seek(start*40); clip=f.read(frames*40)
assert len(clip)==frames*40
with gzip.open(base/f'{label}.f32le.gz','wb',compresslevel=1) as f: f.write(clip)
metadata={'mode':mode,'pid':pid,'launcher_exit':process.returncode,'rate':44100,'channels':10,
    'format':'float32le','full_frames':size//40,'full_sha256':whole_hash,
    'first_active_frame':first,'clip_start_frame':start,'clip_frames':frames,
    'clip_sha256':hashlib.sha256(clip).hexdigest(),
    'scope':'ALSA file output, paced null sink; physical output and realtime underruns not tested'}
(base/f'{label}-capture.json').write_text(json.dumps(metadata,indent=2)+'\n')
print(json.dumps(metadata),flush=True)
raw.unlink() # Keep compressed excerpt and full-capture hash; reclaim scratch.
