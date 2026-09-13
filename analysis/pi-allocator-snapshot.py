"""Read opt-in allocator telemetry; optionally request a fresh ordinary-thread sample.

Run with sudo on the Pi. Debugger writes only the aligned request counter;
no inferior function call, memory-policy change, or firmware instruction edit.
"""
import argparse, hashlib, json, os, struct, subprocess, tempfile, time
from pathlib import Path

p=argparse.ArgumentParser()
p.add_argument('pid',type=int);p.add_argument('output',type=Path)
p.add_argument('--request',action='store_true');p.add_argument('--file-cache-mib',type=int,choices=(32,64,100),default=100);a=p.parse_args()
proc=Path(f'/proc/{a.pid}')
expected={100: '137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c', 64: '9f93478b76bda19c0ea0708196f0f20e97f4c1e0b59c8f9648118e3acb256fe4', 32: 'f61eb7dda3ec197c675af28cac87dcca53eca0bfde2977a6a9824e4809e5b324'}[a.file_cache_mib]
assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest()==expected
identity=(proc/'stat').read_text().rsplit(')',1)[1].split()[19]
mapping=next(s for s in (proc/'maps').read_text().splitlines()
             if s.endswith('/lab-shims/allocator-snapshot.so') and s.split()[2]=='00000000')
base=int(mapping.split('-')[0],16)
shim=proc/'root/lab-shims/allocator-snapshot.so'
sha=hashlib.sha256(shim.read_bytes()).hexdigest()
symbols={s.split()[2]:base+int(s.split()[0],16)
         for s in subprocess.check_output(['nm','-D',str(shim)],text=True).splitlines()
         if len(s.split())==3 and s.split()[2].startswith('lab_memory_')}
def read(address,size):
 assert (proc/'stat').read_text().rsplit(')',1)[1].split()[19]==identity
 fd=os.open(proc/'mem',os.O_RDONLY)
 try:
  data=os.pread(fd,size,address);assert len(data)==size;return data
 finally:os.close(fd)
def value(name,fmt='<Q'):
 return struct.unpack(fmt,read(symbols['lab_memory_'+name],struct.calcsize(fmt)))[0]
requested=value('request')
if a.request:
 requested+=1;assert requested<2**64
 code=f'''import gdb,hashlib
from pathlib import Path
i=gdb.selected_inferior()
assert i.pid=={a.pid}
assert Path('/proc/{a.pid}/stat').read_text().rsplit(')',1)[1].split()[19]=={identity!r}
assert hashlib.sha256(Path({str(shim)!r}).read_bytes()).hexdigest()=={sha!r}
assert {mapping!r} in Path('/proc/{a.pid}/maps').read_text().splitlines()
i.write_memory({symbols['lab_memory_request']},({requested}).to_bytes(8,'little'))
print('ALLOCATOR_REQUESTED',{requested})'''
 with tempfile.TemporaryDirectory(prefix='az-allocator-request-') as temp:
  script=Path(temp)/'request.gdb'
  script.write_text(f'set pagination off\nset confirm off\nset auto-load off\nset print thread-events off\nattach {a.pid}\npython\n'+code+'\nend\ndetach\nquit\n')
  result=subprocess.run(['gdb','-q','-nx','-batch','-x',str(script)],capture_output=True,text=True,timeout=15)
  result.check_returncode();assert f'ALLOCATOR_REQUESTED {requested}' in result.stdout
deadline=time.monotonic()+10
while time.monotonic()<deadline:
 sequence=value('sequence')
 if sequence and not sequence%2 and value('done')==requested:
  length=value('length');assert length<1024*1024
  data=read(symbols['lab_memory_json'],length)
  error=value('error','<i');duration=value('nanoseconds')
  if value('sequence')==sequence and value('done')==requested:
   assert error==0,f'Allocator snapshot errno={error}'
   payload=json.loads(data);break
 time.sleep(.05)
else:raise TimeoutError('No stable completed allocator snapshot; player may not be drawing')
rollup={}
for line in (proc/'smaps_rollup').read_text().splitlines()[1:]:
 parts=line.split()
 if len(parts)==3 and parts[2]=='kB':rollup[parts[0].rstrip(':')]=int(parts[1])
out={'pid':a.pid,'file_cache_mib':a.file_cache_mib,'start_id':identity,'shim_sha256':sha,'request':requested,
     'sequence':sequence,'collection_ns':duration,'smaps_rollup_kib':rollup,'allocator':payload}
a.output.parent.mkdir(parents=True,exist_ok=True)
a.output.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'output':str(a.output),'collection_ms':duration/1e6,
 'stats':payload['jemalloc'].get('stats'),'rss_mib':rollup.get('Rss',0)/1024}))
