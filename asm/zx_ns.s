	.file	"zx_ns.c"
	.text
	.align	2
	.global	zx_name_server
	.type	zx_name_server, %function
zx_name_server:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L2
.L3:
	sub	r3, fp, #28
	sub	r2, fp, #40
	mov	r0, r3
	mov	r1, r2
	mov	r2, #12
	bl	Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	sub	r3, r3, #1
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L4
	.p2align 2
.L9:
	b	.L5
	b	.L6
	b	.L7
	b	.L8
.L5:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-44]
	mov	r0, r3
	mov	r1, r2
	bl	zx_bst_get_by_name(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L10
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-36]
	b	.L13
.L10:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L13
.L6:
	ldr	r2, [fp, #-32]
	ldr	ip, [fp, #-36]
	sub	r3, fp, #44
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_bst_add_by_name(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L14
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L13
.L14:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L13
.L7:
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	b	.L13
.L8:
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L13
.L4:
	mov	r3, #0
	str	r3, [fp, #-40]
.L13:
	ldr	r3, [fp, #-28]
	sub	r2, fp, #40
	mov	r0, r3
	mov	r1, r2
	mov	r2, #12
	bl	Reply(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
.L2:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L3
	bl	Exit(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_name_server, .-zx_name_server
	.ident	"GCC: (GNU) 4.0.2"
