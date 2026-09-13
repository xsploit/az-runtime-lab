"""Plot saved image-registration measurements; does not rerun video analysis."""
import json
from pathlib import Path
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
root=Path(__file__).resolve().parent/'grid-waveform-blend/az-grid-curve-motion'
fig,axes=plt.subplots(3,1,figsize=(10,6),sharex=True,sharey=True,layout='constrained')
for ax,name,title,color in zip(axes,['grid-only','grid-and-smooth-curve','grid-only-restored'],['Preferred grid + original waveform','Same grid + interpolated contrast','Original waveform restored'],['#486581','#167d8d','#486581']):
 d=json.loads((root/f'{name}.waveform-motion-sigma1.json').read_text());rows=[r for r in d['pairs'] if r['residual'] is not None]
 ax.plot([r['time'] for r in rows],[r['residual'] for r in rows],color=color,lw=.8)
 ax.axhline(0,color='#999',lw=.6);ax.set_ylim(-.8,.8);ax.grid(alpha=.2)
 ax.set_title(title,loc='left',fontsize=10);ax.set_ylabel('Difference (px)')
 ax.text(.99,.93,f"95th percentile |difference|: {d['summary']['residual_absolute_p95']:.3f} px",transform=ax.transAxes,ha='right',va='top',fontsize=9)
axes[-1].set_xlabel('Time within each separate clip (seconds)')
fig.suptitle('Inferred waveform movement minus measured grid movement',fontsize=13)
fig.supxlabel('Image registration, not optical motion. Separate song sections; smoothing σ = 1 px.',fontsize=9)
fig.savefig(root/'waveform-registration.png',dpi=160)
print(root/'waveform-registration.png')
