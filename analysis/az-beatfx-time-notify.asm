
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 21365b0: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
 21365b4: 910003fd     	mov	x29, sp
 21365b8: a90153f3     	stp	x19, x20, [sp, #0x10]
 21365bc: aa0103f4     	mov	x20, x1
 21365c0: 9100e3f3     	add	x19, sp, #0x38
 21365c4: 910103e1     	add	x1, sp, #0x40
 21365c8: f90013f5     	str	x21, [sp, #0x20]
 21365cc: aa0003f5     	mov	x21, x0
 21365d0: f90023f3     	str	x19, [sp, #0x40]
 21365d4: 97fff897     	bl	0x2134830 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9349a8>
 21365d8: f9400400     	ldr	x0, [x0, #0x8]
 21365dc: f0006841     	adrp	x1, 0x2e41000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x87e1a8>
 21365e0: 913ea021     	add	x1, x1, #0xfa8
 21365e4: eb01001f     	cmp	x0, x1
 21365e8: 54000440     	b.eq	0x2136670 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9367e8>
 21365ec: 39400002     	ldrb	w2, [x0]
 21365f0: 7100a85f     	cmp	w2, #0x2a
 21365f4: 54000060     	b.eq	0x2136600 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936778>
 21365f8: 978bc23e     	bl	0x426ef0 <strcmp@plt>
 21365fc: 340003a0     	cbz	w0, 0x2136670 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9367e8>
 2136600: 910103e1     	add	x1, sp, #0x40
 2136604: aa1503e0     	mov	x0, x21
 2136608: f90023f3     	str	x19, [sp, #0x40]
 213660c: 97fff889     	bl	0x2134830 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9349a8>
 2136610: d000cf61     	adrp	x1, 0x3b24000
 2136614: f9400400     	ldr	x0, [x0, #0x8]
 2136618: f9437c21     	ldr	x1, [x1, #0x6f8]
 213661c: eb01001f     	cmp	x0, x1
 2136620: 540000c0     	b.eq	0x2136638 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9367b0>
 2136624: 39400002     	ldrb	w2, [x0]
 2136628: 7100a85f     	cmp	w2, #0x2a
 213662c: 54000580     	b.eq	0x21366dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936854>
 2136630: 978bc230     	bl	0x426ef0 <strcmp@plt>
 2136634: 35000540     	cbnz	w0, 0x21366dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936854>
 2136638: b9400280     	ldr	w0, [x20]
 213663c: 4a807c00     	eor	w0, w0, w0, asr #31
 2136640: 7100041f     	cmp	w0, #0x1
 2136644: 540000c0     	b.eq	0x213665c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9367d4>
 2136648: 5400048d     	b.le	0x21366d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936850>
 213664c: 7100081f     	cmp	w0, #0x2
 2136650: 540004e0     	b.eq	0x21366ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936864>
 2136654: 71000c1f     	cmp	w0, #0x3
 2136658: 54000601     	b.ne	0x2136718 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936890>
 213665c: f9400681     	ldr	x1, [x20, #0x8]
 2136660: b40003e1     	cbz	x1, 0x21366dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936854>
 2136664: aa1503e0     	mov	x0, x21
 2136668: 97ffe888     	bl	0x2130888 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x930a00>
 213666c: 1400001c     	b	0x21366dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936854>
 2136670: b9400280     	ldr	w0, [x20]
 2136674: 4a807c00     	eor	w0, w0, w0, asr #31
 2136678: 7100041f     	cmp	w0, #0x1
 213667c: 54000240     	b.eq	0x21366c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x93683c>
 2136680: 540002cd     	b.le	0x21366d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936850>
 2136684: 7100081f     	cmp	w0, #0x2
 2136688: 540001a1     	b.ne	0x21366bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936834>
 213668c: 91002281     	add	x1, x20, #0x8
 2136690: 910103e0     	add	x0, sp, #0x40
 2136694: 97ffe801     	bl	0x2130698 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x930810>
 2136698: f94023e1     	ldr	x1, [sp, #0x40]
 213669c: b5000381     	cbnz	x1, 0x213670c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936884>
 21366a0: f94027e0     	ldr	x0, [sp, #0x48]
 21366a4: b40001c0     	cbz	x0, 0x21366dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936854>
 21366a8: 9794f70c     	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 21366ac: a94153f3     	ldp	x19, x20, [sp, #0x10]
 21366b0: f94013f5     	ldr	x21, [sp, #0x20]
 21366b4: a8c57bfd     	ldp	x29, x30, [sp], #0x50
 21366b8: d65f03c0     	ret
 21366bc: 71000c1f     	cmp	w0, #0x3
 21366c0: 540002c1     	b.ne	0x2136718 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936890>
 21366c4: f9400681     	ldr	x1, [x20, #0x8]
 21366c8: b40000a1     	cbz	x1, 0x21366dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936854>
 21366cc: aa1503e0     	mov	x0, x21
 21366d0: 97ffe846     	bl	0x21307e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x930960>
 21366d4: 14000002     	b	0x21366dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936854>
 21366d8: 35000200     	cbnz	w0, 0x2136718 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936890>
 21366dc: a94153f3     	ldp	x19, x20, [sp, #0x10]
 21366e0: f94013f5     	ldr	x21, [sp, #0x20]
 21366e4: a8c57bfd     	ldp	x29, x30, [sp], #0x50
 21366e8: d65f03c0     	ret
 21366ec: 91002281     	add	x1, x20, #0x8
 21366f0: 910103e0     	add	x0, sp, #0x40
 21366f4: 97ffe7e9     	bl	0x2130698 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x930810>
 21366f8: f94023e1     	ldr	x1, [sp, #0x40]
 21366fc: b4fffd21     	cbz	x1, 0x21366a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936818>
 2136700: aa1503e0     	mov	x0, x21
 2136704: 97ffe861     	bl	0x2130888 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x930a00>
 2136708: 17ffffe6     	b	0x21366a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936818>
 213670c: aa1503e0     	mov	x0, x21
 2136710: 97ffe836     	bl	0x21307e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x930960>
 2136714: 17ffffe3     	b	0x21366a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936818>
 2136718: 978bc0b2     	bl	0x4269e0 <abort@plt>
 213671c: f94027e1     	ldr	x1, [sp, #0x48]
 2136720: aa0003f3     	mov	x19, x0
 2136724: b4000061     	cbz	x1, 0x2136730 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9368a8>
 2136728: aa0103e0     	mov	x0, x1
 213672c: 9794f6eb     	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 2136730: aa1303e0     	mov	x0, x19
 2136734: 978bb977     	bl	0x424d10 <_Unwind_Resume@plt>
 2136738: 17fffff9     	b	0x213671c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x936894>
 213673c: 00000000     	udf	#0x0
