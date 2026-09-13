
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1e01170:      	mov	w2, #0x0                // =0
 1e01174:      	mov	x0, x22
 1e01178:      	sdiv	w3, w3, w25
 1e0117c:      	strb	w3, [sp, #0x157]
 1e01180:      	ldr	x3, [x4, #0x30]
 1e01184:      	blr	x3
 1e01188:      	ldr	x20, [sp, #0xb8]
 1e0118c:      	add	x0, sp, #0x101
 1e01190:      	ldrb	w2, [sp, #0x128]
 1e01194:      	mov	x1, x20
 1e01198:      	strb	w2, [sp, #0x100]
 1e0119c:      	bl	0x23a5020 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc00>
 1e011a0:      	mov	x0, x20
 1e011a4:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1e011a8:      	ldrb	w0, [sp, #0x100]
 1e011ac:      	add	x2, sp, #0x200
 1e011b0:      	ldrb	w1, [sp, #0x103]
 1e011b4:      	sub	x6, x23, #0x1c
 1e011b8:      	strb	w1, [sp, #0x15a]
 1e011bc:      	add	x20, sp, #0x150
 1e011c0:      	ldurh	w2, [x2, #-0xff]
 1e011c4:      	add	x8, sp, #0x143
 1e011c8:      	mul	w0, w0, w24
 1e011cc:      	strh	w2, [sp, #0x158]
 1e011d0:      	add	x18, sp, #0x142
 1e011d4:      	add	x17, sp, #0x141
 1e011d8:      	add	x16, sp, #0x152
 1e011dc:      	add	x15, sp, #0x151
 1e011e0:      	add	x11, sp, #0x153
 1e011e4:      	mov	w4, #0x0                // =0
 1e011e8:      	sdiv	w0, w0, w25
 1e011ec:      	mov	w5, #0x0                // =0
 1e011f0:      	mov	w24, #0x3               // =3
 1e011f4:      	mov	x30, #0x3               // =3
 1e011f8:      	mov	w13, #0x62              // =98
 1e011fc:      	mov	w12, #0x3e80            // =16000
 1e01200:      	mov	w14, #0x64              // =100
 1e01204:      	str	x22, [sp, #0xa0]
 1e01208:      	ands	w0, w0, #0xff
 1e0120c:      	csinc	w0, w0, wzr, ne
 1e01210:      	strb	w0, [sp, #0x15b]
 1e01214:      	ldr	x0, [sp, #0x80]
 1e01218:      	ldr	x22, [sp, #0xa8]
 1e0121c:      	ldrb	w1, [x0, #0x1]
 1e01220:      	ldrb	w2, [x0]
 1e01224:      	ldrb	w0, [x0, #0x2]
 1e01228:      	strb	w0, [sp, #0x15e]
 1e0122c:      	ldrb	w0, [sp, #0xc0]
 1e01230:      	strb	w2, [sp, #0x15c]
 1e01234:      	strb	w1, [sp, #0x15d]
 1e01238:      	strb	w0, [sp, #0x15f]
 1e0123c:      	b	0x1e012f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x60146c>
 1e01240:      	mov	w10, #0x3e8             // =1000
 1e01244:      	mul	w3, w3, w10
 1e01248:      	udiv	w3, w3, w2
 1e0124c:      	cmp	w3, #0x8ae
 1e01250:      	b.gt	0x1e0141c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601594>
 1e01254:      	ldr	x2, [sp, #0x88]
 1e01258:      	lsl	x1, x1, #2
 1e0125c:      	ldrb	w19, [x11, x0]
 1e01260:      	ldr	d0, [x2]
 1e01264:      	mov	w2, #0x8000             // =32768
 1e01268:      	fcvtzs	w0, d0, #0xf
 1e0126c:      	sub	w3, w2, w0
 1e01270:      	mul	w25, w0, w25
 1e01274:      	mul	w26, w0, w26
 1e01278:      	mul	w28, w0, w28
 1e0127c:      	madd	w25, w3, w27, w25
 1e01280:      	madd	w0, w3, w7, w26
 1e01284:      	mov	w7, #0xff               // =255
 1e01288:      	madd	w3, w3, w9, w28
 1e0128c:      	asr	w2, w25, #15
 1e01290:      	cmp	w2, #0xff
 1e01294:      	asr	w0, w0, #15
 1e01298:      	csel	w2, w2, w7, le
 1e0129c:      	asr	w3, w3, #15
 1e012a0:      	cmp	w0, w7
 1e012a4:      	strb	w2, [x6, #0x2]
 1e012a8:      	csel	w0, w0, w7, le
 1e012ac:      	cmp	w3, w7
 1e012b0:      	csel	w3, w3, w7, le
 1e012b4:      	strb	w3, [x6]
 1e012b8:      	strb	w0, [x6, #0x1]
 1e012bc:      	ldrb	w0, [x8, x1]
 1e012c0:      	cmp	w0, w19
 1e012c4:      	b.hi	0x1e01490 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601608>
 1e012c8:      	cmp	w5, #0x3
 1e012cc:      	strb	w0, [x6, #0x3]
 1e012d0:      	cinc	w5, w5, ne
 1e012d4:      	cmp	w4, #0x2
 1e012d8:      	ccmp	w0, w19, #0x0, le
 1e012dc:      	add	x6, x6, #0x4
 1e012e0:      	cinc	w4, w4, eq
 1e012e4:      	cmp	x23, x6
 1e012e8:      	b.eq	0x1e014a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601620>
 1e012ec:      	sbfiz	x0, x4, #2, #32
 1e012f0:      	ldrb	w19, [x11, x0]
 1e012f4:      	sxtw	x1, w5
 1e012f8:      	lsl	x0, x1, #2
 1e012fc:      	ldrb	w0, [x8, x0]
 1e01300:      	cmp	w0, #0x0
 1e01304:      	ccmp	w5, #0x2, #0x0, eq
 1e01308:      	b.gt	0x1e01348 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6014c0>
 1e0130c:      	add	w0, w5, #0x1
 1e01310:      	sxtw	x1, w0
 1e01314:      	lsl	x2, x1, #2
 1e01318:      	ldrb	w2, [x8, x2]
 1e0131c:      	cmp	w2, #0x0
 1e01320:      	ccmp	w0, #0x2, #0x0, eq
 1e01324:      	b.gt	0x1e019a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601b1c>
 1e01328:      	add	w5, w5, #0x2
 1e0132c:      	sxtw	x1, w5
 1e01330:      	lsl	x0, x1, #2
 1e01334:      	ldrb	w0, [x8, x0]
 1e01338:      	cmp	w0, #0x0
 1e0133c:      	ccmp	w5, #0x2, #0x0, eq
 1e01340:      	csel	w5, w5, w24, gt
 1e01344:      	csel	x1, x1, x30, gt
 1e01348:      	cmp	w19, #0x0
 1e0134c:      	sxtw	x0, w4
 1e01350:      	ccmp	w4, #0x2, #0x0, eq
 1e01354:      	b.gt	0x1e0139c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601514>
 1e01358:      	add	w2, w4, #0x1
 1e0135c:      	sxtw	x0, w2
 1e01360:      	lsl	x3, x0, #2
 1e01364:      	ldrb	w19, [x11, x3]
 1e01368:      	cmp	w19, #0x0
 1e0136c:      	ccmp	w2, #0x2, #0x0, eq
 1e01370:      	b.gt	0x1e0199c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601b14>
 1e01374:      	add	w4, w4, #0x2
 1e01378:      	sxtw	x0, w4
 1e0137c:      	lsl	x2, x0, #2
 1e01380:      	ldrb	w19, [x11, x2]
 1e01384:      	cmp	w19, #0x0
 1e01388:      	ccmp	w4, #0x2, #0x0, eq
 1e0138c:      	b.gt	0x1e0139c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601514>
 1e01390:      	ldrb	w19, [sp, #0x15f]
 1e01394:      	mov	w4, #0x3                // =3
 1e01398:      	mov	x0, #0x3                // =3
 1e0139c:      	lsl	x2, x1, #2
 1e013a0:      	lsl	x0, x0, #2
 1e013a4:      	add	x25, x21, x2
 1e013a8:      	add	x10, x20, x0
 1e013ac:      	ldrb	w3, [x17, x2]
 1e013b0:      	ldrb	w7, [x18, x2]
 1e013b4:      	ldrb	w9, [x15, x0]
 1e013b8:      	lsl	w26, w3, #6
 1e013bc:      	ldrb	w28, [x21, x2]
 1e013c0:      	sub	w26, w26, w3
 1e013c4:      	add	w7, w7, w7, lsl #8
 1e013c8:      	ldrb	w27, [x16, x0]
 1e013cc:      	lsl	w3, w9, #6
 1e013d0:      	add	w7, w7, w26, lsl #3
 1e013d4:      	sub	w3, w3, w9
 1e013d8:      	ldrb	w26, [x20, x0]
 1e013dc:      	mov	w9, w28
 1e013e0:      	add	w27, w27, w27, lsl #8
 1e013e4:      	madd	w7, w28, w13, w7
 1e013e8:      	add	w2, w27, w3, lsl #3
 1e013ec:      	ldrb	w27, [x25, #0x2]
 1e013f0:      	add	w3, w7, w12
 1e013f4:      	ldrb	w7, [x25, #0x1]
 1e013f8:      	madd	w2, w26, w13, w2
 1e013fc:      	ldrb	w25, [x10, #0x2]
 1e01400:      	ldrb	w26, [x10, #0x1]
 1e01404:      	mul	w10, w3, w14
 1e01408:      	add	w2, w2, w12
 1e0140c:      	ldrb	w28, [x20, x0]
 1e01410:      	udiv	w10, w10, w2
 1e01414:      	cmp	w10, #0x2c
 1e01418:      	b.gt	0x1e01240 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6013b8>
 1e0141c:      	ldp	w0, w3, [x22]
 1e01420:      	cmp	w27, w25
 1e01424:      	mul	w2, w3, w25
 1e01428:      	madd	w2, w0, w27, w2
 1e0142c:      	asr	w2, w2, #15
 1e01430:      	b.lo	0x1e01990 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601b08>
 1e01434:      	cmp	w2, w27
 1e01438:      	csel	w27, w2, w27, le
 1e0143c:      	mul	w2, w3, w26
 1e01440:      	strb	w27, [x6, #0x2]
 1e01444:      	madd	w2, w0, w7, w2
 1e01448:      	cmp	w7, w26
 1e0144c:      	asr	w2, w2, #15
 1e01450:      	b.lo	0x1e01960 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601ad8>
 1e01454:      	mul	w3, w3, w28
 1e01458:      	cmp	w2, w7
 1e0145c:      	madd	w0, w0, w9, w3
 1e01460:      	csel	w2, w2, w7, le
 1e01464:      	strb	w2, [x6, #0x1]
 1e01468:      	cmp	w9, w28
 1e0146c:      	asr	w0, w0, #15
 1e01470:      	b.lo	0x1e01980 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601af8>
 1e01474:      	cmp	w0, w9
 1e01478:      	csel	w0, w0, w9, le
 1e0147c:      	strb	w0, [x6]
 1e01480:      	lsl	x1, x1, #2
 1e01484:      	ldrb	w0, [x8, x1]
 1e01488:      	cmp	w0, w19
 1e0148c:      	b.ls	0x1e012c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x601440>
