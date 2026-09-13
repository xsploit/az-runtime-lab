.syntax unified
.arm
.fpu neon
.text
.balign 8
.global native_ctor
.type native_ctor,%function
native_ctor:
.incbin "native-ctor.bin",0,20
bl native_base
.incbin "native-ctor.bin",24,32
bl fixture_string
.incbin "native-ctor.bin",60,132
bl fixture_string
.incbin "native-ctor.bin",196,16
bl fixture_string
.incbin "native-ctor.bin",216,96
bl fixture_string
.incbin "native-ctor.bin",316,8
bl fixture_string
.incbin "native-ctor.bin",328,96
bl fixture_string
.incbin "native-ctor.bin",428,16
bl fixture_string
.incbin "native-ctor.bin",448,104
bl fixture_string
.incbin "native-ctor.bin",556,20
bl fixture_string
.incbin "native-ctor.bin",580,112
bl fixture_string
.incbin "native-ctor.bin",696,28
bl fixture_exception
.incbin "native-ctor.bin",728,0
bl fixture_exception
.incbin "native-ctor.bin",732
.balign 4
native_base:
.incbin "native-base.bin"
.section .note.GNU-stack,"",%progbits
