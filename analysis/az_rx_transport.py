"""Bounded native RX transport for private input producers.

With continuous feedback enabled, use its input socket. Direct FIFO mode is for
exclusive standalone probes; it must not run alongside another RX writer.
"""
import os,socket,stat
from pathlib import Path
from az_mixer_packet import inspect

def add_transport_arguments(parser):
 group=parser.add_mutually_exclusive_group()
 group.add_argument('--input-socket',type=Path,help='Launcher rx_feedback input_socket; preserves mixer-owned FX fields')
 group.add_argument('--fifo',type=Path,default=None,help='Exclusive direct RX FIFO (never alongside feedback service)')
 parser.add_argument('--baseline',type=Path,help='Complete CRC-valid control baseline; defaults to neutral fields')

def baseline_packet(args):
 if args.baseline is not None:
  packet=args.baseline.read_bytes();validate(packet);return bytearray(packet)
 packet=bytearray(128);packet[0]=1
 return packet

def validate(packet):
 if len(packet)!=128 or not inspect(packet)['checksum_valid']:
  raise ValueError('Complete CRC-valid 128-byte RX packet required')

class RxTransport:
 def __init__(self,args):
  self.sock=None;self.fd=None
  if args.input_socket is not None:
   if not stat.S_ISSOCK(args.input_socket.lstat().st_mode):raise ValueError('Expected input socket')
   self.sock=socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM)
   try:self.sock.setblocking(False);self.sock.connect(str(args.input_socket))
   except BaseException:self.sock.close();raise
  else:
   fifo=args.fifo or Path(__file__).resolve().parents[1]/'xdjaz/state/tmp/mixer-rx.fifo'
   self.fd=os.open(fifo,os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
   if not stat.S_ISFIFO(os.fstat(self.fd).st_mode):
    os.close(self.fd);self.fd=None;raise ValueError('Expected RX FIFO')
 def __enter__(self):return self
 def __exit__(self,*_):
  if self.sock is not None:self.sock.close()
  if self.fd is not None:os.close(self.fd)
 def send(self,packet):
  validate(packet)
  count=self.sock.send(packet) if self.sock is not None else os.write(self.fd,packet)
  if count!=128:raise RuntimeError('Incomplete native RX packet')
  return count
