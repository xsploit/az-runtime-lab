.syntax unified
.arm
.fpu neon
.text
.balign 4
delay_base:
.incbin "native-delay-control.bin"
.global delay_init
.type delay_init, %function
.set delay_init,delay_base+0
.global delay_time
.type delay_time, %function
.set delay_time,delay_base+24
.global delay_on
.type delay_on, %function
.set delay_on,delay_base+36
.global delay_off
.type delay_off, %function
.set delay_off,delay_base+152
.global delay_depth
.type delay_depth, %function
.set delay_depth,delay_base+320
.balign 4
.global delay_select
.type delay_select,%function
delay_select:
.incbin "native-delay-select.bin"
.section .note.GNU-stack,"",%progbits
