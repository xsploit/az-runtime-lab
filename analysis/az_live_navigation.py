"""Preferred FLX6 navigation using a fresh native page read for each decision.

No pointer simulation or guessed toggle state. Releases do not depend on page
availability. A page can still change after observation; no atomicity claim.
"""
import time
from az_live_view import ViewUnavailable

class LiveNavigation:
 def __init__(self,navigation,observer,*,clock=time.monotonic,max_age=.05):
  if not 0<max_age<=.25:raise ValueError('Bounded observation age required')
  self.navigation=navigation;self.observer=observer;self.clock=clock;self.max_age=max_age
 def message(self,status,control,value):
  # Normalize only for deciding whether a page read is needed. Navigation
  # validates the complete message and handles the actual held-button state.
  normalized=status+16 if status&0xf0==0x80 else status
  pressed=value!=0 and status&0xf0!=0x80
  addr=(normalized,control);nav=self.navigation;visible=None
  if pressed and addr not in nav.down and nav.bindings.get(addr) in ('view','back'):
   sample=self.observer.sample()
   if not 0<=self.clock()-sample['observed_at']<=self.max_age:raise ViewUnavailable('Page observation expired')
   # On settings/modal/PC pages send the native Back key instead of refusing
   # the user's escape action. Only Waveform keeps the preferred open-browser
   # Back shortcut. View always sends the native Browse toggle.
   visible=sample['kind']!='waveform' if nav.bindings[addr]=='back' else False
  return nav.message(status,control,value,browser_visible=visible)
