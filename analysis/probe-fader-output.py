"""Inject all four raw faders during tone playback; log capture offsets, not latency."""
import os, stat, time, json
from pathlib import Path
from az_mixer_packet import crc16, inspect
base=Path(__file__).resolve().parents[1]
root=base/'xdjaz/state/tmp'
f=os.open(root/'mixer-rx.fifo',os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
rows=[]
try:
 if not stat.S_ISFIFO(os.fstat(f).st_mode):raise ValueError('Expected lab FIFO')
 for value in (0,1023,0,1023):
  frame=bytearray(128);frame[0]=1
  for g in range(4):
   frame[10+g]=value>>2;frame[14]|=(value&3)<<(6-2*g)
  frame[96:98]=crc16(frame[:96]).to_bytes(2,'little')
  assert inspect(frame)['channel_faders_raw']==[value]*4
  before=(root/'az-output.raw').stat().st_size//40
  if os.write(f,frame)!=128:raise RuntimeError('Short packet')
  time.sleep(2)
  after=(root/'az-output.raw').stat().st_size//40
  rows.append(dict(raw_faders=[value]*4,start_frame=before,end_frame=after))
finally:os.close(f)
(base/'analysis/az-fader-output-events.json').write_text(json.dumps(rows,indent=2)+'\n')
print(json.dumps(rows,indent=2))
