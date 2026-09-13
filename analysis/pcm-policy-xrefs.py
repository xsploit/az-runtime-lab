"""Find diagnostic strings and candidate ADRP/ADD chains; register clobbers not modeled, validate manually."""
import struct,json
from pathlib import Path
root=Path(__file__).resolve().parents[1];d=(root/'xdjaz/rootfs/home/root/pdj/EP147').read_bytes();o=struct.unpack_from('<Q',d,32)[0];sz,n=struct.unpack_from('<HH',d,54);segments=[struct.unpack_from('<IIQQQQQQ',d,o+i*sz) for i in range(n)]
needles=[b'ParallelBufferingUnitList<',b'BufferCleaner<',b'Pool<ObjectT>::push',b'BufferingClientList::regClient',b'PageBuffer<StaticConfig>::prepareTrackFor',b'Page<StaticConfig>::write',b'LockedRange<StaticConfig>::',b'LockedRangeList<StaticConfig>::',b'getLicenseToLockRange(int)']
targets={}
for needle in needles:
 pos=0
 while True:
  pos=d.find(needle,pos)
  if pos<0:break
  lo=d.rfind(b'\0',0,pos)+1;hi=d.find(b'\0',pos)
  for s in segments:
   if s[0]==1 and s[2]<=lo< s[2]+s[5]:
    targets[s[3]+lo-s[2]]=d[lo:hi].decode('utf8',errors='replace');break
  pos+=len(needle)
pages={t&~4095 for t in targets};out=[]
for s in segments:
 if s[0]!=1 or not s[1]&1:continue
 for i in range(0,s[5]-96,4):
  w=struct.unpack_from('<I',d,s[2]+i)[0]
  if w&0x9f000000!=0x90000000:continue
  imm=((w>>29)&3)|(((w>>5)&0x7ffff)<<2)
  if imm&0x100000:imm-=0x200000
  page=((s[3]+i)&~4095)+(imm<<12);reg=w&31
  if not any(0<=t-page<16384 for t in targets):continue
  values={reg:page}
  for j in range(1,25):
   x=struct.unpack_from('<I',d,s[2]+i+j*4)[0]
   if x&0xff000000==0x91000000 and ((x>>5)&31) in values:
    dest=values[(x>>5)&31]+(((x>>10)&4095)<<(12 if x&(1<<22) else 0))
    values[x&31]=dest
    if dest in targets:out.append(dict(adrp=hex(s[3]+i),add=hex(s[3]+i+j*4),target=hex(dest),label=targets[dest]))
result=dict(targets={hex(k):v for k,v in targets.items()},candidates=out,scope=__doc__)
(root/'analysis/pcm-pool-live/policy-diagnostic-xrefs.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
