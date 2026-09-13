"""Reconcile merged jemalloc small-bin accounting; not a resident object census."""
import argparse,json
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('snapshot',type=Path);p.add_argument('output',type=Path);a=p.parse_args()
j=json.loads(a.snapshot.read_text())['allocator']['jemalloc'];merged=j['stats.arenas']['merged'];sizes=j['arenas']['bin'];bins=merged['bins'];assert len(sizes)==len(bins)
rows=[]
for size,usage in zip(sizes,bins):
 allocated=size['size']*usage['curregs'];slabs=size['slab_size']*usage['curslabs']
 rows.append(dict(size=size['size'],curregs=usage['curregs'],allocated_bytes=allocated,slab_capacity_bytes=slabs,allocated_mib=allocated/1024**2,slab_capacity_mib=slabs/1024**2))
total=sum(r['allocated_bytes'] for r in rows);assert total==merged['small']['allocated'],(total,merged['small'])
result=dict(source=str(a.snapshot),small_allocated_mib=total/1024**2,rows=sorted(rows,key=lambda r:r['allocated_bytes'],reverse=True),scope='Allocator size-class accounting; tcache may lag frees. Slab capacity is not measured physical residency. Does not identify allocation callers.')
a.output.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(dict(total_mib=result['small_allocated_mib'],top=result['rows'][:3])))
