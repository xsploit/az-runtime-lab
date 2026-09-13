"""Read owning PCM page descriptors and pagemap residency, not audio payload."""
import argparse,hashlib,json,os,struct,time
from pathlib import Path
from importlib.machinery import SourceFileLoader
helper=SourceFileLoader('residency',str(Path(__file__).with_name('pi-allocation-residency.py'))).load_module()
p=argparse.ArgumentParser();p.add_argument('pid',type=int);p.add_argument('pool',type=lambda s:int(s,0));p.add_argument('output',type=Path);a=p.parse_args()
proc=Path(f'/proc/{a.pid}');identity=(proc/'stat').read_text().rsplit(')',1)[1].split()[19]
assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest()=='137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
fd=os.open(proc/'mem',os.O_RDONLY);pg=os.open(proc/'pagemap',os.O_RDONLY);ps=os.sysconf('SC_PAGE_SIZE');started=time.monotonic()
def same():assert (proc/'stat').read_text().rsplit(')',1)[1].split()[19]==identity
def read(addr,n):
 data=os.pread(fd,n,addr);assert len(data)==n;return data
try:
 assert struct.unpack('<Q',read(a.pool,8))[0]==0x25f9c00
 config=read(a.pool+8,40);assert struct.unpack('<10I',config)==(1764,50,30000,37,33850,677,50,600,1500000,88200)
 descriptor=read(a.pool+0x80,20);vector=struct.unpack_from('<Q',descriptor)[0];count=struct.unpack_from('<I',descriptor,16)[0];assert count==33850
 ptrdata=read(vector,count*8);ptrs=struct.unpack('<'+'Q'*count,ptrdata);assert len(set(ptrs))==count
 ranges=[];guard_samples=[]
 for i,ptr in enumerate(ptrs):
  if i%256==0:same()
  data,n=struct.unpack('<QI',read(ptr,12));assert n==1764 and data%8==0
  lo=data-8;hi=data+n*8+8;ranges.append((lo,hi))
  if i in {j*(count-1)//15 for j in range(16)}:
   front=read(lo,8);back=read(hi-8,8)
   assert front==b'\xaf'*8 and back==b'\xef'*8,(i,front.hex(),back.hex())
   guard_samples.append(i)
 assert len(set(ranges))==count
 aligned=helper.merge_ranges(ranges,ps)
 observations=[helper.page_counts(pg,lo,hi,ps) for lo,hi in aligned]
 same();assert read(a.pool+8,40)==config and read(a.pool+0x80,20)==descriptor and read(vector,count*8)==ptrdata
 summary=dict(pid=a.pid,start_id=identity,pool=hex(a.pool),page_count=count,payload_elements_per_page=1764,element_bytes=8,requested_bytes_per_page=14128,requested_total_mib=count*14128/1024**2,allocator_rounded_total_mib=count*14336/1024**2,kernel_page_size=ps,distinct_page_ranges=len(aligned),virtual_page_span_mib=sum(o['pages'] for o in observations)*ps/1024**2,present_page_span_mib=sum(o['present_page_span_mib'] for o in observations),swapped_pages=sum(o['swapped'] for o in observations),guard_sample_indices=guard_samples,elapsed_seconds=time.monotonic()-started,scope='Current owning vector/descriptors verified before and after. Residency is a virtual-page span, including boundary sharing/allocator rounding; not unique physical RAM or memory proven safe to release. Only descriptor and16 guard-pair samples read; no PCM payload read or saved.')
 a.output.write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary))
finally:os.close(fd);os.close(pg)
