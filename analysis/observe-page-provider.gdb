set pagination off
set confirm off
set architecture aarch64
set sysroot runtime-lab/xdjaz/rootfs
file runtime-lab/xdjaz/rootfs/home/root/pdj/EP147
target remote runtime-lab/xdjaz/state/tmp/guest-gdb.sock
break *0x204c7e8
continue
python
import json
if int(gdb.parse_and_eval('$pc')) != 0x204c7e8:
    raise gdb.GdbError('Unexpected stop; no provider read')
q=lambda a:int(gdb.parse_and_eval('*(unsigned long*)'+str(a)))
obj=int(gdb.parse_and_eval('$x19'));provider=q(obj+72);vt=q(provider);sp=int(gdb.parse_and_eval('$sp'))
result=dict(callback_object=hex(obj),provider=hex(provider),vtable=hex(vt),typeinfo=hex(q(vt-8)),identity_getter=hex(q(vt+16)),flags_getter=hex(q(vt+40)),returned_identity=hex(q(sp+88)))
gdb.write('PAGE_PROVIDER '+json.dumps(result)+'\n')
end
detach
quit
