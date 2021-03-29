	.file	"zx_ready_queue.c"
	.text
	.align	2
	.global	zx_q_create_node
	.type	zx_q_create_node, %function
zx_q_create_node:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	and	r3, r3, #63
	mov	r0, r3
	bl	zx_q_get_node(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_q_create_node, .-zx_q_create_node
	.align	2
	.global	zx_q_append_to_end
	.type	zx_q_append_to_end, %function
zx_q_append_to_end:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	ldr	r0, [fp, #-40]
	bl	zx_q_get_head_addr(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r0, [fp, #-36]
	bl	zx_q_create_node(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-36]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	beq	.L9
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L6
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #4]
	b	.L8
.L6:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #8]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #8]
.L8:
	ldr	r0, [fp, #-40]
	bl	zx_q_add_priority(PLT)
.L9:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_q_append_to_end, .-zx_q_append_to_end
	.align	2
	.global	zx_q_append_to_penultimate
	.type	zx_q_append_to_penultimate, %function
zx_q_append_to_penultimate:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r0, [fp, #-36]
	bl	zx_q_get_head_addr(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-32]
	bl	zx_q_create_node(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L11
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #4]
	b	.L13
.L11:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #8]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L13
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
.L13:
	ldr	r0, [fp, #-36]
	bl	zx_q_add_priority(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_q_append_to_penultimate, .-zx_q_append_to_penultimate
	.align	2
	.global	zx_q_add_priority
	.type	zx_q_add_priority, %function
zx_q_add_priority:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r3, .L18
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r2, #1
	ldr	r3, [fp, #-24]
	mov	r3, r2, asl r3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	orr	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L19:
	.align	2
.L18:
	.word	413592
	.size	zx_q_add_priority, .-zx_q_add_priority
	.align	2
	.global	zx_q_remove_priority
	.type	zx_q_remove_priority, %function
zx_q_remove_priority:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r3, .L22
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r2, #1
	ldr	r3, [fp, #-24]
	mov	r3, r2, asl r3
	mvn	r3, r3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	and	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L23:
	.align	2
.L22:
	.word	413592
	.size	zx_q_remove_priority, .-zx_q_remove_priority
	.align	2
	.global	zx_q_get_highest_priority
	.type	zx_q_get_highest_priority, %function
zx_q_get_highest_priority:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	r3, .L26
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mov	r0, r3
	bl	zx_count_trailing_zeros(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	413592
	.size	zx_q_get_highest_priority, .-zx_q_get_highest_priority
	.align	2
	.global	zx_q_remove_node
	.type	zx_q_remove_node, %function
zx_q_remove_node:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	and	r3, r3, #63
	mov	r0, r3
	bl	zx_q_get_node(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L37
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L31
	b	.L37
.L31:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L33
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L33
	ldr	r0, [fp, #-36]
	bl	zx_q_get_head_addr(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-36]
	bl	zx_q_remove_priority(PLT)
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #0]
	b	.L36
.L33:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #8]
.L36:
	ldr	r0, [fp, #-28]
	bl	zx_q_free_node(PLT)
.L37:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_q_remove_node, .-zx_q_remove_node
	.align	2
	.global	zx_q_get_next_tid
	.type	zx_q_get_next_tid, %function
zx_q_get_next_tid:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	bl	zx_q_get_highest_priority(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #32
	bne	.L39
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L41
.L39:
	ldr	r0, [fp, #-28]
	bl	zx_q_get_head_addr(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-32]
.L41:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_q_get_next_tid, .-zx_q_get_next_tid
	.align	2
	.global	zx_q_free_node
	.type	zx_q_free_node, %function
zx_q_free_node:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #8]
	ldmfd	sp, {r3, fp, sp, pc}
	.size	zx_q_free_node, .-zx_q_free_node
	.align	2
	.global	zx_q_get_node
	.type	zx_q_get_node, %function
zx_q_get_node:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, .L47
	add	r3, r2, r3
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L48:
	.align	2
.L47:
	.word	415752
	.size	zx_q_get_node, .-zx_q_get_node
	.align	2
	.global	zx_q_get_head_addr
	.type	zx_q_get_head_addr, %function
zx_q_get_head_addr:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	ldr	r3, .L51
	add	r3, r2, r3
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L52:
	.align	2
.L51:
	.word	415624
	.size	zx_q_get_head_addr, .-zx_q_get_head_addr
	.ident	"GCC: (GNU) 4.0.2"
