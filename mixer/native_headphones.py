"""AZ native TX headphone mode delivery; no physical gain assumptions.
H1 is versioned separately from the existing M1 routing snapshot. Enable only
when the downstream mixer advertises support. Unknown modes never become stereo.
"""
class NativeHeadphones:
 def __init__(self):
  self.mode=None
 def accept(self,packet):
  if not isinstance(packet,dict) or packet.get('direction')!='tx' or packet.get('length_valid') is not True or packet.get('checksum_valid') is not True:return False
  routing=packet.get('routing_settings')
  if not isinstance(routing,dict):return False
  mode=routing.get('headphone_mode')
  if mode not in ('stereo','mono_split') or mode==self.mode:return False
  self.mode=mode
  return True
 def command(self):
  if self.mode is None:raise ValueError('No verified native headphone mode')
  return 'H1 '+str({'stereo':0,'mono_split':1}[self.mode])
