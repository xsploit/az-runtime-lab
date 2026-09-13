 24bcfb0: 7100003f     	cmp	w1, #0x0
 24bcfb4: 5400008d     	b.le	0x24bcfc4
 24bcfb8: 52807d02     	mov	w2, #0x3e8              // =1000
 24bcfbc: 1ac10c41     	sdiv	w1, w2, w1
 24bcfc0: 17fffeac     	b	0x24bca70
