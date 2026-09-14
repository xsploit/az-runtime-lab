"""Package verified local screen recordings in one offline HTML file."""
import base64,json,argparse
from pathlib import Path
here=Path(__file__).resolve().parent
lab=here.parent
p=argparse.ArgumentParser(description=__doc__)
for name in ('original','fractional','restored','earlier','output'):p.add_argument('--'+name,type=Path,required=True)
a=p.parse_args()
clips=[
    ('original','Original grid — faster scrolling','Whole-pixel grid · same 59 Hz scrolling experiment · first capture',a.original),
    ('fractional','Fractional grid — new drawing','Fractional grid placement · same zoom · second capture',a.fractional),
    ('restored','Original grid restored — check','Original placement restored · same zoom · third capture',a.restored),
    ('earlier','Earlier 59 Hz detail — different capture','Earlier ten-second recording · different deck/position · qualitative comparison only',a.earlier),
]
data=[{'id':ident,'label':label,'caption':caption,'src':'data:video/mp4;base64,'+base64.b64encode(path.read_bytes()).decode()} for ident,label,caption,path in clips]
html=(here/'template.html').read_text().replace('__CLIP_DATA__',json.dumps(data)).replace('__PLAYER_SCRIPT__',(here/'player.js').read_text())
assert '__CLIP_DATA__' not in html and '__PLAYER_SCRIPT__' not in html
output=a.output
output.write_text(html)
print(f'{output}: {output.stat().st_size:,} bytes; {len(data)} embedded clips')
