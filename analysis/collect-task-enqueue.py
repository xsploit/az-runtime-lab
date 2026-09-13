"""Bounded AZ task enqueue implementation and constructor evidence."""
import hashlib, importlib.util, json, struct
from pathlib import Path
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('helpers',HERE/'cdj-render-compare/helpers.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
e=m.ELF('az');sha=hashlib.sha256(e.d).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
ranges=[(0x22093b0,0x22093e4),(0x2211620,0x22116e8),
 (0x220c820,0x220c914),(0x22122d0,0x221245c),(0x220d750,0x220d868),
 (0x220c9d0,0x220cba8),(0x776338,0x776358),(0x7764a0,0x776520),
 (0x782754,0x782798),(0x782a04,0x782a38)]
a=0x2e67ac8
out=HERE/'pcm-pool-live'
(out/'task-enqueue-disassembly.txt').write_text(''.join(e.dis(a,z) for a,z in ranges))
(out/'task-enqueue-evidence.json').write_text(json.dumps(dict(firmware_sha256=sha,
 ranges=[dict(start=hex(a),end_exclusive=hex(z)) for a,z in ranges],
 queue_vtable=dict(address=hex(a),slots=[hex(v) for v in struct.unpack('<7Q',e.read(a,56))]),
 offsets_relative_to_queue=dict(inner_queue='0x38',head='0x38',tail='0x78',spare_head='0xb8'),
 allocation=dict(node_bytes=64,constructor_argument=1024,initial_nodes=1025,raw_node_bytes_per_queue=65600),
 scope='Dynamic enqueue and task-ID return contract. Controlled sequential tests, not live contention, allocator exceptions or full application capacity measurements.'),indent=2)+'\n')
print(json.dumps(dict(output=str(out/'task-enqueue-evidence.json'))))
