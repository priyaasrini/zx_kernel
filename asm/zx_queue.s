	.file	"zx_queue.c"
	.text
	.align	2
	.global	zx_queue_initialize
	.type	zx_queue_initialize, %function
zx_queue_initialize:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	mvn	r3, #0
	str	r3, [r2, #8]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	mvn	r3, #0
	str	r3, [r2, #12]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	mov	r3, #1
	str	r3, [r2, #16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #20]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #24]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L2
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	mov	r3, #1
	str	r3, [r2, #20]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #16]
.L2:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_queue_initialize, .-zx_queue_initialize
	.global	__modsi3
	.align	2
	.global	zx_queue_insert
	.type	zx_queue_insert, %function
zx_queue_insert:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L6
	mov	r3, #3
	str	r3, [fp, #-48]
	b	.L8
.L6:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	__modsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	mul	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-44]
	ldr	r2, [fp, #-28]
	bl	zx_memcpy(PLT)
	ldr	r3, [fp, #-32]
	cmn	r3, #1
	bne	.L9
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	str	r3, [r2, #8]
.L9:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #16]
	ldr	r3, [fp, #-40]
	ldr	r4, [r3, #0]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-24]
	bl	zx_queue_is_full(PLT)
	mov	r3, r0
	str	r3, [r4, #20]
	mov	r3, #1
	str	r3, [fp, #-48]
.L8:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
	.size	zx_queue_insert, .-zx_queue_insert
	.align	2
	.global	zx_queue_remove
	.type	zx_queue_remove, %function
zx_queue_remove:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L13
	mov	r3, #2
	str	r3, [fp, #-48]
	b	.L15
.L13:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-28]
	bl	zx_memcpy(PLT)
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #20]
	ldr	r3, [fp, #-40]
	ldr	r4, [r3, #0]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-36]
	bl	zx_is_queue_empty(PLT)
	mov	r3, r0
	str	r3, [r4, #16]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	__modsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #8]
	mov	r3, #1
	str	r3, [fp, #-48]
.L15:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
	.size	zx_queue_remove, .-zx_queue_remove
	.align	2
	.global	zx_is_queue_empty
	.type	zx_is_queue_empty, %function
zx_is_queue_empty:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L18
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L20
.L18:
	mov	r3, #0
	str	r3, [fp, #-24]
.L20:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_is_queue_empty, .-zx_is_queue_empty
	.align	2
	.global	zx_queue_is_full
	.type	zx_queue_is_full, %function
zx_queue_is_full:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	__modsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L23
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L25
.L23:
	mov	r3, #0
	str	r3, [fp, #-28]
.L25:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_queue_is_full, .-zx_queue_is_full
	.ident	"GCC: (GNU) 4.0.2"
