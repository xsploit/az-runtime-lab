"""Bounded native AZ playback -> native EQ state -> software audio capture."""
import json,os,socket,subprocess,sys,time,struct,math
from pathlib import Path
from probe_eq_packet_delivery import packet
from az_mixer_packet import crc16,inspect_tx
b=Path(__file__).resolve().parents[1];a=b/'analysis'
env=dict(os.environ,LAB_AUDIO_STATS='1',NULL_AUDIO='1',OFFLINE_MIDI='1',PACED_AUDIO='1',USB_FIXTURE='1',MIXER_FIXTURE='1',ERP_FIXTURE='1',MIX_STREAM='1',DSP_GRAPH='1',RX_FEEDBACK='1',LAB_RX_FEEDBACK_MODE='tap',MIXER_TX_CAPTURE='1',NATIVE_EQ='1',LAB_EQ_TABLES=str(b/'analysis/dsp-oracle/native-channel-eq-tables.bin'),LAB_DURATION_SECONDS='110')
def events(path):
 out=[]
 for l in path.read_text().splitlines():
  try:out.append(json.loads(l))
  except ValueError:pass
 return out
result={'scope':'Live AZ playback and native EQ mode/knob delivery into software audio capture; no physical controller test.'}
with (a/'eq-audio-verified-launch.log').open('w') as log:
 p=subprocess.Popen([sys.executable,str(b/'run-az-probe.py')],env=env,stdout=log,stderr=log)
 try:
  time.sleep(20)
  es=events(a/'eq-audio-verified-launch.log');assert p.poll() is None
  assert not any(x.get('process_returncode') is not None for x in es), 'Native AZ exited during startup'
  display=next(x['display'] for x in es if x.get('event')=='started')
  inp=next(x['input_socket'] for x in es if x.get('event')=='rx_feedback')
  def rx(values,enter=False,load=0,counter=0):
   f=bytearray(packet(values));f[31]=int(enter);f[33]=load;f[34:36]=counter.to_bytes(2,'little',signed=True)
   f[96:98]=crc16(f[:96]).to_bytes(2,'little')
   with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sock:sock.sendto(f,inp)
  neutral=[512]*12
  for _ in range(5):rx(neutral,enter=True);time.sleep(.2);rx(neutral);time.sleep(.8)
  rx(neutral,counter=2);time.sleep(1);rx(neutral,load=8,counter=2);time.sleep(.2);rx(neutral,counter=2);time.sleep(10)
  subprocess.run([sys.executable,str(a/'send-erp-button.py'),'--button','play'],check=True,stdout=subprocess.DEVNULL)
  time.sleep(4)
  subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',display,'-frames:v','1',str(a/'eq-audio-loaded.png')],check=True)
  ctl=next(x['socket'] for x in es if x.get('event')=='mixer_control')
  with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sock:sock.sendto(b'M1 0 1 0 0 0 0 0 0 0 0 .5 .5 .5 0',ctl)
  # Do not call a mute/cut test valid without establishing audible PCM first.
  audio=b/'xdjaz/state/tmp/mixed-output.raw';deadline=time.monotonic()+12
  audible=False
  while time.monotonic()<deadline:
   start=audio.stat().st_size//16*16;time.sleep(.5)
   with audio.open('rb') as f:f.seek(start);raw=f.read(22050*16)
   rows=list(struct.iter_unpack('<4f',raw[:len(raw)//16*16]))
   if rows and any(abs(r[0])+abs(r[1])>1e-5 for r in rows):audible=True;break
  result['audible_before_eq_test']=audible
  if not audible:raise RuntimeError('Native track loaded but audible playback not established; inspect loaded screenshot and player log')
  n=json.loads((a/'az-browser-named-buttons.json').read_text())['shortcut']
  with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as s:
   for press in (False,True,False):
    f=bytearray(packet([512]*12))
    if press:f[n['byte']]|=1<<n['bit']
    f[96:98]=crc16(f[:96]).to_bytes(2,'little');s.sendto(f,inp);time.sleep(.2)
  def click(x,y):
   subprocess.run([sys.executable,str(a/'click-private-display.py'),display,str(x),str(y)],check=True,stdout=subprocess.DEVNULL);time.sleep(1)
  def capture(label):
   subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',display,'-frames:v','1',str(a/('eq-audio-'+label+'.png'))],check=True)
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
  click(855,147) # Native ISO mode for a complete cut.
  audio=b/'xdjaz/state/tmp/mixed-output.raw'
  windows=[]
  for label,values in [('normal',neutral),('cut',[0]*3+[512]*9),('restored',neutral)]:
   rx(values);time.sleep(.6)
   start=audio.stat().st_size//16*16;time.sleep(1.5);end=audio.stat().st_size//16*16
   with audio.open('rb') as f:f.seek(start);raw=f.read(end-start)
   rows=list(struct.iter_unpack('<4f',raw));assert len(rows)>1000 and all(math.isfinite(x) for row in rows for x in row)
   rms=math.sqrt(sum(row[0]**2+row[1]**2 for row in rows)/(2*len(rows)))
   windows.append(dict(label=label,start_frame=start//16,frames=len(rows),master_rms=rms))
  click(855,98)
  result['audio_windows']=windows
  assert windows[0]['master_rms']>1e-5 and windows[2]['master_rms']>1e-5,windows
  assert windows[1]['master_rms']<1e-8,windows
  result.update(passed=True,changes=changes)
 except Exception as e:result.update(passed=False,error=repr(e))
 finally:
  result['launcher_status']=p.wait(timeout=110)
  final_events=events(a/'eq-audio-verified-launch.log')
  result['native_exit']=[x.get('process_returncode') for x in final_events if 'process_returncode' in x]
  if any(code not in (None,0) for code in result['native_exit']):result['passed']=False
  for name in ('rx-feedback.log','mixer-stream.log'):(a/('eq-audio-'+name)).write_bytes((b/'xdjaz'/name).read_bytes())
  result['native_input_audio']=[x for x in events(b/'xdjaz/mixer-stream.log') if 'input_audio_channel' in x]
  (a/'eq-audio-live-results.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
if not result.get('passed'):raise SystemExit(1)
