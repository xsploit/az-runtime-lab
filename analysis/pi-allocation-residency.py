"""Read page residency for recorded allocation ranges; never reads payload or PFNs.

Allocation traces are historical: freed/reused/overlapping ranges are not live
objects. Present virtual pages are not necessarily unique physical pages.
"""
import argparse,hashlib,json,mmap,os,struct,time
from pathlib import Path

def page_counts(fd,lo,hi,page_size):
    assert 0<=lo<=hi
    first=lo//page_size;end=(hi+page_size-1)//page_size
    counts=dict(pages=end-first,present=0,swapped=0,file_or_shared_anon=0)
    for start in range(first,end,65536):
        n=min(65536,end-start)
        data=os.pread(fd,n*8,start*8)
        if len(data)!=n*8:raise RuntimeError('Incomplete pagemap read')
        for (word,) in struct.iter_unpack('<Q',data):
            counts['present']+=(word>>63)&1
            counts['swapped']+=(word>>62)&1
            counts['file_or_shared_anon']+=(word>>61)&1
    counts['present_page_span_mib']=counts['present']*page_size/1024**2
    return counts

def merge_ranges(ranges,page_size):
    merged=[]
    for lo,hi in sorted((lo//page_size*page_size,(hi+page_size-1)//page_size*page_size) for lo,hi in ranges):
        if merged and lo<=merged[-1][1]:merged[-1][1]=max(hi,merged[-1][1])
        else:merged.append([lo,hi])
    return merged

def self_test():
    size=os.sysconf('SC_PAGE_SIZE')
    # Address is obtained locally only; no foreign memory reads.
    import ctypes
    area=mmap.mmap(-1,4*size,flags=mmap.MAP_PRIVATE|mmap.MAP_ANONYMOUS)
    addr=ctypes.addressof(ctypes.c_char.from_buffer(area))
    fd=os.open('/proc/self/pagemap',os.O_RDONLY)
    try:
        before=page_counts(fd,addr,addr+4*size,size)
        area[size]=17;area[3*size]=23
        after=page_counts(fd,addr,addr+4*size,size)
        assert before['present']==0 and after['present']==2,(before,after)
        assert merge_ranges([(size+1,2*size+3),(2*size,4*size)],size)==[[size,4*size]]
        print(json.dumps(dict(page_size=size,before=before,after=after,result='passed')))
    finally:os.close(fd);area.close()

def main():
    p=argparse.ArgumentParser();p.add_argument('--self-test',action='store_true');p.add_argument('--pid',type=int);p.add_argument('--trace',type=Path,action='append',default=[]);p.add_argument('--output',type=Path);a=p.parse_args()
    if a.self_test:return self_test()
    assert a.pid and a.output and a.trace
    proc=Path(f'/proc/{a.pid}');identity=(proc/'stat').read_text().rsplit(')',1)[1].split()[19]
    expected='137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
    assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest()==expected
    size=os.sysconf('SC_PAGE_SIZE');before=(proc/'maps').read_text();records=[]
    for path in a.trace:
        trace=json.loads(path.read_text());assert trace['pid']==a.pid and trace['start_id']==identity
        for index,row in enumerate(trace['records']):
            if row['result'] and row['size']:
                records.append(dict(trace=path.name,index=index,caller=row['caller_hex'],address=row['result'],size=row['size']))
    fd=os.open(proc/'pagemap',os.O_RDONLY);started=time.monotonic()
    try:
        for row in records:row['residency']=page_counts(fd,row['address'],row['address']+row['size'],size)
        ranges=merge_ranges([(r['address'],r['address']+r['size']) for r in records],size)
        union=[page_counts(fd,lo,hi,size) for lo,hi in ranges]
        maps=[]
        for line in before.splitlines():
            fields=line.split(maxsplit=5);lo,hi=(int(x,16) for x in fields[0].split('-'))
            if (hi-lo)//size>2000000:raise RuntimeError('Unexpectedly large mapping; inspect before scanning')
            maps.append(dict(mapping=line,**page_counts(fd,lo,hi,size)))
    finally:os.close(fd)
    assert (proc/'stat').read_text().rsplit(')',1)[1].split()[19]==identity
    result=dict(pid=a.pid,start_id=identity,firmware_sha256=expected,page_size=size,elapsed_seconds=time.monotonic()-started,maps_changed=before!=(proc/'maps').read_text(),records=records,recorded_range_union_present_mib=sum(r['present_page_span_mib'] for r in union),mappings=sorted(maps,key=lambda r:r['present'],reverse=True),smaps_rollup=(proc/'smaps_rollup').read_text(),scope=__doc__)
    a.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(dict(output=str(a.output),elapsed_seconds=result['elapsed_seconds'],maps_changed=result['maps_changed'],union_mib=result['recorded_range_union_present_mib'],records=[dict(caller=r['caller'],size=r['size'],present_mib=r['residency']['present_page_span_mib']) for r in records],top_mappings=result['mappings'][:10])))
if __name__=='__main__':main()
