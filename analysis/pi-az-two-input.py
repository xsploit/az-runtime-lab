
# Locate shared helpers from this checkout, independent of the caller's cwd.
import sys as _az_sys
from pathlib import Path as _AzPath
_az_sys.path.insert(0, str(_AzPath(__file__).resolve().parents[1]))
from az_paths import lab_path

import os,time,json,subprocess
from pathlib import Path
from az_mixer_packet import crc16
b=lab_path('');state=lab_path('xdjaz/state/tmp')
def mixer(counter=0,enter=False,load=0,browse=False):
 f=bytearray(128);f[0]=1;f[31]=int(enter);f[32]=64 if browse else 0;f[33]=load;f[34:36]=counter.to_bytes(2,'little',signed=True);f[96:98]=crc16(f[:96]).to_bytes(2,'little')
 fd=os.open(state/'mixer-rx.fifo',os.O_WRONLY|os.O_NONBLOCK);os.write(fd,f);os.close(fd)
for _ in range(5):mixer(enter=True);time.sleep(.15);mixer();time.sleep(.6)
mixer(load=8);time.sleep(.2);mixer();time.sleep(2)
mixer(browse=True);time.sleep(.2);mixer();time.sleep(1)
mixer(counter=1);time.sleep(1);mixer(counter=1,load=4);time.sleep(.2);mixer(counter=1);time.sleep(2)
for group in [0,1]:
 for bits in [0,2,0]:
  f=bytearray(128);f[0]=1;f[10+8*group]=bits;f[28:30]=crc16(f[:28]).to_bytes(2,'little')
  fd=os.open(state/'erp-rx.fifo',os.O_WRONLY|os.O_NONBLOCK);os.write(fd,f);os.close(fd);time.sleep(.2)
