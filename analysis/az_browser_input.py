"""Private AZ browser packet encoder; button names remain unverified.
Preserves other fields in a caller-owned complete mixer packet.
"""
from az_mixer_packet import crc16
class BrowserInput:
 def __init__(self,counter=0):
  if not -32768<=counter<=32767:raise ValueError('Counter must be signed16')
  self.counter=counter
 def encode(self,base,delta=0,flag=False):
  if len(base)!=128:raise ValueError('Expected128-byte mixer RX frame')
  if not isinstance(delta,int):raise ValueError('Integer delta required')
  new=self.counter+delta
  # The dispatcher subtracts signed16 values as32-bit integers. Downstream
  # wrap handling is unknown, so do not silently create a65535-step jump.
  if not -32768<=new<=32767:raise ValueError('Counter wrap behavior unverified')
  frame=bytearray(base);frame[31]=(frame[31]&0xfe)|int(bool(flag))
  frame[34:36]=new.to_bytes(2,'little',signed=True)
  frame[96:98]=crc16(frame[:96]).to_bytes(2,'little')
  self.counter=new
  return bytes(frame)
