 22d6590: f00769e1     	adrp	x1, 0x11015000
 22d6594: f9058420     	str	x0, [x1, #0xb08]
 22d6598: d65f03c0     	ret
 22d659c: d503201f     	nop
 22d65a0: f00769e0     	adrp	x0, 0x11015000
 22d65a4: f9458400     	ldr	x0, [x0, #0xb08]
 22d65a8: b4000080     	cbz	x0, 0x22d65b8
 22d65ac: f9400001     	ldr	x1, [x0]
 22d65b0: f9400021     	ldr	x1, [x1]
 22d65b4: d61f0020     	br	x1
 22d65b8: d65f03c0     	ret
 22d65bc: d503201f     	nop
 22d65c0: f00769e0     	adrp	x0, 0x11015000
 22d65c4: f9458400     	ldr	x0, [x0, #0xb08]
 22d65c8: b4000080     	cbz	x0, 0x22d65d8
 22d65cc: f9400001     	ldr	x1, [x0]
 22d65d0: f9400421     	ldr	x1, [x1, #0x8]
 22d65d4: d61f0020     	br	x1
 22d65d8: 52800000     	mov	w0, #0x0                // =0
 22d65dc: d65f03c0     	ret
 22d65e0: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
 22d65e4: f00769e2     	adrp	x2, 0x11015000
 22d65e8: 910003fd     	mov	x29, sp
 22d65ec: f9458442     	ldr	x2, [x2, #0xb08]
 22d65f0: b4000102     	cbz	x2, 0x22d6610
 22d65f4: f9400043     	ldr	x3, [x2]
 22d65f8: aa0003e1     	mov	x1, x0
 22d65fc: aa0203e0     	mov	x0, x2
 22d6600: f9400862     	ldr	x2, [x3, #0x10]
 22d6604: d63f0040     	blr	x2
 22d6608: a8c57bfd     	ldp	x29, x30, [sp], #0x50
 22d660c: d65f03c0     	ret
 22d6610: 9100a3e0     	add	x0, sp, #0x28
 22d6614: 90002081     	adrp	x1, 0x26e6000
