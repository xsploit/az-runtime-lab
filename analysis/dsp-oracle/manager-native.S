.syntax unified
.arm
.fpu neon
.text
.balign 8
.global manager_native
manager_native:
.incbin "native-manager.bin",0,308
.word manager_native+724
.word manager_native+952
.word manager_native+1140
.word manager_native+604
.incbin "native-manager.bin",324,580
.word manager_native+1824
.word manager_native+1800
.word manager_native+1792
.word manager_native+1784
.word manager_native+1776
.word manager_native+1768
.word manager_native+324
.incbin "native-manager.bin",932,12
.word manager_ones
.incbin "native-manager.bin",948,164
.word manager_native+1696
.word manager_native+1688
.word manager_native+1680
.word manager_native+1672
.word manager_native+1664
.word manager_native+1656
.word manager_native+1400
.incbin "native-manager.bin",1140,412
.word manager_native+1580
.word manager_native+1752
.word manager_native+1744
.word manager_native+1736
.word manager_native+1728
.word manager_native+1720
.word manager_native+1760
.incbin "native-manager.bin",1580,572
.word manager_ones
.global manager_native_set_type
manager_native_set_type:
.incbin "native-manager-settype.bin"
.section .rodata
.balign 8
manager_ones:
.float 1.0,1.0
.section .note.GNU-stack,"",%progbits
