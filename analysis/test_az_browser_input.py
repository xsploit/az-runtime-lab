from az_browser_input import BrowserInput
from az_mixer_packet import crc16
base=bytearray(range(128));b=BrowserInput()
for delta,flag in [(0,False),(1,True),(-2,False),(40,True)]:
 old=b.counter;p=b.encode(base,delta,flag)
 assert int.from_bytes(p[34:36],'little',signed=True)==old+delta
 assert p[31]&1==flag and p[31]&254==base[31]&254
 assert p[96:98]==crc16(p[:96]).to_bytes(2,'little')
 for i in set(range(128))-{31,34,35,96,97}:assert p[i]==base[i]
b=BrowserInput(32767)
try:b.encode(base,1)
except ValueError:pass
else:raise AssertionError('Unverified wrap allowed')
assert b.counter==32767
print('PASS: counter accumulation, signed steps, CRC, other fields preserved, wrap rejected')
