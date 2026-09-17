"""Private AZ grid-hook A/B/A; explicit PID and already settled transport.

Writes only the exported experiment switch, through GDB while stopped. Checks
the executable, session identity, hooks, and veneer targets before each write.
Restores the initial switch in finally; SIGKILL/host loss cannot guarantee this.
Does not operate playback, controller counters, or firmware files.
"""

# Locate shared helpers from this checkout, independent of the caller's cwd.
import sys as _az_sys
from pathlib import Path as _AzPath
_az_sys.path.insert(0, str(_AzPath(__file__).resolve().parents[1]))
from az_paths import lab_path

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
players=json.loads(a.players.read_text())
maps=(proc/'maps').read_text().splitlines()
mapping=next(x for x in maps if x.endswith('/lab-shims/fractional-grid.so') and x.split()[2]=='00000000')
base=int(mapping.split('-')[0],16)
symbols={}
for line in subprocess.check_output(['nm','-D',str(lab_path('shims/fractional-grid.so'))],text=True).splitlines():
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

def set_enabled(value,label):
    # Repeat guards inside the debugger, after all threads have stopped.
    code=f'''import gdb
from pathlib import Path
i=gdb.selected_inferior()
assert i.pid=={a.pid}
assert Path('/proc/{a.pid}/stat').read_text().rsplit(')',1)[1].split()[19]=={identity!r}
assert {mapping!r} in Path('/proc/{a.pid}/maps').read_text().splitlines()
for address,data in {guard!r}:
    assert bytes(i.read_memory(address,len(bytes.fromhex(data))))==bytes.fromhex(data)
assert int.from_bytes(bytes(i.read_memory({switch},4)),'little') in (0,1)
i.write_memory({switch},({value}).to_bytes(4,'little'))
print('GRID_SWITCH_VERIFIED', {value})'''
    script=a.output/f'{label}.gdb'
    script.write_text('set pagination off\nset confirm off\nset auto-load off\nset print thread-events off\n'+
                      f'attach {a.pid}\npython\n'+code+'\nend\ndetach\nquit\n')
    r=subprocess.run(['gdb','-q','-nx','-batch','-x',str(script)],capture_output=True,text=True,timeout=15)
    (a.output/f'{label}.gdb.log').write_text(r.stdout+r.stderr)
    r.check_returncode()
    assert f'GRID_SWITCH_VERIFIED {value}' in r.stdout
    assert int.from_bytes(read(switch,4),'little')==value
    time.sleep(.3)

def cpu():
    f=(proc/'stat').read_text().rsplit(')',1)[1].split()
    return int(f[11])+int(f[12])

def capture(label):
    subprocess.run(['ffmpeg','-v','error','-y','-f','x11grab','-video_size','1280x800','-i',':0',
                    '-frames:v','1',str(a.output/f'{label}.png')],check=True,timeout=5)

results=[]
initial=snapshot()['enabled']; assert initial in (0,1)
def interrupted(sig,frame): raise InterruptedError(sig)
for sig in [signal.SIGINT,signal.SIGTERM]: signal.signal(sig,interrupted)
try:
    for label,value in [('original',0),('candidate',1),('restored',0)]:
        set_enabled(value,label)
        before=snapshot(); time.sleep(.5); settled=snapshot()
        if a.motion: assert settled['positions'][0]>before['positions'][0], 'Deck 1 must already be playing'
        else: assert settled['positions']==before['positions'], 'Both decks must already be paused'
        item={'phase':label,'before':before}
        if a.motion:
            start=time.monotonic(); c=cpu(); time.sleep(4)
            item['cpu_without_capture']=100*(cpu()-c)/os.sysconf('SC_CLK_TCK')/(time.monotonic()-start)
            c=cpu(); start=time.monotonic()
            subprocess.run(['ffmpeg','-v','error','-y','-f','x11grab','-framerate','60','-video_size','640x190',
                            '-i',':0+420,85','-t','6','-c:v','libx264rgb','-threads','1','-preset','ultrafast','-crf','0',
                            str(a.output/f'{label}.mkv')],check=True,timeout=12)
            item['cpu_with_capture']=100*(cpu()-c)/os.sysconf('SC_CLK_TCK')/(time.monotonic()-start)
        capture(label); item['after']=snapshot()
        if not a.motion: assert item['after']['positions']==before['positions']
        else:
            duration=item['after']['time']-before['time']
            rate=(item['after']['positions'][0]-before['positions'][0])/duration
            item['deck1_source_units_per_second']=rate
            # This fixture is 44.1 kHz at zero pitch; reject end/seek/pause runs.
            item['transport_valid']=42000 < rate < 46000
        results.append(item)
        (a.output/'results.json').write_text(json.dumps({'pid':a.pid,'identity':identity,'results':results},indent=2)+'\n')
        print(json.dumps(item),flush=True)
        if a.motion: assert item['transport_valid'], 'Transport changed or reached track end; reject this comparison'
finally:
    set_enabled(initial,'final-switch-restore')
    print(json.dumps({'final':snapshot()}),flush=True)
