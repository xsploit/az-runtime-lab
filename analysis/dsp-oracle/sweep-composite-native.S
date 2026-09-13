.syntax unified
.arm
.fpu neon
.text
.balign 8
.global native_sweep_core
native_sweep_core:
.incbin "native-sweep-composite.bin",0,740
bl abort
.incbin "native-sweep-composite.bin",744,888
bl abort
.incbin "native-sweep-composite.bin",1636,1284
.word sweep_hpf_endpoint
.word sweep_lpf_endpoint
.incbin "native-sweep-composite.bin",2928,900
bl abort
.incbin "native-sweep-composite.bin",3832,4
bl abort
.incbin "native-sweep-composite.bin",3840,52
bl abort
.incbin "native-sweep-composite.bin",3896,4
bl abort
.incbin "native-sweep-composite.bin",3904,52
bl abort
.incbin "native-sweep-composite.bin",3960,4
bl abort
.incbin "native-sweep-composite.bin",3968,28
bl abort
.incbin "native-sweep-composite.bin",4000,4
bl abort
.incbin "native-sweep-composite.bin",4008,376
.word sweep_lpf_endpoint
.word sweep_hpf_endpoint
.incbin "native-sweep-composite.bin",4392,580
.word sweep_ones
.global native_sweep_init
.set native_sweep_init,native_sweep_core+3744
.global native_sweep_execute
.set native_sweep_execute,native_sweep_core+4392
.global native_sweep_detect
.set native_sweep_detect,native_sweep_core+852
.balign 4
.global sweep_hpf_endpoint
sweep_hpf_endpoint:
.incbin "native-sweep-sweep_hpf_endpoint.bin"
.balign 4
.global sweep_lpf_endpoint
sweep_lpf_endpoint:
.incbin "native-sweep-sweep_lpf_endpoint.bin"
.balign 4
.global sweep_detector_lpf
sweep_detector_lpf:
.incbin "native-sweep-sweep_detector_lpf.bin"
.balign 4
.global sweep_detector_hpf
sweep_detector_hpf:
.incbin "native-sweep-sweep_detector_hpf.bin"
.balign 8
sweep_ones:.float 1,1
.section .note.GNU-stack,"",%progbits
