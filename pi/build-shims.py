"""Build the native runtime shims using a caller-supplied compatible ARM64 CC."""
from pathlib import Path
import argparse, hashlib, json, os, re, subprocess, tempfile

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--cc', default=os.environ.get('AZ_CC'), required=not os.environ.get('AZ_CC'),
                   help='AArch64 compiler with a guest-compatible glibc sysroot')
    p.add_argument('--x11-headers',type=Path,default=Path('/usr/include/X11'))
    a=p.parse_args();base=Path(__file__).resolve().parents[1];shims=base/'shims'
    if not (a.x11_headers/'Xlib.h').is_file():p.error('Install X11 development headers or set --x11-headers')
    machine=subprocess.check_output([a.cc,'-dumpmachine'],text=True).strip()
    if 'aarch64' not in machine:p.error('The compiler must target AArch64')
    targets={'offline-mixer-fixture.so':['offline-mixer-fixture.c'],
             'ximage-fast24.so':['ximage-fast24.c'],'ximage-present.so':['ximage-present.c'],
             'fractional-grid.so':['fractional-grid.c'],
             'fractional-grid-span.so':['fractional-grid-span.c','grid_span.c'],
             'sem-owner.so':['sem-owner.c']}
    with tempfile.TemporaryDirectory(prefix='az-native-build-') as directory:
        temp=Path(directory);(temp/'X11').symlink_to(a.x11_headers.resolve(),target_is_directory=True)
        for output,sources in targets.items():
            subprocess.run([a.cc,'-std=gnu11','-O2','-shared','-fPIC','-ffp-contract=off',
                            '-I'+str(temp),*[str(shims/s) for s in sources],'-ldl','-lpthread','-lm',
                            '-o',str(temp/output)],check=True)
            versions=subprocess.check_output(['readelf','--version-info',str(temp/output)],text=True)
            required={tuple(map(int,v.split('.'))) for v in re.findall(r'GLIBC_([0-9.]+)',versions)}
            if any(v>(2,29) for v in required):
                raise RuntimeError(f'{output} requires newer glibc than AZ; use an older compatible compiler/sysroot. Requirements: {sorted(required)}')
        # Publish only after every library built and passed the version check.
        for output in targets:
            pending=shims/(output+'.new')
            pending.write_bytes((temp/output).read_bytes());pending.replace(shims/output)
    manifest={'target':machine,'compiler':subprocess.check_output([a.cc,'--version'],text=True).splitlines()[0],
              'sha256':{name:hashlib.sha256((shims/name).read_bytes()).hexdigest() for name in targets}}
    (shims/'native-build.json').write_text(json.dumps(manifest,indent=2)+'\n')
    print(json.dumps(manifest,indent=2))

if __name__=='__main__':main()
