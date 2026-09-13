"""Read-only diagnostic scan, no thread suspension or memory writes.
Candidate pointers require subsequent stable reads and page-change validation.
"""
import argparse,os,struct,json
from pathlib import Path
p=argparse.ArgumentParser(description=__doc__);p.add_argument('pid',type=int);a=p.parse_args()
mem=os.open(f'/proc/{a.pid}/mem',os.O_RDONLY)
q=lambda address:struct.unpack('<Q',os.pread(mem,8,address))[0]
# Check actual mapped getter bytes before interpreting the pinned object layout.
assert os.pread(mem,8,0x198f468)==bytes.fromhex('01a840f940120190')
needle=struct.pack('<Q',0x29cb4a0);hits=[];scanned=0;skipped=0
try:
 for line in Path(f'/proc/{a.pid}/maps').read_text().splitlines():
  fields=line.split();lo,hi=[int(x,16) for x in fields[0].split('-')]
  if fields[1]!='rw-p' or len(fields)>5 and fields[5]!='[heap]' or hi-lo>1024*1024*1024:continue
  for start in range(lo,hi,1024*1024):
   try:data=os.pread(mem,min(1024*1024,hi-start),start)
   except OSError:skipped+=1;continue
   scanned+=len(data);i=0
   while True:
    i=data.find(needle,i)
    if i<0:break
    addr=start+i;i+=1
    if addr%8:continue
    try:
     nested=q(addr+24);vt=q(nested);slot=q(vt+488)
     if slot!=0x198f468:continue
     current=q(nested+336)
     hits.append(dict(manager=hex(addr),nested=hex(nested),vtable=hex(vt),getter=hex(slot),current=hex(current),identity=hex(q(current+248) if current else q(0x3bd76f0))))
    except (OSError,struct.error):pass
finally:os.close(mem)
print(json.dumps(dict(pid=a.pid,scanned_bytes=scanned,skipped_chunks=skipped,candidates=hits),indent=2))
