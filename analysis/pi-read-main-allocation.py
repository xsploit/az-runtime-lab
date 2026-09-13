"""Read an opt-in native AZ main C allocation ring without stopping the player."""
import argparse,hashlib,json,os,struct,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('output',type=Path);p.add_argument('--file-cache-mib',type=int,choices=(32,64,100),default=100);a=p.parse_args()
proc=Path(f'/proc/{a.pid}')
assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest()=={100: '137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c', 64: '9f93478b76bda19c0ea0708196f0f20e97f4c1e0b59c8f9648118e3acb256fe4', 32: 'f61eb7dda3ec197c675af28cac87dcca53eca0bfde2977a6a9824e4809e5b324'}[a.file_cache_mib]
identity=(proc/'stat').read_text().rsplit(')',1)[1].split()[19]
maps=(proc/'maps').read_text()
mapping=next(line for line in maps.splitlines() if line.endswith('/lab-shims/main-allocation-trace.so') and line.split()[2]=='00000000')
base=int(mapping.split('-')[0],16);library=proc/'root/lab-shims/main-allocation-trace.so'
symbols={s.split()[2]:base+int(s.split()[0],16) for s in subprocess.check_output(['nm','-D',str(library)],text=True).splitlines()
         if len(s.split())==3 and s.split()[2].startswith('lab_c_')}
fd=os.open(proc/'mem',os.O_RDONLY)
def read(addr,n):
 assert (proc/'stat').read_text().rsplit(')',1)[1].split()[19]==identity
 data=os.pread(fd,n,addr);assert len(data)==n;return data
try:
 installed=struct.unpack('<Q',read(symbols['lab_c_trace_installed'],8))[0]
 error=struct.unpack('<Q',read(symbols['lab_c_trace_error'],8))[0]
 assert installed==7 and error==0,(installed,error)
 count=struct.unpack('<Q',read(symbols['lab_c_alloc_count'],8))[0];rows=[]
 for i in range(min(count,512)):
  address=symbols['lab_c_alloc_events']+i*48
  for attempt in range(20):
   if struct.unpack('<Q',read(address,8))[0]==1:break
   time.sleep(.01)
  else:raise RuntimeError('Reserved event did not finish')
  row=dict(zip(['ready','kind','size','argument2','caller','result'],struct.unpack('<6Q',read(address,48))))
  assert row['ready']==1 and row['size']>=8*1024**2
  row['caller_hex']=hex(row['caller']);row['result_hex']=hex(row['result']);rows.append(row)
finally:os.close(fd)
a.output.parent.mkdir(parents=True,exist_ok=True)
a.output.write_text(json.dumps({'pid':a.pid,'file_cache_mib':a.file_cache_mib,'start_id':identity,'shim_sha256':hashlib.sha256(library.read_bytes()).hexdigest(),
 'installed':installed,'error':error,'count_at_read_start':count,'truncated':count>512,'records':rows,'maps':maps,
 'scope':'Returned main-executable malloc/calloc/realloc calls >=8MiB. May include repeated, freed or failed calls; not a live allocation inventory. Other libraries and C++ APIs are not intercepted.'},indent=2)+'\n')
print(json.dumps({'output':str(a.output),'count':count,'largest':sorted(rows,key=lambda row:row['size'],reverse=True)[:12]}))
