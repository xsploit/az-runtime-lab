
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 21307e8: aa0003e2     	mov	x2, x0
 21307ec: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 21307f0: aa0103e0     	mov	x0, x1
 21307f4: 910003fd     	mov	x29, sp
 21307f8: b9400043     	ldr	w3, [x2]
 21307fc: f9400024     	ldr	x4, [x1]
 2130800: 4a837c63     	eor	w3, w3, w3, asr #31
 2130804: 39403041     	ldrb	w1, [x2, #0xc]
 2130808: 7100047f     	cmp	w3, #0x1
 213080c: f9401085     	ldr	x5, [x4, #0x20]
 2130810: 54000069     	b.ls	0x213081c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x930994>
 2130814: a90153f3     	stp	x19, x20, [sp, #0x10]
 2130818: 978bd872     	bl	0x4269e0 <abort@plt>
 213081c: b0006884     	adrp	x4, 0x2e41000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x87e1a8>
 2130820: 911ea084     	add	x4, x4, #0x7a8
 2130824: 38634883     	ldrb	w3, [x4, w3, uxtw]
 2130828: 10000064     	adr	x4, 0x2130834 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9309ac>
 213082c: 8b238883     	add	x3, x4, w3, sxtb #2
 2130830: d61f0060     	br	x3
 2130834: 79c01044     	ldrsh	w4, [x2, #0x8]
 2130838: 39402843     	ldrb	w3, [x2, #0xa]
 213083c: b9400446     	ldr	w6, [x2, #0x4]
 2130840: 9100a3e2     	add	x2, sp, #0x28
 2130844: b9002be6     	str	w6, [sp, #0x28]
 2130848: 79005be4     	strh	w4, [sp, #0x2c]
 213084c: 3900bbe3     	strb	w3, [sp, #0x2e]
 2130850: d63f00a0     	blr	x5
 2130854: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 2130858: d65f03c0     	ret
 213085c: a90153f3     	stp	x19, x20, [sp, #0x10]
 2130860: b0002c13     	adrp	x19, 0x26b1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xee1a8>
 2130864: 912e6273     	add	x19, x19, #0xb98
 2130868: f90017f3     	str	x19, [sp, #0x28]
 213086c: 97ffffaf     	bl	0x2130728 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9308a0>
 2130870: aa0003f4     	mov	x20, x0
 2130874: 9100a3e0     	add	x0, sp, #0x28
 2130878: f90017f3     	str	x19, [sp, #0x28]
 213087c: 978bce2d     	bl	0x424130 <_ZNSt9exceptionD2Ev@plt>
 2130880: aa1403e0     	mov	x0, x20
 2130884: 978bd123     	bl	0x424d10 <_Unwind_Resume@plt>
 2130888: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 213088c: aa0103e3     	mov	x3, x1
 2130890: 910003fd     	mov	x29, sp
 2130894: b9400002     	ldr	w2, [x0]
 2130898: f9400024     	ldr	x4, [x1]
 213089c: 4a827c42     	eor	w2, w2, w2, asr #31
 21308a0: 39403001     	ldrb	w1, [x0, #0xc]
 21308a4: 7100045f     	cmp	w2, #0x1
 21308a8: f9401485     	ldr	x5, [x4, #0x28]
 21308ac: 54000069     	b.ls	0x21308b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x930a30>
 21308b0: a90153f3     	stp	x19, x20, [sp, #0x10]
 21308b4: 978bd84b     	bl	0x4269e0 <abort@plt>
 21308b8: b0006884     	adrp	x4, 0x2e41000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x87e1a8>
 21308bc: 911eb084     	add	x4, x4, #0x7ac
 21308c0: 38624882     	ldrb	w2, [x4, w2, uxtw]
 21308c4: 10000064     	adr	x4, 0x21308d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x930a48>
 21308c8: 8b228882     	add	x2, x4, w2, sxtb #2
 21308cc: d61f0040     	br	x2
 21308d0: 79400802     	ldrh	w2, [x0, #0x4]
 21308d4: aa0303e0     	mov	x0, x3
 21308d8: d63f00a0     	blr	x5
 21308dc: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 21308e0: d65f03c0     	ret
 21308e4: a90153f3     	stp	x19, x20, [sp, #0x10]
 21308e8: b0002c13     	adrp	x19, 0x26b1000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xee1a8>
 21308ec: 912e6273     	add	x19, x19, #0xb98
 21308f0: f90017f3     	str	x19, [sp, #0x28]
 21308f4: 97ffff8d     	bl	0x2130728 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9308a0>
 21308f8: aa0003f4     	mov	x20, x0
 21308fc: 9100a3e0     	add	x0, sp, #0x28
 2130900: f90017f3     	str	x19, [sp, #0x28]
 2130904: 978bce0b     	bl	0x424130 <_ZNSt9exceptionD2Ev@plt>
 2130908: aa1403e0     	mov	x0, x20
 213090c: 978bd101     	bl	0x424d10 <_Unwind_Resume@plt>
