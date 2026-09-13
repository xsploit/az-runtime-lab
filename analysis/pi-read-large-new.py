"""Read an opt-in native AZ C++ allocation ring without stopping the player."""
import argparse,hashlib,json,os,struct,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('output',type=Path);a=p.parse_args()
proc=Path(f'/proc/{a.pid}')
assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest()=='137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
identity=(proc/'stat').read_text().rsplit(')',1)[1].split()[19]
maps=(proc/'maps').read_text()
mapping=next(line for line in maps.splitlines() if line.endswith('/lab-shims/large-new-trace.so') and line.split()[2]=='00000000')
base=int(mapping.split('-')[0],16);library=proc/'root/lab-shims/large-new-trace.so'
symbols={s.split()[2]:base+int(s.split()[0],16) for s in subprocess.check_output(['nm','-D',str(library)],text=True).splitlines()
         if len(s.split())==3 and s.split()[2].startswith('lab_alloc_')}
fd=os.open(proc/'mem',os.O_RDONLY)
def read(addr,n):
 assert (proc/'stat').read_text().rsplit(')',1)[1].split()[19]==identity
 data=os.pread(fd,n,addr);assert len(data)==n;return data
try:
 count=struct.unpack('<Q',read(symbols['lab_alloc_count'],8))[0];rows=[]
 for i in range(min(count,512)):
  address=symbols['lab_alloc_events']+i*48
  for attempt in range(20):
   if struct.unpack('<Q',read(address,8))[0]==1:break
   time.sleep(.01)
  else:raise RuntimeError('Reserved event did not finish')
  row=dict(zip(['ready','kind','size','argument2','caller','result'],struct.unpack('<6Q',read(address,48))))
  assert row['ready']==1 and row['size']>=8*1024**2
  row['caller_hex']=hex(row['caller']);row['result_hex']=hex(row['result']);rows.append(row)
finally:os.close(fd)
a.output.parent.mkdir(parents=True,exist_ok=True)
a.output.write_text(json.dumps({'pid':a.pid,'start_id':identity,'shim_sha256':hashlib.sha256(library.read_bytes()).hexdigest(),
 'count_at_read_start':count,'truncated':count>512,'records':rows,'maps':maps,
 'scope':'Returned C++ new/new[] calls >=8MiB. May include repeated, freed, failed or nested calls; not a live allocation inventory. C allocation APIs and thrown calls are not logged.'},indent=2)+'\n')
print(json.dumps({'output':str(a.output),'count':count,'largest':sorted(rows,key=lambda row:row['size'],reverse=True)[:12]}))
