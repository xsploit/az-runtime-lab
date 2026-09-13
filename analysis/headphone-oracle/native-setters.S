.syntax unified
.arm
.fpu neon
.text
.balign 8
base:
.incbin "native-setters.bin"
.global native_master
.type native_master,%function
.set native_master,base+276
.global native_mode
.type native_mode,%function
.set native_mode,base+368
.global native_level
.type native_level,%function
.set native_level,base
.global native_mix
.type native_mix,%function
.set native_mix,base+108
.section .note.GNU-stack,"",%progbits
