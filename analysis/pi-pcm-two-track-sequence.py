"""Known two-file native UI sequence in the isolated PCM lab after SOURCE ready.
Requires 01-Estara.mp3 and02-Dead-Wrong.mp3; confirms source positions before play.
"""
import json
from pathlib import Path
import subprocess
import sys
import time
stage=Path(sys.argv[1]).resolve(); pid=int(sys.argv[2]); label=sys.argv[3]
assert stage.name=='pcm-startup-test' and label in ('baseline','template','baseline-audio','template-audio')
helper=stage/'analysis/pcm-stage-input.py'
def send(action,counter,decks=(1,2)):
    subprocess.run([sys.executable,str(helper),str(stage),action,'--counter',str(counter),
                    '--decks',*[str(d) for d in decks]],check=True,timeout=5)
for _ in range(4):
    send('enter',0); time.sleep(.5)
send('load',0,(1,)); time.sleep(3)
send('browse',0); time.sleep(1)
send('counter',1); time.sleep(.5)
send('load',1,(2,)); time.sleep(5)
def sample(name,seconds):
    path=stage/f'{label}-{name}.json'
    subprocess.run(['sudo','-n',sys.executable,str(stage/'analysis/pi-cache-motion.py'),str(pid),str(path),
                    '--file-cache-mib','100','--seconds',str(seconds),'--memory'],check=True,timeout=seconds+15)
    return json.loads(path.read_text())
paused=sample('two-paused',2)
assert paused['source_rates']==[0.,0.,None,None],paused
send('play',1)
playing=sample('two-playing',20)
assert all(v is not None and 43900<v<44300 for v in playing['source_rates'][:2]),playing
assert playing['source_rates'][2:]==[None,None]
