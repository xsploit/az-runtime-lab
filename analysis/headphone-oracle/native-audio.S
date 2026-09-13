.syntax unified
.arm
.fpu neon
.text
.balign 8
.global native_audio
.type native_audio,%function
native_audio:
.incbin "native-audio.bin",0,80
bl fixture_output
.incbin "native-audio.bin",84
.section .note.GNU-stack,"",%progbits
