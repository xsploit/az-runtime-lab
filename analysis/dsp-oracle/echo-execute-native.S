.syntax unified
.arm
.fpu neon
.text
.balign 8
.global echo_execute
.type echo_execute,%function
echo_execute:
.incbin "native-echo-execute.bin",0,124
bl ceil
.incbin "native-echo-execute.bin",128,876
bl oracle_quantize
.incbin "native-echo-execute.bin",1008,12
bl oracle_time
.incbin "native-echo-execute.bin",1024,192
bl ceil
.incbin "native-echo-execute.bin",1220,52
bl floor
.incbin "native-echo-execute.bin",1276,72
bl floor
.incbin "native-echo-execute.bin",1352,128
.section .note.GNU-stack,"",%progbits
