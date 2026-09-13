.syntax unified
.arm
.fpu neon
.text
.balign 8
.global delay_execute
.type delay_execute,%function
delay_execute:
.incbin "native-delay-execute.bin",0,256
bl ceil
.incbin "native-delay-execute.bin",260,520
bl floor
.incbin "native-delay-execute.bin",784,72
bl oracle_quantize
.incbin "native-delay-execute.bin",860,48
b oracle_time
.incbin "native-delay-execute.bin",912,124
bl ceil
.incbin "native-delay-execute.bin",1040,108
bl floor
.incbin "native-delay-execute.bin",1152,52
.section .note.GNU-stack,"",%progbits
