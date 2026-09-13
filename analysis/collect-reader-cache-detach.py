"""Collect bounded static AZ detachFiles / reader-cache-clear evidence."""
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct
import subprocess

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('elf_helpers', HERE/'cdj-render-compare/helpers.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
elf = module.ELF('az')
sha = hashlib.sha256(elf.d).hexdigest()
assert sha == '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
types = []
for table in (0x25f8cb8,0x25f8e30,0x25fa008,0x25f9a70,0x25f8da8):
    typeinfo = struct.unpack('<Q',elf.read(table-8,8))[0]
    name = struct.unpack('<Q',elf.read(typeinfo+8,8))[0]
    types.append(dict(table=hex(table),typeinfo=hex(typeinfo),
        name=elf.read(name,1024).split(b'\0')[0].decode(),
        slots=[hex(v) for v in struct.unpack('<4Q',elf.read(table,32))]))
ranges = [(0x77aa80,0x77aaa8),(0x77ab28,0x77ab48),(0x77ab70,0x77ab88),
          (0x77efc8,0x77f04c),(0x77f104,0x77f158),
          (0x77f1c8,0x77f210),(0x77f238,0x77f250),(0x77f3ec,0x77f418),
          (0x77f6d0,0x77f704),(0x77e260,0x77e510),
          (0x765af8,0x765b34), (0x77f2ac,0x77f358),
          (0x77f3dc,0x77f3ec), (0x77e6a8,0x77e8fc),
          (0x77ee90,0x77ef9c), (0x765fc8,0x765fd8),
          (0x766170,0x7661a8), (0x7661f0,0x766204),
          (0x766910,0x766914), (0x6742d8,0x674380)]
plt = subprocess.check_output(['llvm-objdump','-d','-j','.plt',str(elf.path)],text=True)
names = {int(a,16): n for a,n in re.findall(r'^([0-9a-f]+) <(.+)@plt>:',plt,re.M)}
call_maps = {}
for start,end in ((0x77efc8,0x77f610),(0x77e6a8,0x77e8fc),(0x77ee90,0x77ef9c)):
    calls = []
    for va in range(start,end,4):
        word = struct.unpack('<I',elf.read(va,4))[0]
        if word & 0xfc000000 != 0x94000000:
            continue
        imm = word & 0x3ffffff
        if imm & 0x2000000:
            imm -= 0x4000000
        target = va+4*imm
        calls.append(dict(site=hex(va),target=hex(target),import_symbol=names.get(target)))
    call_maps[hex(start)] = dict(end_exclusive=hex(end),direct_bl_calls=calls)
out = HERE/'pcm-pool-live'
(out/'reader-cache-detach-disassembly.txt').write_text(''.join(elf.dis(a,b) for a,b in ranges))
result = dict(firmware_sha256=sha,types=types,
    direct_call_maps=call_maps,
    futex_imports={hex(a):n for a,n in names.items() if 'futex' in n},
    diagnostic=dict(address='0x25fa850',text=elf.read(0x25fa850,100).split(b'\0')[0].decode()),
    ranges=[dict(start=hex(a),end_exclusive=hex(b)) for a,b in ranges],
    scope='Static constructor/task/clear/reference-release trace. Direct calls are not a transitive or indirect-call inventory. See AZ-DETACH-PROMISE-LIFETIME.md for normal queued-path non-join evidence; no cancellation completeness or shutdown quiescence claim.')
(out/'reader-cache-detach.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(dict(types=types,output=str(out/'reader-cache-detach.json'))))
