"""Bounded raw MIDI decoder: channel messages, running status and realtime bytes."""
class MidiStream:
    def __init__(self):
        self.status=None;self.data=[];self.sysex=False
    def feed(self,chunk):
        messages=[]
        for b in chunk:
            if b>=0xf8:continue
            if b&0x80:
                self.data=[]
                if b>=0xf0:
                    self.status=None;self.sysex=b==0xf0
                else:self.status=b;self.sysex=False
                continue
            if self.sysex or self.status is None:continue
            self.data.append(b)
            size=1 if self.status&0xf0 in (0xc0,0xd0) else 2
            if len(self.data)==size:
                if size==2:messages.append((self.status,*self.data))
                self.data=[]
        return messages
