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
for address,data in [(28932484, '9fa1d194'), (83886080, '5000005800021fd6a04d8628ff7f0000'), (28858344, '0aead194'), (83886096, '5000005800021fd6104e8628ff7f0000'), (28858432, 'f8e9d194'), (83886112, '5000005800021fd6104e8628ff7f0000'), (37727768, '8614b014'), (83886128, '5000005800021fd6e04d8628ff7f0000')]:
    assert bytes(i.read_memory(address,len(bytes.fromhex(data))))==bytes.fromhex(data)
assert int.from_bytes(bytes(i.read_memory(140733873406168,4)),'little') in (0,1)
i.write_memory(140733873406168,(1).to_bytes(4,'little'))
print('GRID_SWITCH_VERIFIED', 1)
end
detach
quit
