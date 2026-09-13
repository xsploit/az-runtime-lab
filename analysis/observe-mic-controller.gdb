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
detach
quit
