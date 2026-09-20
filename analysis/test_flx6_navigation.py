from pathlib import Path
from flx6_navigation import Navigation
from az_mixer_packet import crc16
xml=Path(__file__).resolve().parents[2]/'rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml'
base=bytearray(128);base[94]=128;base[10]=77
n=Navigation(xml,base)
assert n.packet()[34:36]==b'\0\0'
n.message(0xb6,0x40,1)
p=n.message(0x96,0x41,127);assert p[31]&1 and p[34:36]==b'\1\0'
p=n.message(0xb6,0x40,1);assert p[31]&1 and p[34:36]==b'\2\0'
p=n.message(0x86,0x41,64);assert not p[31]&1
for deck in range(4):
 p=n.message(0x96,0x46+deck,127);assert p[33]==1<<(3-deck)
 assert p[34:36]==b'\2\0'
 p=n.message(0x96,0x46+deck,0);assert p[33]==0
try:n.message(0x96,0x7a,127)
except ValueError:pass
else:raise AssertionError('Unknown UI state accepted')
assert n.message(0x96,0x7a,127,browser_visible=True)[32]&64
assert not n.message(0x96,0x7a,0)[32]&64
p=n.message(0x96,0x7a,127,browser_visible=False);assert p[32]&64
p=n.message(0x96,0x7a,0);assert not p[32]&64
p=n.message(0x96,0x65,127,browser_visible=True);assert p[33]&128
p=n.message(0x96,0x65,0);assert not p[33]&128
p=n.message(0x96,0x65,127,browser_visible=False);assert p[32]&64
p=n.message(0x96,0x65,0);assert not p[32]&64
assert p[94]==128 and p[10]==77 and p[96:98]==crc16(p[:96]).to_bytes(2,'little')
print('PASS: XML navigation, held press plus turn, all loads preserve counter, unrelated fields, guarded View/Back, releases')

p=n.message(0x96,0x7a,127,browser_visible=False)
p=n.message(0x96,0x65,127,browser_visible=False)
p=n.message(0x96,0x7a,0);assert p[32]&64
p=n.message(0x96,0x65,0);assert not p[32]&64
print('PASS: overlapping logical bindings retain native button until both release')
