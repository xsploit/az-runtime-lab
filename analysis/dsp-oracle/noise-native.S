.syntax unified
.arm
.fpu neon
.text
.balign 8
.global native_noise_color
.type native_noise_color,%function
native_noise_color:
.incbin "native-noise-native_noise_color.bin",0,36
.balign 8
.space 4
.global native_noise_core
.type native_noise_core,%function
native_noise_core:
.incbin "native-noise-native_noise_core.bin",0,212
bl powf
.incbin "native-noise-native_noise_core.bin",216,192
bl powf
.incbin "native-noise-native_noise_core.bin",412,44
bl powf
.incbin "native-noise-native_noise_core.bin",460,1124
bl abort
.incbin "native-noise-native_noise_core.bin",1588,4
bl abort
.incbin "native-noise-native_noise_core.bin",1596,940
bl abort
.incbin "native-noise-native_noise_core.bin",2540,32
.global native_noise_init
.set native_noise_init,native_noise_core+1532
.global native_noise_execute
.set native_noise_execute,native_noise_core+1752
.global native_noise_coeff
.set native_noise_coeff,native_noise_core+168
.section .note.GNU-stack,"",%progbits
