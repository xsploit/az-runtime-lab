"""Opt-in private AZ 1.30 experiment: temporary executable with eight changes.

The source firmware is never modified. The returned TemporaryDirectory must
remain alive until the player exits. Only the verified pinned image is accepted.
"""
import hashlib
import json
from pathlib import Path
import struct
import tempfile

SOURCE_SHA256 = '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
PATCHES = (
    (0x1e262e8, 0x528003c1, 0x52800781, 'LocalPlayer startup refresh request 30 to 60 Hz'),
    (0x212fb94, 0x7100041f, 0x7100001f, 'Repaint tick threshold'),
    (0x212f344, 0x7100041f, 0x7100001f, 'Upload tick threshold'),
    (0x212f974, 0x11000673, 0x52800033, 'Repaint reservation one tick'),
    (0x212f9ac, 0x11000673, 0x52800033, 'Alternate repaint reservation one tick'),
    (0x212fc1c, 0x1e632800, 0xd503201f, 'Remove extra post-callback period'),
    (0x212fc44, 0x52800022, 0x52800002, 'Repaint fallback zero ticks'),
    (0x212f358, 0x52800022, 0x52800002, 'Upload fallback zero ticks'),
)

def prepare(source, file_cache_mib=None):
    """Return (private temporary-directory owner, executable path, manifest)."""
    source = Path(source)
    data = bytearray(source.read_bytes())
    if hashlib.sha256(data).hexdigest() != SOURCE_SHA256:
        raise ValueError('Smooth-scroll experiment requires the verified AZ 1.30 EP147 image')
    if data[:6] != b'\x7fELF\x02\x01' or struct.unpack_from('<H', data, 18)[0] != 183:
        raise ValueError('Expected little-endian AArch64 ELF64')
    phoff = struct.unpack_from('<Q', data, 32)[0]
    phsize, phnum = struct.unpack_from('<HH', data, 54)
    segments = [struct.unpack_from('<IIQQQQQQ', data, phoff + i * phsize) for i in range(phnum)]
    manifest = {'source_sha256': SOURCE_SHA256, 'patches': []}
    if file_cache_mib is not None and (type(file_cache_mib) is not int or file_cache_mib not in (32,64,100)):
        raise ValueError('File-cache experiment supports only32,64,100 MiB per cache')
    for va, before, after, reason in PATCHES:
        matches = [s for s in segments if s[0] == 1 and s[1] & 1 and s[3] <= va and va + 4 <= s[3] + s[5]]
        if len(matches) != 1:
            raise ValueError(f'Instruction {va:#x} is not uniquely mapped executable file content')
        seg = matches[0]
        offset = seg[2] + va - seg[3]
        if struct.unpack_from('<I', data, offset)[0] != before:
            raise ValueError(f'Unexpected instruction at {va:#x}')
        struct.pack_into('<I', data, offset, after)
        manifest['patches'].append({'va': hex(va), 'offset': offset, 'before': hex(before), 'after': hex(after), 'reason': reason})
    if file_cache_mib is not None:
        # Both confirmed loads construct FileCacheConfig. Preserve all other
        # fields (including five caches); never truncate an allocation alone.
        va=0x25fa6e0
        matches=[s for s in segments if s[0]==1 and s[3]<=va and va+16<=s[3]+s[5]]
        if len(matches)!=1:raise ValueError('Cache configuration is not uniquely mapped')
        segment=matches[0];offset=segment[2]+va-segment[3]
        if struct.unpack_from('<4I',data,offset)!=(100,2048,5,1024):
            raise ValueError('Unexpected FileCacheConfig defaults')
        struct.pack_into('<I',data,offset,file_cache_mib)
        manifest['file_cache_mib']=file_cache_mib
        manifest['patches'].append({'va':hex(va),'offset':offset,'before':100,'after':file_cache_mib,
            'reason':'Raw-file cache configured capacity in MiB; count and block arithmetic unchanged'})
    manifest['overlay_sha256'] = hashlib.sha256(data).hexdigest()
    owner = tempfile.TemporaryDirectory(prefix='az-scroll-')
    try:
        exe = Path(owner.name) / 'EP147'
        exe.write_bytes(data)
        exe.chmod(0o500)
        (Path(owner.name) / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
        return owner, exe, manifest
    except BaseException:
        owner.cleanup()
        raise
