	.file	"zx_system_call_handlers.c"
	.text
	.align	2
	.global	zx_parent_tid
	.type	zx_parent_tid, %function
zx_parent_tid:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	beq	.L2
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-28]
	b	.L4
.L2:
	mov	r3, #0
	str	r3, [fp, #-28]
.L4:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_parent_tid, .-zx_parent_tid
	.align	2
	.global	zx_my_tid
	.type	zx_my_tid, %function
zx_my_tid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	bl	zx_get_active_task_id(PLT)
	mov	r3, r0
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	.size	zx_my_tid, .-zx_my_tid
	.align	2
	.global	zx_exit
	.type	zx_exit, %function
zx_exit:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	zx_kill(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
	.size	zx_exit, .-zx_exit
	.align	2
	.global	zx_create
	.type	zx_create, %function
zx_create:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	ldr	sl, .L21
.L20:
	add	sl, pc, sl
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	ldr	r3, .L21+4
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldmia	r3, {r3-r4}
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	ldr	r3, .L21+8
	ldr	r3, [sl, r3]
	mov	r2, r3
	ldr	r3, [fp, #-52]
	cmp	r3, r2
	bne	.L11
	mov	r3, #48
	str	r3, [fp, #-36]
	b	.L13
.L11:
	sub	r3, fp, #44
	ldmia	r3, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	bl	zx_count_trailing_zeros_64(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
.L13:
	ldr	r3, [fp, #-36]
	cmp	r3, #64
	bne	.L14
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L16
.L14:
	sub	r3, fp, #44
	ldmia	r3, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	ldr	r2, [fp, #-36]
	mov	r3, #0
	bl	zx_set_bit_64(PLT)
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	sub	r3, fp, #44
	ldr	r0, [fp, #-32]
	mov	r1, r3
	mov	r2, #8
	bl	zx_memcpy(PLT)
	ldr	r0, [fp, #-36]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #8
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, .L21+8
	ldr	r3, [sl, r3]
	mov	r2, r3
	ldr	r3, [fp, #-52]
	cmp	r3, r2
	bne	.L17
	mov	r3, #0
	str	r3, [fp, #-24]
.L17:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	and	r2, r3, #255
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #8
	orr	r2, r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	bl	zx_my_tid(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-28]
	str	r2, [r3, #4]
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-48]
	str	r3, [r2, #12]
	ldr	r2, [fp, #-36]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #14
	add	r3, r3, #421888
	add	r3, r3, #264
	mov	r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #20]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #20]
	add	r2, r3, #1638400
	ldr	r3, [fp, #-28]
	str	r2, [r3, #16]
	ldr	r2, [fp, #-28]
	mov	r3, #16
	str	r3, [r2, #28]
	ldr	r2, [fp, #-28]
	mvn	r3, #1
	str	r3, [r2, #32]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #16]
	mov	r0, r3
	ldr	r1, [fp, #-52]
	bl	zx_initialize_stack(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #24]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	zx_heap_create(PLT)
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-56]
.L16:
	ldr	r3, [fp, #-56]
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, sl, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
	.word	413580
	.word	zx_idle(GOT)
	.size	zx_create, .-zx_create
	.align	2
	.global	zx_send
	.type	zx_send, %function
zx_send:
	@ args = 4, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #44
	str	r0, [fp, #-44]
	str	r1, [fp, #-48]
	str	r2, [fp, #-52]
	str	r3, [fp, #-56]
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	beq	.L24
	ldr	r0, [fp, #-44]
	bl	zx_is_taskid_valid(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L26
.L24:
	ldr	r2, [fp, #-36]
	mvn	r3, #0
	str	r3, [r2, #32]
	b	.L35
.L26:
	ldr	r0, [fp, #-44]
	bl	zx_does_task_exist(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L28
	ldr	r2, [fp, #-36]
	mvn	r3, #1
	str	r3, [r2, #32]
	b	.L35
.L28:
	ldr	r0, [fp, #-44]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	cmp	r3, #5
	bne	.L30
	ldr	r2, [fp, #-36]
	mvn	r3, #2
	str	r3, [r2, #32]
	b	.L35
.L30:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	zx_q_remove_node(PLT)
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	sub	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-40]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	sub	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #4]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [r2, #24]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	cmp	r3, #4
	bne	.L32
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-40]
	str	r3, [r2, #24]
	bl	zx_get_active_task_id(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-20]
	bl	zx_memcpy(PLT)
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-52]
	str	r3, [r2, #32]
	ldr	r2, [fp, #-36]
	mov	r3, #5
	str	r3, [r2, #8]
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	zx_q_append_to_penultimate(PLT)
	b	.L35
.L32:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-52]
	bl	zx_receive_q_create_node(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-16]
	bl	zx_receive_q_append_to_end(PLT)
	ldr	r2, [fp, #-36]
	mov	r3, #3
	str	r3, [r2, #8]
.L35:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_send, .-zx_send
	.align	2
	.global	zx_receive
	.type	zx_receive, %function
zx_receive:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-32]
	ldr	r0, [fp, #-32]
	bl	zx_receive_q_get_next_node(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L37
	ldr	r2, [fp, #-36]
	mov	r3, #4
	str	r3, [r2, #8]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-32]
	mov	r1, r3
	bl	zx_q_remove_node(PLT)
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #4
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-48]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #4
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #4
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #24]
	b	.L40
.L37:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r0, [fp, #-20]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #5
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	ldr	r2, [fp, #-48]
	bl	zx_memcpy(PLT)
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #32]
	ldr	r0, [fp, #-28]
	bl	zx_receive_q_free_head(PLT)
.L40:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_receive, .-zx_receive
	.align	2
	.global	zx_reply
	.type	zx_reply, %function
zx_reply:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-36]
	bl	zx_is_taskid_valid(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L42
	ldr	r2, [fp, #-32]
	mvn	r3, #0
	str	r3, [r2, #32]
	b	.L54
.L42:
	ldr	r0, [fp, #-36]
	bl	zx_does_task_exist(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L45
	ldr	r2, [fp, #-32]
	mvn	r3, #1
	str	r3, [r2, #32]
	b	.L54
.L45:
	ldr	r0, [fp, #-36]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	cmp	r3, #5
	beq	.L47
	ldr	r2, [fp, #-32]
	mvn	r3, #2
	str	r3, [r2, #32]
	b	.L54
.L47:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bge	.L49
	ldr	r2, [fp, #-32]
	mvn	r3, #3
	str	r3, [r2, #32]
	b	.L54
.L49:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #24]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-44]
	bl	zx_memcpy(PLT)
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-44]
	str	r3, [r2, #32]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L51
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	zx_q_append_to_penultimate(PLT)
	b	.L53
.L51:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	zx_q_append_to_end(PLT)
.L53:
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #32]
.L54:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_reply, .-zx_reply
	.section	.rodata
	.align	2
.LC0:
	.ascii	"zx_await_event: Unsupported event_number: %d.\012\000"
	.text
	.align	2
	.global	zx_await_event
	.type	zx_await_event, %function
zx_await_event:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L67
.L66:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L56
	.p2align 2
.L62:
	b	.L57
	b	.L58
	b	.L59
	b	.L60
	b	.L61
.L57:
	ldr	r3, .L67+4
	str	r3, [fp, #-24]
	b	.L63
.L58:
	ldr	r3, .L67+8
	str	r3, [fp, #-24]
	mov	r0, #23
	bl	zx_device_intr_on(PLT)
	b	.L63
.L59:
	ldr	r3, .L67+12
	str	r3, [fp, #-24]
	mov	r0, #24
	bl	zx_device_intr_on(PLT)
	mov	r0, #1
	bl	zx_device_intr_on(PLT)
	b	.L63
.L60:
	ldr	r3, .L67+16
	str	r3, [fp, #-24]
	mov	r0, #25
	bl	zx_device_intr_on(PLT)
	b	.L63
.L61:
	ldr	r3, .L67+20
	str	r3, [fp, #-24]
	mov	r0, #26
	bl	zx_device_intr_on(PLT)
	b	.L63
.L56:
	mov	r0, #1
	ldr	r3, .L67+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	b	.L65
.L63:
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, #6
	str	r3, [r2, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	zx_q_remove_node(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
.L65:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L68:
	.align	2
.L67:
	.word	_GLOBAL_OFFSET_TABLE_-(.L66+8)
	.word	413640
	.word	413648
	.word	413644
	.word	413656
	.word	413652
	.word	.LC0(GOTOFF)
	.size	zx_await_event, .-zx_await_event
	.align	2
	.global	zx_handle_hwi
	.type	zx_handle_hwi, %function
zx_handle_hwi:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	cmp	r3, #25
	addls	pc, pc, r3, asl #2
	b	.L78
	.p2align 2
.L77:
	b	.L71
	b	.L78
	b	.L78
	b	.L72
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L78
	b	.L73
	b	.L74
	b	.L75
	b	.L76
.L72:
	mov	r0, #0
	bl	zx_handle_timer_interrupt(PLT)
	b	.L78
.L73:
	mov	r0, #23
	mov	r1, #0
	bl	zx_handle_uart_interrupt(PLT)
	b	.L78
.L74:
	mov	r0, #24
	mov	r1, #0
	bl	zx_handle_uart1_transmit_interrupt(PLT)
	b	.L78
.L71:
	mov	r0, #1
	mov	r1, #0
	bl	zx_handle_uart1_transmit_interrupt(PLT)
	b	.L78
.L75:
	mov	r0, #25
	mov	r1, #0
	bl	zx_handle_uart_interrupt(PLT)
	b	.L78
.L76:
	mov	r0, #26
	mov	r1, #0
	bl	zx_handle_uart_interrupt(PLT)
.L78:
	ldmfd	sp, {r3, fp, sp, pc}
	.size	zx_handle_hwi, .-zx_handle_hwi
	.align	2
	.global	zx_kill
	.type	zx_kill, %function
zx_kill:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-40]
	ldr	r0, [fp, #-40]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	and	r3, r3, #63
	str	r3, [fp, #-24]
	ldr	r3, .L81
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldmia	r3, {r3-r4}
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r3, fp, #36
	ldmia	r3, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	ldr	r2, [fp, #-24]
	mov	r3, #1
	bl	zx_set_bit_64(PLT)
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r3, fp, #36
	ldr	r0, [fp, #-20]
	mov	r1, r3
	mov	r2, #8
	bl	zx_memcpy(PLT)
	ldr	r2, [fp, #-28]
	mov	r3, #2
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	zx_q_remove_node(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L82:
	.align	2
.L81:
	.word	413580
	.size	zx_kill, .-zx_kill
	.align	2
	.global	zx_shutdown
	.type	zx_shutdown, %function
zx_shutdown:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	r0, #1
	bl	zx_handle_timer_interrupt(PLT)
	mov	r0, #23
	mov	r1, #1
	bl	zx_handle_uart_interrupt(PLT)
	mov	r0, #25
	mov	r1, #1
	bl	zx_handle_uart_interrupt(PLT)
	mov	r0, #26
	mov	r1, #1
	bl	zx_handle_uart_interrupt(PLT)
	mov	r0, #24
	mov	r1, #1
	bl	zx_handle_uart1_transmit_interrupt(PLT)
	ldr	r0, .L85
	bl	zx_timer_disable(PLT)
	ldr	r0, .L85+4
	bl	zx_timer_disable(PLT)
	bl	zx_reset_all_interrupts(PLT)
	mov	r0, #48
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #2
	str	r3, [r2, #8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	mov	r0, #48
	mov	r1, r3
	bl	zx_q_remove_node(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
.L86:
	.align	2
.L85:
	.word	-2139029472
	.word	-2139029504
	.size	zx_shutdown, .-zx_shutdown
	.align	2
	.global	zx_initialize_stack
	.type	zx_initialize_stack, %function
zx_initialize_stack:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89+4
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89+8
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89+12
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89+16
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89+20
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89+24
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89+28
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89+32
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89+36
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89+40
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L89+44
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L90:
	.align	2
.L89:
	.word	-858993460
	.word	-1145324613
	.word	-1431655766
	.word	-1717986919
	.word	-2004318072
	.word	2004318071
	.word	1717986918
	.word	1431655765
	.word	1145324612
	.word	858993459
	.word	572662306
	.word	286331153
	.size	zx_initialize_stack, .-zx_initialize_stack
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Arg1: %x. \012\000"
	.align	2
.LC2:
	.ascii	"Arg2: %x. \012\000"
	.align	2
.LC3:
	.ascii	"Arg3: %x. \012\000"
	.align	2
.LC4:
	.ascii	"Arg4: %x. \012\000"
	.align	2
.LC5:
	.ascii	"Arg5: %x. \012\000"
	.align	2
.LC6:
	.ascii	"Arg6: %x. \012\000"
	.align	2
.LC7:
	.ascii	"Arg7: %x. \012\000"
	.text
	.align	2
	.global	debug_many_args
	.type	debug_many_args, %function
debug_many_args:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L94
.L93:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L94+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	mov	r0, #1
	ldr	r3, .L94+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #8]
	mov	r0, #1
	ldr	r3, .L94+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #12]
	mov	r0, #1
	ldr	r3, .L94+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #16]
	mov	r0, #1
	ldr	r3, .L94+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #20]
	mov	r0, #1
	ldr	r3, .L94+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #24]
	mov	r0, #1
	ldr	r3, .L94+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L94+32
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L95:
	.align	2
.L94:
	.word	_GLOBAL_OFFSET_TABLE_-(.L93+8)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	-1717986919
	.size	debug_many_args, .-debug_many_args
	.ident	"GCC: (GNU) 4.0.2"
