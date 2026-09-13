.syntax unified
.arm
.fpu neon
.text
.balign 8
.global native_sweep_gate_process
.type native_sweep_gate_process,%function
native_sweep_gate_process:
.incbin "native-sweep-native_sweep_gate_process.bin"
.balign 8
.global native_sweep_gate_parameters
.type native_sweep_gate_parameters,%function
native_sweep_gate_parameters:
.incbin "native-sweep-native_sweep_gate_parameters.bin"
.balign 8
.global native_sweep_prepare_gain
.type native_sweep_prepare_gain,%function
native_sweep_prepare_gain:
.incbin "native-sweep-native_sweep_prepare_gain.bin"
.section .note.GNU-stack,"",%progbits
