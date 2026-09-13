"""Replay saved FLX6 EQ CCs through running native navigation/RX/EQ services."""
import json,socket,time
from pathlib import Path
from az_eq_probe import ProcessReader,stable_snapshot,Unavailable
b=Path(__file__).resolve().parents[1];log=b/'analysis/flx6-eq-live-launch.log'
start=time.monotonic();event=None
while time.monotonic()-start<25:
 for line in log.read_text().splitlines():
  try:e=json.loads(line)
  except ValueError:continue
  if e.get('event')=='native_navigation':event=e
 if event:break
 time.sleep(.1)
if not event:raise RuntimeError('No current navigation service event')
time.sleep(max(0,15-(time.monotonic()-start)))
reader=ProcessReader(event['guest_pid']);cases=[]
try:
 with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sender:
  for value in (8192,0,16383):
   for ch in range(4):
    for cc in (7,11,15):
     sender.sendto(bytes([0xb0+ch,cc,value>>7]),event['midi_socket'])
     sender.sendto(bytes([0xb0+ch,cc+32,value&127]),event['midi_socket'])
   deadline=time.monotonic()+4
   while time.monotonic()<deadline:
    time.sleep(.1)
    try:snap=stable_snapshot(reader.read)
    except Unavailable:continue
    if all(c['raw']==value>>4 for c in snap['controls']):break
   else:raise RuntimeError('EQ HUI value did not match MIDI')
   cases.append({'midi14':value,'native10':value>>4,'controls':snap['controls']})
 result={'passed':True,'cases':cases,'guest_pid':event['guest_pid'],'scope':'Saved FLX6 CC message replay through live service to native HUI; physical controller absent.'}
 (b/'analysis/flx6-eq-live-results.json').write_text(json.dumps(result,indent=2)+'\n')
 print('Passed three values across12 native EQ knobs through MIDI service')
finally:reader.close()
