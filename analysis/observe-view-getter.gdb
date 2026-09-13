set pagination off
set confirm off
set architecture aarch64
set sysroot runtime-lab/xdjaz/rootfs
file runtime-lab/xdjaz/rootfs/home/root/pdj/EP147
target remote runtime-lab/xdjaz/state/tmp/guest-gdb.sock
break *0x198cac0
continue
python
import json
if int(gdb.parse_and_eval('$pc')) != 0x198cac0:
    gdb.execute('info registers pc x0 x1 x19 x20 x29 x30 sp')
    gdb.execute('bt 8')
    raise gdb.GdbError('Unexpected stop; no view read')
q=lambda a:int(gdb.parse_and_eval('*(unsigned long*)'+str(a)))
obj=int(gdb.parse_and_eval('$x0'))
if q(obj)!=0x29cb4a0:raise gdb.GdbError('Unexpected ViewObjectManager vtable')
nested=q(obj+24);slot=q(q(nested)+488)
result=dict(manager=hex(obj),vtable=hex(q(obj)),nested=hex(nested),nested_vtable=hex(q(nested)),getter=hex(slot),caller=hex(int(gdb.parse_and_eval('$x30'))))
if slot==0x198f468:
    current=q(nested+336)
    result.update(current=hex(current),identity=hex(q(current+248) if current else q(0x3bd76f0)))
gdb.write('VIEW_GETTER '+json.dumps(result)+'\n')
end
detach
quit
