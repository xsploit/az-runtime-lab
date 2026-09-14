"""Private AZ grid-hook A/B/A; explicit PID and already settled transport.

Writes only the exported experiment switch, through GDB while stopped. Checks
the executable, session identity, hooks, and veneer targets before each write.
Restores the initial switch in finally; SIGKILL/host loss cannot guarantee this.
Does not operate playback, controller counters, or firmware files.
"""
import argparse, hashlib, json, os, signal, struct, subprocess, time
from pathlib import Path

p=argparse.ArgumentParser()
p.add_argument('pid',type=int)
p.add_argument('--players',type=Path,required=True)
p.add_argument('--output',type=Path,required=True)
p.add_argument('--motion',action='store_true')
a=p.parse_args(); a.output.mkdir(parents=True,exist_ok=True)
proc=Path(f'/proc/{a.pid}')
expected_sha='137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
assert hashlib.sha256((proc/'exe').read_bytes()).hexdigest()==expected_sha
identity=(proc/'stat').read_text().rsplit(')',1)[1].split()[19]

uid = next(line.split()[1] for line in (proc/'status').read_text().splitlines() if line.startswith('Uid:'))
sockets = list((Path('/run/user')/uid).glob('sway-ipc.*.sock'))
assert len(sockets)==1, 'Cannot uniquely identify the Pi compositor; inspect before accepting this display'
env = dict(os.environ, SWAYSOCK=str(sockets[0]))
outputs = json.loads(subprocess.check_output(['swaymsg','-r','-t','get_outputs'],env=env,text=True))
panel = next(o for o in outputs if o['name']=='DSI-2' and o['active'])
assert panel['scale_filter']=='linear', 'AZ display regression: restore DSI-2 scale_filter linear'
print(json.dumps({'display_filter':panel['scale_filter'],'output':panel['name'],'mode':panel['current_mode']}))

players=json.loads(a.players.read_text())
maps=(proc/'maps').read_text().splitlines()
mapping=next(x for x in maps if x.endswith('/lab-shims/fractional-grid.so') and x.split()[2]=='00000000')
base=int(mapping.split('-')[0],16)
symbols={}
for line in subprocess.check_output(['nm','-D','/home/pompu_5/az-native-lab/shims/fractional-grid.so'],text=True).splitlines():
    parts=line.split()
    if len(parts)==3 and parts[2].startswith('lab_grid_'): symbols[parts[2]]=base+int(parts[0],16)
switch=symbols['lab_grid_enabled']
hooks=[(0x1b97984,'lab_grid_update',True),(0x1b857e8,'lab_grid_draw',True),
       (0x1b85840,'lab_grid_draw',True),(0x23fae18,'lab_grid_gate',False)]

def read(address,length):
    assert (proc/'stat').read_text().rsplit(')',1)[1].split()[19]==identity
    fd=os.open(proc/'mem',os.O_RDONLY)
    try: return os.pread(fd,length,address)
    finally: os.close(fd)

guard=[]
for address,name,call in hooks:
    data=read(address,4); word=int.from_bytes(data,'little')
    assert word>>26==(0b100101 if call else 0b000101)
    imm=word&0x3ffffff
    if imm&(1<<25): imm-=1<<26
    veneer=address+4*imm
    v=read(veneer,16)
    assert v[:8]==struct.pack('<II',0x58000050,0xd61f0200)
    assert int.from_bytes(v[8:],'little')==symbols[name]
    guard.extend([(address,data.hex()),(veneer,v.hex())])

def snapshot():
    return {'time':time.monotonic(),
            'positions':[int.from_bytes(read(int(x['source'],16)+0xe8,8),'little',signed=True) for x in players[:2]],
            'enabled':int.from_bytes(read(switch,4),'little'),
            'counters':{n:int.from_bytes(read(symbols[n],8),'little') for n in ['lab_grid_updates','lab_grid_draws','lab_grid_fallbacks']}}


print(json.dumps(snapshot(),indent=2))

for lib,prefix,names in [('ximage-present.so','lab_present_',['enabled','uploads','fallbacks'])]:
 mapping=next(x for x in maps if x.endswith('/lab-shims/'+lib) and x.split()[2]=='00000000');base=int(mapping.split('-')[0],16)
 for line in subprocess.check_output(['nm','-D','/home/pompu_5/az-native-lab/shims/'+lib],text=True).splitlines():
  t=line.split()
  if len(t)==3 and t[2] in [prefix+n for n in names]: print(t[2],int.from_bytes(read(base+int(t[0],16),4 if t[2].endswith('enabled') else 8),'little'))
print('native_patches',[(hex(a),read(a,4).hex()) for a in [0x1e262e8,0x212fb94,0x212f344,0x212f974,0x212f9ac,0x212fc1c,0x212fc44,0x212f358]])
