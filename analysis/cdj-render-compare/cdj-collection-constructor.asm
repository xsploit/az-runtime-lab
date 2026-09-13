 1f6f750: a9b27bfd     	stp	x29, x30, [sp, #-0xe0]!
 1f6f754: d00081c2     	adrp	x2, 0x2fa9000
 1f6f758: 912ce042     	add	x2, x2, #0xb38
 1f6f75c: 910003fd     	mov	x29, sp
 1f6f760: a90153f3     	stp	x19, x20, [sp, #0x10]
 1f6f764: aa0003f3     	mov	x19, x0
 1f6f768: d00081c0     	adrp	x0, 0x2fa9000
 1f6f76c: 91308000     	add	x0, x0, #0xc20
 1f6f770: a9025bf5     	stp	x21, x22, [sp, #0x20]
 1f6f774: d00081c3     	adrp	x3, 0x2fa9000
 1f6f778: a90363f7     	stp	x23, x24, [sp, #0x30]
 1f6f77c: 912e0063     	add	x3, x3, #0xb80
 1f6f780: aa0103f4     	mov	x20, x1
 1f6f784: a9046bf9     	stp	x25, x26, [sp, #0x40]
 1f6f788: f00041c5     	adrp	x5, 0x27aa000
 1f6f78c: b00041a4     	adrp	x4, 0x27a4000
 1f6f790: f9000a60     	str	x0, [x19, #0x10]
 1f6f794: d00081c0     	adrp	x0, 0x2fa9000
 1f6f798: 9131e000     	add	x0, x0, #0xc78
 1f6f79c: a9000e62     	stp	x2, x3, [x19]
 1f6f7a0: d00081c2     	adrp	x2, 0x2fa9000
 1f6f7a4: 91314042     	add	x2, x2, #0xc50
 1f6f7a8: a9018262     	stp	x2, x0, [x19, #0x18]
 1f6f7ac: d0004ec0     	adrp	x0, 0x2949000
 1f6f7b0: 9119a000     	add	x0, x0, #0x668
 1f6f7b4: 911440a5     	add	x5, x5, #0x510
 1f6f7b8: 9110e084     	add	x4, x4, #0x438
 1f6f7bc: f00081c1     	adrp	x1, 0x2faa000
 1f6f7c0: d00104d5     	adrp	x21, 0x4009000
 1f6f7c4: 91040021     	add	x1, x1, #0x100
 1f6f7c8: 910f42b5     	add	x21, x21, #0x3d0
 1f6f7cc: 900050c3     	adrp	x3, 0x2987000
 1f6f7d0: f00081c2     	adrp	x2, 0x2faa000
 1f6f7d4: 91222063     	add	x3, x3, #0x888
 1f6f7d8: 9102a042     	add	x2, x2, #0xa8
 1f6f7dc: a9029265     	stp	x5, x4, [x19, #0x28]
 1f6f7e0: f9001e63     	str	x3, [x19, #0x38]
 1f6f7e4: f9002262     	str	x2, [x19, #0x40]
 1f6f7e8: f9002661     	str	x1, [x19, #0x48]
 1f6f7ec: f9002a60     	str	x0, [x19, #0x50]
 1f6f7f0: 08dffea0     	ldarb	w0, [x21]
 1f6f7f4: d00104d6     	adrp	x22, 0x4009000
 1f6f7f8: 36002d60     	tbz	w0, #0x0, 0x1f6fda4
 1f6f7fc: b943dacc     	ldr	w12, [x22, #0x3d8]
 1f6f800: f00081cb     	adrp	x11, 0x2faa000
 1f6f804: f00081ca     	adrp	x10, 0x2faa000
 1f6f808: 9104c16b     	add	x11, x11, #0x130
 1f6f80c: 9108814a     	add	x10, x10, #0x220
 1f6f810: f00081c9     	adrp	x9, 0x2faa000
 1f6f814: f00081c8     	adrp	x8, 0x2faa000
 1f6f818: 910a0129     	add	x9, x9, #0x280
 1f6f81c: f00081c7     	adrp	x7, 0x2faa000
 1f6f820: 910aa108     	add	x8, x8, #0x2a8
 1f6f824: 910b40e7     	add	x7, x7, #0x2d0
 1f6f828: f00081c6     	adrp	x6, 0x2faa000
 1f6f82c: f00081c5     	adrp	x5, 0x2faa000
 1f6f830: 910c60c6     	add	x6, x6, #0x318
 1f6f834: 910d00a5     	add	x5, x5, #0x340
 1f6f838: f00081c4     	adrp	x4, 0x2faa000
 1f6f83c: f00081c3     	adrp	x3, 0x2faa000
 1f6f840: 910da084     	add	x4, x4, #0x368
 1f6f844: 910f0063     	add	x3, x3, #0x3c0
 1f6f848: f00081c2     	adrp	x2, 0x2faa000
 1f6f84c: f00081c1     	adrp	x1, 0x2faa000
 1f6f850: 910fc042     	add	x2, x2, #0x3f0
 1f6f854: 91106021     	add	x1, x1, #0x418
 1f6f858: f00081c0     	adrp	x0, 0x2faa000
 1f6f85c: 91094000     	add	x0, x0, #0x250
 1f6f860: a9002a6b     	stp	x11, x10, [x19]
 1f6f864: 9101a27a     	add	x26, x19, #0x68
 1f6f868: a9012660     	stp	x0, x9, [x19, #0x10]
 1f6f86c: aa1a03e0     	mov	x0, x26
 1f6f870: a9021e68     	stp	x8, x7, [x19, #0x20]
 1f6f874: a9031666     	stp	x6, x5, [x19, #0x30]
 1f6f878: a9040e64     	stp	x4, x3, [x19, #0x40]
 1f6f87c: a9050662     	stp	x2, x1, [x19, #0x50]
 1f6f880: b900626c     	str	w12, [x19, #0x60]
 1f6f884: 97ffcd95     	bl	0x1f62ed8
 1f6f888: f9400a80     	ldr	x0, [x20, #0x10]
 1f6f88c: aa1403e2     	mov	x2, x20
 1f6f890: a9431283     	ldp	x3, x4, [x20, #0x30]
 1f6f894: f100001f     	cmp	x0, #0x0
 1f6f898: 9102e261     	add	x1, x19, #0xb8
 1f6f89c: 9a9a1000     	csel	x0, x0, x26, ne
 1f6f8a0: b9400a85     	ldr	w5, [x20, #0x8]
 1f6f8a4: 91002266     	add	x6, x19, #0x8
 1f6f8a8: f9003be1     	str	x1, [sp, #0x70]
 1f6f8ac: a90a8e60     	stp	x0, x3, [x19, #0xa8]
 1f6f8b0: aa0103e0     	mov	x0, x1
 1f6f8b4: b8418441     	ldr	w1, [x2], #0x18
 1f6f8b8: 97fffe44     	bl	0x1f6f1c8
