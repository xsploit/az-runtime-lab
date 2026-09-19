"""FIFO navigation helper for --no-controller sessions (never alongside the
live MIDI bridge): writes MIXER_CONT frames into the mixer-rx FIFO.
Commands: reset | enter | browse | view | back | rotate N | load DECK (1|2).
The lab checkout is $AZ_LAB, else this file's checkout, else ~/az-native-lab.
"""
from pathlib import Path
import os,sys,time
base=Path(os.environ['AZ_LAB']) if os.environ.get('AZ_LAB') else Path(__file__).resolve().parents[3]
if not (base/'pi/session.py').exists():base=Path.home()/'az-native-lab'
sys.path.insert(0,str(base))
from az_mixer_packet import crc16
state=base/'xdjaz/state/tmp'
cfile=base/'analysis/sem-owner-validation/encoder.txt';counter=int(cfile.read_text()) if cfile.exists() else 0
cmd=sys.argv[1];value=int(sys.argv[2]) if len(sys.argv)>2 else 0
if cmd=='reset':cfile.write_text('0');sys.exit()
if cmd=='rotate':counter+=value
for down in (False,True,False):
 f=bytearray(128);f[0]=1;f[34:36]=counter.to_bytes(2,'little',signed=True)
 if down:
  if cmd=='enter':f[31]=1
  if cmd=='browse':f[32]=64
  if cmd=='view':f[32]=128
  if cmd=='back':f[33]=128
  if cmd=='load':f[33]={0:12,1:8,2:4}[value]
 f[96:98]=crc16(f[:96]).to_bytes(2,'little')
 fd=os.open(state/'mixer-rx.fifo',os.O_WRONLY|os.O_NONBLOCK);os.write(fd,f);os.close(fd);time.sleep(.15)
cfile.write_text(str(counter))
