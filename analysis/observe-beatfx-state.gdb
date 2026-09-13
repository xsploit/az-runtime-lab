set pagination off
set confirm off
set architecture aarch64
set sysroot runtime-lab/xdjaz/rootfs
file runtime-lab/xdjaz/rootfs/home/root/pdj/EP147
target remote runtime-lab/xdjaz/state/tmp/guest-gdb.sock
break *0x9960f8
continue
python
if int(gdb.parse_and_eval('$pc')) != 0x9960f8:
    gdb.write('UNEXPECTED_STOP: no state read attempted\n')
    gdb.execute('info registers pc x0 x19 x20 x21 x22 x29 x30 sp')
    gdb.execute('thread apply all bt 6')
    gdb.execute('detach')
    gdb.execute('quit 2')
base=int(gdb.parse_and_eval('$x23'))
q=lambda a:int(gdb.parse_and_eval('*(unsigned long*)'+str(a)))
u=lambda a:int(gdb.parse_and_eval('*(unsigned int*)'+str(a)))
if q(base)!=0x2692378:
    raise gdb.GdbError('BeatFx identity mismatch')
for name,off,vt in [('channel',72,0x2633f70),('mic',104,0x2633fd0)]:
    p=q(base+off)
    if not p or q(p)!=vt:
        raise gdb.GdbError(name+' setting identity mismatch')
    gdb.write('BEATFX_STATE '+name+'='+str(u(p+96))+'\n')
gdb.write('BEATFX_OBJECT='+hex(base)+'\n')
end
detach
quit
