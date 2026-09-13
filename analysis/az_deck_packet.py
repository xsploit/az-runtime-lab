"""Read-only AZ deck-ucom frame inspection from EP147 static instruction evidence.

Does not emulate transport, promise dispatch, or assign calibration meanings.
"""
from pathlib import Path
import argparse,json
from az_mixer_packet import crc16

def inspect(frame):
 if len(frame)!=152:return {'length':len(frame),'length_valid':False}
 a=frame[16]|((frame[17]&3)<<8)
 b=frame[18]|((frame[19]&3)<<8)
 stored=int.from_bytes(frame[38:40],'little');calculated=crc16(frame[:38])
 return dict(length=152,length_valid=True,version=int.from_bytes(frame[:2],'little'),version_nonzero=any(frame[:2]),checksum_valid=stored==calculated,stored_crc=stored,calculated_crc=calculated,tempo_raw_a=a,tempo_raw_b=b,slider_event_words=[b<<6,a<<6],scope='Static decode only; event calibration and real transport remain unverified.')
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('frame',type=Path);args=p.parse_args();print(json.dumps(inspect(args.frame.read_bytes()),indent=2))
