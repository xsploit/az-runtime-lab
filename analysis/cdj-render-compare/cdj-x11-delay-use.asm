 261abd0: a9b17bfd     	stp	x29, x30, [sp, #-0xf0]!
 261abd4: 910003fd     	mov	x29, sp
 261abd8: a90153f3     	stp	x19, x20, [sp, #0x10]
 261abdc: aa0003f3     	mov	x19, x0
 261abe0: 97f2ee80     	bl	0x22d65e0
 261abe4: 97f2ee77     	bl	0x22d65c0
 261abe8: 35000840     	cbnz	w0, 0x261acf0
 261abec: b9405660     	ldr	w0, [x19, #0x54]
 261abf0: 35000200     	cbnz	w0, 0x261ac30
 261abf4: b9404260     	ldr	w0, [x19, #0x40]
 261abf8: 35000880     	cbnz	w0, 0x261ad08
 261abfc: 97f890d9     	bl	0x243ef60
 261ac00: b9402a61     	ldr	w1, [x19, #0x28]
 261ac04: 112ee021     	add	w1, w1, #0xbb8
 261ac08: 6b01001f     	cmp	w0, w1
 261ac0c: 540008c8     	b.hi	0x261ad24
