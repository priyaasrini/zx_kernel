	.file	"zx_receive_queue.c"
	.text
	.align	2
	.global	zx_receive_q_create_node
	.type	zx_receive_q_create_node, %function
zx_receive_q_create_node:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	and	r3, r3, #63
	mov	r0, r3
	bl	zx_receive_q_get_node(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #12]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_receive_q_create_node, .-zx_receive_q_create_node
	.align	2
	.global	zx_receive_q_append_to_end
	.type	zx_receive_q_append_to_end, %function
zx_receive_q_append_to_end:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	and	r3, r3, #63
	mov	r0, r3
	bl	zx_receive_q_get_tail_addr(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L4
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	and	r3, r3, #63
	mov	r0, r3
	bl	zx_receive_q_get_head_addr(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	b	.L7
.L4:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #12]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
.L7:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_receive_q_append_to_end, .-zx_receive_q_append_to_end
	.align	2
	.global	zx_receive_q_get_next_node
	.type	zx_receive_q_get_next_node, %function
zx_receive_q_get_next_node:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	and	r3, r3, #63
	mov	r0, r3
	bl	zx_receive_q_get_head_addr(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L9
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L11
.L9:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L12
	ldr	r3, [fp, #-28]
	and	r3, r3, #63
	mov	r0, r3
	bl	zx_receive_q_get_tail_addr(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #0]
.L12:
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-32]
.L11:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_receive_q_get_next_node, .-zx_receive_q_get_next_node
	.align	2
	.global	zx_receive_q_free_head
	.type	zx_receive_q_free_head, %function
zx_receive_q_free_head:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #12]
	ldmfd	sp, {r3, fp, sp, pc}
	.size	zx_receive_q_free_head, .-zx_receive_q_free_head
	.align	2
	.global	zx_receive_q_get_node
	.type	zx_receive_q_get_node, %function
zx_receive_q_get_node:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #4
	ldr	r3, .L19
	add	r3, r2, r3
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L20:
	.align	2
.L19:
	.word	417032
	.size	zx_receive_q_get_node, .-zx_receive_q_get_node
	.align	2
	.global	zx_receive_q_get_tail_addr
	.type	zx_receive_q_get_tail_addr, %function
zx_receive_q_get_tail_addr:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	ldr	r3, .L23
	add	r3, r2, r3
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	416776
	.size	zx_receive_q_get_tail_addr, .-zx_receive_q_get_tail_addr
	.align	2
	.global	zx_receive_q_get_head_addr
	.type	zx_receive_q_get_head_addr, %function
zx_receive_q_get_head_addr:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	ldr	r3, .L27
	add	r3, r2, r3
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L28:
	.align	2
.L27:
	.word	416520
	.size	zx_receive_q_get_head_addr, .-zx_receive_q_get_head_addr
	.ident	"GCC: (GNU) 4.0.2"
