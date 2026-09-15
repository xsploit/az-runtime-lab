"""Verified opt-ins for the native AZ launcher; no firmware files are changed."""
import hashlib
import json

AZ_SHA256 = '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'

def configure(args, base, root, model, env):
    grid = env.get('LAB_GRID_SPAN_CANDIDATE')
    sem = env.get('LAB_SEM_OWNER_FIX')
    if not grid and not sem:
        return args
    if model != 'xdjaz' or any(v and v != '1' for v in (grid, sem)):
        raise ValueError('Native optimization flags require value 1 and XDJ-AZ')
    if env.get('OFFLINE_MIDI') != '1' or env.get('LAB_AZ_SMOOTH_SCROLL') != '1':
        raise ValueError('Native optimizations require the pinned offline smooth-scroll setup')
    if grid and env.get('LAB_AZ_FRACTIONAL_GRID') != '1':
        raise ValueError('Grid optimization retains fractional grid alignment')
    if hashlib.sha256((root/'home/root/pdj/EP147').read_bytes()).hexdigest() != AZ_SHA256:
        raise ValueError('Unsupported AZ executable; these addresses are version-specific')
    manifest = json.loads((base/'shims/native-build.json').read_text())
    needed = (['fractional-grid-span.so'] if grid else []) + (['sem-owner.so'] if sem else [])
    for name in needed:
        if hashlib.sha256((base/'shims'/name).read_bytes()).hexdigest() != manifest['sha256'].get(name):
            raise ValueError(f'{name} differs from the local build manifest; rebuild')
    args = list(args)
    if grid:
        i=args.index('--chdir')
        args[i:i]=['--ro-bind',str(base/'shims/fractional-grid-span.so'),'/lab-shims/fractional-grid.so']
    if sem:
        if sum(x.startswith('LD_PRELOAD=') for x in args) != 1:
            raise ValueError('Ambiguous native preload list')
        args=[x+':/lab-shims/sem-owner.so' if x.startswith('LD_PRELOAD=') else x for x in args]
    return args
