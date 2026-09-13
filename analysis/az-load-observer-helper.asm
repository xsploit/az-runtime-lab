
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000006cba78 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3aee8>:
  6cba78:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
  6cba7c:	910003fd 	mov	x29, sp
  6cba80:	a90153f3 	stp	x19, x20, [sp,#16]
  6cba84:	aa0003f4 	mov	x20, x0
  6cba88:	d001a3d3 	adrp	x19, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
  6cba8c:	91174273 	add	x19, x19, #0x5d0
  6cba90:	a9025bf5 	stp	x21, x22, [sp,#32]
  6cba94:	aa0103f5 	mov	x21, x1
  6cba98:	08dffe60 	ldarb	w0, [x19]
  6cba9c:	36000680 	tbz	w0, #0, 6cbb6c <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3afdc>
  6cbaa0:	08dffe60 	ldarb	w0, [x19]
  6cbaa4:	360009a0 	tbz	w0, #0, 6cbbd8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3b048>
  6cbaa8:	d001a3c0 	adrp	x0, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
  6cbaac:	91180000 	add	x0, x0, #0x600
  6cbab0:	88dffc01 	ldar	w1, [x0]
  6cbab4:	37f80c61 	tbnz	w1, #31, 6cbc40 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3b0b0>
  6cbab8:	11000422 	add	w2, w1, #0x1
  6cbabc:	885ffc03 	ldaxr	w3, [x0]
  6cbac0:	6b01007f 	cmp	w3, w1
  6cbac4:	54000061 	b.ne	6cbad0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af40>
  6cbac8:	8804fc02 	stlxr	w4, w2, [x0]
  6cbacc:	35ffff84 	cbnz	w4, 6cbabc <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af2c>
  6cbad0:	54ffff01 	b.ne	6cbab0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af20>
  6cbad4:	d001a3c2 	adrp	x2, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
  6cbad8:	91176042 	add	x2, x2, #0x5d8
  6cbadc:	f9400281 	ldr	x1, [x20]
  6cbae0:	b9801843 	ldrsw	x3, [x2,#24]
  6cbae4:	f9400444 	ldr	x4, [x2,#8]
  6cbae8:	9ac30822 	udiv	x2, x1, x3
  6cbaec:	9b038442 	msub	x2, x2, x3, x1
  6cbaf0:	f862d893 	ldr	x19, [x4,w2,sxtw #3]
  6cbaf4:	b5000093 	cbnz	x19, 6cbb04 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af74>
  6cbaf8:	14000007 	b	6cbb14 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af84>
  6cbafc:	f9400a73 	ldr	x19, [x19,#16]
  6cbb00:	b40000b3 	cbz	x19, 6cbb14 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af84>
  6cbb04:	f9400262 	ldr	x2, [x19]
  6cbb08:	eb02003f 	cmp	x1, x2
  6cbb0c:	54ffff81 	b.ne	6cbafc <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af6c>
  6cbb10:	f9400673 	ldr	x19, [x19,#8]
  6cbb14:	88dffc01 	ldar	w1, [x0]
  6cbb18:	7100003f 	cmp	w1, #0x0
  6cbb1c:	540009cd 	b.le	6cbc54 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3b0c4>
  6cbb20:	51000422 	sub	w2, w1, #0x1
  6cbb24:	885ffc03 	ldaxr	w3, [x0]
  6cbb28:	6b01007f 	cmp	w3, w1
  6cbb2c:	54000061 	b.ne	6cbb38 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3afa8>
  6cbb30:	8804fc02 	stlxr	w4, w2, [x0]
  6cbb34:	35ffff84 	cbnz	w4, 6cbb24 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af94>
  6cbb38:	54fffee1 	b.ne	6cbb14 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af84>
  6cbb3c:	b4000833 	cbz	x19, 6cbc40 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3b0b0>
  6cbb40:	f9400263 	ldr	x3, [x19]
  6cbb44:	aa1503e1 	mov	x1, x21
  6cbb48:	aa1303e0 	mov	x0, x19
  6cbb4c:	52800002 	mov	w2, #0x0                   	// #0
  6cbb50:	f9401063 	ldr	x3, [x3,#32]
  6cbb54:	d63f0060 	blr	x3
  6cbb58:	52800020 	mov	w0, #0x1                   	// #1
  6cbb5c:	a94153f3 	ldp	x19, x20, [sp,#16]
  6cbb60:	a9425bf5 	ldp	x21, x22, [sp,#32]
  6cbb64:	a8c67bfd 	ldp	x29, x30, [sp],#96
  6cbb68:	d65f03c0 	ret
  6cbb6c:	aa1303e0 	mov	x0, x19
  6cbb70:	97f569bc 	bl	426260 <__cxa_guard_acquire@plt>
  6cbb74:	34fff960 	cbz	w0, 6cbaa0 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af10>
  6cbb78:	d001a3d6 	adrp	x22, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
  6cbb7c:	911762d6 	add	x22, x22, #0x5d8
  6cbb80:	d2809800 	mov	x0, #0x4c0                 	// #1216
  6cbb84:	b90022df 	str	wzr, [x22,#32]
  6cbb88:	97f56512 	bl	424fd0 <malloc@plt>
  6cbb8c:	52801304 	mov	w4, #0x98                  	// #152
  6cbb90:	52800ca3 	mov	w3, #0x65                  	// #101
  6cbb94:	d2806502 	mov	x2, #0x328                 	// #808
  6cbb98:	52800001 	mov	w1, #0x0                   	// #0
  6cbb9c:	f90006c0 	str	x0, [x22,#8]
  6cbba0:	b90012c4 	str	w4, [x22,#16]
  6cbba4:	b9001ac3 	str	w3, [x22,#24]
  6cbba8:	97f56292 	bl	4245f0 <memset@plt>
  6cbbac:	aa1303e0 	mov	x0, x19
  6cbbb0:	b9002adf 	str	wzr, [x22,#40]
  6cbbb4:	97f56b23 	bl	426840 <__cxa_guard_release@plt>
  6cbbb8:	aa1603e1 	mov	x1, x22
  6cbbbc:	f001a2c2 	adrp	x2, 3b26000 <_ZTISt11range_error@@GLIBCXX_3.4+0x1440>
  6cbbc0:	90000000 	adrp	x0, 6cb000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3a470>
  6cbbc4:	9135a042 	add	x2, x2, #0xd68
  6cbbc8:	91176000 	add	x0, x0, #0x5d8
  6cbbcc:	97f56cb9 	bl	426eb0 <__cxa_atexit@plt>
  6cbbd0:	08dffe60 	ldarb	w0, [x19]
  6cbbd4:	3707f6a0 	tbnz	w0, #0, 6cbaa8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af18>
  6cbbd8:	aa1303e0 	mov	x0, x19
  6cbbdc:	97f569a1 	bl	426260 <__cxa_guard_acquire@plt>
  6cbbe0:	34fff640 	cbz	w0, 6cbaa8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x3af18>
  6cbbe4:	d001a3d6 	adrp	x22, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
  6cbbe8:	911762d6 	add	x22, x22, #0x5d8
  6cbbec:	d2809800 	mov	x0, #0x4c0                 	// #1216
  6cbbf0:	b90022df 	str	wzr, [x22,#32]
  6cbbf4:	97f564f7 	bl	424fd0 <malloc@plt>
  6cbbf8:	52801304 	mov	w4, #0x98                  	// #152
  6cbbfc:	52800ca3 	mov	w3, #0x65                  	// #101
