"""Measure the active intervals of four stereo deck outputs in the AZ lab capture."""
from pathlib import Path
from array import array
import json,sys
base=Path(__file__).resolve().parents[1]
data=(base/'xdjaz/state/tmp/az-output.raw').read_bytes()
a=array('f');a.frombytes(data[:len(data)//40*40]);del data
if sys.byteorder!='little':a.byteswap()
rows=[]
for deck in range(4):
 left=a[deck*2::10];right=a[deck*2+1::10]
 active=[i for i,v in enumerate(left) if abs(v)>1e-5]
 if not active:raise RuntimeError(f'Deck {deck+1} has no active output')
 rows.append(dict(deck=deck+1,channels=[deck*2+1,deck*2+2],start_seconds=active[0]/44100,end_seconds=(active[-1]+1)/44100,duration_seconds=(active[-1]+1-active[0])/44100,peak=max(map(abs,left)),stereo_max_difference=max(abs(x-y) for x,y in zip(left,right))))
r=dict(decks=rows,overlap_seconds=max(0,min(x['end_seconds'] for x in rows)-max(x['start_seconds'] for x in rows)),auxiliary_peaks=[max(map(abs,a[k::10])) for k in (8,9)],limitation='Active interval overlap with same generated tone; no distinct-track crosstalk, hardware mixing, or Pi performance claim.')
(base/'analysis/az-four-deck-overlap.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(r,indent=2))
