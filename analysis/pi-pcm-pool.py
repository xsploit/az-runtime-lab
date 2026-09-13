"""Read verified PCM pool metadata; scan only present private anonymous pages.

No heap dump or PCM contents are saved. Allocator/object identity and container
bounds are checked. Free-queue count is structural, not semantic load capacity.
"""
import argparse,hashlib,json,os,struct,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('output',type=Path);p.add_argument('--pool',type=lambda s:int(s,0));a=p.parse_args()
proc=Path(f'/proc/{a.pid}');identity=(proc/'stat').read_text().rsplit(')',1)[1].split()[19]
assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest()=='137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
fd=os.open(proc/'mem',os.O_RDONLY);pg=os.open(proc/'pagemap',os.O_RDONLY);size=os.sysconf('SC_PAGE_SIZE');started=time.monotonic()
def read(addr,n):
 assert (proc/'stat').read_text().rsplit(')',1)[1].split()[19]==identity
 data=os.pread(fd,n,addr);assert len(data)==n;return data
def words(addr,n):return struct.unpack('<'+'Q'*n,read(addr,8*n))
try:
 hits=[];scanned=0
 if a.pool:hits=[a.pool]
 else:
  needle=struct.pack('<Q',0x25f9c00)
  for line in (proc/'maps').read_text().splitlines():
   fields=line.split()
   if len(fields)!=5 or fields[1]!='rw-p' or fields[4]!='0':continue
   lo,hi=(int(s,16) for s in fields[0].split('-'))
   assert hi-lo<2**32
   for chunk in range(lo,hi,1024*1024):
    end=min(chunk+1024*1024,hi);n=(end-chunk)//size
    status=os.pread(pg,n*8,(chunk//size)*8);assert len(status)==n*8
    # Search present pages only; do not fault in untouched reserved buffers.
    for i,(word,) in enumerate(struct.iter_unpack('<Q',status)):
     if not word>>63:continue
     base=chunk+i*size;data=read(base,size);scanned+=size;offset=0
     while True:
      offset=data.find(needle,offset)
      if offset<0:break
      candidate=base+offset
      if candidate%8==0:
       config=struct.unpack('<10I',read(candidate+8,40))
       if config[4]==33850 and config[5]==677:hits.append(candidate)
      offset+=8
 assert len(hits)==1,hits
 pool=hits[0];assert words(pool,1)==(0x25f9c00,)
 config=struct.unpack('<10I',read(pool+8,40))
 # Require stable start/finish snapshots; a transient update is not corruption.
 for attempt in range(100):
  q1=words(pool+0x40,8);q2=words(pool+0x40,8)
  if q1==q2:break
 else:raise RuntimeError('Free queue remained busy')
 sc,sf,sl,sn,fc,ff,fl,fn=q1
 assert sl-sf==fl-ff==512 and sf<=sc<=sl and ff<=fc<=fl and fn>=sn and (fn-sn)%8==0
 queue=(fn-sn)//8*64+(fc-ff)//8-(sc-sf)//8
 ptr=words(pool+0x80,1)[0];capacity,_,count=struct.unpack('<3I',read(pool+0x88,12))
 assert count==config[4] and count<=capacity<100000 and 0<=queue<=count
 result=dict(pid=a.pid,start_id=identity,pool=hex(pool),config_u32=list(config),page_vector=hex(ptr),page_vector_count=count,page_vector_capacity=capacity,free_queue_count=queue,not_in_free_queue=count-queue,scanned_present_mib=scanned/1024**2,elapsed_seconds=time.monotonic()-started,scope=__doc__)
 a.output.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
finally:os.close(fd);os.close(pg)
