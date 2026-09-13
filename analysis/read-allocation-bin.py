"""Read stable aggregate trace counters without stopping or modifying the process."""
import argparse,hashlib,json,os,struct,subprocess,time
from pathlib import Path

def read_bins(pid,library_suffix,prefix):
 proc=Path(f'/proc/{pid}');identity=(proc/'stat').read_text().rsplit(')',1)[1].split()[19]
 mapping=next(s for s in (proc/'maps').read_text().splitlines() if s.endswith(library_suffix) and s.split()[2]=='00000000')
 name=mapping.split(maxsplit=5)[5];lib=proc/'root'/name.lstrip('/');base=int(mapping.split('-')[0],16)
 symbols={s.split()[2]:base+int(s.split()[0],16) for s in subprocess.check_output(['nm','-D',str(lib)],text=True).splitlines() if len(s.split())==3 and s.split()[2].startswith(prefix)}
 fd=os.open(proc/'mem',os.O_RDONLY)
 def read(n,size=8):
  data=os.pread(fd,size,symbols[prefix+n]);assert len(data)==size;return data
 def val(n):return struct.unpack('<Q',read(n))[0]
 try:
  for attempt in range(100):
   seq=val('sequence')
   if seq%2:time.sleep(.005);continue
   used=val('used');assert used<=256
   data=read('events',used*64);overflow=val('overflow')
   if val('sequence')==seq:break
  else:raise RuntimeError('Counters remained busy')
 finally:os.close(fd)
 assert (proc/'stat').read_text().rsplit(')',1)[1].split()[19]==identity
 rows=[dict(zip(['caller','size','kind','count','success','failed','first_result','last_result'],row)) for row in struct.iter_unpack('<8Q',data)]
 for row in rows:
  assert 12288<row['size']<=14336 and row['success']+row['failed']==row['count'];row['caller_hex']=hex(row['caller'])
 return dict(pid=pid,start_id=identity,library_sha256=hashlib.sha256(lib.read_bytes()).hexdigest(),sequence=seq,overflow=overflow,rows=sorted(rows,key=lambda r:r['count'],reverse=True),scope='Returned allocation calls in (12288,14336]; frees not traced, not live allocations. First/last addresses are historical.')
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('output',type=Path);a=p.parse_args()
 assert hashlib.sha256(Path(f'/proc/{a.pid}/exe').read_bytes()).hexdigest()=='137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
 out={k:read_bins(a.pid,lib,prefix) for k,lib,prefix in [('new','/lab-shims/large-new-trace.so','lab_bin_new_'),('c','/lab-shims/main-allocation-trace.so','lab_bin_c_')]}
 a.output.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
