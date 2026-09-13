.syntax unified
.arm
.fpu neon
.text
.balign 8
echo_base:
.incbin "native-echo-control.bin"
.global echo_init
.type echo_init,%function
.set echo_init,echo_base+0
.global echo_keep
.type echo_keep,%function
.set echo_keep,echo_base+24
.global echo_time
.type echo_time,%function
.set echo_time,echo_base+36
.global echo_on
.type echo_on,%function
.set echo_on,echo_base+48
.global echo_off
.type echo_off,%function
.set echo_off,echo_base+132
.global echo_depth
.type echo_depth,%function
.set echo_depth,echo_base+196
.section .note.GNU-stack,"",%progbits
