set pagination off
set confirm off
set auto-load off
set print thread-events off
attach 18499
python
import gdb,hashlib
from pathlib import Path
i=gdb.selected_inferior()
assert i.pid==18499
assert Path('/proc/18499/stat').read_text().rsplit(')',1)[1].split()[19]=='2252966'
assert '7ffedf5f8000-7ffedf5fc000 r-xp 00000000 b3:02 201336                     /lab-shims/ximage-present.so' in Path('/proc/18499/maps').read_text().splitlines()
assert hashlib.sha256(Path('/home/pompu_5/az-native-lab/shims/ximage-present.so').read_bytes()).hexdigest()=='cd6046bb1c6e4b9c412f6ba1388f34f655ea5f97fa92b1bac20bd10f220f94e7'
assert int.from_bytes(bytes(i.read_memory(140732646129728,4)),'little') in (0,1)
i.write_memory(140732646129728,(1).to_bytes(4,'little'))
print('PRESENT_SWITCH_VERIFIED',1)
end
detach
quit
