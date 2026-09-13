"""Explicit native input for an isolated PCM test stage, never the main lab."""
import argparse
import os
from pathlib import Path
import stat
import time
from az_mixer_packet import crc16
p=argparse.ArgumentParser()
p.add_argument('stage',type=Path)
p.add_argument('action',choices=['enter','browse','load','play','cue','counter'])
p.add_argument('--counter',type=int,required=True)
p.add_argument('--decks',type=int,nargs='+',choices=[1,2],default=[1,2])
a=p.parse_args()
stage=a.stage.resolve()
if stage.name!='pcm-startup-test' or not (stage/'pi-pcm-startup-run.py').is_file():
    raise ValueError('Explicit isolated PCM staging directory required')
if not -32768<=a.counter<=32767: raise ValueError('Counter must fit signed16')
erp=a.action in ('play','cue')
fifo=stage/'xdjaz/state/tmp'/('erp-rx.fifo' if erp else 'mixer-rx.fifo')
fd=os.open(fifo,os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
try:
    assert stat.S_ISFIFO(os.fstat(fd).st_mode)
    for down in ([False] if a.action=='counter' else [False,True,False]):
        frame=bytearray(128); frame[0]=1
        if erp:
            for deck in a.decks:
                frame[10+(deck-1)*8]=(2 if a.action=='play' else 4) if down else 0
            end=28
        else:
            frame[34:36]=a.counter.to_bytes(2,'little',signed=True)
            if down:
                if a.action=='enter': frame[31]=1
                if a.action=='browse': frame[32]=64
                if a.action=='load': frame[33]=sum(1<<(4-d) for d in a.decks)
            end=96
        frame[end:end+2]=crc16(frame[:end]).to_bytes(2,'little')
        assert os.write(fd,frame)==128
        time.sleep(.2)
finally: os.close(fd)
