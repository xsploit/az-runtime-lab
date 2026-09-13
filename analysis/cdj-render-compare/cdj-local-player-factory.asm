 1f6f1c8: a9007c1f     	stp	xzr, xzr, [x0]
 1f6f1cc: 7100003f     	cmp	w1, #0x0
 1f6f1d0: f900081f     	str	xzr, [x0, #0x10]
 1f6f1d4: 5400238d     	b.le	0x1f6f644
 1f6f1d8: a9b27bfd     	stp	x29, x30, [sp, #-0xe0]!
 1f6f1dc: 910003fd     	mov	x29, sp
 1f6f1e0: a90573fb     	stp	x27, x28, [sp, #0x50]
 1f6f1e4: d28d145c     	mov	x28, #0x68a2            // =26786
 1f6f1e8: f2a7f11c     	movk	x28, #0x3f88, lsl #16
 1f6f1ec: a9046bf9     	stp	x25, x26, [sp, #0x40]
 1f6f1f0: aa0003fa     	mov	x26, x0
 1f6f1f4: 51000420     	sub	w0, w1, #0x1
 1f6f1f8: f2cbaddc     	movk	x28, #0x5d6e, lsl #32
 1f6f1fc: aa0203fb     	mov	x27, x2
 1f6f200: f9003be0     	str	x0, [sp, #0x70]
 1f6f204: 910363e0     	add	x0, sp, #0xd8
 1f6f208: f2e03bdc     	movk	x28, #0x1de, lsl #48
 1f6f20c: a90153f3     	stp	x19, x20, [sp, #0x10]
 1f6f210: d2800014     	mov	x20, #0x0               // =0
 1f6f214: a9025bf5     	stp	x21, x22, [sp, #0x20]
 1f6f218: a90363f7     	stp	x23, x24, [sp, #0x30]
 1f6f21c: f90043e0     	str	x0, [sp, #0x80]
 1f6f220: d00081c0     	adrp	x0, 0x2fa9000
 1f6f224: 9138a000     	add	x0, x0, #0xe28
 1f6f228: f9003fe0     	str	x0, [sp, #0x78]
 1f6f22c: a90893e3     	stp	x3, x4, [sp, #0x88]
 1f6f230: b9009fe5     	str	w5, [sp, #0x9c]
 1f6f234: f90053e6     	str	x6, [sp, #0xa0]
 1f6f238: fd0033e8     	str	d8, [sp, #0x60]
 1f6f23c: d503201f     	nop
 1f6f240: a9400378     	ldp	x24, x0, [x27]
 1f6f244: 2a1403f7     	mov	w23, w20
 1f6f248: cb180000     	sub	x0, x0, x24
 1f6f24c: 9343fc00     	asr	x0, x0, #3
 1f6f250: 6b14001f     	cmp	w0, w20
 1f6f254: 540017ed     	b.le	0x1f6f550
 1f6f258: d37df280     	lsl	x0, x20, #3
 1f6f25c: f90057e0     	str	x0, [sp, #0xa8]
 1f6f260: d2803800     	mov	x0, #0x1c0              // =448
 1f6f264: 9792d903     	bl	0x425670
 1f6f268: a901fc1f     	stp	xzr, xzr, [x0, #0x18]
 1f6f26c: aa0003f3     	mov	x19, x0
 1f6f270: 91010019     	add	x25, x0, #0x40
 1f6f274: 941524d7     	bl	0x24b85d0
 1f6f278: f9403fe4     	ldr	x4, [sp, #0x78]
 1f6f27c: d00081c3     	adrp	x3, 0x2fa9000
 1f6f280: d00081c2     	adrp	x2, 0x2fa9000
 1f6f284: 913a8063     	add	x3, x3, #0xea0
 1f6f288: 913c0042     	add	x2, x2, #0xf00
 1f6f28c: 90003c21     	adrp	x1, 0x26f3000
 1f6f290: 9123c021     	add	x1, x1, #0x8f0
 1f6f294: f9000264     	str	x4, [x19]
 1f6f298: a9028a63     	stp	x3, x2, [x19, #0x28]
 1f6f29c: d2800400     	mov	x0, #0x20               // =32
 1f6f2a0: b9003a74     	str	w20, [x19, #0x38]
 1f6f2a4: f9002261     	str	x1, [x19, #0x40]
 1f6f2a8: 9792d8f2     	bl	0x425670
 1f6f2ac: 0f000420     	movi	v0.2s, #0x1
 1f6f2b0: aa0003f6     	mov	x22, x0
 1f6f2b4: aa0003f5     	mov	x21, x0
 1f6f2b8: 90003c20     	adrp	x0, 0x26f3000
 1f6f2bc: 9139c000     	add	x0, x0, #0xe70
 1f6f2c0: 90010442     	adrp	x2, 0x3ff7000
 1f6f2c4: 913ba042     	add	x2, x2, #0xee8
 1f6f2c8: fd0006c0     	str	d0, [x22, #0x8]
 1f6f2cc: f80106a0     	str	x0, [x21], #0x10
 1f6f2d0: f9000adf     	str	xzr, [x22, #0x10]
 1f6f2d4: b9000abf     	str	wzr, [x21, #0x8]
 1f6f2d8: 08dffc40     	ldarb	w0, [x2]
 1f6f2dc: 36001960     	tbz	w0, #0x0, 0x1f6f608
 1f6f2e0: 90010443     	adrp	x3, 0x3ff7000
 1f6f2e4: 913bc063     	add	x3, x3, #0xef0
 1f6f2e8: b9400062     	ldr	w2, [x3]
 1f6f2ec: b0008781     	adrp	x1, 0x3060000
 1f6f2f0: a904da75     	stp	x21, x22, [x19, #0x48]
 1f6f2f4: 91044021     	add	x1, x1, #0x110
 1f6f2f8: 9101a260     	add	x0, x19, #0x68
 1f6f2fc: f9000f3f     	str	xzr, [x25, #0x18]
 1f6f300: d2801675     	mov	x21, #0xb3              // =179
 1f6f304: f9000ac1     	str	x1, [x22, #0x10]
 1f6f308: f2f12015     	movk	x21, #0x8900, lsl #48
 1f6f30c: b9001ac2     	str	w2, [x22, #0x18]
 1f6f310: 92401ef7     	and	x23, x23, #0xff
 1f6f314: f900327f     	str	xzr, [x19, #0x60]
 1f6f318: 91034276     	add	x22, x19, #0xd0
 1f6f31c: 94151889     	bl	0x24b5540
 1f6f320: b0008780     	adrp	x0, 0x3060000
 1f6f324: 91080000     	add	x0, x0, #0x200
 1f6f328: f9002260     	str	x0, [x19, #0x40]
 1f6f32c: b0008780     	adrp	x0, 0x3060000
 1f6f330: 91094000     	add	x0, x0, #0x250
 1f6f334: f9001720     	str	x0, [x25, #0x28]
 1f6f338: f9003e7f     	str	xzr, [x19, #0x78]
 1f6f33c: d00081e0     	adrp	x0, 0x2fad000
 1f6f340: 913d8400     	add	x0, x0, #0xf61
 1f6f344: 97ffb36d     	bl	0x1f5c0f8
 1f6f348: 8b001001     	add	x1, x0, x0, lsl #4
 1f6f34c: d00081e2     	adrp	x2, 0x2fad000
 1f6f350: f900427f     	str	xzr, [x19, #0x80]
 1f6f354: 8b010c01     	add	x1, x0, x1, lsl #3
 1f6f358: 913e2440     	add	x0, x2, #0xf89
 1f6f35c: 91011c22     	add	x2, x1, #0x47
 1f6f360: 91028261     	add	x1, x19, #0xa0
 1f6f364: f90057e1     	str	x1, [sp, #0xa8]
 1f6f368: 9bd57c41     	umulh	x1, x2, x21
 1f6f36c: d378fc21     	lsr	x1, x1, #56
 1f6f370: 9b1c8821     	msub	x1, x1, x28, x2
 1f6f374: aa0122e1     	orr	x1, x23, x1, lsl #8
 1f6f378: f9004661     	str	x1, [x19, #0x88]
 1f6f37c: 97ffb35f     	bl	0x1f5c0f8
 1f6f380: 8b001001     	add	x1, x0, x0, lsl #4
 1f6f384: d0007682     	adrp	x2, 0x2e41000
 1f6f388: 8b010c01     	add	x1, x0, x1, lsl #3
 1f6f38c: 910d6440     	add	x0, x2, #0x359
 1f6f390: 91011c22     	add	x2, x1, #0x47
 1f6f394: 9bd57c41     	umulh	x1, x2, x21
 1f6f398: d378fc21     	lsr	x1, x1, #56
 1f6f39c: 9b1c8821     	msub	x1, x1, x28, x2
 1f6f3a0: aa0122f7     	orr	x23, x23, x1, lsl #8
 1f6f3a4: a9095e7f     	stp	xzr, x23, [x19, #0x90]
 1f6f3a8: d00081d7     	adrp	x23, 0x2fa9000
 1f6f3ac: 97ffb353     	bl	0x1f5c0f8
 1f6f3b0: 8b001005     	add	x5, x0, x0, lsl #4
 1f6f3b4: d37df286     	lsl	x6, x20, #3
 1f6f3b8: 912ec2f7     	add	x23, x23, #0xbb0
 1f6f3bc: 8b050c05     	add	x5, x0, x5, lsl #3
 1f6f3c0: 91060264     	add	x4, x19, #0x180
 1f6f3c4: 91011ca5     	add	x5, x5, #0x47
 1f6f3c8: 9100c263     	add	x3, x19, #0x30
 1f6f3cc: f94053e0     	ldr	x0, [sp, #0xa0]
 1f6f3d0: aa1903e1     	mov	x1, x25
 1f6f3d4: 9bd57cb5     	umulh	x21, x5, x21
 1f6f3d8: fc666b08     	ldr	d8, [x24, x6]
 1f6f3dc: a90b5e60     	stp	x0, x23, [x19, #0xb0]
 1f6f3e0: d378feb5     	lsr	x21, x21, #56
 1f6f3e4: f94047e2     	ldr	x2, [sp, #0x88]
 1f6f3e8: aa1603e0     	mov	x0, x22
 1f6f3ec: 9b1c96b5     	msub	x21, x21, x28, x5
 1f6f3f0: a90a567f     	stp	xzr, x21, [x19, #0xa0]
 1f6f3f4: f8266b1f     	str	xzr, [x24, x6]
 1f6f3f8: f9404bf5     	ldr	x21, [sp, #0x90]
 1f6f3fc: fd006268     	str	d8, [x19, #0xc0]
 1f6f400: f9006675     	str	x21, [x19, #0xc8]
 1f6f404: 97ffe407     	bl	0x1f68420
 1f6f408: d00081c0     	adrp	x0, 0x2fa9000
 1f6f40c: 9134c000     	add	x0, x0, #0xd30
 1f6f410: f9006a60     	str	x0, [x19, #0xd0]
 1f6f414: d00081c2     	adrp	x2, 0x2fa9000
 1f6f418: d00081c1     	adrp	x1, 0x2fa9000
 1f6f41c: 9136a042     	add	x2, x2, #0xda8
 1f6f420: 91376021     	add	x1, x1, #0xdd8
 1f6f424: d00081c0     	adrp	x0, 0x2fa9000
 1f6f428: 91380000     	add	x0, x0, #0xe00
 1f6f42c: a90b06c2     	stp	x2, x1, [x22, #0xb0]
 1f6f430: b9409fe1     	ldr	w1, [sp, #0x9c]
 1f6f434: a90c56c0     	stp	x0, x21, [x22, #0xc0]
 1f6f438: 7100003f     	cmp	w1, #0x0
 1f6f43c: fd006ac8     	str	d8, [x22, #0xd0]
 1f6f440: a91afe7f     	stp	xzr, xzr, [x19, #0x1a8]
 1f6f444: b901ba7f     	str	wzr, [x19, #0x1b8]
 1f6f448: 3906f27f     	strb	wzr, [x19, #0x1bc]
 1f6f44c: 5400006d     	b.le	0x1f6f458
 1f6f450: aa1303e0     	mov	x0, x19
 1f6f454: 941536d7     	bl	0x24bcfb0
 1f6f458: 910303e1     	add	x1, sp, #0xc0
 1f6f45c: 910323e0     	add	x0, sp, #0xc8
