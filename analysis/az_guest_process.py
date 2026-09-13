"""Find the AZ guest only within a launcher's live descendant tree."""
from pathlib import Path

def find_guest(parent, proc_root=Path('/proc')):
 pending=[parent];seen=set();matches=[]
 while pending:
  pid=pending.pop()
  if pid in seen:continue
  seen.add(pid)
  try:
   for children in (proc_root/str(pid)/'task').glob('*/children'):
    try:pending.extend(map(int,children.read_text().split()))
    except FileNotFoundError:pass
   if pid!=parent:
    cmd=(proc_root/str(pid)/'cmdline').read_bytes().split(b'\0')
    if cmd[0]==b'/qemu' and b'/home/root/pdj/EP147' in cmd:matches.append(pid)
  except FileNotFoundError:continue
 if len(matches)>1:raise RuntimeError('Multiple AZ guests under this launcher')
 return matches[0] if matches else None
