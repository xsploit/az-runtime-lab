"""Play loaded deck1 and change host fader/cue; private offline lab only."""
from pathlib import Path
import subprocess,sys,time,json
b=Path(__file__).resolve().parents[1]
sock=sys.argv[1]
def control(gain,cue):
 subprocess.run([sys.executable,str(b/'mixer/send_controls.py'),sock,'--gains',str(gain),'0','0','0','--cue-mask',str(cue),'--ramp','441'],check=True)
control(1,1)
subprocess.run([sys.executable,str(b/'analysis/send-erp-button.py'),'--button','play'],check=True)
for gain,cue in [(0,1),(1,0),(1,1)]:
 time.sleep(2)
 control(gain,cue)
print('Sent fader/cue sequence; inspect applied frame offsets in mixer-stream.log')
