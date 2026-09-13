import struct,unittest
from az_eq_probe import BANDS,REGISTRY,Unavailable,stable_snapshot

class ProbeTests(unittest.TestCase):
 def setUp(self):
  self.memory={}
  def put(a,b):self.memory.update({a+i:v for i,v in enumerate(b)})
  self.put=put;self.q=lambda a,v:put(a,struct.pack('<Q',v))
  self.q(REGISTRY+8,0x10000);put(REGISTRY+24,struct.pack('<i',1));self.q(0x10000,0)
  self.owners=[]
  for i,key in enumerate(base+c for c in range(4) for base in BANDS.values()):
   node=0x20000+i*32;owner=0x30000+i*512;adapter=0x50000+i*32
   previous=struct.unpack('<Q',self.read(0x10000,8))[0]
   self.q(node,key);self.q(node+8,owner+0xc0);self.q(node+16,previous);self.q(0x10000,node)
   self.q(owner,0x2e63990);self.q(owner+0xc0,0x2e639f8);self.q(owner+0xd0,key)
   put(owner+0xd8,struct.pack('<fI',0.5,512));self.q(owner+0xb8,adapter);self.q(adapter,0x99990000)
   self.owners.append(owner)
 def read(self,a,n):return bytes(self.memory[a+i] for i in range(n))
 def test_collision_chain_and_values(self):
  r=stable_snapshot(self.read);self.assertEqual(len(r['controls']),12);self.assertEqual(r['controls'][0]['raw'],512)
 def test_pinned_default_adapter(self):
  for i in range(12):
   a=0x50000+i*32;self.q(a,0x2e63960);self.put(a+12,struct.pack('<If',1023,1.0))
  self.q(0x2e63970,0x21ee490);self.q(0x2e63978,0x21edc30)
  r=stable_snapshot(self.read)
  self.assertTrue(all(c['default_adapter']['raw_denominator']==1023 for c in r['controls']))
  self.q(0x2e63970,0xdeadbeef)
  with self.assertRaises(Unavailable):stable_snapshot(self.read)
 def test_wrong_component_rejected(self):
  self.q(self.owners[0]+0xc0,0xdead0000)
  with self.assertRaises(Unavailable):stable_snapshot(self.read)
 def test_cycle_rejected(self):
  top=0x20000+11*32;self.q(top+16,top)
  with self.assertRaises(Unavailable):stable_snapshot(self.read)
 def test_value_race_rejected(self):
  calls=0
  def read(a,n):
   nonlocal calls
   if a==self.owners[0]+0xd8:
    calls+=1
    if calls==2:self.put(a,struct.pack('<fI',0.6,614))
   return self.read(a,n)
  with self.assertRaises(Unavailable):stable_snapshot(read)
 def test_identity_alias_rejected(self):
  self.q(self.owners[0]+0xd0,1)
  with self.assertRaises(Unavailable):stable_snapshot(self.read)
if __name__=='__main__':unittest.main()
