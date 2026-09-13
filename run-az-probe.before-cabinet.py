from pathlib import Path
import subprocess,os,time,json
base=Path(__file__).resolve().parent;lab=base/'xdjaz';root=lab/'rootfs';state=lab/'state';state.mkdir(exist_ok=True)
for d in ['settings','mnt/debug','sys/class/thermal/thermal_zone0','sys/class/thermal/thermal_zone1','sys/module/rockchipdrm/parameters','tmp','run']:(state/d).mkdir(parents=True,exist_ok=True)
(state/'sys/class/thermal/thermal_zone0/temp').write_text('45000\n');(state/'sys/class/thermal/thermal_zone1/temp').write_text('45000\n');(state/'tmp/testmode').write_text('off\n')
(root/'home/root/settings').mkdir(exist_ok=True)
rd,wr=os.pipe()
with (lab/'xvfb.log').open('w') as log:
 xv=subprocess.Popen([str(base/'tools/usr/bin/Xvfb'),'-displayfd',str(wr),'-screen','0','1280x800x24','-nolisten','tcp','-ac'],pass_fds=(wr,),stdout=log,stderr=log)
os.close(wr);display=os.read(rd,32).decode().strip();os.close(rd)
if not display:raise RuntimeError('Xvfb failed')
sock=f'/tmp/.X11-unix/X{display}'
args=['bwrap','--unshare-all','--die-with-parent','--ro-bind',str(root),'/', '--ro-bind','/usr/bin/qemu-aarch64-static','/qemu','--proc','/proc','--dev','/dev','--bind',str(state/'tmp'),'/tmp','--dir','/tmp/.X11-unix','--ro-bind',sock,sock,'--bind',str(state/'settings'),'/home/root/settings','--bind',str(state/'mnt'),'/mnt','--ro-bind',str(state/'sys'),'/sys','--tmpfs','/run','--chdir','/home/root/pdj','--setenv','HOME','/home/root','--setenv','PATH','/usr/sbin:/usr/bin:/sbin:/bin','--setenv','DISPLAY',':'+display,'/qemu','/home/root/pdj/EP147']
if os.environ.get('TRACE'):args.insert(-1,'-strace')
try:
 with (lab/('trace-launch.log' if os.environ.get('TRACE') else 'display-launch.log')).open('w') as log:
  proc=subprocess.Popen(args,stdout=log,stderr=log)
  try:
   
   for _ in range(1200):
    (state/'sys/module/rockchipdrm/parameters/vsync_time').write_text(str(int(time.monotonic()*1000))+'\n')
    time.sleep(1/60)
   cap=subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',':'+display,'-frames:v','1',str(lab/'first-display.png')],timeout=15,capture_output=True,text=True)
   print(json.dumps(dict(pid=proc.pid,running=proc.poll() is None,screenshot_exit=cap.returncode,screenshot_error=cap.stderr)),flush=True)
  finally:
   proc.terminate()
   try:proc.wait(timeout=5)
   except subprocess.TimeoutExpired:proc.kill();proc.wait()
finally:xv.terminate();xv.wait(timeout=5)
