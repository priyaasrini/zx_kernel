	.file	"zx_helper.c"
	.text
	.align	2
	.global	find_next_bit_set
	.type	find_next_bit_set, %function
find_next_bit_set:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	mov	r3, r0
	str	r1, [fp, #-20]
	strb	r3, [fp, #-16]
.L2:
	ldrb	r1, [fp, #-16]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	sub	r2, r3, #1
	mov	r3, #128
	mov	r3, r3, asr r2
	and	r3, r1, r3
	cmp	r3, #0
	beq	.L3
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
	b	.L5
.L3:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #8
	bgt	.L6
	b	.L2
.L6:
	mvn	r3, #0
	str	r3, [fp, #-24]
.L5:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	find_next_bit_set, .-find_next_bit_set
	.align	2
	.global	zx_is_taskid_valid
	.type	zx_is_taskid_valid, %function
zx_is_taskid_valid:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmn	r3, #1
	bne	.L10
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L12
.L10:
	ldr	r3, [fp, #-20]
	and	r3, r3, #63
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L13
	ldr	r3, [fp, #-16]
	cmp	r3, #63
	ble	.L15
.L13:
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L12
.L15:
	mov	r3, #1
	str	r3, [fp, #-24]
.L12:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_is_taskid_valid, .-zx_is_taskid_valid
	.align	2
	.global	zx_does_task_exist
	.type	zx_does_task_exist, %function
zx_does_task_exist:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L18
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L20
.L18:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L21
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L20
.L21:
	mov	r3, #1
	str	r3, [fp, #-24]
.L20:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_does_task_exist, .-zx_does_task_exist
	.align	2
	.global	zx_get_td
	.type	zx_get_td, %function
zx_get_td:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	and	r3, r3, #63
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, #417792
	add	r3, r3, #264
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_get_td, .-zx_get_td
	.align	2
	.global	zx_get_active_td
	.type	zx_get_active_td, %function
zx_get_active_td:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	r3, .L28
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	and	r3, r3, #63
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, #417792
	add	r3, r3, #264
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L29:
	.align	2
.L28:
	.word	413588
	.size	zx_get_active_td, .-zx_get_active_td
	.align	2
	.global	zx_get_active_task_id
	.type	zx_get_active_task_id, %function
zx_get_active_task_id:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	r3, .L32
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L33:
	.align	2
.L32:
	.word	413588
	.size	zx_get_active_task_id, .-zx_get_active_task_id
	.align	2
	.global	zx_set_active_task_id
	.type	zx_set_active_task_id, %function
zx_set_active_task_id:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, .L36
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	413588
	.size	zx_set_active_task_id, .-zx_set_active_task_id
	.align	2
	.global	zx_count_trailing_zeros
	.type	zx_count_trailing_zeros, %function
zx_count_trailing_zeros:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L39
	mov	r3, #32
	str	r3, [fp, #-24]
	b	.L41
.L39:
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L42
	ldr	r3, [fp, #-16]
	add	r3, r3, #16
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #16
	str	r3, [fp, #-20]
.L42:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L44
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #8
	str	r3, [fp, #-20]
.L44:
	ldr	r3, [fp, #-20]
	and	r3, r3, #15
	cmp	r3, #0
	bne	.L46
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #4
	str	r3, [fp, #-20]
.L46:
	ldr	r3, [fp, #-20]
	and	r3, r3, #3
	cmp	r3, #0
	bne	.L48
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #2
	str	r3, [fp, #-20]
.L48:
	ldr	r3, [fp, #-20]
	and	r2, r3, #1
	ldr	r3, [fp, #-16]
	rsb	r3, r2, r3
	str	r3, [fp, #-24]
.L41:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_count_trailing_zeros, .-zx_count_trailing_zeros
	.align	2
	.global	zx_count_trailing_zeros_64
	.type	zx_count_trailing_zeros_64, %function
zx_count_trailing_zeros_64:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-32]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-28]
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L52
	mov	r3, #64
	str	r3, [fp, #-36]
	b	.L54
.L52:
	mov	r3, #1
	mov	r4, #0
	str	r3, [fp, #-24]
	str	r4, [fp, #-20]
	sub	r1, fp, #32
	ldmia	r1, {r1-r2}
	mvn	r3, #0
	mov	r4, #0
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r1
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L55
	sub	r1, fp, #24
	ldmia	r1, {r1-r2}
	mov	r3, #32
	mov	r4, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-24]
	str	r4, [fp, #-20]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r4, #0
	str	r3, [fp, #-32]
	str	r4, [fp, #-28]
.L55:
	sub	r1, fp, #32
	ldmia	r1, {r1-r2}
	mov	r3, #65280
	add	r3, r3, #255
	mov	r4, #0
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r1
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L57
	sub	r1, fp, #24
	ldmia	r1, {r1-r2}
	mov	r3, #16
	mov	r4, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-24]
	str	r4, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r1, r3, asl #16
	ldr	r2, [fp, #-32]
	ldr	r0, [fp, #-28]
	mov	r3, r2, lsr #16
	orr	r3, r3, r1
	mov	r4, r0, lsr #16
	str	r3, [fp, #-32]
	str	r4, [fp, #-28]
.L57:
	sub	r1, fp, #32
	ldmia	r1, {r1-r2}
	mov	r3, #255
	mov	r4, #0
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r1
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L59
	sub	r1, fp, #24
	ldmia	r1, {r1-r2}
	mov	r3, #8
	mov	r4, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-24]
	str	r4, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r1, r3, asl #24
	ldr	r2, [fp, #-32]
	ldr	r0, [fp, #-28]
	mov	r3, r2, lsr #8
	orr	r3, r3, r1
	mov	r4, r0, lsr #8
	str	r3, [fp, #-32]
	str	r4, [fp, #-28]
.L59:
	sub	r1, fp, #32
	ldmia	r1, {r1-r2}
	mov	r3, #15
	mov	r4, #0
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r1
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L61
	sub	r1, fp, #24
	ldmia	r1, {r1-r2}
	mov	r3, #4
	mov	r4, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-24]
	str	r4, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r1, r3, asl #28
	ldr	r2, [fp, #-32]
	ldr	r0, [fp, #-28]
	mov	r3, r2, lsr #4
	orr	r3, r3, r1
	mov	r4, r0, lsr #4
	str	r3, [fp, #-32]
	str	r4, [fp, #-28]
.L61:
	sub	r1, fp, #32
	ldmia	r1, {r1-r2}
	mov	r3, #3
	mov	r4, #0
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r1
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L63
	sub	r1, fp, #24
	ldmia	r1, {r1-r2}
	mov	r3, #2
	mov	r4, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-24]
	str	r4, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r1, r3, asl #30
	ldr	r2, [fp, #-32]
	ldr	r0, [fp, #-28]
	mov	r3, r2, lsr #2
	orr	r3, r3, r1
	mov	r4, r0, lsr #2
	str	r3, [fp, #-32]
	str	r4, [fp, #-28]
.L63:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	and	r3, r3, #1
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
.L54:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
	.size	zx_count_trailing_zeros_64, .-zx_count_trailing_zeros_64
	.align	2
	.global	zx_set_bit_64
	.type	zx_set_bit_64, %function
zx_set_bit_64:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-40]
	str	r1, [fp, #-36]
	str	r2, [fp, #-44]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-44]
	mov	r4, r3, asr #31
	str	r3, [fp, #-32]
	str	r4, [fp, #-28]
	ldr	r1, [fp, #-32]
	sub	r0, r1, #32
	mov	r3, #1
	mov	ip, r3, asl r0
	rsb	r2, r1, #32
	mov	r3, #1
	mov	r2, r3, lsr r2
	mov	r3, #0
	mov	r3, r3, asl r1
	orr	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r0, #0
	movge	r3, ip
	str	r3, [fp, #-28]
	mov	r3, #1
	mov	r3, r3, asl r1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	cmp	r3, #1
	bne	.L67
	sub	r1, fp, #40
	ldmia	r1, {r1-r2}
	sub	r3, fp, #32
	ldmia	r3, {r3-r4}
	orr	r5, r1, r3
	orr	r6, r2, r4
	str	r5, [fp, #-56]
	str	r6, [fp, #-52]
	b	.L69
.L67:
	sub	r3, fp, #32
	ldmia	r3, {r3-r4}
	mvn	r1, r3
	mvn	r2, r4
	sub	r3, fp, #40
	ldmia	r3, {r3-r4}
	and	r5, r1, r3
	and	r6, r2, r4
	str	r5, [fp, #-56]
	str	r6, [fp, #-52]
.L69:
	sub	r3, fp, #56
	ldmia	r3, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	.size	zx_set_bit_64, .-zx_set_bit_64
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%x is the current task\012\015\000"
	.text
	.align	2
	.global	debug_print_list
	.type	debug_print_list, %function
debug_print_list:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L77
.L76:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L72
.L73:
	bl	zx_q_get_next_tid(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L77+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L72:
	ldr	r3, [fp, #-20]
	cmp	r3, #4
	ble	.L73
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L78:
	.align	2
.L77:
	.word	_GLOBAL_OFFSET_TABLE_-(.L76+8)
	.word	.LC0(GOTOFF)
	.size	debug_print_list, .-debug_print_list
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Printing Receiver Queue for task %d\012\015\000"
	.align	2
.LC2:
	.ascii	"%d is the sender node\012\015\000"
	.text
	.align	2
	.global	debug_print_receive_queue
	.type	debug_print_receive_queue, %function
debug_print_receive_queue:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L85
.L84:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L85+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	ldr	r0, [fp, #-24]
	bl	zx_receive_q_get_next_node(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	b	.L80
.L81:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L85+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-20]
.L80:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L81
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L86:
	.align	2
.L85:
	.word	_GLOBAL_OFFSET_TABLE_-(.L84+8)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	debug_print_receive_queue, .-debug_print_receive_queue
	.section	.rodata
	.align	2
.LC3:
	.ascii	"Stack (printing, then incrementing): \012\000"
	.align	2
.LC4:
	.ascii	"Addr (hex): %x. Value (hex): %x. Value (dec): %d.\012"
	.ascii	"\000"
	.text
	.align	2
	.global	debug_print_stack
	.type	debug_print_stack, %function
debug_print_stack:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L98
.L97:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L88
	mov r3, sp
	str	r3, [fp, #-24]
	b	.L90
.L88:
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	bne	.L91
	mov r3, ip
	str	r3, [fp, #-24]
	b	.L90
.L91:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-24]
.L90:
	mov	r0, #1
	ldr	r3, .L98+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L93
.L94:
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L98+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L93:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	ble	.L94
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L99:
	.align	2
.L98:
	.word	_GLOBAL_OFFSET_TABLE_-(.L97+8)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.size	debug_print_stack, .-debug_print_stack
	.align	2
	.global	zx_random
	.type	zx_random, %function
zx_random:
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
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #8
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r2, r3, r2
	ldr	r3, .L102
	add	r3, r2, r3
	mov	r3, r3, asl #17
	mov	r3, r3, lsr #17
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L103:
	.align	2
.L102:
	.word	2531011
	.size	zx_random, .-zx_random
	.global	__udivsi3
	.align	2
	.global	zx_random_range
	.type	zx_random_range, %function
zx_random_range:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	ldr	r0, .L109
	mov	r1, r3
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-16]
.L105:
	ldr	r0, [fp, #-16]
	bl	zx_random(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bls	.L106
	b	.L105
.L106:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L110:
	.align	2
.L109:
	.word	32767
	.size	zx_random_range, .-zx_random_range
	.ident	"GCC: (GNU) 4.0.2"
