"""BiteDJ FLX6 EQ MIDI bindings -> native AZ 10-bit RX knob fields.

Keep high10 bits of the14-bit input (0..16383 ->0..1023). This is explicit
transport quantization, not a claim of identical BiteDJ/native EQ response.
Both MIDI halves must have been seen in this session before any update.
"""
import re
import xml.etree.ElementTree as ET

class EqMidi:
 def __init__(self,xml):
  self.bindings={};self.parts={};pairs={}
  for c in ET.parse(xml).findall('.//controls/control'):
   m=re.fullmatch(r'\[EqualizerRack1_\[Channel([1-4])\]_Effect1\]',c.findtext('group',''))
   key=c.findtext('key')
   if not m or key not in ('parameter1','parameter2','parameter3'):continue
   channel=int(m[1])-1;lane={'parameter3':1,'parameter2':2,'parameter1':3}[key]
   opts=c.find('options');modes=[mode for mode in ('msb','lsb') if opts is not None and opts.find('fourteen-bit-'+mode) is not None]
   if len(modes)!=1:raise ValueError('Expected one14-bit EQ option')
   addr=(int(c.findtext('status'),0),int(c.findtext('midino'),0))
   if not 0xb0<=addr[0]<=0xbf or not 0<=addr[1]<128:raise ValueError('Expected channel CC binding')
   binding=(channel,lane,modes[0])
   if addr in self.bindings and self.bindings[addr]!=binding:raise ValueError('Conflicting EQ binding')
   self.bindings[addr]=binding;pairs.setdefault((channel,lane),set()).add(modes[0])
  if len(pairs)!=12 or any(x!={'msb','lsb'} for x in pairs.values()):raise ValueError('Complete four-channel EQ mapping required')

 def update(self,frame,status,control,value):
  if len(frame)!=128:raise ValueError('Expected complete RX frame')
  if not 0x80<=status<=0xef or not 0<=control<128 or not 0<=value<128:raise ValueError('Invalid MIDI channel message')
  binding=self.bindings.get((status,control))
  if binding is None:return False
  channel,lane,mode=binding;pair=self.parts.setdefault((channel,lane),{});pair[mode]=value
  if 'msb' not in pair or 'lsb' not in pair:return False
  raw=((pair['msb']<<7)|pair['lsb'])>>4
  high=36+5*channel+lane;low=40+5*channel;shift=6-2*lane
  previous=(frame[high]<<2)|((frame[low]>>shift)&3)
  if raw==previous:return False
  frame[high]=raw>>2;frame[low]=(frame[low]&~(3<<shift))|((raw&3)<<shift)
  return True
