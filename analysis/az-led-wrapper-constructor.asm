
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000020422f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x842470>:
 20422f8:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 20422fc:	910003fd 	mov	x29, sp
 2042300:	a90153f3 	stp	x19, x20, [sp,#16]
 2042304:	aa0803f3 	mov	x19, x8
 2042308:	f90013f5 	str	x21, [sp,#32]
 204230c:	aa0003f5 	mov	x21, x0
 2042310:	d2800500 	mov	x0, #0x28                  	// #40
 2042314:	f9001fe1 	str	x1, [sp,#56]
 2042318:	978f8a8a 	bl	424d40 <_Znwm@plt>
 204231c:	aa0003f4 	mov	x20, x0
 2042320:	f9401fe1 	ldr	x1, [sp,#56]
 2042324:	aa0103e2 	mov	x2, x1
 2042328:	aa1503e1 	mov	x1, x21
 204232c:	97ff7c31 	bl	20213f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x821568>
 2042330:	f94013f5 	ldr	x21, [sp,#32]
 2042334:	f9000274 	str	x20, [x19]
 2042338:	aa1303e0 	mov	x0, x19
 204233c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2042340:	a8c47bfd 	ldp	x29, x30, [sp],#64
 2042344:	d65f03c0 	ret
 2042348:	d2800501 	mov	x1, #0x28                  	// #40
 204234c:	aa0003f3 	mov	x19, x0
 2042350:	aa1403e0 	mov	x0, x20
 2042354:	978f90c3 	bl	426660 <_ZdlPvm@plt>
 2042358:	aa1303e0 	mov	x0, x19
 204235c:	978f8a6d 	bl	424d10 <_Unwind_Resume@plt>
