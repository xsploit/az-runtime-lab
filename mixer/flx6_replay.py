"""Replay complete MIDI messages from a text file into the private host mixer.
Each line contains three hex bytes: B0 13 7F. Does not open a MIDI device.
"""
import argparse,socket
from pathlib import Path
from flx6_state import MixerState
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('messages',type=Path);p.add_argument('--mapping',type=Path,required=True)
p.add_argument('--socket',help='Omit to print snapshots without sending')
a=p.parse_args();state=MixerState(a.mapping)
with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sock:
 for line in a.messages.read_text().splitlines():
  line=line.split('#',1)[0].strip()
  if not line:continue
  parts=[int(v,16) for v in line.split()]
  if len(parts)!=3:raise ValueError('Expected three hex bytes per line')
  if state.message(*parts):
   msg=state.snapshot();print(msg)
   if a.socket:sock.sendto(msg.encode(),a.socket)
