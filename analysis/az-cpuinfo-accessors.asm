
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002354160 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc048>:
 2354160:	f94023e0 	ldr	x0, [sp,#64]
 2354164:	d1004000 	sub	x0, x0, #0x10
 2354168:	eb14001f 	cmp	x0, x20
 235416c:	54000040 	b.eq	2354174 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc05c>
 2354170:	97fea118 	bl	22fc5d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744b8>
 2354174:	b9400660 	ldr	w0, [x19,#4]
 2354178:	7100001f 	cmp	w0, #0x0
 235417c:	5400006c 	b.gt	2354188 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc070>
 2354180:	b9400260 	ldr	w0, [x19]
 2354184:	b9000660 	str	w0, [x19,#4]
 2354188:	f9401fe0 	ldr	x0, [sp,#56]
 235418c:	d1004000 	sub	x0, x0, #0x10
 2354190:	eb14001f 	cmp	x0, x20
 2354194:	54000040 	b.eq	235419c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc084>
 2354198:	97fea10e 	bl	22fc5d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744b8>
 235419c:	a94153f3 	ldp	x19, x20, [sp,#16]
 23541a0:	a9425bf5 	ldp	x21, x22, [sp,#32]
 23541a4:	a8c57bfd 	ldp	x29, x30, [sp],#80
 23541a8:	d65f03c0 	ret
 23541ac:	d503201f 	nop
 23541b0:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 23541b4:	910003fd 	mov	x29, sp
 23541b8:	a90153f3 	stp	x19, x20, [sp,#16]
 23541bc:	f000c413 	adrp	x19, 3bd7000 <stdout@@GLIBC_2.17+0x95f40>
 23541c0:	9114a273 	add	x19, x19, #0x528
 23541c4:	91062274 	add	x20, x19, #0x188
 23541c8:	08dffe80 	ldarb	w0, [x20]
 23541cc:	360000a0 	tbz	w0, #0, 23541e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc0c8>
 23541d0:	91064260 	add	x0, x19, #0x190
 23541d4:	a94153f3 	ldp	x19, x20, [sp,#16]
 23541d8:	a8c27bfd 	ldp	x29, x30, [sp],#32
 23541dc:	d65f03c0 	ret
 23541e0:	aa1403e0 	mov	x0, x20
 23541e4:	9783481f 	bl	426260 <__cxa_guard_acquire@plt>
 23541e8:	34ffff40 	cbz	w0, 23541d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc0b8>
 23541ec:	91064261 	add	x1, x19, #0x190
 23541f0:	f900ca7f 	str	xzr, [x19,#400]
 23541f4:	aa0103e0 	mov	x0, x1
 23541f8:	f900ce7f 	str	xzr, [x19,#408]
 23541fc:	7903427f 	strh	wzr, [x19,#416]
 2354200:	39068a7f 	strb	wzr, [x19,#418]
 2354204:	97ffff3b 	bl	2353ef0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cbdd8>
 2354208:	aa1403e0 	mov	x0, x20
 235420c:	9783498d 	bl	426840 <__cxa_guard_release@plt>
 2354210:	91064260 	add	x0, x19, #0x190
 2354214:	a94153f3 	ldp	x19, x20, [sp,#16]
 2354218:	a8c27bfd 	ldp	x29, x30, [sp],#32
 235421c:	d65f03c0 	ret
 2354220:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 2354224:	910003fd 	mov	x29, sp
 2354228:	97ffffe2 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 235422c:	a8c17bfd 	ldp	x29, x30, [sp],#16
 2354230:	b9400000 	ldr	w0, [x0]
 2354234:	d65f03c0 	ret
 2354238:	d503201f 	nop
 235423c:	d503201f 	nop
 2354240:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 2354244:	910003fd 	mov	x29, sp
 2354248:	97ffffda 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 235424c:	a8c17bfd 	ldp	x29, x30, [sp],#16
 2354250:	b9400400 	ldr	w0, [x0,#4]
 2354254:	d65f03c0 	ret
 2354258:	d503201f 	nop
 235425c:	d503201f 	nop
 2354260:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 2354264:	910003fd 	mov	x29, sp
 2354268:	97ffffd2 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 235426c:	a8c17bfd 	ldp	x29, x30, [sp],#16
 2354270:	39402000 	ldrb	w0, [x0,#8]
 2354274:	d65f03c0 	ret
 2354278:	d503201f 	nop
 235427c:	d503201f 	nop
 2354280:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 2354284:	910003fd 	mov	x29, sp
 2354288:	97ffffca 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 235428c:	a8c17bfd 	ldp	x29, x30, [sp],#16
 2354290:	39403000 	ldrb	w0, [x0,#12]
 2354294:	d65f03c0 	ret
 2354298:	d503201f 	nop
 235429c:	d503201f 	nop
 23542a0:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 23542a4:	910003fd 	mov	x29, sp
 23542a8:	97ffffc2 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 23542ac:	a8c17bfd 	ldp	x29, x30, [sp],#16
 23542b0:	39402400 	ldrb	w0, [x0,#9]
 23542b4:	d65f03c0 	ret
 23542b8:	d503201f 	nop
 23542bc:	d503201f 	nop
 23542c0:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 23542c4:	910003fd 	mov	x29, sp
 23542c8:	97ffffba 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 23542cc:	a8c17bfd 	ldp	x29, x30, [sp],#16
 23542d0:	39402800 	ldrb	w0, [x0,#10]
 23542d4:	d65f03c0 	ret
 23542d8:	d503201f 	nop
 23542dc:	d503201f 	nop
 23542e0:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 23542e4:	910003fd 	mov	x29, sp
 23542e8:	97ffffb2 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 23542ec:	a8c17bfd 	ldp	x29, x30, [sp],#16
 23542f0:	39402c00 	ldrb	w0, [x0,#11]
 23542f4:	d65f03c0 	ret
 23542f8:	d503201f 	nop
 23542fc:	d503201f 	nop
 2354300:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 2354304:	910003fd 	mov	x29, sp
 2354308:	97ffffaa 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 235430c:	a8c17bfd 	ldp	x29, x30, [sp],#16
 2354310:	39403400 	ldrb	w0, [x0,#13]
 2354314:	d65f03c0 	ret
 2354318:	d503201f 	nop
 235431c:	d503201f 	nop
 2354320:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 2354324:	910003fd 	mov	x29, sp
 2354328:	97ffffa2 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 235432c:	a8c17bfd 	ldp	x29, x30, [sp],#16
 2354330:	39403800 	ldrb	w0, [x0,#14]
 2354334:	d65f03c0 	ret
 2354338:	d503201f 	nop
 235433c:	d503201f 	nop
 2354340:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 2354344:	910003fd 	mov	x29, sp
 2354348:	97ffff9a 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 235434c:	a8c17bfd 	ldp	x29, x30, [sp],#16
 2354350:	39403c00 	ldrb	w0, [x0,#15]
 2354354:	d65f03c0 	ret
 2354358:	d503201f 	nop
 235435c:	d503201f 	nop
 2354360:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 2354364:	910003fd 	mov	x29, sp
 2354368:	97ffff92 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 235436c:	a8c17bfd 	ldp	x29, x30, [sp],#16
 2354370:	39404000 	ldrb	w0, [x0,#16]
 2354374:	d65f03c0 	ret
 2354378:	d503201f 	nop
 235437c:	d503201f 	nop
 2354380:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 2354384:	910003fd 	mov	x29, sp
 2354388:	97ffff8a 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 235438c:	a8c17bfd 	ldp	x29, x30, [sp],#16
 2354390:	39404400 	ldrb	w0, [x0,#17]
 2354394:	d65f03c0 	ret
 2354398:	d503201f 	nop
 235439c:	d503201f 	nop
 23543a0:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 23543a4:	910003fd 	mov	x29, sp
 23543a8:	97ffff82 	bl	23541b0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1cc098>
 23543ac:	a8c17bfd 	ldp	x29, x30, [sp],#16
 23543b0:	39404800 	ldrb	w0, [x0,#18]
 23543b4:	d65f03c0 	ret
 23543b8:	d503201f 	nop
 23543bc:	d503201f 	nop
