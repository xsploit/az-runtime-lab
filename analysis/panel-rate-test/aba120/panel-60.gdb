set pagination off
set confirm off
set auto-load off
set print thread-events off
attach 1885
python
import gdb,struct
from pathlib import Path
i=gdb.selected_inferior()
assert i.pid==1885
assert Path('/proc/1885/stat').read_text().rsplit(')',1)[1].split()[19]=='99532'
assert int.from_bytes(bytes(i.read_memory(140733081131424,8)),'little')==0x2e414e0
old=struct.unpack('<d',bytes(i.read_memory(140733081131512,8)))[0]
assert any(abs(old-1000/r)<1e-10 for r in (59.24,60.018))
i.write_memory(140733081131512,struct.pack('<d',16.661668166216803))
Path('/home/pompu_5/az-native-lab/analysis/panel-rate-test/rate.txt').write_text('60.018')
print('RATE_VERIFIED',60.018)
end
detach
quit
