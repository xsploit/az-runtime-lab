"""Summarize saved jemalloc 5.2/5.3 telemetry; sizes are bytes, not OS pages."""
import argparse,json
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('directory',type=Path);p.add_argument('output',type=Path);a=p.parse_args()
rows=[]
for path in sorted(a.directory.glob('*.json')):
 data=json.loads(path.read_text())
 if 'allocator' not in data:continue
 jem=data['allocator']['jemalloc'];arena=jem['stats.arenas']['merged']
 sizes=jem['arenas'].get('lextent',jem['arenas'].get('lextents'))
 assert sizes is not None and len(sizes)==len(arena['lextents'])
 classes=sorted([dict(size_bytes=s['size'],count=v['curlextents'],total_bytes=s['size']*v['curlextents'])
                 for s,v in zip(sizes,arena['lextents']) if v['curlextents']],
                key=lambda item:item['total_bytes'],reverse=True)
 assert sum(item['total_bytes'] for item in classes)==arena['large']['allocated']
 rows.append(dict(source=path.name,collection_ms=data['collection_ns']/1e6,
  rss_mib=data['smaps_rollup_kib']['Rss']/1024,
  allocated_mib=jem['stats']['allocated']/1024**2,active_mib=jem['stats']['active']/1024**2,
  dirty_mib=arena['pdirty']*jem['arenas']['page']/1024**2,
  tcache_mib=arena['tcache_bytes']/1024**2,allocator_page_bytes=jem['arenas']['page'],large_classes=classes))
assert rows
a.output.write_text(json.dumps(rows,indent=2)+'\n')
print(json.dumps([{k:v for k,v in row.items() if k!='large_classes'} for row in rows],indent=2))
