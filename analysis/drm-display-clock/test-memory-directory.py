"""Native integration checks for directory lifetime and atomic clock readers."""
import importlib.util,os,sys,tempfile,time,threading
from pathlib import Path
spec=importlib.util.spec_from_file_location('timing',sys.argv[1]);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
with tempfile.TemporaryDirectory() as legacy:
 os.environ['LAB_TIMING_TMPFS']='1';owner,p=m.prepare_native_timing_directory(legacy)
 assert owner is not None and p!=Path(legacy) and p.stat().st_mode&0o777==0o700
 errors=[];done=threading.Event();reads=[0]
 def reader():
  previous=0
  while not done.is_set():
   try:
    value=int((p/'vsync_time').read_text());assert value>=previous;previous=value;reads[0]+=1
   except Exception as e:errors.append(repr(e));return
 thread=threading.Thread(target=reader);thread.start()
 for _ in range(1000):m.publish_timing(p/'vsync_time',time.monotonic_ns())
 done.set();thread.join();assert not errors and reads[0]>0,(errors,reads)
 owner.cleanup();assert not p.exists()
 os.environ['LAB_TIMING_TMPFS']='0';owner,p=m.prepare_native_timing_directory(legacy)
 assert owner is None and p==Path(legacy)
 os.environ['LAB_TIMING_TMPFS']='invalid'
 try:m.prepare_native_timing_directory(legacy)
 except ValueError:pass
 else:raise AssertionError('Invalid switch accepted')
 print({'atomic_reader_checks':reads[0],'writes':1000,'cleanup':True,'explicit_legacy':True,'invalid_switch_rejected':True})
