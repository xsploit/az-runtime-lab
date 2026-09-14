"""FLX6 jog/tempo -> native AZ deck-ucom packets (logical decks 1/2).
Jog calibration is provisional; native converter semantics are oracle-tested.
"""
import re
import time
import xml.etree.ElementTree as ET
from az_mixer_packet import crc16

class DeckControls:
    def __init__(self, xml, clock=time.monotonic, jog_scale=.81):
        if not 0<jog_scale<=8:raise ValueError('Invalid jog scale')
        self.clock=clock;self.scale=jog_scale;self.bindings={};self.parts=[{},{}]
        self.frames=[bytearray(152) for _ in range(2)]
        self.count=[0.,0.];self.last=[None,None];self.moving=[False,False];self.touched=[set(),set()]
        for frame in self.frames:
            frame[0]=1;frame[12:14]=b'\xff\xff'
            frame[16:20]=bytes([0,2,0,2])
        keys={'jogTurn':'turn','jogTouch':'touch','tempoSliderMSB':'msb','tempoSliderLSB':'lsb'}
        for c in ET.parse(xml).findall('.//controls/control'):
            m=re.fullmatch(r'\[Channel([1-4])\]',c.findtext('group',''))
            key=keys.get(c.findtext('key','').split('.')[-1])
            if not m or not key:continue
            addr=(int(c.findtext('status'),0),int(c.findtext('midino'),0))
            self.bindings[addr]=(int(m[1])-1,key)
    def packet(self,deck):
        f=self.frames[deck];f[38:40]=crc16(f[:38]).to_bytes(2,'little');return bytes(f)
    def message(self,status,control,value):
        if not 0x80<=status<=0xef or not 0<=control<128 or not 0<=value<128:raise ValueError('Invalid MIDI')
        if status&0xf0==0x80:status+=16;value=0
        binding=self.bindings.get((status,control))
        if binding is None:return None
        d,key=binding
        if d>1:raise NotImplementedError('AZ deck3/4 jog/tempo layer selection not mapped')
        f=self.frames[d];now=self.clock()
        if key=='turn':
            delta=value-64
            if not delta:return None
            dt=.01 if self.last[d] is None else max(.001,min(.05,now-self.last[d]))
            old=round(self.count[d]);self.count[d]+=delta*self.scale;new=round(self.count[d]);ticks=new-old
            if not ticks:return None
            f[10:12]=(new&65535).to_bytes(2,'little')
            period=max(1,min(65534,round(1800000*dt/abs(ticks))))
            f[12:14]=period.to_bytes(2,'little');f[9]=(f[9]&~4)|(4 if ticks>0 else 0)
            self.last[d]=now;self.moving[d]=True
        elif key=='touch':
            addr=(status,control)
            if value:self.touched[d].add(addr)
            else:self.touched[d].discard(addr)
            f[9]=(f[9]&~2)|(2 if self.touched[d] else 0)
        else:
            self.parts[d][key]=value
            # Controller sends MSB then LSB. Emit only complete LSB updates.
            if key!='lsb' or 'msb' not in self.parts[d]:return None
            raw=(self.parts[d]['msb']<<7)|value
            position=12+round(1000*raw/16383)
            f[16:18]=position.to_bytes(2,'little')
        return d,self.packet(d)
    def idle(self):
        now=self.clock();out=[]
        for d in range(2):
            if self.moving[d] and now-self.last[d]>=.05:
                self.frames[d][12:14]=b'\xff\xff';self.moving[d]=False;out.append((d,self.packet(d)))
        return out
    def release_all(self):
        out=[]
        for d in range(2):
            self.touched[d].clear();self.frames[d][9]&=~2;self.frames[d][12:14]=b'\xff\xff'
            self.moving[d]=False;self.last[d]=None;self.parts[d].clear();out.append((d,self.packet(d)))
        return out
