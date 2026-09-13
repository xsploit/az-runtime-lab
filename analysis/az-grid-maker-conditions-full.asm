
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1dffe10:      	stp	x29, x30, [sp, #-0x110]!
 1dffe14:      	mov	x29, sp
 1dffe18:      	stp	x19, x20, [sp, #0x10]
 1dffe1c:      	mov	x19, x0
 1dffe20:      	mov	w20, w3
 1dffe24:      	stp	x21, x22, [sp, #0x20]
 1dffe28:      	and	w22, w4, #0xff
 1dffe2c:      	adrp	x21, 0x3ba2000 <stdout+0x60f40>
 1dffe30:      	add	x21, x21, #0x510
 1dffe34:      	stp	x23, x24, [sp, #0x30]
 1dffe38:      	mov	x23, x1
 1dffe3c:      	and	w24, w5, #0xff
 1dffe40:      	stp	x25, x26, [sp, #0x40]
 1dffe44:      	mov	w26, w2
 1dffe48:      	stp	x27, x28, [sp, #0x50]
 1dffe4c:      	stp	d8, d9, [sp, #0x60]
 1dffe50:      	fmov	s8, s0
 1dffe54:      	str	d10, [sp, #0x70]
 1dffe58:      	ldarb	w0, [x21]
 1dffe5c:      	tbz	w0, #0x0, 0x1e00498 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600610>
 1dffe60:      	add	x25, x21, #0x10
 1dffe64:      	ldarb	w0, [x25]
 1dffe68:      	tbz	w0, #0x0, 0x1e00410 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600588>
 1dffe6c:      	add	x25, x21, #0x20
 1dffe70:      	ldarb	w0, [x25]
 1dffe74:      	tbz	w0, #0x0, 0x1e0045c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6005d4>
 1dffe78:      	ldar	x0, [x23]
 1dffe7c:      	cbz	x0, 0x1dfff08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600080>
 1dffe80:      	ldar	x1, [x23]
 1dffe84:      	add	x1, x1, #0x28
 1dffe88:      	add	x0, sp, #0xf0
 1dffe8c:      	bl	0xd28c68 <_ZSt20__throw_bad_weak_ptrv+0x41e050>
 1dffe90:      	ldp	x0, x1, [x19, #0x10]
 1dffe94:      	cmp	x0, x1
 1dffe98:      	b.eq	0x1dffea0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600018>
 1dffe9c:      	str	x0, [x19, #0x18]
 1dffea0:      	add	x0, sp, #0xf0
 1dffea4:      	ldar	x0, [x0]
 1dffea8:      	cbz	x0, 0x1dffeb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600030>
 1dffeac:      	add	x0, sp, #0xf0
 1dffeb0:      	ldar	x0, [x0]
 1dffeb4:      	cbnz	x0, 0x1e0059c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600714>
 1dffeb8:      	add	x0, sp, #0xf0
 1dffebc:      	ldar	x1, [x0]
 1dffec0:      	cbz	x1, 0x1dfff08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600080>
 1dffec4:      	ldr	w2, [x1, #0x10]
 1dffec8:      	mov	w0, #0x4f58             // =20312
 1dffecc:      	movk	w0, #0x5243, lsl #16
 1dffed0:      	cmp	w2, w0
 1dffed4:      	b.ne	0x1e00508 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600680>
 1dffed8:      	add	x0, x1, #0xc
 1dffedc:      	ldar	w2, [x0]
 1dffee0:      	cmp	w2, #0x0
 1dffee4:      	b.le	0x1e00928 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600aa0>
 1dffee8:      	ldaxr	w2, [x0]
 1dffeec:      	sub	w2, w2, #0x1
 1dffef0:      	stlxr	w3, w2, [x0]
 1dffef4:      	cbnz	w3, 0x1dffee8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600060>
 1dffef8:      	cbnz	w2, 0x1dfff08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600080>
 1dffefc:      	ldr	x0, [x1, #0x18]
 1dfff00:      	bl	0x22043f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x7c2d8>
 1dfff04:      	nop
 1dfff08:      	add	x22, x21, #0x30
 1dfff0c:      	ldarb	w0, [x22]
 1dfff10:      	tbz	w0, #0x0, 0x1e004c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600638>
 1dfff14:      	mov	x21, x19
 1dfff18:      	ldr	w22, [x21], #0x28
 1dfff1c:      	mov	x0, x21
 1dfff20:      	bl	0x23b1510 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c0f0>
 1dfff24:      	cmp	w22, w0
 1dfff28:      	b.eq	0x1e003fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600574>
 1dfff2c:      	mov	w4, #0x0                // =0
 1dfff30:      	mov	w3, w20
 1dfff34:      	mov	w2, w22
 1dfff38:      	add	x0, sp, #0xf0
 1dfff3c:      	mov	w1, #0x2                // =2
 1dfff40:      	bl	0x23b12e0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bec0>
 1dfff44:      	add	x1, sp, #0xf0
 1dfff48:      	mov	x0, x21
 1dfff4c:      	bl	0x23b14d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c0b0>
 1dfff50:      	add	x0, sp, #0xf0
 1dfff54:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dfff58:      	ldr	x1, [x19, #0x28]
 1dfff5c:      	mov	w4, #0x2                // =2
 1dfff60:      	mov	w3, #0x0                // =0
 1dfff64:      	mov	w2, #0x0                // =0
 1dfff68:      	mov	x0, x1
 1dfff6c:      	ldr	x5, [x1]
 1dfff70:      	add	x1, x19, #0x30
 1dfff74:      	ldr	x5, [x5, #0x28]
 1dfff78:      	stp	w22, w20, [x21, #0x1c]
 1dfff7c:      	blr	x5
 1dfff80:      	ldr	w1, [x21, #0x20]
 1dfff84:      	ldrb	w23, [x19, #0xc]
 1dfff88:      	ldrb	w25, [x19, #0xd]
 1dfff8c:      	cmp	w1, #0x0
 1dfff90:      	ldrb	w26, [x19, #0xe]
 1dfff94:      	ldrb	w27, [x19, #0xf]
 1dfff98:      	ldr	w22, [x19, #0xc]
 1dfff9c:      	b.le	0x1e00750 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6008c8>
 1dfffa0:      	ldr	x0, [x19, #0x30]
 1dfffa4:      	mov	w1, #0x0                // =0
 1dfffa8:      	ldp	x4, x5, [x19, #0x10]
 1dfffac:      	ldr	w3, [x19]
 1dfffb0:      	cmp	x5, x4
 1dfffb4:      	b.eq	0x1e00018 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600190>
 1dfffb8:      	ldr	w2, [x4]
 1dfffbc:      	cmp	w1, w2
 1dfffc0:      	b.ge	0x1e003c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x60053c>
 1dfffc4:      	cmp	w1, w3
 1dfffc8:      	b.lt	0x1dfffd8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600150>
 1dfffcc:      	b	0x1e000d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600248>
 1dfffd0:      	cmp	w1, w3
 1dfffd4:      	b.eq	0x1e000d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600248>
 1dfffd8:      	strb	w23, [x0]
 1dfffdc:      	add	w1, w1, #0x1
 1dfffe0:      	strb	w25, [x0, #0x1]
 1dfffe4:      	cmp	w1, w2
 1dfffe8:      	strb	w26, [x0, #0x2]
 1dfffec:      	add	x0, x0, #0x4
 1dffff0:      	sturb	w27, [x0, #-0x1]
 1dffff4:      	b.ne	0x1dfffd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600148>
 1dffff8:      	cmp	w2, w3
 1dffffc:      	b.ge	0x1e000d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600248>
 1e00000:      	ldr	w1, [x4, #0x4]
 1e00004:      	add	x4, x4, #0xc
 1e00008:      	str	w1, [x0], #0x4
 1e0000c:      	cmp	x5, x4
 1e00010:      	add	w1, w2, #0x1
 1e00014:      	b.ne	0x1dfffb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600130>
 1e00018:      	cmp	w1, w3
 1e0001c:      	b.ge	0x1e000d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600248>
 1e00020:      	sub	w2, w3, #0x1
 1e00024:      	sub	w8, w3, w1
 1e00028:      	sub	w2, w2, w1
 1e0002c:      	cmp	w2, #0x3
 1e00030:      	b.ls	0x1e00098 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600210>
 1e00034:      	dup	v0.16b, w23
 1e00038:      	lsr	w4, w8, #2
 1e0003c:      	mov	x2, x0
 1e00040:      	add	x4, x0, w4, uxtw #4
 1e00044:      	mov	v0.b[1], w25
 1e00048:      	mov	v0.b[2], w26
 1e0004c:      	mov	v0.b[3], w27
 1e00050:      	mov	v0.b[5], w25
 1e00054:      	mov	v0.b[6], w26
 1e00058:      	mov	v0.b[7], w27
 1e0005c:      	mov	v0.b[9], w25
 1e00060:      	mov	v0.b[10], w26
 1e00064:      	mov	v0.b[11], w27
 1e00068:      	mov	v0.b[13], w25
 1e0006c:      	mov	v0.b[14], w26
 1e00070:      	mov	v0.b[15], w27
 1e00074:      	nop
 1e00078:      	str	q0, [x2], #0x10
 1e0007c:      	cmp	x2, x4
 1e00080:      	b.ne	0x1e00078 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6001f0>
 1e00084:      	and	w2, w8, #0xfffffffc
 1e00088:      	add	w1, w1, w2
 1e0008c:      	cmp	w2, w8
 1e00090:      	add	x0, x0, x2, lsl #2
 1e00094:      	b.eq	0x1e000d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600248>
 1e00098:      	str	w22, [x0]
 1e0009c:      	add	w2, w1, #0x1
 1e000a0:      	cmp	w3, w2
 1e000a4:      	b.le	0x1e000d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600248>
 1e000a8:      	str	w22, [x0, #0x4]
 1e000ac:      	add	w2, w1, #0x2
 1e000b0:      	cmp	w3, w2
 1e000b4:      	b.le	0x1e000d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600248>
 1e000b8:      	str	w22, [x0, #0x8]
 1e000bc:      	add	w1, w1, #0x3
 1e000c0:      	cmp	w3, w1
 1e000c4:      	b.le	0x1e000d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600248>
 1e000c8:      	str	w22, [x0, #0xc]
 1e000cc:      	nop
 1e000d0:      	cbz	w24, 0x1e00340 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6004b8>
 1e000d4:      	cmp	w20, #0x6
 1e000d8:      	sub	w24, w20, #0x5
 1e000dc:      	mov	w28, #0x1               // =1
 1e000e0:      	b.le	0x1e0011c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600294>
 1e000e4:      	nop
 1e000e8:      	ldr	w0, [x21, #0x20]
 1e000ec:      	cmp	w0, w28
 1e000f0:      	b.le	0x1e003cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600544>
 1e000f4:      	ldr	w0, [x19, #0x3c]
 1e000f8:      	ldr	x1, [x19, #0x30]
 1e000fc:      	mul	w0, w28, w0
 1e00100:      	add	x0, x1, w0, sxtw
 1e00104:      	ldrsw	x2, [x19]
 1e00108:      	add	w28, w28, #0x1
 1e0010c:      	lsl	x2, x2, #2
 1e00110:      	bl	0x424980 <memcpy@plt>
 1e00114:      	cmp	w28, w24
 1e00118:      	b.ne	0x1e000e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600260>
 1e0011c:      	ldr	w5, [x21, #0x20]
 1e00120:      	sub	w24, w20, #0x6
 1e00124:      	cmp	w24, w5
 1e00128:      	b.ge	0x1e00764 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6008dc>
 1e0012c:      	ldr	w0, [x19, #0x3c]
 1e00130:      	ldr	x1, [x19, #0x30]
 1e00134:      	mul	w0, w24, w0
 1e00138:      	add	x0, x1, w0, sxtw
 1e0013c:      	ldp	x4, x6, [x19, #0x10]
 1e00140:      	mov	w1, #0x0                // =0
 1e00144:      	ldr	w3, [x19]
 1e00148:      	cmp	x6, x4
 1e0014c:      	b.eq	0x1e001bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600334>
 1e00150:      	ldr	w2, [x4]
 1e00154:      	cmp	w1, w2
 1e00158:      	b.ge	0x1e00500 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600678>
 1e0015c:      	cmp	w1, w3
 1e00160:      	b.lt	0x1e00170 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6002e8>
 1e00164:      	b	0x1e00270 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6003e8>
 1e00168:      	cmp	w1, w3
 1e0016c:      	b.eq	0x1e00270 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6003e8>
 1e00170:      	strb	w23, [x0]
 1e00174:      	add	w1, w1, #0x1
 1e00178:      	strb	w25, [x0, #0x1]
 1e0017c:      	cmp	w1, w2
 1e00180:      	strb	w26, [x0, #0x2]
 1e00184:      	add	x0, x0, #0x4
 1e00188:      	sturb	w27, [x0, #-0x1]
 1e0018c:      	b.ne	0x1e00168 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6002e0>
 1e00190:      	cmp	w2, w3
 1e00194:      	b.ge	0x1e00270 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6003e8>
 1e00198:      	ldrb	w1, [x4, #0x8]
 1e0019c:      	cbz	w1, 0x1e003bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600534>
 1e001a0:      	ldr	w1, [x4, #0x4]
 1e001a4:      	str	w1, [x0]
 1e001a8:      	add	x4, x4, #0xc
 1e001ac:      	add	x0, x0, #0x4
 1e001b0:      	cmp	x6, x4
 1e001b4:      	add	w1, w2, #0x1
 1e001b8:      	b.ne	0x1e00150 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6002c8>
 1e001bc:      	cmp	w1, w3
 1e001c0:      	b.ge	0x1e00270 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6003e8>
 1e001c4:      	sub	w2, w3, #0x1
 1e001c8:      	sub	w6, w3, w1
 1e001cc:      	sub	w2, w2, w1
 1e001d0:      	cmp	w2, #0x3
 1e001d4:      	b.ls	0x1e00238 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6003b0>
 1e001d8:      	dup	v0.16b, w23
 1e001dc:      	lsr	w4, w6, #2
 1e001e0:      	mov	x2, x0
 1e001e4:      	add	x4, x0, w4, uxtw #4
 1e001e8:      	mov	v0.b[1], w25
 1e001ec:      	mov	v0.b[2], w26
 1e001f0:      	mov	v0.b[3], w27
 1e001f4:      	mov	v0.b[5], w25
 1e001f8:      	mov	v0.b[6], w26
 1e001fc:      	mov	v0.b[7], w27
 1e00200:      	mov	v0.b[9], w25
 1e00204:      	mov	v0.b[10], w26
 1e00208:      	mov	v0.b[11], w27
 1e0020c:      	mov	v0.b[13], w25
 1e00210:      	mov	v0.b[14], w26
 1e00214:      	mov	v0.b[15], w27
 1e00218:      	str	q0, [x2], #0x10
 1e0021c:      	cmp	x2, x4
 1e00220:      	b.ne	0x1e00218 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600390>
 1e00224:      	and	w2, w6, #0xfffffffc
 1e00228:      	add	w1, w1, w2
 1e0022c:      	cmp	w6, w2
 1e00230:      	add	x0, x0, x2, lsl #2
 1e00234:      	b.eq	0x1e00270 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6003e8>
 1e00238:      	str	w22, [x0]
 1e0023c:      	add	w2, w1, #0x1
 1e00240:      	cmp	w2, w3
 1e00244:      	b.ge	0x1e00270 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6003e8>
 1e00248:      	str	w22, [x0, #0x4]
 1e0024c:      	add	w2, w1, #0x2
 1e00250:      	cmp	w2, w3
 1e00254:      	b.ge	0x1e00270 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6003e8>
 1e00258:      	str	w22, [x0, #0x8]
 1e0025c:      	add	w1, w1, #0x3
 1e00260:      	cmp	w1, w3
 1e00264:      	b.ge	0x1e00270 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6003e8>
 1e00268:      	str	w22, [x0, #0xc]
 1e0026c:      	nop
 1e00270:      	mov	w23, w24
 1e00274:      	cmp	w23, w5
 1e00278:      	b.ge	0x1e002d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600448>
 1e0027c:      	nop
 1e00280:      	ldr	w22, [x19, #0x3c]
 1e00284:      	cmp	w24, w5
 1e00288:      	ldr	x0, [x19, #0x30]
 1e0028c:      	mul	w22, w23, w22
 1e00290:      	add	x22, x0, w22, sxtw
 1e00294:      	b.ge	0x1e002ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600464>
 1e00298:      	ldr	w1, [x19, #0x3c]
 1e0029c:      	mov	x0, x22
 1e002a0:      	ldr	x3, [x19, #0x30]
 1e002a4:      	add	w23, w23, #0x1
 1e002a8:      	ldrsw	x2, [x19]
 1e002ac:      	mul	w1, w24, w1
 1e002b0:      	lsl	x2, x2, #2
 1e002b4:      	add	x1, x3, w1, sxtw
 1e002b8:      	bl	0x424980 <memcpy@plt>
 1e002bc:      	cmp	w20, w23
 1e002c0:      	b.eq	0x1e00318 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600490>
 1e002c4:      	ldr	w5, [x21, #0x20]
 1e002c8:      	cmp	w23, w5
 1e002cc:      	b.lt	0x1e00280 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6003f8>
 1e002d0:      	mov	x1, #0x0                // =0
 1e002d4:      	mov	w0, #0x0                // =0
 1e002d8:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1e002dc:      	mov	x22, #0x0               // =0
 1e002e0:      	ldr	w5, [x21, #0x20]
 1e002e4:      	cmp	w24, w5
 1e002e8:      	b.lt	0x1e00298 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600410>
 1e002ec:      	mov	x1, #0x0                // =0
 1e002f0:      	mov	w0, #0x0                // =0
 1e002f4:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1e002f8:      	add	w23, w23, #0x1
 1e002fc:      	ldrsw	x2, [x19]
 1e00300:      	mov	x0, x22
 1e00304:      	mov	x1, #0x0                // =0
 1e00308:      	lsl	x2, x2, #2
 1e0030c:      	bl	0x424980 <memcpy@plt>
 1e00310:      	cmp	w20, w23
 1e00314:      	b.ne	0x1e002c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x60043c>
 1e00318:      	mov	x0, x21
 1e0031c:      	ldr	d10, [sp, #0x70]
 1e00320:      	ldp	x19, x20, [sp, #0x10]
 1e00324:      	ldp	x21, x22, [sp, #0x20]
 1e00328:      	ldp	x23, x24, [sp, #0x30]
 1e0032c:      	ldp	x25, x26, [sp, #0x40]
 1e00330:      	ldp	x27, x28, [sp, #0x50]
 1e00334:      	ldp	d8, d9, [sp, #0x60]
 1e00338:      	ldp	x29, x30, [sp], #0x110
 1e0033c:      	ret
 1e00340:      	cmp	w20, #0x1
 1e00344:      	b.le	0x1e00318 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600490>
 1e00348:      	ldr	w0, [x21, #0x20]
 1e0034c:      	mov	w22, #0x1               // =1
 1e00350:      	cmp	w0, w22
 1e00354:      	b.le	0x1e0038c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600504>
 1e00358:      	ldr	w0, [x19, #0x3c]
 1e0035c:      	ldr	x1, [x19, #0x30]
 1e00360:      	mul	w0, w22, w0
 1e00364:      	add	x0, x1, w0, sxtw
 1e00368:      	ldrsw	x2, [x19]
 1e0036c:      	add	w22, w22, #0x1
 1e00370:      	lsl	x2, x2, #2
 1e00374:      	bl	0x424980 <memcpy@plt>
 1e00378:      	cmp	w20, w22
 1e0037c:      	b.eq	0x1e00318 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600490>
 1e00380:      	ldr	w0, [x21, #0x20]
 1e00384:      	cmp	w0, w22
 1e00388:      	b.gt	0x1e00358 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6004d0>
 1e0038c:      	mov	w0, #0x0                // =0
 1e00390:      	mov	x1, #0x0                // =0
 1e00394:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1e00398:      	ldr	w0, [x21, #0x20]
 1e0039c:      	cmp	w0, #0x0
 1e003a0:      	b.gt	0x1e00a60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600bd8>
 1e003a4:      	mov	x1, #0x0                // =0
 1e003a8:      	mov	w0, #0x0                // =0
 1e003ac:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1e003b0:      	mov	x0, #0x0                // =0
 1e003b4:      	mov	x1, #0x0                // =0
 1e003b8:      	b	0x1e00368 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6004e0>
 1e003bc:      	str	w22, [x0]
 1e003c0:      	b	0x1e001a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600320>
 1e003c4:      	mov	w2, w1
 1e003c8:      	b	0x1dffff8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600170>
 1e003cc:      	mov	w0, #0x0                // =0
 1e003d0:      	mov	x1, #0x0                // =0
 1e003d4:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1e003d8:      	ldr	w0, [x21, #0x20]
 1e003dc:      	cmp	w0, #0x0
 1e003e0:      	b.gt	0x1e00a54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600bcc>
 1e003e4:      	mov	x1, #0x0                // =0
 1e003e8:      	mov	w0, #0x0                // =0
 1e003ec:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1e003f0:      	mov	x0, #0x0                // =0
 1e003f4:      	mov	x1, #0x0                // =0
 1e003f8:      	b	0x1e00104 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x60027c>
 1e003fc:      	mov	x0, x21
 1e00400:      	bl	0x23b1530 <_ZNSt8functionIFvvEEC2ERKS1_+0x3c110>
 1e00404:      	cmp	w20, w0
 1e00408:      	b.ne	0x1dfff2c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6000a4>
 1e0040c:      	b	0x1dfff80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6000f8>
 1e00410:      	mov	x0, x25
 1e00414:      	bl	0x426260 <__cxa_guard_acquire@plt>
 1e00418:      	cbz	w0, 0x1dffe6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5fffe4>
 1e0041c:      	mov	w0, #0x6666             // =26214
 1e00420:      	add	x8, sp, #0xf0
 1e00424:      	movk	w0, #0x3f26, lsl #16
 1e00428:      	fmov	s0, w0
 1e0042c:      	adrp	x0, 0x3bd7000 <stdout+0x95f40>
 1e00430:      	add	x0, x0, #0x950
 1e00434:      	bl	0x23a5950 <_ZNSt8functionIFvvEEC2ERKS1_+0x30530>
 1e00438:      	ldr	w1, [sp, #0xf0]
 1e0043c:      	mov	x0, x25
 1e00440:      	str	w1, [x21, #0x18]
 1e00444:      	add	x25, x21, #0x20
 1e00448:      	bl	0x426840 <__cxa_guard_release@plt>
 1e0044c:      	add	x0, sp, #0xf0
 1e00450:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e00454:      	ldarb	w0, [x25]
 1e00458:      	tbnz	w0, #0x0, 0x1dffe78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ffff0>
 1e0045c:      	mov	x0, x25
 1e00460:      	bl	0x426260 <__cxa_guard_acquire@plt>
 1e00464:      	cbz	w0, 0x1dffe78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ffff0>
 1e00468:      	mov	w3, #-0x8               // =-8
 1e0046c:      	mov	w2, #-0x48              // =-72
 1e00470:      	add	x0, sp, #0xf0
 1e00474:      	mov	w1, #0x20               // =32
 1e00478:      	bl	0x23a5080 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc60>
 1e0047c:      	ldr	w1, [sp, #0xf0]
 1e00480:      	mov	x0, x25
 1e00484:      	str	w1, [x21, #0x28]
 1e00488:      	bl	0x426840 <__cxa_guard_release@plt>
 1e0048c:      	add	x0, sp, #0xf0
 1e00490:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e00494:      	b	0x1dffe78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ffff0>
 1e00498:      	mov	x0, x21
 1e0049c:      	bl	0x426260 <__cxa_guard_acquire@plt>
 1e004a0:      	cbz	w0, 0x1dffe60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5fffd8>
 1e004a4:      	adrp	x1, 0x3bd7000 <stdout+0x95f40>
 1e004a8:      	add	x1, x1, #0xd40
 1e004ac:      	mov	x0, x21
 1e004b0:      	ldr	w1, [x1]
 1e004b4:      	str	w1, [x21, #0x8]
 1e004b8:      	bl	0x426840 <__cxa_guard_release@plt>
 1e004bc:      	b	0x1dffe60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5fffd8>
 1e004c0:      	mov	x0, x22
 1e004c4:      	bl	0x426260 <__cxa_guard_acquire@plt>
 1e004c8:      	cbz	w0, 0x1dfff14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x60008c>
 1e004cc:      	mov	w1, #0x7f000000         // =2130706432
 1e004d0:      	add	x21, x21, #0x38
 1e004d4:      	mov	x0, x21
 1e004d8:      	bl	0x23a5070 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc50>
 1e004dc:      	mov	x0, x22
 1e004e0:      	bl	0x426840 <__cxa_guard_release@plt>
 1e004e4:      	mov	x1, x21
 1e004e8:      	adrp	x2, 0x3b26000
 1e004ec:      	adrp	x0, 0x239f000 <_ZNSt8functionIFvvEEC2ERKS1_+0x29be0>
 1e004f0:      	add	x2, x2, #0xd68
 1e004f4:      	add	x0, x0, #0xef0
 1e004f8:      	bl	0x426eb0 <__cxa_atexit@plt>
 1e004fc:      	b	0x1dfff14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x60008c>
 1e00500:      	mov	w2, w1
 1e00504:      	b	0x1e00190 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600308>
 1e00508:      	add	x0, sp, #0xc0
 1e0050c:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1e00510:      	add	x1, x1, #0xd70
 1e00514:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1e00518:      	add	x0, sp, #0xc0
 1e0051c:      	add	x8, sp, #0xc8
 1e00520:      	adrp	x1, 0x2d99000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7d61a8>
 1e00524:      	add	x1, x1, #0x310
 1e00528:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1e0052c:      	add	x8, sp, #0xd0
 1e00530:      	add	x0, sp, #0xc8
 1e00534:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1e00538:      	add	x1, x1, #0xd38
 1e0053c:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1e00540:      	add	x0, sp, #0xb8
 1e00544:      	adrp	x1, 0x25cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xc1a8>
 1e00548:      	add	x1, x1, #0x870
 1e0054c:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1e00550:      	add	x8, sp, #0xd8
 1e00554:      	add	x1, sp, #0xb8
 1e00558:      	add	x0, sp, #0xd0
 1e0055c:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
 1e00560:      	mov	w2, #0x1                // =1
 1e00564:      	mov	w1, w2
 1e00568:      	add	x0, sp, #0xd8
 1e0056c:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
 1e00570:      	add	x0, sp, #0xd8
 1e00574:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e00578:      	add	x0, sp, #0xb8
 1e0057c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e00580:      	add	x0, sp, #0xd0
 1e00584:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e00588:      	add	x0, sp, #0xc8
 1e0058c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e00590:      	add	x0, sp, #0xc0
 1e00594:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e00598:      	b	0x1dfff08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600080>
 1e0059c:      	add	x0, sp, #0xf0
 1e005a0:      	ldar	x23, [x0]
 1e005a4:      	cbz	x23, 0x1e009bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600b34>
 1e005a8:      	ldr	w0, [x23, #0x30]
 1e005ac:      	cbz	w0, 0x1dffeb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600030>
 1e005b0:      	ldr	s1, [x19]
 1e005b4:      	scvtf	s3, w26
 1e005b8:      	adrp	x0, 0x287a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2b71a8>
 1e005bc:      	ldr	w1, [sp, #0x108]
 1e005c0:      	str	w1, [sp, #0x88]
 1e005c4:      	movi	d0, #0000000000000000
 1e005c8:      	ldr	d6, [x0, #0x420]
 1e005cc:      	mov	x0, #0x400000000000     // =70368744177664
 1e005d0:      	scvtf	s1, s1
 1e005d4:      	scvtf	d5, w1
 1e005d8:      	fdiv	s3, s3, s8
 1e005dc:      	movk	x0, #0x408f, lsl #48
 1e005e0:      	fmov	d4, x0
 1e005e4:      	add	x0, sp, #0xf0
 1e005e8:      	fdiv	s1, s1, s8
 1e005ec:      	fcvt	d2, s3
 1e005f0:      	fadd	s1, s1, s3
 1e005f4:      	fmul	d2, d2, d6
 1e005f8:      	fcvt	d1, s1
 1e005fc:      	fmul	d2, d2, d5
 1e00600:      	fmul	d1, d1, d6
 1e00604:      	fdiv	d2, d2, d4
 1e00608:      	fmul	d1, d1, d5
 1e0060c:      	fdiv	d1, d1, d4
 1e00610:      	fcvtzs	x1, d2
 1e00614:      	fcvtzs	d1, d1
 1e00618:      	str	d1, [sp, #0x80]
 1e0061c:      	bl	0xd29f88 <_ZSt20__throw_bad_weak_ptrv+0x41f370>
 1e00620:      	cmp	w0, #0x0
 1e00624:      	csel	w23, w0, wzr, ge
 1e00628:      	add	x0, sp, #0xf0
 1e0062c:      	ldar	x0, [x0]
 1e00630:      	mov	w27, #0x0               // =0
 1e00634:      	cbnz	x0, 0x1e007a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600918>
 1e00638:      	cbnz	w22, 0x1e0077c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6008f4>
 1e0063c:      	ldrb	w0, [x21, #0x18]
 1e00640:      	str	w0, [sp, #0x9c]
 1e00644:      	ldrb	w0, [x21, #0x19]
 1e00648:      	str	w0, [sp, #0x94]
 1e0064c:      	ldrb	w0, [x21, #0x1a]
 1e00650:      	str	w0, [sp, #0x98]
 1e00654:      	ldrb	w0, [x21, #0x1b]
 1e00658:      	str	w0, [sp, #0x90]
 1e0065c:      	str	wzr, [sp, #0x8c]
 1e00660:      	cmp	w23, w27
 1e00664:      	add	x28, x19, #0x10
 1e00668:      	sxtw	x25, w23
 1e0066c:      	b.ge	0x1dffeb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600030>
 1e00670:      	mov	w1, #0xc28f             // =49807
 1e00674:      	mov	w0, #0x43160000         // =1125515264
 1e00678:      	movk	w1, #0x3e75, lsl #16
 1e0067c:      	fmov	s10, w0
 1e00680:      	fmov	s9, w1
 1e00684:      	mov	w1, w23
 1e00688:      	add	x0, sp, #0xf0
 1e0068c:      	bl	0xd29de0 <_ZSt20__throw_bad_weak_ptrv+0x41f1c8>
 1e00690:      	mov	x22, x0
 1e00694:      	ldr	x0, [sp, #0x80]
 1e00698:      	cmp	x22, x0
 1e0069c:      	b.ge	0x1dffeb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600030>
 1e006a0:      	mov	w1, w23
 1e006a4:      	add	x0, sp, #0xf0
 1e006a8:      	bl	0xd2c100 <_ZSt20__throw_bad_weak_ptrv+0x4214e8>
 1e006ac:      	fcmpe	s8, s9
 1e006b0:      	b.gt	0x1e00854 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6009cc>
 1e006b4:      	cbnz	w0, 0x1e0073c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6008b4>
 1e006b8:      	cbnz	w24, 0x1e00870 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6009e8>
 1e006bc:      	ldrb	w6, [x21, #0x8]
 1e006c0:      	mov	w2, #0x1                // =1
 1e006c4:      	ldrb	w5, [x21, #0x9]
 1e006c8:      	ldrb	w4, [x21, #0xa]
 1e006cc:      	ldrb	w3, [x21, #0xb]
 1e006d0:      	ldr	s0, [sp, #0x88]
 1e006d4:      	scvtf	s1, x22
 1e006d8:      	ldr	w1, [x19]
 1e006dc:      	scvtf	s0, s0
 1e006e0:      	fdiv	s0, s1, s0
 1e006e4:      	fmul	s0, s0, s10
 1e006e8:      	fmul	s0, s0, s8
 1e006ec:      	fcvtzs	w0, s0
 1e006f0:      	sub	w0, w0, w26
 1e006f4:      	cmp	w1, w0
 1e006f8:      	b.le	0x1e0073c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6008b4>
 1e006fc:      	str	w0, [sp, #0xd8]
 1e00700:      	ldr	x1, [x28, #0x8]
 1e00704:      	strb	w6, [sp, #0xdc]
 1e00708:      	ldr	x0, [x28, #0x10]
 1e0070c:      	strb	w5, [sp, #0xdd]
 1e00710:      	strb	w4, [sp, #0xde]
 1e00714:      	strb	w3, [sp, #0xdf]
 1e00718:      	cmp	x1, x0
 1e0071c:      	strb	w2, [sp, #0xe0]
 1e00720:      	b.eq	0x1e00918 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600a90>
 1e00724:      	ldr	x0, [sp, #0xd8]
 1e00728:      	str	x0, [x1]
 1e0072c:      	add	x0, x1, #0xc
 1e00730:      	ldr	w2, [sp, #0xe0]
 1e00734:      	str	w2, [x1, #0x8]
 1e00738:      	str	x0, [x28, #0x8]
 1e0073c:      	add	w23, w23, #0x1
 1e00740:      	add	x25, x25, #0x1
 1e00744:      	cmp	w23, w27
 1e00748:      	b.ne	0x1e00684 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6007fc>
 1e0074c:      	b	0x1dffeb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600030>
 1e00750:      	mov	w0, #0x0                // =0
 1e00754:      	mov	x1, #0x0                // =0
 1e00758:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1e0075c:      	mov	x0, #0x0                // =0
 1e00760:      	b	0x1dfffa4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x60011c>
 1e00764:      	mov	w0, #0x0                // =0
 1e00768:      	mov	x1, #0x0                // =0
 1e0076c:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1e00770:      	mov	x0, #0x0                // =0
 1e00774:      	ldr	w5, [x21, #0x20]
 1e00778:      	b	0x1e0013c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6002b4>
 1e0077c:      	ldrb	w0, [x21, #0x28]
 1e00780:      	str	w0, [sp, #0x9c]
 1e00784:      	ldrb	w0, [x21, #0x29]
 1e00788:      	str	w0, [sp, #0x94]
 1e0078c:      	ldrb	w0, [x21, #0x2a]
 1e00790:      	str	w0, [sp, #0x98]
 1e00794:      	ldrb	w0, [x21, #0x2b]
 1e00798:      	str	w0, [sp, #0x90]
 1e0079c:      	b	0x1e0065c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6007d4>
 1e007a0:      	add	x0, sp, #0xf0
 1e007a4:      	ldar	x25, [x0]
 1e007a8:      	cbz	x25, 0x1e007b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600930>
 1e007ac:      	ldr	w27, [x25, #0x30]
 1e007b0:      	cbz	w22, 0x1e0063c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6007b4>
 1e007b4:      	b	0x1e0077c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6008f4>
 1e007b8:      	add	x0, sp, #0xd0
 1e007bc:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1e007c0:      	add	x1, x1, #0xd70
 1e007c4:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1e007c8:      	adrp	x1, 0x2d99000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7d61a8>
 1e007cc:      	add	x1, x1, #0x310
 1e007d0:      	add	x1, x1, #0x40
 1e007d4:      	add	x0, sp, #0xd0
 1e007d8:      	add	x8, sp, #0xc8
 1e007dc:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1e007e0:      	add	x8, sp, #0xc0
 1e007e4:      	add	x0, sp, #0xc8
 1e007e8:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1e007ec:      	add	x1, x1, #0xd38
 1e007f0:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1e007f4:      	add	x0, sp, #0xd8
 1e007f8:      	adrp	x1, 0x25cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xc1a8>
 1e007fc:      	add	x1, x1, #0x988
 1e00800:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1e00804:      	add	x8, sp, #0xb8
 1e00808:      	add	x1, sp, #0xd8
 1e0080c:      	add	x0, sp, #0xc0
 1e00810:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
 1e00814:      	mov	w2, #0x1                // =1
 1e00818:      	mov	w1, w2
 1e0081c:      	add	x0, sp, #0xb8
 1e00820:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
 1e00824:      	add	x0, sp, #0xb8
 1e00828:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e0082c:      	add	x0, sp, #0xd8
 1e00830:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e00834:      	add	x0, sp, #0xc0
 1e00838:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e0083c:      	add	x0, sp, #0xc8
 1e00840:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e00844:      	add	x0, sp, #0xd0
 1e00848:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e0084c:      	ldr	w27, [x25, #0x30]
 1e00850:      	b	0x1e007b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600928>
 1e00854:      	cbz	w0, 0x1e006b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600830>
 1e00858:      	mov	w2, #0x0                // =0
 1e0085c:      	cbnz	w24, 0x1e008dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600a54>
 1e00860:      	mov	w2, #0x1                // =1
 1e00864:      	ldp	w3, w5, [sp, #0x90]
 1e00868:      	ldp	w4, w6, [sp, #0x98]
 1e0086c:      	b	0x1e006d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600848>
 1e00870:      	ldr	w0, [sp, #0x8c]
 1e00874:      	cbnz	w0, 0x1e008d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600a50>
 1e00878:      	ldr	x1, [x19, #0x68]
 1e0087c:      	add	x8, sp, #0xd8
 1e00880:      	mov	x0, x1
 1e00884:      	ldr	x1, [x1]
 1e00888:      	ldr	x1, [x1, #0x18]
 1e0088c:      	blr	x1
 1e00890:      	ldp	x0, x1, [sp, #0xd8]
 1e00894:      	sub	x1, x1, x0
 1e00898:      	asr	x1, x1, #3
 1e0089c:      	cmp	x1, #0x0
 1e008a0:      	ccmp	x1, x25, #0x0, ne
 1e008a4:      	b.hs	0x1e008f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600a68>
 1e008a8:      	ldrb	w6, [x21, #0x18]
 1e008ac:      	ldrb	w5, [x21, #0x19]
 1e008b0:      	ldrb	w4, [x21, #0x1a]
 1e008b4:      	ldrb	w3, [x21, #0x1b]
 1e008b8:      	cbz	x0, 0x1e008d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600a48>
 1e008bc:      	stp	w3, w4, [sp, #0xa0]
 1e008c0:      	stp	w6, w5, [sp, #0xa8]
 1e008c4:      	bl	0x424e50 <_ZdlPv@plt>
 1e008c8:      	ldp	w3, w4, [sp, #0xa0]
 1e008cc:      	ldp	w6, w5, [sp, #0xa8]
 1e008d0:      	mov	w2, w24
 1e008d4:      	b	0x1e006d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600848>
 1e008d8:      	ldr	w2, [sp, #0x8c]
 1e008dc:      	ldrb	w6, [x21, #0x18]
 1e008e0:      	ldrb	w5, [x21, #0x19]
 1e008e4:      	ldrb	w4, [x21, #0x1a]
 1e008e8:      	ldrb	w3, [x21, #0x1b]
 1e008ec:      	b	0x1e006d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600848>
 1e008f0:      	lsl	x1, x25, #3
 1e008f4:      	ldrb	w1, [x0, x1]
 1e008f8:      	cmp	w1, #0x1
 1e008fc:      	b.ne	0x1e008a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600a20>
 1e00900:      	ldrb	w6, [x21, #0x8]
 1e00904:      	ldrb	w5, [x21, #0x9]
 1e00908:      	ldrb	w4, [x21, #0xa]
 1e0090c:      	ldrb	w3, [x21, #0xb]
 1e00910:      	str	w24, [sp, #0x8c]
 1e00914:      	b	0x1e008b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600a30>
 1e00918:      	add	x2, sp, #0xd8
 1e0091c:      	mov	x0, x28
 1e00920:      	bl	0x1e00a80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600bf8>
 1e00924:      	b	0x1e0073c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6008b4>
 1e00928:      	add	x0, sp, #0xd0
 1e0092c:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1e00930:      	add	x1, x1, #0xd70
 1e00934:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1e00938:      	add	x0, sp, #0xd0
 1e0093c:      	add	x8, sp, #0xc8
 1e00940:      	adrp	x1, 0x2d99000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7d61a8>
 1e00944:      	add	x1, x1, #0x310
 1e00948:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1e0094c:      	add	x8, sp, #0xc0
 1e00950:      	add	x0, sp, #0xc8
 1e00954:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1e00958:      	add	x1, x1, #0xd38
 1e0095c:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1e00960:      	add	x0, sp, #0xd8
 1e00964:      	adrp	x1, 0x25cf000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xc1a8>
 1e00968:      	add	x1, x1, #0x838
 1e0096c:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1e00970:      	add	x8, sp, #0xb8
 1e00974:      	add	x1, sp, #0xd8
 1e00978:      	add	x0, sp, #0xc0
 1e0097c:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
 1e00980:      	mov	w2, #0x1                // =1
 1e00984:      	mov	w1, w2
 1e00988:      	add	x0, sp, #0xb8
 1e0098c:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
 1e00990:      	add	x0, sp, #0xb8
 1e00994:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e00998:      	add	x0, sp, #0xd8
 1e0099c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e009a0:      	add	x0, sp, #0xc0
 1e009a4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e009a8:      	add	x0, sp, #0xc8
 1e009ac:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e009b0:      	add	x0, sp, #0xd0
 1e009b4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e009b8:      	b	0x1dfff08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x600080>
 1e009bc:      	add	x0, sp, #0xd0
