import tempfile
from pathlib import Path
from az_tx_freshness import TxFreshness
from az_mixer_packet import crc16

def frame(state):
    f=bytearray(128); f[26]=state<<4
    f[104:106]=crc16(f[:104]).to_bytes(2,'little')
    return bytes(f)

with tempfile.TemporaryDirectory() as d:
    p=Path(d)/'capture'; p.write_bytes(frame(2)*2)
    r=TxFreshness()
    assert r.poll(p,0) is None # old capture cannot bootstrap state
    with p.open('ab') as f: f.write(frame(2)*2)
    assert r.poll(p,0.1)==2
    assert r.poll(p,0.2)==2
    assert r.poll(p,0.4) is None # stopped/capped capture expires
    with p.open('ab') as f: f.write(frame(1)+frame(2))
    assert r.poll(p,0.5) is None # transition
    with p.open('ab') as f: f.write(frame(1)*2)
    assert r.poll(p,0.6)==1
    with p.open('ab') as f: f.write(bytes(128)*2)
    assert r.poll(p,0.7) is None # invalid CRC
    with p.open('ab') as f: f.write(frame(3)*2)
    assert r.poll(p,0.8) is None # unknown raw enum
    p.write_bytes(frame(2)*2)
    assert r.poll(p,0.9) is None # truncation
    replacement=Path(d)/'new'; replacement.write_bytes(frame(2)*4); replacement.replace(p)
    assert r.poll(p,1) is None # replaced capture
    with p.open('ab') as f: f.write(frame(2)*2+b'partial')
    assert r.poll(p,1.1)==2 # only complete records considered
    p.unlink()
    assert r.poll(p,1.2) is None
print('Freshness checks passed: baseline, growth, expiry, transition, CRC, unknown, reset, partial, missing')
