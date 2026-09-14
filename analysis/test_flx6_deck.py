from pathlib import Path
from flx6_deck import DeckControls
from az_mixer_packet import crc16
xml=Path(__file__).resolve().parents[2]/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml'
t=[0.];d=DeckControls(xml,clock=lambda:t[0])
def check(result):
 deck,f=result;assert len(f)==152 and crc16(f[:38])==int.from_bytes(f[38:40],'little');return f
assert d.message(0xb0,0x20,0) is None
assert d.message(0xb0,0,64) is None
f=check(d.message(0xb0,0x20,0));assert int.from_bytes(f[16:18],'little')==512
f=check(d.message(0x90,0x36,127));assert f[9]&2
check(d.message(0x90,0x67,127));f=check(d.message(0x80,0x36,127));assert f[9]&2
f=check(d.message(0xb0,0x21,74));assert int.from_bytes(f[10:12],'little')==8 and f[9]&4
f=check(d.message(0x90,0x67,0));assert not f[9]&2 and int.from_bytes(f[10:12],'little')==8
t[0]=.06;f=check(d.idle()[0]);assert f[12:14]==b'\xff\xff'
t[0]=.07;f=check(d.message(0xb0,0x21,44));assert int.from_bytes(f[10:12],'little')==65528 and not f[9]&4
assert d.frames[1][10:12]==b'\x00\x00'
for result in d.release_all():check(result)
assert all(not f[9]&2 and f[12:14]==b'\xff\xff' for f in d.frames)
try:d.message(0xb2,0x21,65)
except NotImplementedError:pass
else:raise AssertionError('Deck3 should reject')
print('PASS: tempo pairing/center, overlapping touch/release, direction, counter wrap, idle stop, isolation, CRC, unsupported layer')
