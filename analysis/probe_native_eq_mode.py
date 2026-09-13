"""Bounded private AZ UI -> TX -> EQ1 mode check; clicks only for UI validation."""
import json,os,socket,subprocess,sys,time
from pathlib import Path
from probe_eq_packet_delivery import packet
from az_mixer_packet import crc16,inspect_tx
b=Path(__file__).resolve().parents[1];a=b/'analysis'
env=dict(os.environ,NULL_AUDIO='1',OFFLINE_MIDI='1',PACED_AUDIO='1',USB_FIXTURE='1',MIXER_FIXTURE='1',ERP_FIXTURE='1',MIX_STREAM='1',DSP_GRAPH='1',RX_FEEDBACK='1',LAB_RX_FEEDBACK_MODE='tap',MIXER_TX_CAPTURE='1',NATIVE_EQ='1',LAB_EQ_TABLES=str(b/'analysis/dsp-oracle/native-channel-eq-tables.bin'),LAB_DURATION_SECONDS='65')
def events(path):
 out=[]
 for l in path.read_text().splitlines():
  try:out.append(json.loads(l))
  except ValueError:pass
 return out
result={'scope':'Native utility UI clicks -> native TX -> real software-mixer mode application. No loaded-song audio or physical controller test.'}
with (a/'eq-mode-verified-launch.log').open('w') as log:
 p=subprocess.Popen([sys.executable,str(b/'run-az-probe.py')],env=env,stdout=log,stderr=log)
 try:
  time.sleep(20)
  es=events(a/'eq-mode-verified-launch.log');assert p.poll() is None
  display=next(x['display'] for x in es if x.get('event')=='started')
  inp=next(x['input_socket'] for x in es if x.get('event')=='rx_feedback')
  n=json.loads((a/'az-browser-named-buttons.json').read_text())['shortcut']
  with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as s:
   for press in (False,True,False):
    f=bytearray(packet([512]*12))
    if press:f[n['byte']]|=1<<n['bit']
    f[96:98]=crc16(f[:96]).to_bytes(2,'little');s.sendto(f,inp);time.sleep(.2)
  def click(x,y):
   subprocess.run([sys.executable,str(a/'click-private-display.py'),display,str(x),str(y)],check=True,stdout=subprocess.DEVNULL);time.sleep(1)
  def capture(label):
   subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',display,'-frames:v','1',str(a/('eq-mode-'+label+'.png'))],check=True)
  click(1246,33);click(50,180);click(350,348);capture('before')
  changes=[]
  for mode,coords,label in [(1,(855,147),'isolator'),(0,(855,98),'restored')]:
   previous=len(events(b/'xdjaz/mixer-stream.log'));click(*coords);capture(label)
   raw=(b/'xdjaz/state/tmp/mixer-tx.raw').read_bytes();complete=len(raw)//128
   latest=inspect_tx(raw[(complete-1)*128:complete*128])
   assert latest['checksum_valid'] and latest['eq_iso_mode_raw']==mode,latest
   applied=[x for x in events(b/'xdjaz/mixer-stream.log')[previous:] if 'eq_frame' in x]
   assert len(applied)==4 and {x['channel'] for x in applied}==set(range(4)) and all(x['mode']==mode and x['result']==1 for x in applied),applied
   changes.append({'mode':mode,'applied':applied,'tx_mode':latest['eq_iso_mode']})
  result.update(passed=True,changes=changes)
 except Exception as e:result.update(passed=False,error=repr(e))
 finally:
  result['launcher_status']=p.wait(timeout=70)
  for name in ('rx-feedback.log','mixer-stream.log'):(a/('eq-mode-'+name)).write_bytes((b/'xdjaz'/name).read_bytes())
  (a/'eq-mode-live-results.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
if not result.get('passed'):raise SystemExit(1)
