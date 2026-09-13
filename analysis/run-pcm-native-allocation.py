"""Execute original AZ constructor allocation and cleanup with real storage.

Extracted code stays in private temporary directories and is deleted on exit.
No attach, player patch, restart or UI operation. Allocation failure reporting is intercepted to exit43; this does not execute
the original logger. The constructor snippet stops before owner-vector insertion;
full pool construction, application teardown and exception unwind are not tested.
"""
import hashlib
import json
from pathlib import Path
import shlex
import shutil
import struct
import subprocess
import tempfile

root = Path(__file__).resolve().parents[1]
firmware = root/'xdjaz/rootfs/home/root/pdj/EP147'
data = firmware.read_bytes()
sha = hashlib.sha256(data).hexdigest()
assert sha == '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
phoff = struct.unpack_from('<Q',data,32)[0]
stride,count = struct.unpack_from('<HH',data,54)
segments = [struct.unpack_from('<IIQQQQQQ',data,phoff+i*stride) for i in range(count)]
def read(address,length):
    for s in segments:
        if s[0] == 1 and s[3] <= address and address+length <= s[3]+s[5]:
            return data[s[2]+address-s[3]:s[2]+address-s[3]+length]
    raise ValueError(hex(address))
assert struct.unpack('<I',read(0x770658,4))[0] == 0xaa1603e1
assert struct.unpack('<I',read(0x777b40,4))[0] == 0x293f0401
assert struct.unpack('<I',read(0x777b44,4))[0] == 0xf822d803
options = ['-o','BatchMode=yes','-o','ConnectTimeout=8',
           '-o','UserKnownHostsFile=/tmp/piflex-known-hosts','-i','/tmp/piflex-ssh-key']
host = 'pompu_5@pflx.local'
def remote(command,check=True):
    return subprocess.run(['ssh',*options,host,command],capture_output=True,text=True,
                          check=check,timeout=45)
directory = remote('mktemp -d /tmp/az-pcm-allocation-XXXXXXXX').stdout.strip()
assert directory.startswith('/tmp/az-pcm-allocation-') and '\n' not in directory
results = []
source_paths = ['shims/pcm-template-store.c','shims/pcm-template-store.h',
                'shims/pcm-template-allocation.c','shims/pcm-template-allocation.h',
                'analysis/test-pcm-native-allocation.c','analysis/test-pcm-allocation.c']
try:
    with tempfile.TemporaryDirectory(prefix='az-pcm-allocation-local-') as local:
        t = Path(local)
        for name in source_paths:
            (t/name).parent.mkdir(exist_ok=True)
            shutil.copyfile(root/name,t/name)
        (t/'wrapper.bin').write_bytes(read(0x76c000,16384))
        (t/'constructor.bin').write_bytes(read(0x774000,16384))
        (t/'helper.bin').write_bytes(read(0x770000,16384))
        subprocess.run(['scp','-q','-r',*options,str(t)+'/.',host+':'+directory+'/'],
                       check=True,timeout=30)
    prefix = 'cd '+shlex.quote(directory)+' && '
    build = remote(prefix+'cc -O2 -Wall -Wextra -Werror -fPIE -pie '
                   'shims/pcm-template-store.c shims/pcm-template-allocation.c '
                   'analysis/test-pcm-native-allocation.c -o probe')
    for variant in range(2):
        for case in ('shared','exhausted','disabled','variable','failure'):
            run = remote(prefix+f'./probe {variant} {case}',check=False)
            expected = 43 if case == 'failure' else 0
            result = dict(variant=variant,case=case,returncode=run.returncode,
                          expected_returncode=expected,stdout=run.stdout,stderr=run.stderr,
                          passed=run.returncode == expected)
            results.append(result)
            print(json.dumps(result),flush=True)
            if run.returncode != expected: break
        if results and not results[-1]['passed']: break
finally:
    cleanup = remote('rm -rf -- '+shlex.quote(directory),check=False)
output = dict(scope=__doc__,firmware_sha256=sha,tests=results,
              temporary_remote_cleanup_returncode=cleanup.returncode,
              sources={p:hashlib.sha256((root/p).read_bytes()).hexdigest() for p in source_paths})
(root/'analysis/pcm-pool-live/native-store-allocation-tests.json').write_text(json.dumps(output,indent=2)+'\n')
assert len(results) == 10 and all(r['passed'] for r in results)
assert cleanup.returncode == 0
