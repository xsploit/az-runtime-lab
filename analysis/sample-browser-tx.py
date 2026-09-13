"""Record recent TX indicator-byte distributions for one visually checked page."""
from pathlib import Path
import argparse,json,collections
p=argparse.ArgumentParser();p.add_argument('label');a=p.parse_args()
b=Path(__file__).resolve().parents[1];raw=(b/'xdjaz/state/tmp/mixer-tx.raw').read_bytes();n=len(raw)//128
frames=[raw[i*128:(i+1)*128] for i in range(max(0,n-30),n)]
r=dict(label=a.label,frame_end=n,window_frames=len(frames),bytes={str(i):dict(collections.Counter(str(f[i]) for f in frames)) for i in range(24,28)})
with (b/'analysis/az-browser-tx-page-samples.jsonl').open('a') as f:f.write(json.dumps(r)+'\n')
print(json.dumps(r))
