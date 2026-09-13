set pagination off
set confirm off
set architecture aarch64
set sysroot runtime-lab/xdjaz/rootfs
file runtime-lab/xdjaz/rootfs/home/root/pdj/EP147
target remote runtime-lab/xdjaz/state/tmp/guest-gdb.sock
break *0x19f4e7c
continue
python
if int(gdb.parse_and_eval('$pc')) != 0x19f4e7c:
    gdb.write('UNEXPECTED_STOP: no action attempted\n')
    gdb.execute('info registers pc x0 x19 x20 sp')
    gdb.execute('thread apply all bt 6')
    gdb.execute('detach')
    gdb.execute('quit 2')
ctrl=int(gdb.parse_and_eval('$x20'))
read=lambda a:int(gdb.parse_and_eval('*(unsigned long*)'+str(a)))
if read(ctrl)!=0x29f6c28 or read(ctrl+8)!=0x29f6c70 or not read(ctrl+40):
    gdb.write('LAYOUT_MISMATCH\n')
    gdb.execute('detach')
    gdb.execute('quit 3')
setting=read(ctrl+40)
if read(setting)!=0x2633250:
    gdb.write('SETTING_TYPE_MISMATCH\n')
    gdb.execute('detach')
    gdb.execute('quit 4')
for a,name in [(0x3b864e8,'aButton'),(0x3b864f0,'bButton'),(0x3b864f8,'thruButton')]:
    value=gdb.Value(read(a)).cast(gdb.lookup_type('char').pointer()).string()
    if value!=name: raise gdb.GdbError('Unexpected identifier: '+value)
gdb.execute('set $ctrl = '+str(ctrl))
gdb.execute('set $setting = '+str(setting))
end
printf "CROSSFADER_CONTROLLER=%#lx CACHE_BEFORE=%u\n", $ctrl, *(unsigned int*)($setting+96)
call ((void (*)(void*,void*))0x19f3b10)((void*)$ctrl, (void*)0x3b864e8)
printf "NATIVE_A_ACTION_RETURNED\n"
detach
quit
