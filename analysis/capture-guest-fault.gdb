set pagination off
set confirm off
set architecture aarch64
set sysroot runtime-lab/xdjaz/rootfs
file runtime-lab/xdjaz/rootfs/home/root/pdj/EP147
target remote runtime-lab/xdjaz/state/tmp/guest-gdb.sock
continue
info registers pc x0 x19 x20 x21 x22 x29 x30 sp
thread apply all bt 6
detach
quit
