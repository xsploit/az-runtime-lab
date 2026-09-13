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
assert '05000000-05004000 r-xp 00000000 00:00 0 ' in Path('/proc/14542/maps').read_text().splitlines()
assert int.from_bytes(bytes(i.read_memory(0x1b97984,4)),'little')==2496766367
stub=bytes.fromhex('ff0302d1e00700a9e20f01a9e41702a9e08701ade28f02ad00423bd5e03b00f920443bd5e03f00f9e0db40fd0820601e260400540b04005401106e1e0020611eac0300540190641e0008611e0000781e1f2800718a0200540100621e0038611e01040010210c008b220c4029241441298400024ba500034b4100621e8200621e4208601e2128621e2200781e6100621ea200621e4208601e2128621e2300781e030000140200805203009052e2bb01b9e3bf01b9e03f40f920441bd5e03b40f900421bd5e08741ade28f42ade41742a9e20f41a9e00740a9ff030291170000140080000000000000997900008f220000a3700000a330000066660000b83e0000b85e0000854b00000a5700000a570000854b0000b85e0000b83e000066660000a3300000a37000008f2200009979000000000000008000006902621e67023817')
assert bytes(i.read_memory(83887104,len(stub))) in (bytes(len(stub)),stub)
i.write_memory(83887104,stub)

for addr,old in [(31461076, 509739625)]:
    assert int.from_bytes(bytes(i.read_memory(addr,4)),'little') in (old,348650827)
for addr,old in [(31461076, 509739625)]:
    i.write_memory(addr,(348650827 if False else old).to_bytes(4,'little'))
print('WAVEFORM_PATCH_VERIFIED', False)
end
detach
quit
