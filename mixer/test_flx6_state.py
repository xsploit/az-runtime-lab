from pathlib import Path
from flx6_state import MixerState
xml=Path(__file__).resolve().parents[2]/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml'
s=MixerState(xml)
for deck in range(4):
 assert not s.message(0xb0+deck,0x13,127)
 assert s.message(0xb0+deck,0x33,127)
 assert s.gains[deck]==1
 assert s.message(0xb0+deck,0x13,0)
 assert s.message(0xb0+deck,0x33,0)
 assert s.gains[deck]==0
old=s.cue
assert s.message(0x92,0x54,127) and s.cue==old^4
assert not s.message(0x92,0x54,127) and s.cue==old^4
assert not s.message(0x82,0x54,64) # note-off velocity ignored
assert s.message(0x92,0x54,127) and s.cue==old
assert not s.message(0xb6,0x2c,127) # low-byte-first pair
assert s.message(0xb6,0x0c,127) and s.blend==1
assert not s.message(0xb6,0x1f,0)
assert s.message(0xb6,0x3f,0) and s.cross==0
saved=s.snapshot()
for msg in [(0xb6,0x40,1),(0x96,0x65,127),(0x90,0x0b,127)]:assert not s.message(*msg)
assert s.snapshot()==saved
assert s.gains==[0]*4 and s.cue==1 and s.blend==1
print('PASS: saved XML bindings, four 14-bit faders, cue edges, note-off, blend/cross, unrelated controls preserve state')
