
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000020eb700 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8eb878>:
 20eb700:	9e670008 	fmov	d8, x0
 20eb704:	8b140014 	add	x20, x0, x20
 20eb708:	a9450be1 	ldp	x1, x2, [sp,#80]
 20eb70c:	f90083f4 	str	x20, [sp,#256]
 20eb710:	4e080500 	dup	v0.2d, v8.d[0]
 20eb714:	d2800014 	mov	x20, #0x0                   	// #0
 20eb718:	3d803fe0 	str	q0, [sp,#240]
 20eb71c:	eb010042 	subs	x2, x2, x1
 20eb720:	54000060 	b.eq	20eb72c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8eb8a4>
 20eb724:	aa0203f4 	mov	x20, x2
 20eb728:	978ce236 	bl	424000 <memmove@plt>
 20eb72c:	9e660100 	fmov	x0, d8
 20eb730:	8b140014 	add	x20, x0, x20
 20eb734:	d2806700 	mov	x0, #0x338                 	// #824
 20eb738:	f9007ff4 	str	x20, [sp,#248]
 20eb73c:	978ce581 	bl	424d40 <_Znwm@plt>
 20eb740:	aa0003f4 	mov	x20, x0
 20eb744:	9103c3e2 	add	x2, sp, #0xf0
 20eb748:	aa1603e1 	mov	x1, x22
 20eb74c:	97fe4aab 	bl	207e1f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87e370>
 20eb750:	f9407be0 	ldr	x0, [sp,#240]
 20eb754:	b4000040 	cbz	x0, 20eb75c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8eb8d4>
 20eb758:	978ce5be 	bl	424e50 <_ZdlPv@plt>
 20eb75c:	f9400e60 	ldr	x0, [x19,#24]
 20eb760:	f9000e74 	str	x20, [x19,#24]
 20eb764:	b40000a0 	cbz	x0, 20eb778 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8eb8f0>
 20eb768:	f9400001 	ldr	x1, [x0]
 20eb76c:	f9402821 	ldr	x1, [x1,#80]
 20eb770:	d63f0020 	blr	x1
 20eb774:	f9400e74 	ldr	x20, [x19,#24]
 20eb778:	d2801700 	mov	x0, #0xb8                  	// #184
 20eb77c:	f9400676 	ldr	x22, [x19,#8]
 20eb780:	978ce570 	bl	424d40 <_Znwm@plt>
 20eb784:	aa0003f5 	mov	x21, x0
 20eb788:	aa1403e2 	mov	x2, x20
 20eb78c:	aa1603e1 	mov	x1, x22
 20eb790:	97fd6066 	bl	2043928 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x843aa0>
 20eb794:	f9401274 	ldr	x20, [x19,#32]
 20eb798:	f9001275 	str	x21, [x19,#32]
 20eb79c:	b40000d4 	cbz	x20, 20eb7b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8eb92c>
 20eb7a0:	aa1403e0 	mov	x0, x20
 20eb7a4:	97dfb2d7 	bl	18d8300 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0xd8478>
 20eb7a8:	aa1403e0 	mov	x0, x20
 20eb7ac:	d2801701 	mov	x1, #0xb8                  	// #184
 20eb7b0:	978cebac 	bl	426660 <_ZdlPvm@plt>
 20eb7b4:	f9402be0 	ldr	x0, [sp,#80]
 20eb7b8:	b4000040 	cbz	x0, 20eb7c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8eb938>
 20eb7bc:	978ce5a5 	bl	424e50 <_ZdlPv@plt>
 20eb7c0:	a94153f3 	ldp	x19, x20, [sp,#16]
 20eb7c4:	a9425bf5 	ldp	x21, x22, [sp,#32]
 20eb7c8:	fd401fe8 	ldr	d8, [sp,#56]
 20eb7cc:	a8d17bfd 	ldp	x29, x30, [sp],#272
 20eb7d0:	d65f03c0 	ret
 20eb7d4:	910022b5 	add	x21, x21, #0x8
 20eb7d8:	eb1502ff 	cmp	x23, x21
 20eb7dc:	54fff3e1 	b.ne	20eb658 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8eb7d0>
 20eb7e0:	f9400697 	ldr	x23, [x20,#8]
 20eb7e4:	17ffffa6 	b	20eb67c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8eb7f4>
 20eb7e8:	9e6703e8 	fmov	d8, xzr
 20eb7ec:	17ffffd0 	b	20eb72c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8eb8a4>
 20eb7f0:	d63f0020 	blr	x1
 20eb7f4:	17ffffbc 	b	20eb6e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8eb85c>
 20eb7f8:	aa1403e0 	mov	x0, x20
 20eb7fc:	d63f0020 	blr	x1
 20eb800:	17ffffa6 	b	20eb698 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x8eb810>
 20eb804:	aa0003f4 	mov	x20, x0
 20eb808:	d2801801 	mov	x1, #0xc0                  	// #192
 20eb80c:	aa1503e0 	mov	x0, x21
