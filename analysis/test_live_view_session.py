"""Actual lab validation: resolve manager directly, observe Browse, reject ended guest.
Requires one running offline AZ fixture; never starts or kills a player itself.
"""
import json,os,errno,subprocess,sys,time,select
from pathlib import Path
from az_live_view import LiveView,ViewUnavailable
from az_browser_input import BrowserInput
b=Path(__file__).resolve().parents[1];pid=None
for p in Path('/proc').iterdir():
 if not p.name.isdigit():continue
 try:a=(p/'cmdline').read_bytes().split(b'\0')
 except OSError:continue
 if a[0]==b'/qemu' and b'/home/root/pdj/EP147' in a:
  if pid is not None:raise RuntimeError('Ambiguous active AZ process')
  pid=int(p.name)
assert pid
fifo=b/'xdjaz/state/tmp/mixer-rx.fifo';deadline=time.monotonic()+20
while True:
 try:fd=os.open(fifo,os.O_WRONLY|os.O_NONBLOCK);break
 except OSError as exc:
  if exc.errno!=errno.ENXIO or time.monotonic()>deadline:raise
  time.sleep(.1)
os.close(fd);time.sleep(3)
with LiveView(pid) as reader:
 before=reader.sample();print(json.dumps(dict(event='before',sample=before)),flush=True)
 fd=os.open(fifo,os.O_WRONLY|os.O_NONBLOCK);base=bytearray(128);base[0]=1;n=BrowserInput(0)
 try:
  for _ in range(5):
   assert os.write(fd,n.encode(base,flag=True))==128;time.sleep(.3)
   assert os.write(fd,n.encode(base,flag=False))==128;time.sleep(1.5)
 finally:os.close(fd)
 after=reader.sample();assert after['kind']=='browse',after
 print(json.dumps(dict(event='browse',sample=after)),flush=True)
 # Launcher owns shutdown. Wait in bounded polls for its scheduled exit.
 deadline=time.monotonic()+70
 while not reader.poll.poll(100):
  if time.monotonic()>deadline:raise RuntimeError('Player did not finish expected bounded run')
 try:reader.sample()
 except ViewUnavailable as exc:ended=str(exc)
 else:raise AssertionError('Returned stale view after player exit')
 result=dict(pid=pid,before=before,browse=after,exit_rejection=ended,scope='Read-only session observation; native navigation packets; no physical controller')
 (b/'analysis/live-view-reader-result.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps(result),flush=True)
