"""Mount a persistent PIONEER metadata overlay; song reads stay on original USB.
Run as the desktop user. Requires fuse-overlayfs; does not edit the USB or fstab.
"""
import argparse,json,subprocess
from pathlib import Path

def prepare(usb,cache):
 usb=usb.resolve(strict=True);cache=cache.resolve();lower=usb/'PIONEER'
 if any(char in str(path) for path in (usb,cache) for char in (',',':','\\','\n')):raise ValueError('Overlay paths cannot contain commas, colons, backslashes or newlines; use a simpler mount/cache path')
 if not lower.is_dir():raise ValueError('USB has no PIONEER directory')
 if cache.is_relative_to(usb):raise ValueError('Cache must live off the USB')
 uuid=subprocess.check_output(['findmnt','-n','-o','UUID','--target',str(usb)],text=True).strip()
 if not uuid:raise ValueError('USB filesystem UUID unavailable; cannot safely identify cache')
 cache.mkdir(parents=True,exist_ok=True);identity=cache/'identity.json'
 expected={'usb_uuid':uuid,'scope':'PIONEER'}
 if identity.exists() and json.loads(identity.read_text())!=expected:raise ValueError('Cache belongs to a different USB')
 if not identity.exists():identity.write_text(json.dumps(expected)+'\n')
 for name in ('upper','work','merged'):(cache/name).mkdir(exist_ok=True)
 merged=cache/'merged'
 if subprocess.run(['mountpoint','-q',str(merged)]).returncode:
  subprocess.run(['fuse-overlayfs','-o',f'lowerdir={lower},upperdir={cache}/upper,workdir={cache}/work',str(merged)],check=True)
 fs=subprocess.check_output(['findmnt','-n','-o','FSTYPE','--target',str(merged)],text=True).strip()
 if fs!='fuse.fuse-overlayfs':raise ValueError('Unexpected filesystem at cache mount')
 return merged
if __name__=='__main__':
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('usb',type=Path);p.add_argument('cache',type=Path);a=p.parse_args()
 print(prepare(a.usb,a.cache))
