"""Collect hash-pinned offline evidence for AZ PCM return-task dispatch."""
import hashlib
import importlib.util
import json
from pathlib import Path
import struct

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('cdj_elf_helpers', HERE/'cdj-render-compare/helpers.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
elf = module.ELF('az')
sha = hashlib.sha256(elf.d).hexdigest()
assert sha == '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'

types = []
for typeinfo in (0x25f8520, 0x25f96a0):
    name = struct.unpack('<Q', elf.read(typeinfo+8, 8))[0]
    types.append(dict(typeinfo=hex(typeinfo), name_address=hex(name),
                      mangled_name=elf.read(name, 1024).split(b'\0')[0].decode()))
ranges = [(0x773620, 0x7736cc), (0x774630, 0x7746e8),
          (0x670488, 0x6704a8), (0x77d3e8, 0x77d490),
          (0x77d54c, 0x77d598), (0x77d5f0, 0x77d5f8),
          (0x7826e0, 0x782834), (0x782978, 0x782ac4),
          (0x76ebf0, 0x76ec58), (0x776130, 0x776150),
          (0x776364, 0x7763c8), (0x7766a4, 0x7766e8),
          (0x68f0e8, 0x68f11c), (0x231cbe0, 0x231cbec),
          (0x22093b0, 0x22093e4), (0x2211620, 0x22116d8),
          (0x22107b0, 0x2210958), (0x2210a40, 0x2210a48),
          (0x781d60, 0x782058), (0x684480, 0x6844ac),
          (0x7745f8, 0x7746e8), (0x774828, 0x774868)]
output = HERE/'pcm-pool-live'
(output/'return-dispatch-disassembly.txt').write_text(''.join(elf.dis(a,b) for a,b in ranges))
records = {}
for f in (0x773620, 0x77d5f0, 0x782978, 0x782af0):
    records[hex(f)] = dict(direct_calls=[hex(a) for a in elf.calls(f)],
        pointer_references=[hex(a) for a in elf.hits(struct.pack('<Q',f))])
tables = {hex(a): [hex(v) for v in struct.unpack('<10Q',elf.read(a,80))]
          for a in (0x25f9d70,)}
result = dict(firmware_sha256=sha, types=types, references=records, scheduler_task_table=tables,
    ranges=[dict(start=hex(a), end_exclusive=hex(b)) for a,b in ranges],
    scope='Static direct B/BL and byte-pattern pointer references; no indirect-call completeness or runtime synchronization proof.')
(output/'return-dispatch-xrefs.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(dict(types=types, output=str(output/'return-dispatch-xrefs.json'))))
