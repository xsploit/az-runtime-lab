"""Read-only startup memory and template-hook state for an explicit native PID."""
import json
import pathlib
import struct
import subprocess
import sys
pid=int(sys.argv[1])
root=pathlib.Path(f'/proc/{pid}')
start=root.joinpath('stat').read_text().split(') ',1)[1].split()[19]
maps=root.joinpath('maps').read_text()
rollup={}
for row in root.joinpath('smaps_rollup').read_text().splitlines()[1:]:
    parts=row.split()
    if len(parts)>=2: rollup[parts[0].rstrip(':')]=int(parts[1])
result={'pid':pid,'starttime':start,'smaps_rollup_kib':rollup,
        'template_vmas':sum('az-pcm-store-experiment' in row for row in maps.splitlines())}
hook=[row.split() for row in maps.splitlines() if 'pcm-template-hook.so' in row]
if hook:
    base=min(int(row[0].split('-')[0],16)-int(row[2],16) for row in hook)
    symbols=subprocess.check_output(['nm','-D','--defined-only',sys.argv[2]],text=True)
    lookup={p[2]:int(p[0],16) for row in symbols.splitlines() if len(p:=row.split())==3}
    with root.joinpath('mem').open('rb',buffering=0) as mem:
        def u64(address):
            mem.seek(address); return struct.unpack('<Q',mem.read(8))[0]
        for key in ['lab_pcm_installed','lab_pcm_init_error','lab_pcm_allocations','lab_pcm_releases','lab_pcm_reallocations']:
            result[key]=u64(base+lookup[key])
        address=base+lookup['lab_pcm_store']
        result['store']={key:u64(address+i*8) for i,key in enumerate(['arena','stride','capacity','next','live'])}
        st=result['store']
        if st['arena'] and st['stride']==16384 and st['capacity']==33850:
            with root.joinpath('pagemap').open('rb',buffering=0) as pages:
                pages.seek(st['arena']//16384*8)
                entries=struct.unpack('<'+'Q'*st['capacity'],pages.read(st['capacity']*8))
            present=[v for v in entries if v & (1<<63)]
            result['template_pages']={'present':len(present),
                'private_anonymous':sum(not(v & (1<<61)) for v in present),
                'file_backed':sum(bool(v & (1<<61)) for v in present),
                'swapped':sum(bool(v & (1<<62)) for v in entries)}
        mem.seek(0x777b40)
        result['guard_instructions']=[hex(x) for x in struct.unpack('<II',mem.read(8))]
assert start==root.joinpath('stat').read_text().split(') ',1)[1].split()[19]
print(json.dumps(result))
