"""Mount a persistent PIONEER metadata overlay; song reads stay on original USB.
Run as the desktop user. Requires fuse-overlayfs; does not edit the USB or fstab.

With --library-stage, the staged legacy Device Library directory becomes the
upper-priority read-only lower layer, so the adapted exportLibrary.db is visible
while the original USBANLZ/Artwork/Contents trees and the writable analysis
cache keep working. The stage itself is never written.
"""
import argparse,json,subprocess
from pathlib import Path

def prepare(usb,cache,stage=None):
 usb=usb.resolve(strict=True);cache=cache.resolve();lower=usb/'PIONEER'
 if stage is not None:
  stage=stage.resolve(strict=True)
  if not stage.is_dir():raise ValueError('Library stage must be a staged PIONEER directory')
  if stage==lower or stage.is_relative_to(usb):raise ValueError('Use a separate staged PIONEER directory, not the original USB')
  if not (stage/'rekordbox/exportLibrary.db').is_file():raise ValueError('Library stage needs rekordbox/exportLibrary.db; build it with library/stage_from_usb.py and encrypt it')
 paths=(usb,cache) if stage is None else (usb,cache,stage)
 if any(char in str(path) for path in paths for char in (',',':','\\','\n')):raise ValueError('Overlay paths cannot contain commas, colons, backslashes or newlines; use a simpler mount/cache path')
 if not lower.is_dir():raise ValueError('USB has no PIONEER directory')
 if cache.is_relative_to(usb):raise ValueError('Cache must live off the USB')
 uuid=subprocess.check_output(['findmnt','-n','-o','UUID','--target',str(usb)],text=True).strip()
 if not uuid:raise ValueError('USB filesystem UUID unavailable; cannot safely identify cache')
 cache.mkdir(parents=True,exist_ok=True);identity=cache/'identity.json'
 expected={'usb_uuid':uuid,'scope':'PIONEER'}
 if stage is not None:expected['library_stage']=str(stage)
 if identity.exists() and json.loads(identity.read_text())!=expected:raise ValueError('This cache was built for a different USB or library stage; point "cache" at its own directory instead of mixing them')
 if not identity.exists():identity.write_text(json.dumps(expected)+'\n')
 for name in ('upper','work','merged'):(cache/name).mkdir(exist_ok=True)
 merged=cache/'merged'
 if subprocess.run(['mountpoint','-q',str(merged)]).returncode:
  lowerdir=str(lower) if stage is None else f'{stage}:{lower}'
  subprocess.run(['fuse-overlayfs','-o',f'lowerdir={lowerdir},upperdir={cache}/upper,workdir={cache}/work',str(merged)],check=True)
 fs=subprocess.check_output(['findmnt','-n','-o','FSTYPE','--target',str(merged)],text=True).strip()
 if fs!='fuse.fuse-overlayfs':raise ValueError('Unexpected filesystem at cache mount')
 return merged
if __name__=='__main__':
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('usb',type=Path);p.add_argument('cache',type=Path);p.add_argument('--library-stage',type=Path,help='staged legacy Device Library PIONEER directory')
 a=p.parse_args()
 print(prepare(a.usb,a.cache,a.library_stage))
