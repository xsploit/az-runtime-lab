import os,struct,time,subprocess,json
from pathlib import Path
b=Path('/home/pompu_5/az-native-lab');os.chdir(b)
from az_mixer_packet import crc16
pid=7913;addr=0x7fff9a4f19a0
fd=os.open(f'/proc/{pid}/mem',os.O_RDWR)
assert struct.unpack('<Q',os.pread(fd,8,addr))[0]==0x2e414e0
original=os.pread(fd,8,addr+0x58);period=struct.unpack('<d',original)[0];assert abs(period-1000/59.24)<1e-8
# Cue then play sets a repeatable track start using the existing fixture.
def reset():
 for group in [0,1]:
  for mask in [2]:
   for bits in [0,mask,0]:
    f=bytearray(128);f[0]=1;f[10+8*group]=bits;f[28:30]=crc16(f[:28]).to_bytes(2,'little');q=os.open('xdjaz/state/tmp/erp-rx.fifo',os.O_WRONLY|os.O_NONBLOCK);os.write(q,f);os.close(q);time.sleep(.2)
try:
 reset()
 for name,value in [('original',period),('halfperiod',period/2),('restored',period)]:
  os.pwrite(fd,struct.pack('<d',value),addr+0x58);time.sleep(1)
  subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-framerate','120','-video_size','850x170','-i',':0+180,90','-t','8','-f','framemd5',f'/tmp/az-moving-period-{name}.framemd5'],check=True,timeout=15)
  env=os.environ.copy();env.update(XDG_RUNTIME_DIR='/run/user/1000',WAYLAND_DISPLAY='wayland-1')
  subprocess.run(['sudo','-u','pompu_5','env','XDG_RUNTIME_DIR=/run/user/1000','WAYLAND_DISPLAY=wayland-1','grim',f'/tmp/az-moving-period-{name}.png'],check=True)
finally:
 os.pwrite(fd,original,addr+0x58);assert os.pread(fd,8,addr+0x58)==original;os.close(fd)
 print(json.dumps(dict(pid=pid,period_ms=period,restored=True)),flush=True)
