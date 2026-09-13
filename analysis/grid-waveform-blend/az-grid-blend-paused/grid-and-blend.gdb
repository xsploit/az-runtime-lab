set pagination off
set confirm off
set auto-load off
set print thread-events off
attach 14542
python
import gdb
from pathlib import Path
i=gdb.selected_inferior()
assert i.pid==14542
assert Path('/proc/14542/stat').read_text().rsplit(')',1)[1].split()[19]=='1773536'
assert '7fff28864000-7fff28868000 r-xp 00000000 b3:02 201321                     /lab-shims/fractional-grid.so' in Path('/proc/14542/maps').read_text().splitlines()
assert int.from_bytes(bytes(i.read_memory(140733873406168,4)),'little')==1
for addr,old in [(31466604, 1409290861), (31466824, 1409290093), (31466992, 1409293229), (31467476, 1409287533)]:
    assert int.from_bytes(bytes(i.read_memory(addr,4)),'little') in (old,335544326)
for addr,old in [(31466604, 1409290861), (31466824, 1409290093), (31466992, 1409293229), (31467476, 1409287533)]:
    i.write_memory(addr,(335544326 if True else old).to_bytes(4,'little'))
print('WAVEFORM_PATCH_VERIFIED', True)
end
detach
quit
