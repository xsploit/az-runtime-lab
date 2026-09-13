"""Read-only candidate view identity correlated with native page transitions."""
import json,os,struct,time,subprocess
from pathlib import Path
from az_browser_input import BrowserInput
b=Path(__file__).resolve().parents[1];c=json.loads((b/'analysis/view-memory-candidates.json').read_text());pid=c['pid'];assert len(c['candidates'])==1
obj=int(c['candidates'][0]['manager'],16);nested=int(c['candidates'][0]['nested'],16)
mem=os.open(f'/proc/{pid}/mem',os.O_RDONLY);q=lambda x:struct.unpack('<Q',os.pread(mem,8,x))[0]
fd=os.open(b/'xdjaz/state/tmp/mixer-rx.fifo',os.O_WRONLY|os.O_NONBLOCK);base=bytearray(128);base[0]=1;enc=BrowserInput(0);obs=[]
def send(flag):assert os.write(fd,enc.encode(base,flag=flag))==128

def sample(label):
 assert q(obj)==0x29cb4a0 and q(obj+24)==nested and q(q(nested)+488)==0x198f468
 current=q(nested+336);identity=q(current+248) if current else q(0x3bd76f0)
 time.sleep(.02);assert current==q(nested+336)
 assert identity==(q(current+248) if current else q(0x3bd76f0))
 im=b/'xdjaz'/('view-identity-'+label+'.png')
 subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',':0','-frames:v','1',str(im)],check=True,timeout=10)
 obs.append(dict(label=label,current=hex(current),identity=hex(identity),browse_name=hex(q(0x3baf670)),pc_control_name=hex(q(0x3baf678)),image=str(im)))
 print(json.dumps(obs[-1]),flush=True)
try:
 sample('initial')
 for _ in range(5):send(True);time.sleep(.3);send(False);time.sleep(1.5)
 sample('folder')
 base[32]|=64;send(False);time.sleep(.3);base[32]&=~64;send(False);time.sleep(1.5)
 sample('waveform')
finally:
 os.close(fd);os.close(mem)
 (b/'analysis/live-view-identity.json').write_text(json.dumps(dict(pid=pid,manager=hex(obj),nested=hex(nested),observations=obs,scope='Read-only repeated memory samples; screenshot review required; not an atomic snapshot'),indent=2)+'\n')
