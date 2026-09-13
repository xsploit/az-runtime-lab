set pagination off
set confirm off
set architecture aarch64
set sysroot runtime-lab/xdjaz/rootfs
file runtime-lab/xdjaz/rootfs/home/root/pdj/EP147
target remote runtime-lab/xdjaz/state/tmp/guest-gdb.sock
break *0x1a16c68
continue
python
if int(gdb.parse_and_eval('$pc')) != 0x1a16c68:
    gdb.write('UNEXPECTED_STOP: no controller action will be attempted\n')
    gdb.execute('info registers pc x0 x19 x20 x21 x22 x29 x30 sp')
    gdb.execute('thread apply all bt 6')
    gdb.execute('detach')
    gdb.execute('quit 2')
end
printf "MIC_CONTROLLER=%#lx\n", $x20
printf "PRIMARY=%#lx SECONDARY=%#lx SETTING=%#lx\n", *(unsigned long*)$x20, *(unsigned long*)($x20+8), *(unsigned long*)($x20+40)
printf "MIC1_NAME="
x/s *(unsigned long*)0x3b86458
printf "MIC2_NAME="
x/s *(unsigned long*)0x3b86460
printf "MIC_BOTH_NAME="
x/s *(unsigned long*)0x3b86468
set $ctrl = $x20
set $setting = *(unsigned long*)($ctrl+40)
printf "SETTING_VTABLE=%#lx CACHE_BEFORE=%u\n", *(unsigned long*)$setting, *(unsigned int*)($setting+96)
python
ctrl=int(gdb.parse_and_eval('$ctrl'))
read=lambda a:int(gdb.parse_and_eval('*(unsigned long*)'+str(a)))
if read(ctrl)!=0x29f22c0 or read(ctrl+8)!=0x29f2308 or not read(ctrl+40):
    gdb.write('LAYOUT_MISMATCH: action cancelled\n')
    gdb.execute('detach')
    gdb.execute('quit 3')
end
call ((void (*)(void*,void*))0x19ebcc0)((void*)$ctrl, (void*)0x3b86460)
printf "NATIVE_MIC2_ACTION_RETURNED\n"
detach
quit
