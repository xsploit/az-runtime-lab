 1e262e0: a9b27bfd     	stp	x29, x30, [sp, #-0xe0]!
 1e262e4: d2800082     	mov	x2, #0x4                // =4
 1e262e8: 528003c1     	mov	w1, #0x1e               // =30
 1e262ec: 4f000400     	movi	v0.4s, #0x0
 1e262f0: 910003fd     	mov	x29, sp
 1e262f4: f2c00042     	movk	x2, #0x2, lsl #32
 1e262f8: a90153f3     	stp	x19, x20, [sp, #0x10]
 1e262fc: d0007be0     	adrp	x0, 0x2da4000
 1e26300: 9133e000     	add	x0, x0, #0xcf8
 1e26304: a9025bf5     	stp	x21, x22, [sp, #0x20]
 1e26308: a90363f7     	stp	x23, x24, [sp, #0x30]
 1e2630c: f9000102     	str	x2, [x8]
 1e26310: b9000901     	str	w1, [x8, #0x8]
 1e26314: 3d800500     	str	q0, [x8, #0x10]
 1e26318: 3d800900     	str	q0, [x8, #0x20]
 1e2631c: 3d800d00     	str	q0, [x8, #0x30]
 1e26320: f9003fe8     	str	x8, [sp, #0x78]
 1e26324: 97ffcebf     	bl	0x1e19e20
