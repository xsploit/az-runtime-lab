"""Collect hash-pinned AZ scheduler/worker shutdown and thread-stop evidence."""
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import subprocess

HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('elf_helpers',HERE/'cdj-render-compare/helpers.py')
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
elf=module.ELF('az')
sha=hashlib.sha256(elf.d).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
ranges=[(0x771878,0x7719f4),(0x771528,0x771644),(0x771648,0x7716dc),
        (0x771d18,0x771dac),(0x231cbf0,0x231cc04),
        (0x23383f0,0x23384f0),(0x231ecb0,0x231ed54),
        (0x232d830,0x232d874),(0x231e850,0x231e8c8)]
plt=subprocess.check_output(['llvm-objdump','-d','-j','.plt',str(elf.path)],text=True)
names={int(a,16):n for a,n in re.findall(r'^([0-9a-f]+) <(.+)@plt>:',plt,re.M)}
selected={hex(a):names[a] for a in [0x425830,0x426a40,0x426f90,0x426b50,0x424700,0x427030]}
out=HERE/'pcm-pool-live'
(out/'shutdown-disassembly.txt').write_text(''.join(elf.dis(a,b) for a,b in ranges))
(out/'shutdown-evidence.json').write_text(json.dumps(dict(firmware_sha256=sha,
    imported_symbols=selected,ranges=[dict(start=hex(a),end_exclusive=hex(b)) for a,b in ranges],
    scope='Static stop/destructor ordering plus separate controlled thread-stop oracle. Does not establish live thread quiescence, complete queue draining or safe PCM reclamation.'),indent=2)+'\n')
print(json.dumps(dict(output=str(out/'shutdown-evidence.json'),imports=selected)))
