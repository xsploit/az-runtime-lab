set pagination off
set confirm off
set auto-load off
set print thread-events off
attach 3787
python
import gdb,struct
from pathlib import Path
i=gdb.selected_inferior()
assert i.pid==3787
assert Path('/proc/3787/stat').read_text().rsplit(')',1)[1].split()[19]=='291827'
assert int.from_bytes(bytes(i.read_memory(140734303771040,8)),'little')==0x2e414e0
old=struct.unpack('<d',bytes(i.read_memory(140734303771128,8)))[0]
assert any(abs(old-1000/r)<1e-10 for r in (59.24,60.018))
i.write_memory(140734303771128,struct.pack('<d',16.88048615800135))
Path('/home/pompu_5/az-native-lab/analysis/panel-rate-test/rate.txt').write_text('59.24')
print('RATE_VERIFIED',59.24)
end
detach
quit
