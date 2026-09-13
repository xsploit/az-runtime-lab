import os,subprocess,time,json
from pathlib import Path
b=Path.cwd()/'runtime-lab';a=b/'analysis'
env=dict(os.environ,NULL_AUDIO='1',OFFLINE_MIDI='1',PACED_AUDIO='1',USB_FIXTURE='1',MIXER_FIXTURE='1',ERP_FIXTURE='1',LAB_GDB='1',LAB_DURATION_SECONDS='60')
with (a/'eq-startup-debug-launch.log').open('w') as log:
 p=subprocess.Popen(['python3',str(b/'run-az-probe.py')],env=env,stdout=log,stderr=log)
 try:
  path=b/'xdjaz/state/tmp/guest-gdb.sock'
  # Wait for a newly live launcher and its debugger endpoint.
  for _ in range(100):
   assert p.poll() is None
   if path.exists() and '"event": "started"' in (a/'eq-startup-debug-launch.log').read_text():break
   time.sleep(.1)
  else:raise RuntimeError('debugger endpoint not ready')
  commands=['set pagination off','set confirm off','set print frame-arguments none','set sysroot '+str(b/'xdjaz/rootfs'),'target remote '+str(path),'handle SIGPIPE nostop noprint pass','continue','info registers pc sp','x/8i $pc-16','thread apply all bt 4','detach']
  cmd=['gdb','-q','-batch',str(b/'xdjaz/rootfs/home/root/pdj/EP147')]
  for c in commands:cmd+=['-ex',c]
  with (a/'eq-startup-guest-stack.txt').open('w') as out:
   try:r=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT,timeout=45);print('gdb exit',r.returncode,flush=True)
   except subprocess.TimeoutExpired:print('No stopping guest fault within45sec',flush=True)
 finally:print('launcher exit',p.wait(timeout=70),flush=True)
