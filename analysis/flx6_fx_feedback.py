"""FLX6 Beat FX LED follows applied DSP telemetry, never just a button press.
Pulse cadence follows manual FX BPM/audio clock; not track beat phase sync.
"""

class EffectFeedback:
    def __init__(self):
        self.snapshot=None;self.received=0.;self.frame=-1;self.sent={}
    def accept(self,snapshot,now):
        names=('version','attached','audio_frame','active_type','on','source_bpm100')
        if not isinstance(snapshot,dict) or any(type(snapshot.get(k)) is not int for k in names):return False
        if snapshot['version']!=1 or snapshot['attached']!=1 or snapshot['audio_frame']<=self.frame:return False
        if snapshot['on'] not in (0,1) or not 4000<=snapshot['source_bpm100']<=100000:return False
        self.frame=snapshot['audio_frame'];self.snapshot=snapshot.copy();self.received=now;return True
    def messages(self,now,addresses,selected):
        s=self.snapshot
        active=s is not None and 0<=now-self.received<=1 and s['active_type']==5 and s['on']==1
        phase=(s['audio_frame']/44100+now-self.received)*s['source_bpm100']/6000 if active else 0
        # bpm100 / 6000 converts seconds to beats. Half-duty pulse.
        on=127 if active and (phase%1)<.5 else 0
        messages=[]
        for addr in sorted(addresses):
            value=on if addr==selected else 0
            if self.sent.get(addr)!=value:
                messages.append(bytes((*addr,value)));self.sent[addr]=value
        return messages
    def reset(self):
        self.snapshot=None;self.frame=-1;self.sent.clear()
