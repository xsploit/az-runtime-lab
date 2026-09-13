.syntax unified
.arm
.fpu neon
.text
.balign 8
.space 4
.global native_sweep_parameters
.type native_sweep_parameters,%function
native_sweep_parameters:
.incbin "native-sweep-native_sweep_parameters.bin",0,884
.word sweep_hpf_endpoint
.word sweep_lpf_endpoint
.incbin "native-sweep-native_sweep_parameters.bin",892,708
.balign 4
.global sweep_hpf_endpoint
sweep_hpf_endpoint:
.incbin "native-sweep-sweep_hpf_endpoint.bin"
.balign 4
.global sweep_lpf_endpoint
sweep_lpf_endpoint:
.incbin "native-sweep-sweep_lpf_endpoint.bin"
.section .note.GNU-stack,"",%progbits
