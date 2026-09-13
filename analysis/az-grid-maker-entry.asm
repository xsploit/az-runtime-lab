
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
