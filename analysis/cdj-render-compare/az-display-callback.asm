 212fb40: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
 212fb44: 910003fd     	mov	x29, sp
 212fb48: a90153f3     	stp	x19, x20, [sp, #0x10]
 212fb4c: 91016014     	add	x20, x0, #0x58
 212fb50: aa0003f3     	mov	x19, x0
 212fb54: f90013f5     	str	x21, [sp, #0x20]
 212fb58: 91002015     	add	x21, x0, #0x8
 212fb5c: aa1503e0     	mov	x0, x21
 212fb60: 9409a3d4     	bl	0x2398ab0
 212fb64: aa1403e0     	mov	x0, x20
 212fb68: 97fffd8a     	bl	0x212f190
 212fb6c: 6d411683     	ldp	d3, d5, [x20, #0x10]
 212fb70: fd403e60     	ldr	d0, [x19, #0x78]
 212fb74: fd402e61     	ldr	d1, [x19, #0x58]
 212fb78: 1e6338a4     	fsub	d4, d5, d3
 212fb7c: 1e633800     	fsub	d0, d0, d3
 212fb80: 1e611882     	fdiv	d2, d4, d1
 212fb84: 1e611800     	fdiv	d0, d0, d1
 212fb88: 1e700041     	fcvtms	w1, d2
 212fb8c: 1e700000     	fcvtms	w0, d0
 212fb90: 4b000020     	sub	w0, w1, w0
 212fb94: 7100041f     	cmp	w0, #0x1
 212fb98: 5400050d     	b.le	0x212fc38
 212fb9c: f9402260     	ldr	x0, [x19, #0x40]
 212fba0: b4000940     	cbz	x0, 0x212fcc8
 212fba4: 9100c261     	add	x1, x19, #0x30
 212fba8: aa0103e0     	mov	x0, x1
 212fbac: f9402661     	ldr	x1, [x19, #0x48]
 212fbb0: d63f0020     	blr	x1
 212fbb4: aa1303e0     	mov	x0, x19
 212fbb8: 97ffff52     	bl	0x212f900
 212fbbc: fd403a64     	ldr	d4, [x19, #0x70]
 212fbc0: d2e79600     	mov	x0, #0x3cb0000000000000 // =4372995238176751616
 212fbc4: fd402e63     	ldr	d3, [x19, #0x58]
 212fbc8: 9e670005     	fmov	d5, x0
 212fbcc: fd003e64     	str	d4, [x19, #0x78]
 212fbd0: fd400a80     	ldr	d0, [x20, #0x10]
 212fbd4: 1e603882     	fsub	d2, d4, d0
 212fbd8: 1e631841     	fdiv	d1, d2, d3
 212fbdc: 1e780020     	fcvtzs	w0, d1
 212fbe0: 1e620001     	scvtf	d1, w0
 212fbe4: 1e630821     	fmul	d1, d1, d3
 212fbe8: 1e613842     	fsub	d2, d2, d1
 212fbec: 1e602048     	fcmp	d2, #0.0
 212fbf0: 1e614046     	fneg	d6, d2
 212fbf4: 1e62bcc2     	fcsel	d2, d6, d2, lt
 212fbf8: 1e652050     	fcmpe	d2, d5
 212fbfc: 540001a5     	b.pl	0x212fc30
 212fc00: 1e612800     	fadd	d0, d0, d1
 212fc04: 1e6c1001     	fmov	d1, #0.50000000
 212fc08: aa1503e0     	mov	x0, x21
 212fc0c: a94153f3     	ldp	x19, x20, [sp, #0x10]
 212fc10: 1e643800     	fsub	d0, d0, d4
 212fc14: f94013f5     	ldr	x21, [sp, #0x20]
 212fc18: a8c37bfd     	ldp	x29, x30, [sp], #0x30
 212fc1c: 1e632800     	fadd	d0, d0, d3
 212fc20: 1e612800     	fadd	d0, d0, d1
 212fc24: 1e780001     	fcvtzs	w1, d0
 212fc28: 11000421     	add	w1, w1, #0x1
 212fc2c: 1409b45d     	b	0x239cda0
 212fc30: 1e632821     	fadd	d1, d1, d3
 212fc34: 17fffff3     	b	0x212fc00
 212fc38: 1e780041     	fcvtzs	w1, d2
 212fc3c: d2e79602     	mov	x2, #0x3cb0000000000000 // =4372995238176751616
 212fc40: 9e670042     	fmov	d2, x2
 212fc44: 52800022     	mov	w2, #0x1                // =1
 212fc48: 4b000040     	sub	w0, w2, w0
 212fc4c: 1e620020     	scvtf	d0, w1
 212fc50: 1e610800     	fmul	d0, d0, d1
 212fc54: 1e603884     	fsub	d4, d4, d0
 212fc58: 1e602088     	fcmp	d4, #0.0
 212fc5c: 1e614086     	fneg	d6, d4
 212fc60: 1e64bcc4     	fcsel	d4, d6, d4, lt
 212fc64: 1e622090     	fcmpe	d4, d2
 212fc68: 540001c5     	b.pl	0x212fca0
 212fc6c: 1e602860     	fadd	d0, d3, d0
 212fc70: 1e620002     	scvtf	d2, w0
 212fc74: 1e6c1003     	fmov	d3, #0.50000000
 212fc78: aa1503e0     	mov	x0, x21
 212fc7c: 1e653800     	fsub	d0, d0, d5
