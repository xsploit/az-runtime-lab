
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 198e5c0: d2807d01     	mov	x1, #0x3e8              // =1000
 198e5c4: aa1703e0     	mov	x0, x23
 198e5c8: 97aa6026     	bl	0x426660 <_ZdlPvm@plt>
 198e5cc: 17ffff92     	b	0x198e414 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18e58c>
 198e5d0: aa0003f3     	mov	x19, x0
 198e5d4: d2803f01     	mov	x1, #0x1f8              // =504
 198e5d8: aa1703e0     	mov	x0, x23
 198e5dc: 97aa6021     	bl	0x426660 <_ZdlPvm@plt>
 198e5e0: 17ffff8d     	b	0x198e414 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18e58c>
 198e5e4: aa0003f3     	mov	x19, x0
 198e5e8: d2804601     	mov	x1, #0x230              // =560
 198e5ec: aa1703e0     	mov	x0, x23
 198e5f0: 97aa601c     	bl	0x426660 <_ZdlPvm@plt>
 198e5f4: 17ffff88     	b	0x198e414 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18e58c>
 198e5f8: aa0003f3     	mov	x19, x0
 198e5fc: d2818601     	mov	x1, #0xc30              // =3120
 198e600: aa1703e0     	mov	x0, x23
 198e604: 97aa6017     	bl	0x426660 <_ZdlPvm@plt>
 198e608: 17ffff83     	b	0x198e414 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18e58c>
 198e60c: aa0003f3     	mov	x19, x0
 198e610: d2807601     	mov	x1, #0x3b0              // =944
 198e614: aa1703e0     	mov	x0, x23
 198e618: 97aa6012     	bl	0x426660 <_ZdlPvm@plt>
 198e61c: 17ffff7e     	b	0x198e414 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18e58c>
 198e620: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
 198e624: 910003fd     	mov	x29, sp
 198e628: a90153f3     	stp	x19, x20, [sp, #0x10]
 198e62c: aa0003f3     	mov	x19, x0
 198e630: b00081e0     	adrp	x0, 0x29cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4081a8>
 198e634: a9025bf5     	stp	x21, x22, [sp, #0x20]
 198e638: 91128000     	add	x0, x0, #0x4a0
 198e63c: aa0203f5     	mov	x21, x2
 198e640: a90363f7     	stp	x23, x24, [sp, #0x30]
 198e644: aa0303f6     	mov	x22, x3
 198e648: aa0403f7     	mov	x23, x4
 198e64c: a9007e60     	stp	x0, xzr, [x19]
 198e650: aa0503f8     	mov	x24, x5
 198e654: d2805600     	mov	x0, #0x2b0              // =688
 198e658: 97aa59ba     	bl	0x424d40 <_Znwm@plt>
 198e65c: aa0003f4     	mov	x20, x0
 198e660: 94002ecc     	bl	0x199a190 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x19a308>
 198e664: 52800020     	mov	w0, #0x1                // =1
 198e668: 39004260     	strb	w0, [x19, #0x10]
 198e66c: f9000e74     	str	x20, [x19, #0x18]
 198e670: 91008268     	add	x8, x19, #0x20
 198e674: 97ffdead     	bl	0x1986128 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1862a0>
 198e678: a9037e7f     	stp	xzr, xzr, [x19, #0x30]
 198e67c: b00081e0     	adrp	x0, 0x29cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4081a8>
 198e680: 912c9c00     	add	x0, x0, #0xb27
 198e684: a9047e7f     	stp	xzr, xzr, [x19, #0x40]
 198e688: a9057e7f     	stp	xzr, xzr, [x19, #0x50]
 198e68c: a9067e7f     	stp	xzr, xzr, [x19, #0x60]
 198e690: a9077e7f     	stp	xzr, xzr, [x19, #0x70]
 198e694: a9087e7f     	stp	xzr, xzr, [x19, #0x80]
 198e698: a9097e7f     	stp	xzr, xzr, [x19, #0x90]
 198e69c: a90a7e7f     	stp	xzr, xzr, [x19, #0xa0]
 198e6a0: a90b7e7f     	stp	xzr, xzr, [x19, #0xb0]
 198e6a4: 97fff8ed     	bl	0x198ca58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18cbd0>
 198e6a8: 8b001004     	add	x4, x0, x0, lsl #4
 198e6ac: d2801662     	mov	x2, #0xb3               // =179
 198e6b0: d28d1443     	mov	x3, #0x68a2             // =26786
 198e6b4: 8b040c04     	add	x4, x0, x4, lsl #3
 198e6b8: f2f12002     	movk	x2, #0x8900, lsl #48
 198e6bc: 91018485     	add	x5, x4, #0x61
 198e6c0: f2a7f103     	movk	x3, #0x3f88, lsl #16
 198e6c4: f2cbadc3     	movk	x3, #0x5d6e, lsl #32
 198e6c8: aa1303e1     	mov	x1, x19
 198e6cc: f2e03bc3     	movk	x3, #0x1de, lsl #48
 198e6d0: 9101a3e0     	add	x0, sp, #0x68
 198e6d4: 9bc27ca4     	umulh	x4, x5, x2
 198e6d8: d378fc84     	lsr	x4, x4, #56
 198e6dc: 9b039484     	msub	x4, x4, x3, x5
 198e6e0: 8b041085     	add	x5, x4, x4, lsl #4
 198e6e4: 8b050c84     	add	x4, x4, x5, lsl #3
 198e6e8: 9101d085     	add	x5, x4, #0x74
 198e6ec: 9bc27ca4     	umulh	x4, x5, x2
 198e6f0: d378fc84     	lsr	x4, x4, #56
 198e6f4: 9b039484     	msub	x4, x4, x3, x5
 198e6f8: 8b041085     	add	x5, x4, x4, lsl #4
 198e6fc: 8b050c84     	add	x4, x4, x5, lsl #3
 198e700: 91014c85     	add	x5, x4, #0x53
 198e704: 9bc27ca4     	umulh	x4, x5, x2
 198e708: d378fc84     	lsr	x4, x4, #56
 198e70c: 9b039484     	msub	x4, x4, x3, x5
 198e710: 8b041085     	add	x5, x4, x4, lsl #4
 198e714: 8b050c84     	add	x4, x4, x5, lsl #3
 198e718: 9101dc85     	add	x5, x4, #0x77
 198e71c: 9bc27ca4     	umulh	x4, x5, x2
 198e720: d378fc84     	lsr	x4, x4, #56
 198e724: 9b039484     	msub	x4, x4, x3, x5
 198e728: 8b041085     	add	x5, x4, x4, lsl #4
 198e72c: 8b050c84     	add	x4, x4, x5, lsl #3
