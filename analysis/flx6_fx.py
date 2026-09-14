"""Host CFX + Echo controls. Hardware MIDI from saved FLX6 XML.
Echo is the only attached Beat FX algorithm. Pads preserve supported BiteDJ
slots: 2 Sweep, 5/6 Echo, bank two 2 Crush, 6 Dub Echo, 7 Space.
Other pad slots explicitly reject rather than silently substitute an effect.
Echo uses an explicit manual BPM until native playback telemetry is attached.
"""
import re,time
import xml.etree.ElementTree as ET

class Effects:
    def __init__(self,mapping,bpm=120):
        self.bindings={};self.parts={};self.held={};self.buttons=set()
        self.unit=0;self.targets=[0,0];self.depths=[.5,.5]
        self.colors=[.5]*4;self.enabled=False;self.target=0;self.beat=5;self.depth=.5
        self.last_source=None;self.bpm=bpm;self.dirty=True;self.next_send=0;self.retry_until=0
        for c in ET.parse(mapping).findall('.//controls/control'):
            k=c.findtext('key') or '';g=c.findtext('group') or ''
            a=(int(c.findtext('status'),0),int(c.findtext('midino'),0));b=None
            d=re.search(r'Channel([1-4])',g)
            if k=='super1' and g.startswith('[QuickEffectRack1_'):
                b=('filter',int(d[1])-1,a[1]>=0x20)
            elif k.endswith('padFxPressed'):b=('pad',int(d[1])-1,int(g.split(';')[1]))
            elif k.endswith('beatFxLeftPressed'):b=('beat',-1)
            elif k.endswith('beatFxRightPressed'):b=('beat',1)
            elif k.endswith('fxEnabled'):b=('toggle',)
            elif k.endswith('fxSelected'):b=('focus',)
            elif k=='meta' and 'EffectUnit' in g:b=('depth',0,a[1]>=0x20)
            elif k.endswith('setGroupKey') and 'EffectUnit' in g:b=('target',int(d[1])-1 if d else 4)
            elif k.endswith('beatFxChannel1'):b=('target',0)
            elif k.endswith('beatFxChannel2'):b=('target',1)
            if b:self.bindings[a]=b
    def message(self,status,control,value):
        addr=(status+16 if status&0xf0==0x80 else status,control)
        b=self.bindings.get(addr)
        if not b:return False
        pressed=value!=0 and status&0xf0!=0x80;kind=b[0]
        if kind in ('filter','depth'):
            key=(kind,b[1],status,control&0x1f);parts=self.parts.setdefault(key,{})
            parts[b[2]]=value
            if not b[2] or len(parts)!=2:return True
            v=((parts[False]<<7)|parts[True])/16383
            if kind=='filter':self.colors[b[1]]=.5 if abs(v-.5)<.005 else v
            else:
                unit=status&1;self.depths[unit]=v
                if unit==self.unit:self.depth=v
        elif kind=='pad':
            slot=b[2];supported={2:(3,.8),5:('echo',2),6:('echo',3),10:(6,.7),14:(4,.65),15:(5,.65)}
            if slot not in supported:
                if pressed:raise NotImplementedError('Pad FX slot %d not yet ported; no substitute applied'%slot)
                return True
            if pressed:
                if addr not in self.held:self.held[addr]=(b[1],supported[slot])
            else:self.held.pop(addr,None)
        else:
            if not pressed:self.buttons.discard(addr);return True
            if addr in self.buttons:return True
            self.buttons.add(addr)
            if kind in ('toggle','focus'):
                self.unit=addr[0]&1;self.target=self.targets[self.unit];self.depth=self.depths[self.unit]
                if kind=='toggle':self.enabled=not self.enabled
            elif kind=='target':
                unit=addr[0]&1;self.targets[unit]=b[1]
                if unit==self.unit:self.target=b[1]
            elif kind=='beat':
                choices=[1,2,3,5,6,7];i=min(range(len(choices)),key=lambda i:abs(choices[i]-self.beat))
                self.beat=choices[max(0,min(5,i+b[1]))]
        self.dirty=True;return True
    def commands(self,now=None):
        now=time.monotonic() if now is None else now
        # Repeat bounded latest snapshots: CFX refuses updates during transitions.
        if not self.dirty and (now<self.next_send or now>self.retry_until):return []
        if self.dirty:self.retry_until=now+.8
        self.dirty=False;self.next_send=now+.2
        cfx=[(1,v) for v in self.colors];echo=(5 if self.enabled else 0,self.target,self.beat,self.depth)
        for d,(kind,value) in self.held.values():
            if kind=='echo':echo=(5,d,value,max(.35,self.depth))
            else:cfx[d]=(kind,value)
        commands=[f'F1 {d} {kind} {value:.8f} .5' for d,(kind,value) in enumerate(cfx)]
        source=f'P1 {min(echo[1],3)} {round(self.bpm*100)} 0 0 1 0'
        if source!=self.last_source:commands.append(source);self.last_source=source
        commands.append(f'E1 {echo[0]} {echo[1]} {echo[2]} {echo[3]:.8f}')
        return commands
    def release(self):
        self.held.clear();self.buttons.clear();self.parts.clear();self.enabled=False;self.dirty=True
