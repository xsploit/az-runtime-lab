from flx6_midi_stream import MidiStream
m=MidiStream()
assert m.feed(bytes([0x90,11]))==[]
assert m.feed(bytes([0xf8,127,12,127,0x80,11,64]))==[(0x90,11,127),(0x90,12,127),(0x80,11,64)]
assert m.feed(bytes([0xf0,1,2,0xf8,3,0xf7,12,127]))==[]
assert m.feed(bytes([0xb6,0x40,1,0xfe,0x40,127]))==[(0xb6,0x40,1),(0xb6,0x40,127)]
assert m.feed(bytes([0xc0,2,3,4,0x91,11,0]))==[(0x91,11,0)]
assert m.feed(bytes([0x90,1,0xf2,1,2,3,4]))==[]
print('PASS: fragmentation, running status, realtime interleave, sysex, note-off, short channel and system-common reset')
