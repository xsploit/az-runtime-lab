"""Original host mixer state driven by selected BiteDJ XML bindings.
Accepts complete MIDI messages, not a raw byte stream. No native UI or device I/O.
"""
import re
import xml.etree.ElementTree as ET
class MixerState:
 def __init__(self,xml):
  self.bindings={};self.parts={};self.held=set()
  self.gains=[1.]*4;self.assign=[0]*4;self.cue=1
  self.cross=.5;self.master=.25;self.phones=.5;self.blend=0.
  for c in ET.parse(xml).findall('.//controls/control'):
   key=c.findtext('key');group=c.findtext('group','')
   match=re.fullmatch(r'\[Channel([1-4])\]',group)
   if key in ('volume','pfl') and match:deck=int(match[1])-1
   elif key in ('crossfader','headMix') and group=='[Master]':deck=None
   else:continue
   opts=c.find('options');mode='button'
   if opts is not None:
    if opts.find('fourteen-bit-msb') is not None:mode='msb'
    elif opts.find('fourteen-bit-lsb') is not None:mode='lsb'
   if key!='pfl' and mode=='button':raise ValueError('Expected a 14-bit analog binding')
   address=(int(c.findtext('status'),0),int(c.findtext('midino'),0))
   binding=(key,deck,mode)
   if address in self.bindings and self.bindings[address]!=binding:raise ValueError('Conflicting MIDI binding')
   self.bindings[address]=binding
 def message(self,status,control,value):
  if not 0x80<=status<=0xef or not 0<=control<128 or not 0<=value<128:raise ValueError('Invalid channel MIDI message')
  if status&0xf0==0x80:status+=0x10;value=0
  address=(status,control)
  if address not in self.bindings:return False
  key,deck,mode=self.bindings[address]
  if mode=='button':
   if not value:self.held.discard(address);return False
   if address in self.held:return False
   self.held.add(address);self.cue^=1<<deck;return True
  pair=self.parts.setdefault((key,deck),{})
  pair[mode]=value
  # Avoid a fabricated low byte before both components have arrived.
  if 'msb' not in pair or 'lsb' not in pair:return False
  v=((pair['msb']<<7)|pair['lsb'])/16383
  if key=='volume':self.gains[deck]=v
  elif key=='crossfader':self.cross=v
  else:self.blend=v
  return True
 def native_routing(self,packet):
  """Merge inspect_tx output into this single owner; returns routing change.
  Invalid/unknown assignment snapshots are rejected atomically. Headphone mode
  and Link Volume are deliberately not gain controls in the current M1 graph.
  """
  if not isinstance(packet,dict) or packet.get('direction')!='tx' or packet.get('length_valid') is not True or packet.get('checksum_valid') is not True:return False
  routing=packet.get('routing_settings')
  if not isinstance(routing,dict):return False
  names=routing.get('channel_assign')
  if not isinstance(names,list) or len(names)!=4 or any(not isinstance(n,str) or n not in ('a','b','thru') for n in names):return False
  assign=[{'a':-1,'b':1,'thru':0}[n] for n in names]
  if assign==self.assign:return False
  self.assign=assign
  return True
 def snapshot(self,ramp=441):
  if not isinstance(ramp,int) or not 0<=ramp<=441000:raise ValueError('Invalid ramp')
  return ' '.join(map(str,['M1',ramp,*self.gains,*self.assign,self.cue,self.cross,self.master,self.phones,self.blend]))
