"""Align stereo deck captures independently; compare every overlapping sample.
No resampling, gain matching or time warping. ALSA Float32LE/44.1kHz/10channels.
"""
import argparse
import gzip
import hashlib
import json
from pathlib import Path
import numpy as np
from scipy.signal import correlate

def load(path):
    raw=gzip.decompress(path.read_bytes())
    if len(raw)%40: raise ValueError('Incomplete10channel frame')
    samples=np.frombuffer(raw,dtype='<f4').reshape(-1,10)
    if not np.isfinite(samples).all(): raise ValueError('Nonfinite captured output')
    return samples,hashlib.sha256(raw).hexdigest()

def alignment(a,b,rate=44100):
    # Match seconds2..5 of baseline inside seconds0..7 of candidate.
    lo,hi=2*rate,5*rate
    ref=a[lo:hi].astype(np.float64); ref-=ref.mean()
    search=b[:7*rate].astype(np.float64)
    if len(ref)!=3*rate or len(search)!=7*rate: raise ValueError('Need7seconds')
    power=float(np.dot(ref,ref))
    if power<=1e-15: raise ValueError('Silent alignment reference')
    scores=correlate(search,ref,mode='valid',method='fft')
    sums=np.r_[0,np.cumsum(search)]; squares=np.r_[0,np.cumsum(search*search)]
    width=len(ref)
    energy=squares[width:]-squares[:-width]-(sums[width:]-sums[:-width])**2/width
    denom=np.sqrt(np.maximum(energy,0)*power)
    scores=np.divide(scores,denom,out=np.zeros_like(scores),where=denom>1e-15)
    best=int(np.argmax(scores))
    return best-lo,float(scores[best])

def compare(a,b):
    results=[]
    for deck,start in ((1,0),(2,2)):
        lag,score=alignment(a[:,start],b[:,start])
        if score<.95: raise ValueError(f'Deck{deck} alignment correlation only{score}')
        ai=max(0,-lag); bi=max(0,lag); count=min(len(a)-ai,len(b)-bi)
        if count<25*44100: raise ValueError('Less than25seconds of overlap')
        x=a[ai:ai+count,start:start+2]; y=b[bi:bi+count,start:start+2]
        delta=x.astype(np.float64)-y.astype(np.float64)
        signal=float(np.mean(x.astype(np.float64)**2))
        error=float(np.mean(delta*delta))
        windows=[]
        for offset in range(0,count,44100):
            d=delta[offset:offset+44100]
            windows.append(float(np.max(np.abs(d))))
        results.append(dict(deck=deck,candidate_lag_frames=lag,alignment_correlation=score,
            compared_frames=count,seconds=count/44100,
            differing_float32_samples=int(np.count_nonzero(x.view(np.uint32)!=y.view(np.uint32))),
            peak_absolute_error=float(np.max(np.abs(delta))),rms_error=error**.5,
            signal_rms=signal**.5,snr_db=None if not error else float(10*np.log10(signal/error)),
            peak_error_by_second=windows,baseline_peak=float(np.max(np.abs(x))),
            candidate_peak=float(np.max(np.abs(y)))))
    return dict(decks=results,
        unused_channel_peaks_baseline=np.max(np.abs(a[:,4:]),axis=0).tolist(),
        unused_channel_peaks_candidate=np.max(np.abs(b[:,4:]),axis=0).tolist())

if __name__=='__main__':
    p=argparse.ArgumentParser(); p.add_argument('baseline',type=Path);p.add_argument('candidate',type=Path);p.add_argument('output',type=Path);args=p.parse_args()
    a,ha=load(args.baseline);b,hb=load(args.candidate)
    result={'scope':__doc__,'baseline_sha256':ha,'candidate_sha256':hb,**compare(a,b)}
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result))
