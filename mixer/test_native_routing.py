"""Native TX -> shared FLX6 state -> actual mixer channel isolation."""
from pathlib import Path
import ctypes as C,itertools,subprocess,sys,tempfile
b=Path(__file__).resolve().parent
sys.path.insert(0,str(b.parent/'analysis'))
from az_mixer_packet import inspect_tx,crc16
from flx6_state import MixerState
s=MixerState(b.parents[1]/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml')
s.message(0xb0,0x13,32);s.message(0xb0,0x33,0)
s.message(0x92,0x54,127)
s.cross=0;s.blend=.25
preserved=(s.gains.copy(),s.cue,s.cross,s.master,s.phones,s.blend)
def packet(values):
 f=bytearray(128);f[6]=sum(v<<(6-2*g) for g,v in enumerate(values))
 f[104:106]=crc16(f[:104]).to_bytes(2,'little');return f
for raw in itertools.product(range(3),repeat=4):
 s.native_routing(inspect_tx(packet(raw)))
 assert s.assign==[{0:0,1:-1,2:1}[v] for v in raw]
 assert (s.gains,s.cue,s.cross,s.master,s.phones,s.blend)==preserved
 snap=s.snapshot();assert not s.native_routing(inspect_tx(packet(raw)))
 bad=packet(raw);bad[104]^=1
 assert not s.native_routing(inspect_tx(bad));assert s.snapshot()==snap
 for g in range(4):
  unknown=list(raw);unknown[g]=3
  assert not s.native_routing(inspect_tx(packet(unknown)));assert s.snapshot()==snap
s.native_routing(inspect_tx(packet([1,2,0,0])))
# Existing C mixer must send deck1 to A, deck2 to B and leave deck3 thru.
class Mix(C.Structure):
 _fields_=[('gain',C.c_float*4),('assign',C.c_int*4),('cue',C.c_uint),('cross',C.c_float),('master',C.c_float),('phones',C.c_float),('blend',C.c_float)]
with tempfile.TemporaryDirectory() as t:
 lib=Path(t)/'mix.so';subprocess.run(['cc','-shared','-fPIC','-O2',str(b/'deck_mix.c'),'-lm','-o',str(lib)],check=True)
 dll=C.CDLL(str(lib));dll.lab_mix.argtypes=[C.POINTER(Mix),C.POINTER(C.c_float),C.POINTER(C.c_float),C.c_size_t]
 for cross in [0,1]:
  m=Mix((C.c_float*4)(*s.gains),(C.c_int*4)(*s.assign),s.cue,cross,s.master,s.phones,s.blend)
  for deck in range(4):
   x=(C.c_float*10)();x[2*deck]=x[2*deck+1]=.25;y=(C.c_float*4)();dll.lab_mix(C.byref(m),x,y,1)
   audible=not (deck==0 and cross==1 or deck==1 and cross==0)
   expected=.25*s.gains[deck]*s.master if audible else 0
   assert abs(y[0]-expected)<1e-8,(cross,deck,y[0],expected)
print('PASS:81 assignment snapshots, corrupt/unknown atomic rejection, MIDI-state preservation, native A/B/THRU to C mixer isolation')
