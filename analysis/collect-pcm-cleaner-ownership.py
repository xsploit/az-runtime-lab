"""Hash-pinned static evidence for AZ cleaner callback registration and triggers.

Direct references and short ADRP+ADD candidates are not a whole-program
indirect-call or concurrency proof. Candidate register survival is reviewed in
the accompanying bounded disassembly, not inferred by this scanner.
"""
import hashlib
import importlib.util
import json
from pathlib import Path
import struct

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('elf_helpers', HERE/'cdj-render-compare/helpers.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
elf = module.ELF('az')
sha = hashlib.sha256(elf.d).hexdigest()
assert sha == '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
targets = (0x7748d0, 0x7750f8, 0x77c778, 0x785b10,
           0x77a050, 0x7816c0, 0x7817e8)
refs = {hex(f): dict(direct_calls=[hex(a) for a in elf.calls(f)],
                    pointer_references=[hex(a) for a in elf.hits(struct.pack('<Q', f))])
        for f in targets}
candidates = []
pages = {f & ~4095 for f in targets}
for seg in elf.segs:
    if not seg[1] & 1:
        continue
    for i in range(0, seg[5]-68, 4):
        w = struct.unpack_from('<I', elf.d, seg[2]+i)[0]
        if w & 0x9f000000 != 0x90000000:
            continue
        imm = ((w >> 29) & 3) | (((w >> 5) & 0x7ffff) << 2)
        if imm & 0x100000:
            imm -= 0x200000
        va = seg[3]+i
        page = (va & ~4095)+(imm << 12)
        if page not in pages:
            continue
        reg = w & 31
        for j in range(1, 17):
            x = struct.unpack_from('<I', elf.d, seg[2]+i+4*j)[0]
            if x & 0xffc00000 == 0x91000000 and (x >> 5) & 31 == reg:
                target = page+((x >> 10) & 4095)
                if target in targets:
                    candidates.append(dict(adrp=hex(va), add=hex(va+4*j), target=hex(target)))
ranges = [(0x7768a4, 0x7768f8), (0x7769c8, 0x776a48),
          (0x76fba0, 0x76fbf4), (0x770f50, 0x770fc8),
          (0x7660c0, 0x7660e4), (0x767240, 0x7672dc),
          (0x77c778, 0x77c84c), (0x77cac4, 0x77cb18),
          (0x785b10, 0x785b8c), (0x785d28, 0x785d78),
          (0x774cf4, 0x774d30), (0x775954, 0x775990),
          (0x775bc8, 0x775be8),
          (0x769d78, 0x769db8), (0x779cd0, 0x779d4c),
          (0x77bf28, 0x77bf84), (0x77c048, 0x77c088),
          (0x770df8, 0x770eb8), (0x778d90, 0x778dd8),
          (0x77925c, 0x77927c), (0x776364, 0x7763c0),
          (0x776a48, 0x776aac), (0x77d464, 0x77d490),
          (0x77d54c, 0x77d598), (0x77a3f0, 0x77a3f8),
          (0x7816c0, 0x7817e8), (0x7817e8, 0x781918),
          (0x77a1a8, 0x77a224)]
out = HERE/'pcm-pool-live'
(out/'cleaner-ownership-disassembly.txt').write_text(''.join(elf.dis(a,b) for a,b in ranges))
types = []
for table in (0x25f8b68, 0x25f8b98, 0x25f9b58):
    typeinfo = struct.unpack('<Q', elf.read(table-8, 8))[0]
    name = struct.unpack('<Q', elf.read(typeinfo+8, 8))[0]
    types.append(dict(table=hex(table), typeinfo=hex(typeinfo),
                      name=elf.read(name, 400).split(b'\0')[0].decode(),
                      first_four_slots=[hex(v) for v in struct.unpack('<4Q', elf.read(table,32))]))
result = dict(scope=__doc__, firmware_sha256=sha, references=refs,
              address_materialization_candidates=candidates,
              buffering_task_types=types,
              scheduler_listener_vtable=dict(address='0x25f9d18',
                 slots=[hex(v) for v in struct.unpack('<4Q',elf.read(0x25f9d18,32))]),
              commander_vtable=dict(address='0x25f9f88',
                 slots=[hex(v) for v in struct.unpack('<7Q',elf.read(0x25f9f88,56))]),
              ranges=[dict(start=hex(a), end_exclusive=hex(b)) for a,b in ranges])
(out/'cleaner-ownership-xrefs.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(dict(references=refs, candidates=candidates, output=str(out/'cleaner-ownership-xrefs.json'))))
