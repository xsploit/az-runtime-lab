"""Bounded private AZ packet-to-HUI test; no real device or process-memory writes."""
import json,os,struct,subprocess,sys,time
from pathlib import Path
from az_guest_process import find_guest
from az_eq_probe import ProcessReader,stable_snapshot,Unavailable
from az_mixer_packet import crc16
BASE=Path(__file__).resolve().parents[1]

def packet(values):
 f=bytearray(128);f[0]=1
 for channel in range(4):
  lanes=[512]+values[channel*3:channel*3+3]
  for lane,value in enumerate(lanes):
   assert 0<=value<=1023
   f[36+5*channel+lane]=value>>2
   f[40+5*channel]|=(value&3)<<(6-2*lane)
 f[96:98]=crc16(f[:96]).to_bytes(2,'little')
 return bytes(f)

def run():
 result={'scope':'Private PC QEMU: CRC-valid mixer receive packet to native HUI EQ state. Not audio/DSP validation.','cases':[]}
 env=dict(os.environ,NULL_AUDIO='1',OFFLINE_MIDI='1',PACED_AUDIO='1',USB_FIXTURE='1',MIXER_FIXTURE='1',ERP_FIXTURE='1',LAB_DURATION_SECONDS='55')
 reader=None;fd=None
 with (BASE/'analysis/eq-packet-launch.log').open('w') as log:
  p=subprocess.Popen([sys.executable,str(BASE/'run-az-probe.py')],env=env,stdout=log,stderr=subprocess.STDOUT)
  try:
   startup=time.monotonic()
   time.sleep(15)
   deadline=time.monotonic()+12
   while time.monotonic()<deadline:
    time.sleep(.5)
    if p.poll() is not None:raise RuntimeError('AZ exited before probe')
    try:pid=find_guest(p.pid)
    except RuntimeError:
     continue
    if not pid:continue
    try:
     reader=ProcessReader(pid);initial=stable_snapshot(reader.read);break
    except (Unavailable,OSError):
     if reader:reader.close();reader=None
   if reader is None:raise RuntimeError('EQ registry not ready')
   time.sleep(max(0,15-(time.monotonic()-startup)))
   initial=stable_snapshot(reader.read)
   result['pid']=pid;result['initial']=initial
   fd=os.open(BASE/'xdjaz/state/tmp/mixer-rx.fifo',os.O_WRONLY|os.O_NONBLOCK)
   values=[1,511,1023,256,512,768,7,513,1000,1022,100,900]
   corrupt=bytearray(packet(values));corrupt[96]^=1
   assert os.write(fd,corrupt)==128
   time.sleep(1)
   after=stable_snapshot(reader.read)
   assert [(c['value'],c['raw']) for c in initial['controls']]==[(c['value'],c['raw']) for c in after['controls']]
   result['bad_crc_no_change']=True
   for values in [values,list(reversed(values)),[0]*12,[1023]*12,[512]*12]:
    start=time.monotonic();assert os.write(fd,packet(values))==128
    deadline=start+5;observed=None
    while time.monotonic()<deadline:
     time.sleep(.05)
     try:observed=stable_snapshot(reader.read)
     except Unavailable:continue
     if all(c['raw']==v and abs(c['value']-struct.unpack('<f',struct.pack('<f',v/1023))[0])<1e-7 for c,v in zip(observed['controls'],values)):break
    else:
     result['failed_case']=dict(requested=values,observed=observed)
     raise RuntimeError('Native EQ did not reach requested packet values')
    result['cases'].append(dict(requested=values,observed=observed['controls'],observation_latency_seconds=time.monotonic()-start))
   result['passed']=True
  except Exception as exc:
   result['error']=repr(exc);result['passed']=False
  finally:
   if fd is not None:os.close(fd)
   if reader:reader.close()
   result['launcher_status']=p.wait(timeout=75)
   (BASE/'analysis/az-eq-packet-delivery.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps({k:v for k,v in result.items() if k not in ('initial','cases')}));print('verified cases:',len(result['cases']))
 if not result['passed']:raise SystemExit(1)
if __name__=='__main__':run()
