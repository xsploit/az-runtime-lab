"""Saved BiteDJ navigation bindings -> persistent native AZ mixer RX state.
Caller supplies fresh browser visibility for View/Back. No guessed page tracking.
"""
import re
import xml.etree.ElementTree as ET
from az_browser_input import BrowserInput
class Navigation:
 def __init__(self,xml,base=None,*,eq_controls=False):
  self.frame=bytearray(base if base is not None else bytes(128))
  if len(self.frame)!=128:raise ValueError('Expected128-byte RX frame')
  self.frame[0]=1
  self.encoder=BrowserInput(int.from_bytes(self.frame[34:36],'little',signed=True))
  self.eq=None
  if eq_controls:
   from flx6_eq import EqMidi
   self.eq=EqMidi(xml)
  self.bindings={};self.down={}
  for c in ET.parse(xml).findall('.//controls/control'):
   key=c.findtext('key');group=c.findtext('group','');action=None
   if key=='PioneerDDJFLX6.browseRotate':action='rotate'
   elif key=='MoveFocusForward' and group=='[Library]':action='enter'
   elif key=='PioneerDDJFLX6.backPressed':action='back'
   elif group=='[Tab]' and key in ('library','PioneerDDJFLX6.viewPressed'):action='view'
   elif key=='LoadSelectedTrack':
    m=re.fullmatch(r'\[Channel([1-4])\]',group)
    if m:action='load'+m[1]
   if action:self.bindings[(int(c.findtext('status'),0),int(c.findtext('midino'),0))]=action
 def packet(self,delta=0):
  self.frame[:]=self.encoder.encode(self.frame,delta,bool(self.frame[31]&1))
  return bytes(self.frame)
 def message(self,status,control,value,*,browser_visible=None):
  if not 0x80<=status<=0xef or not 0<=control<128 or not 0<=value<128:raise ValueError('Invalid MIDI channel message')
  if status&0xf0==0x80:status+=16;value=0
  if self.eq is not None and self.eq.update(self.frame,status,control,value):return self.packet()
  addr=(status,control);action=self.bindings.get(addr)
  if action is None:return None
  if action=='rotate':
   delta=value if value<64 else value-128
   return self.packet(delta) if delta else None
  if value:
   if addr in self.down:return None
   if action in ('back','view'):
    if type(browser_visible) is not bool:raise ValueError('Fresh browser visibility required for preferred View/Back behavior')
    # View is a real Browse/Waveform toggle, including when Browse is open.
    target=(33,7) if action=='back' and browser_visible else (32,6)
   elif action=='enter':target=(31,0)
   else:target=(33,4-int(action[-1]))
   self.down[addr]=target
   if target is None:return None
   self.frame[target[0]]|=1<<target[1]
  else:
   if addr not in self.down:return None
   target=self.down.pop(addr)
   if target is None:return None
   if target not in self.down.values():self.frame[target[0]]&=~(1<<target[1])
  return self.packet()
