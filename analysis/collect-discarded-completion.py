"""Collect bounded original AZ completion-task ownership and discard evidence."""
import hashlib, importlib.util, json, struct
from pathlib import Path
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('helpers',HERE/'cdj-render-compare/helpers.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
e=m.ELF('az');sha=hashlib.sha256(e.d).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
ranges=[(0x76ebf0,0x76ecd0),(0x759260,0x7593c4),(0x6b0db8,0x6b0ea4),
 (0x76bda8,0x76bea8),(0x7826e0,0x782878),(0x782978,0x782acc),
 (0x77d3e8,0x77d598),(0x2211620,0x22116e8),(0x777af0,0x777bdc)]
typeptr=struct.unpack('<Q',e.read(0x25eb078,8))[0]
strings={hex(a):e.read(a,160).split(b'\0',1)[0].decode() for a in [typeptr,0x25eb520,0x25ec708]}
out=HERE/'pcm-pool-live'
(out/'discarded-completion-disassembly.txt').write_text(''.join(e.dis(a,z) for a,z in ranges))
(out/'discarded-completion-evidence.json').write_text(json.dumps(dict(
 firmware_sha256=sha,strings=strings,ranges=[dict(start=hex(a),end_exclusive=hex(z)) for a,z in ranges],
 task_vtable=dict(address='0x25f8d78',slots=[hex(v) for v in struct.unpack('<3Q',e.read(0x25f8d78,24))]),
 task_offsets=dict(closure='0x18',position_with_source_info='0x20',source_reference='0x48',status='0x50',raw_page_wrapper='0x60',reservation='0x68'),
 scope='Direct task destructor and source-reference semantics. Last-source disposal helper is not resolved or executed by the oracle. No global no-leak, pool reuse or real shutdown guarantee.'),indent=2)+'\n')
print(json.dumps(dict(output=str(out/'discarded-completion-evidence.json'),strings=strings)))
