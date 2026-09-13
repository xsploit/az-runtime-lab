from pathlib import Path
import struct,subprocess
ROOT=Path(__file__).resolve().parents[2]
class ELF:
 def __init__(self,model):
  self.path=ROOT/({'az':'xdjaz/rootfs/home/root/pdj/EP147','cdj':'cdj3000x/rootfs/home/root/pdj/EP145'}[model]);self.d=self.path.read_bytes();d=self.d
  off=struct.unpack_from('<Q',d,32)[0];sz,n=struct.unpack_from('<HH',d,54);self.segs=[s for i in range(n) if (s:=struct.unpack_from('<IIQQQQQQ',d,off+i*sz))[0]==1]
 def offset(self,va):
  s=next(s for s in self.segs if s[3]<=va<s[3]+s[5]);return s[2]+va-s[3]
 def addr(self,o):
  s=next(s for s in self.segs if s[2]<=o<s[2]+s[5]);return s[3]+o-s[2]
 def read(self,va,n):
  o=self.offset(va);return self.d[o:o+n]
 def hits(self,pat):
  start=0;out=[]
  while (o:=self.d.find(pat,start))>=0:
   out.append(self.addr(o));start=o+1
  return out
 def calls(self,target):
  out=[]
  for s in self.segs:
   if not s[1]&1:continue
   for i in range(0,s[5]-3,4):
    w=struct.unpack_from('<I',self.d,s[2]+i)[0]
    if w&0x7c000000!=0x14000000:continue
    imm=w&0x3ffffff
    if imm&0x2000000:imm-=0x4000000
    if s[3]+i+imm*4==target:out.append(s[3]+i)
  return out
 def dis(self,start,end):
  raw=subprocess.check_output(['llvm-objdump','-d','--start-address='+hex(start),'--stop-address='+hex(end),str(self.path)],text=True)
  return '\n'.join(l.split(' <')[0] for l in raw.splitlines() if l.startswith(' '))+'\n'
