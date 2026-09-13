"""Compare a matched native/compositor screenshot pair numerically."""
import collections,itertools,json,subprocess
from pathlib import Path
b=Path(__file__).resolve().parent
def read(name):
 p=b/name
 s=json.loads(subprocess.check_output(['ffprobe','-v','error','-show_streams','-of','json',str(p)]))['streams'][0]
 raw=subprocess.check_output(['ffmpeg','-v','error','-i',str(p),'-frames:v','1','-pix_fmt','rgb24','-f','rawvideo','-'])
 w,h=s['width'],s['height'];assert len(raw)==w*h*3
 return w,h,lambda x,y:tuple(raw[(y*w+x)*3:(y*w+x)*3+3])
aw,ah,a=read('az-scale-native.png');pw,ph,p=read('az-scale-panel.png')
assert (aw,ah,pw,ph)==(1280,800,1920,1200)
def lines(pixel,y,x0,x1):
 pts=[x for x in range(x0,x1) if pixel(x,y)[0]>100 and pixel(x,y)[1]<50 and pixel(x,y)[2]<50]
 runs=[[x for _,x in g] for _,g in itertools.groupby(enumerate(pts),lambda t:t[1]-t[0])]
 return [{'x':r[0],'width':len(r),'colors':sorted({pixel(x,y) for x in r})} for r in runs]
n=lines(a,100,420,1040);q=lines(p,150,630,1560)
r={'native_size':[aw,ah],'compositor_size':[pw,ph],'native_lines':n,'compositor_lines':q,'native_widths':dict(collections.Counter(x['width'] for x in n)),'compositor_widths':dict(collections.Counter(x['width'] for x in q)),'scope':'Matched frozen frame; compositor screenshot, not optical panel measurement'}
for mode in ('floor','center'):
 mismatch=0;total=0
 for y in range(134,155):
  for x in range(630,1560):
   sx=int((x+(.5 if mode=='center' else 0))/1.5);sy=int((y+(.5 if mode=='center' else 0))/1.5)
   mismatch+=p(x,y)!=a(sx,sy);total+=1
 r[mode+'_nearest_mismatches']={'mismatches':mismatch,'pixels':total}
(b/'az-scale-comparison.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if 'lines' not in k},indent=2))
