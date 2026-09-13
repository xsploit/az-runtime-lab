"""One live Q1 -> AZ RX update for an exclusively owned private lab baseline.

This is not a concurrent multi-writer control bridge. Pause other RX writers
while calling. A fresh reply socket prevents replaying old queued telemetry.
"""
import argparse,json,os,socket,stat,tempfile,time
from pathlib import Path
from az_fx_feedback import encode_applied_echo
from az_mixer_packet import inspect

def sync_once(packet,mixer_socket,rx_fifo,*,tap,timeout=1.0):
 if not 0<timeout<=5:raise ValueError('Timeout must be within five seconds')
 baseline=packet.read_bytes()
 if len(baseline)!=128 or not inspect(baseline)['checksum_valid']:
  raise ValueError('Complete CRC-valid baseline required')
 with tempfile.TemporaryDirectory(prefix='az-q1-') as td:
  with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as client:
   client.bind(str(Path(td)/'reply'));client.settimeout(timeout)
   client.connect(str(mixer_socket));started=time.monotonic()
   client.send(b'Q1');data=client.recv(2048)
   if time.monotonic()-started>timeout:raise TimeoutError('Expired reply')
   snapshot=json.loads(data)
 frame=encode_applied_echo(baseline,snapshot,tap=tap)
 if packet.read_bytes()!=baseline:raise RuntimeError('Baseline changed during query')
 fd=os.open(rx_fifo,os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
 try:
  if not stat.S_ISFIFO(os.fstat(fd).st_mode):raise ValueError('Expected private RX FIFO')
  if os.write(fd,frame)!=128:raise RuntimeError('Incomplete RX update')
 finally:os.close(fd)
 packet.write_bytes(frame)
 return {'snapshot':snapshot,'rx_bytes':128,'elapsed_seconds':time.monotonic()-started}

def main():
 p=argparse.ArgumentParser(description=__doc__)
 p.add_argument('packet',type=Path);p.add_argument('mixer_socket',type=Path);p.add_argument('rx_fifo',type=Path)
 p.add_argument('--mode',choices=('auto','tap'),required=True);p.add_argument('--timeout',type=float,default=1)
 a=p.parse_args()
 print(json.dumps(sync_once(a.packet,a.mixer_socket,a.rx_fifo,tap=a.mode=='tap',timeout=a.timeout)))
if __name__=='__main__':main()
