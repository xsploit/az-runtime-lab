
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1b5a040: d1002000     	sub	x0, x0, #0x8
 1b5a044: 17ffffc1     	b	0x1b59f48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a0c0>
 1b5a048: a9b87bfd     	stp	x29, x30, [sp, #-0x80]!
 1b5a04c: 910003fd     	mov	x29, sp
 1b5a050: a90153f3     	stp	x19, x20, [sp, #0x10]
 1b5a054: aa0003f3     	mov	x19, x0
 1b5a058: b9403800     	ldr	w0, [x0, #0x38]
 1b5a05c: 34000220     	cbz	w0, 0x1b5a0a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a218>
 1b5a060: 7100041f     	cmp	w0, #0x1
 1b5a064: 540014c0     	b.eq	0x1b5a2fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a474>
 1b5a068: 7100081f     	cmp	w0, #0x2
 1b5a06c: 540002c0     	b.eq	0x1b5a0c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a23c>
 1b5a070: 71000c1f     	cmp	w0, #0x3
 1b5a074: 54001e00     	b.eq	0x1b5a434 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a5ac>
 1b5a078: 7100101f     	cmp	w0, #0x4
 1b5a07c: 54002740     	b.eq	0x1b5a564 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a6dc>
 1b5a080: 7100141f     	cmp	w0, #0x5
 1b5a084: 54000ae0     	b.eq	0x1b5a1e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a358>
 1b5a088: d2800001     	mov	x1, #0x0                // =0
 1b5a08c: 52800000     	mov	w0, #0x0                // =0
 1b5a090: 941a998c     	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1b5a094: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1b5a098: a8c87bfd     	ldp	x29, x30, [sp], #0x80
 1b5a09c: d65f03c0     	ret
 1b5a0a0: f9402a74     	ldr	x20, [x19, #0x50]
 1b5a0a4: b40013f4     	cbz	x20, 0x1b5a320 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a498>
 1b5a0a8: f9400281     	ldr	x1, [x20]
 1b5a0ac: aa1403e0     	mov	x0, x20
 1b5a0b0: f9400821     	ldr	x1, [x1, #0x10]
 1b5a0b4: d63f0020     	blr	x1
 1b5a0b8: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1b5a0bc: a8c87bfd     	ldp	x29, x30, [sp], #0x80
 1b5a0c0: d65f03c0     	ret
 1b5a0c4: f9402274     	ldr	x20, [x19, #0x40]
 1b5a0c8: b5ffff14     	cbnz	x20, 0x1b5a0a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a220>
 1b5a0cc: f9402660     	ldr	x0, [x19, #0x48]
 1b5a0d0: b4fffec0     	cbz	x0, 0x1b5a0a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a220>
 1b5a0d4: a9025bf5     	stp	x21, x22, [sp, #0x20]
 1b5a0d8: f000ff36     	adrp	x22, 0x3b41000 <_ZSt4cerr+0x68>
 1b5a0dc: 9123e2d6     	add	x22, x22, #0x8f8
 1b5a0e0: 08dffec0     	ldarb	w0, [x22]
 1b5a0e4: 36005600     	tbz	w0, #0x0, 0x1b5aba4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35ad1c>
 1b5a0e8: f000ff35     	adrp	x21, 0x3b41000 <_ZSt4cerr+0x68>
 1b5a0ec: 912402b5     	add	x21, x21, #0x900
 1b5a0f0: b9801aa1     	ldrsw	x1, [x21, #0x18]
 1b5a0f4: f9402662     	ldr	x2, [x19, #0x48]
 1b5a0f8: f94006a3     	ldr	x3, [x21, #0x8]
 1b5a0fc: 9ac10840     	udiv	x0, x2, x1
 1b5a100: 9b018800     	msub	x0, x0, x1, x2
 1b5a104: f860d860     	ldr	x0, [x3, w0, sxtw #3]
 1b5a108: b5000080     	cbnz	x0, 0x1b5a118 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a290>
 1b5a10c: 1400041f     	b	0x1b5b188 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35b300>
 1b5a110: f9400800     	ldr	x0, [x0, #0x10]
 1b5a114: b40083a0     	cbz	x0, 0x1b5b188 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35b300>
 1b5a118: f9400001     	ldr	x1, [x0]
 1b5a11c: eb01005f     	cmp	x2, x1
 1b5a120: 54ffff81     	b.ne	0x1b5a110 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a288>
 1b5a124: f9400415     	ldr	x21, [x0, #0x8]
 1b5a128: b4008315     	cbz	x21, 0x1b5b188 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35b300>
 1b5a12c: b0010196     	adrp	x22, 0x3b8b000 <stdout+0x49f40>
 1b5a130: 913962d6     	add	x22, x22, #0xe58
 1b5a134: 08dffec0     	ldarb	w0, [x22]
 1b5a138: 36006440     	tbz	w0, #0x0, 0x1b5adc0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35af38>
 1b5a13c: 08dffec0     	ldarb	w0, [x22]
 1b5a140: 36006780     	tbz	w0, #0x0, 0x1b5ae30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35afa8>
 1b5a144: b0010181     	adrp	x1, 0x3b8b000 <stdout+0x49f40>
 1b5a148: 913a2021     	add	x1, x1, #0xe88
 1b5a14c: 88dffc20     	ldar	w0, [x1]
 1b5a150: 37f80420     	tbnz	w0, #0x1f, 0x1b5a1d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a34c>
 1b5a154: 11000402     	add	w2, w0, #0x1
 1b5a158: 885ffc23     	ldaxr	w3, [x1]
 1b5a15c: 6b00007f     	cmp	w3, w0
 1b5a160: 54000061     	b.ne	0x1b5a16c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a2e4>
 1b5a164: 8804fc22     	stlxr	w4, w2, [x1]
 1b5a168: 35ffff84     	cbnz	w4, 0x1b5a158 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a2d0>
 1b5a16c: 54ffff01     	b.ne	0x1b5a14c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x35a2c4>
