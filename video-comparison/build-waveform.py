"""Offline comparison of preferred fractional grid and contrast-curve experiment."""
import base64,json,re,subprocess,argparse
from pathlib import Path
here=Path(__file__).resolve().parent
p=argparse.ArgumentParser(description=__doc__);p.add_argument('--clips',type=Path,required=True);p.add_argument('--output',type=Path,required=True);a=p.parse_args()
root=a.clips
clips=[('preferred','Preferred grid + original waveform','The previous comparison’s B setting, captured again with two decks playing.','grid-only'),('curve','Same grid + smoother waveform contrast','Interpolates the native contrast settings; grid and scrolling settings unchanged.','grid-and-smooth-curve'),('restored','Preferred setting restored','Original waveform contrast restored after the experiment.','grid-only-restored')]
data=[]
for ident,label,caption,filename in clips:
 path=root/(filename+'.mp4')
 subprocess.run(['ffmpeg','-v','error','-i',str(path),'-f','null','-'],check=True)
 data.append(dict(id=ident,label=label,caption=caption,src='data:video/mp4;base64,'+base64.b64encode(path.read_bytes()).decode()))
html=(here/'template.html').read_text()
html=html.replace('AZ waveform comparison','AZ waveform contrast comparison').replace('Compare original and fractional beat-grid drawing in native Raspberry Pi captures.','Compare native and interpolated waveform contrast with the improved fractional grid enabled in both.')
html=html.replace('Same zoom, different song sections in the three grid-test clips. Controls align clip time, not beats.','Left starts with the setting you preferred previously. Right adds waveform contrast smoothing. Same zoom, sequential song sections; clip time is aligned, beats are not.')
start=html.index('    <div class="table-wrap">');end=html.index('  </details>',start)
html=html[:start]+'''    <div class="table-wrap"><table>
      <thead><tr><th>Two decks playing</th><th>Preferred</th><th>Smooth contrast</th><th>Restored</th></tr></thead>
      <tbody><tr><td>CPU, % of one core, recorder off</td><td>46.99</td><td>47.24</td><td>47.24</td></tr>
      <tr><td>Red and gray grid changes / second</td><td>58.62</td><td>57.87</td><td>57.75</td></tr>
      <tr><td>Backward grid steps observed</td><td>0</td><td>0</td><td>0</td></tr></tbody>
    </table></div>
    <ul>
      <li>Both settings retain fractional grid placement and the faster scrolling experiment. The candidate interpolates between the waveform renderer’s ten native contrast coefficient pairs.</li>
      <li>A paused comparison restored exactly to its original pixels. The candidate changed waveform pixels only. This is an experiment, not a confirmed fix for physical-display flicker.</li>
      <li>Captures are sequential eight-second sections, 479–480 frames, native 640 × 190 before desktop scaling. MP4 compression and browser scaling can affect thin edges. Lossless masters are retained.</li>
      <li>Linked controls align clip time, not track position. The clock difference is shown; playback does not use hidden resynchronizing seeks. No frame interpolation is added.</li>
      <li>Paced null-audio test: recordings are silent and do not establish audible playback quality.</li>
    </ul>
'''+html[end:]
html=html.replace('__CLIP_DATA__',json.dumps(data)).replace('__PLAYER_SCRIPT__',(here/'player.js').read_text().replace("i ? 'fractional' : 'original'", "i ? 'curve' : 'preferred'"))
assert '__CLIP_DATA__' not in html and '__PLAYER_SCRIPT__' not in html
out=a.output;out.write_text(html)
print(out, out.stat().st_size)
