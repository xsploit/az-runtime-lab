"""Single-threaded AZ RX state merger; no I/O or firmware input simulation.

Each control packet produces one output, preserving press/release ordering.
The effect fields have one owner: applied mixer feedback. When observations
expire or are unsupported, retain the last displayed value and report degraded
status; never overwrite it with neutral fields from a browser packet.
"""
from az_mixer_packet import crc16,inspect
from az_fx_feedback import encode_applied_echo

FX_MASKS={84:0x4c,85:0xf0,86:0xff,88:0xff,89:0xff,90:0xff,91:0xff,92:0xff}

class RxOwner:
 def __init__(self,baseline,*,epoch,tap,max_age=1.0):
  self._validate(baseline)
  if not isinstance(epoch,str) or not epoch:raise ValueError('Explicit mixer session required')
  if type(tap) is not bool:raise ValueError('Explicit TAP/AUTO mode required')
  if not 0<max_age<=5:raise ValueError('Maximum age must be within five seconds')
  self.frame=bytes(baseline);self.epoch=epoch;self.tap=tap;self.max_age=max_age
  self.last_seen_frame=-1;self.last_applied_at=None;self.status='no-feedback'

 @staticmethod
 def _validate(packet):
  if len(packet)!=128 or not inspect(packet)['checksum_valid']:
   raise ValueError('Complete CRC-valid RX packet required')

 def controls(self,packet):
  self._validate(packet)
  merged=bytearray(packet)
  for offset,mask in FX_MASKS.items():
   merged[offset]=(merged[offset]&~mask)|(self.frame[offset]&mask)
  merged[96:98]=crc16(merged[:96]).to_bytes(2,'little')
  self.frame=bytes(merged)
  return self.frame

 def feedback(self,snapshot,*,epoch,received_at,now):
  if epoch!=self.epoch:
   self.status='wrong-session';return None
  if not 0<=now-received_at<=self.max_age:
   self.status='expired-reply';return None
  if not isinstance(snapshot,dict) or type(snapshot.get('audio_frame')) is not int or snapshot['audio_frame']<0:
   self.status='invalid-reply';return None
  frame=snapshot['audio_frame']
  if frame<=self.last_seen_frame:
   self.status='out-of-order';return None
  # Even an unsupported new state invalidates older replies from this session.
  self.last_seen_frame=frame
  try:merged=encode_applied_echo(self.frame,snapshot,tap=self.tap)
  except ValueError:
   self.status='unsupported-state';return None
  changed=merged!=self.frame
  self.frame=merged;self.last_applied_at=received_at;self.status='current'
  return merged if changed else None

 def current(self,now):
  if self.last_applied_at is None:return False
  fresh=0<=now-self.last_applied_at<=self.max_age
  if not fresh:self.status='stale'
  return fresh and self.status=='current'
