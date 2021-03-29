	.file	"zx_kernel_head.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r0, [fp, #-20]
	bl	zx_kernel_init(PLT)
.L2:
	bl	zx_get_next_request(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L3
	ldr	r0, [fp, #-16]
	bl	zx_handle(PLT)
	b	.L2
.L3:
	bl	zx_get_closure_errors(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L5
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L7
.L5:
	mov	r3, #0
	str	r3, [fp, #-28]
.L7:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
