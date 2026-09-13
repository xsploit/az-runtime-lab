 1f6acd8: a9b27bfd     	stp	x29, x30, [sp, #-0xe0]!
 1f6acdc: d2800022     	mov	x2, #0x1                // =1
 1f6ace0: 52800641     	mov	w1, #0x32               // =50
 1f6ace4: 4f000400     	movi	v0.4s, #0x0
 1f6ace8: 910003fd     	mov	x29, sp
 1f6acec: f2c000a2     	movk	x2, #0x5, lsl #32
 1f6acf0: a90153f3     	stp	x19, x20, [sp, #0x10]
 1f6acf4: 90008220     	adrp	x0, 0x2fae000
 1f6acf8: 9104e000     	add	x0, x0, #0x138
 1f6acfc: a9025bf5     	stp	x21, x22, [sp, #0x20]
 1f6ad00: a90363f7     	stp	x23, x24, [sp, #0x30]
 1f6ad04: a90573fb     	stp	x27, x28, [sp, #0x50]
 1f6ad08: aa0803fc     	mov	x28, x8
 1f6ad0c: f9000102     	str	x2, [x8]
 1f6ad10: b9000901     	str	w1, [x8, #0x8]
 1f6ad14: 3d800500     	str	q0, [x8, #0x10]
 1f6ad18: 3d800900     	str	q0, [x8, #0x20]
 1f6ad1c: 3d800d00     	str	q0, [x8, #0x30]
 1f6ad20: 3d801100     	str	q0, [x8, #0x40]
 1f6ad24: 97ffc4f5     	bl	0x1f5c0f8
