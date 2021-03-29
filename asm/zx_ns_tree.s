	.file	"zx_ns_tree.c"
	.text
	.align	2
	.global	zx_get_hash_value
	.type	zx_get_hash_value, %function
zx_get_hash_value:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L2
.L3:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	mul	r2, r3, r2
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L2:
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #24
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	orr	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_get_hash_value, .-zx_get_hash_value
	.align	2
	.global	zx_bst_add_by_name
	.type	zx_bst_add_by_name, %function
zx_bst_add_by_name:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r0, [fp, #-28]
	bl	zx_get_hash_value(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-32]
	bl	zx_insert_into_bst(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L7
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L9
.L7:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-36]
.L9:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_bst_add_by_name, .-zx_bst_add_by_name
	.align	2
	.global	zx_insert_into_bst
	.type	zx_insert_into_bst, %function
zx_insert_into_bst:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L12
	mov	r0, #4
	bl	Alloc(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L14
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L16
.L14:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #12]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
	b	.L16
.L12:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L17
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	bl	zx_insert_into_bst(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-16]
	str	r2, [r3, #8]
	ldr	r0, [fp, #-16]
	bl	zx_bst_balancing(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	b	.L19
.L17:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L19
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	bl	zx_insert_into_bst(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r0, [fp, #-16]
	bl	zx_bst_balancing(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
.L19:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
.L16:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_insert_into_bst, .-zx_insert_into_bst
	.align	2
	.global	Free_bst
	.type	Free_bst, %function
Free_bst:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L29
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L25
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	add	r3, r3, #8
	mov	r0, r3
	bl	Free_bst(PLT)
.L25:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L27
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	add	r3, r3, #12
	mov	r0, r3
	bl	Free_bst(PLT)
.L27:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	Free(PLT)
.L29:
	ldmfd	sp, {r3, fp, sp, pc}
	.size	Free_bst, .-Free_bst
	.align	2
	.global	zx_bst_balancing
	.type	zx_bst_balancing, %function
zx_bst_balancing:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	zx_bst_get_diff(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	ble	.L31
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	mov	r0, r3
	bl	zx_bst_get_diff(PLT)
	mov	r3, r0
	cmp	r3, #0
	ble	.L33
	ldr	r0, [fp, #-20]
	bl	left_left_rotation(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	b	.L36
.L33:
	ldr	r0, [fp, #-20]
	bl	left_right_rotation(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	b	.L36
.L31:
	ldr	r3, [fp, #-16]
	cmn	r3, #1
	bge	.L36
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	mov	r0, r3
	bl	zx_bst_get_diff(PLT)
	mov	r3, r0
	cmp	r3, #0
	ble	.L38
	ldr	r0, [fp, #-20]
	bl	right_left_rotation(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	b	.L36
.L38:
	ldr	r0, [fp, #-20]
	bl	right_right_rotation(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
.L36:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_bst_balancing, .-zx_bst_balancing
	.align	2
	.global	zx_bst_find_height
	.type	zx_bst_find_height, %function
zx_bst_find_height:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L42
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	mov	r0, r3
	bl	zx_bst_find_height(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	mov	r0, r3
	bl	zx_bst_find_height(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	movge	r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L42:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_bst_find_height, .-zx_bst_find_height
	.align	2
	.global	zx_bst_get_by_name
	.type	zx_bst_get_by_name, %function
zx_bst_get_by_name:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r0, [fp, #-20]
	bl	zx_get_hash_value(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-24]
	bl	zx_get_task_id_by_name(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_bst_get_by_name, .-zx_bst_get_by_name
	.align	2
	.global	zx_get_task_id_by_name
	.type	zx_get_task_id_by_name, %function
zx_get_task_id_by_name:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L48
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L50
.L48:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L51
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-24]
	b	.L50
.L51:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	ble	.L53
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	zx_get_task_id_by_name(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L50
.L53:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	zx_get_task_id_by_name(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
.L50:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_get_task_id_by_name, .-zx_get_task_id_by_name
	.align	2
	.global	zx_bst_get_diff
	.type	zx_bst_get_diff, %function
zx_bst_get_diff:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #8]
	mov	r0, r3
	bl	zx_bst_find_height(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #12]
	mov	r0, r3
	bl	zx_bst_find_height(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_bst_get_diff, .-zx_bst_get_diff
	.align	2
	.global	left_right_rotation
	.type	left_right_rotation, %function
left_right_rotation:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	right_right_rotation(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r0, [fp, #-20]
	bl	left_left_rotation(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	left_right_rotation, .-left_right_rotation
	.align	2
	.global	left_left_rotation
	.type	left_left_rotation, %function
left_left_rotation:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	left_left_rotation, .-left_left_rotation
	.align	2
	.global	right_left_rotation
	.type	right_left_rotation, %function
right_left_rotation:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	left_left_rotation(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-20]
	str	r2, [r3, #12]
	ldr	r0, [fp, #-20]
	bl	right_right_rotation(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	right_left_rotation, .-right_left_rotation
	.align	2
	.global	right_right_rotation
	.type	right_right_rotation, %function
right_right_rotation:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #12]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	right_right_rotation, .-right_right_rotation
	.section	.rodata
	.align	2
.LC0:
	.ascii	" hash = %d tid=%d\012\000"
	.text
	.align	2
	.global	debug_bst_traverse_postorder
	.type	debug_bst_traverse_postorder, %function
debug_bst_traverse_postorder:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L71
.L70:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L69
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	mov	r0, r3
	bl	debug_bst_traverse_postorder(PLT)
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	mov	r0, r3
	bl	debug_bst_traverse_postorder(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	ip, [r3, #4]
	mov	r0, #1
	ldr	r3, .L71+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	bwprintf(PLT)
.L69:
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L72:
	.align	2
.L71:
	.word	_GLOBAL_OFFSET_TABLE_-(.L70+8)
	.word	.LC0(GOTOFF)
	.size	debug_bst_traverse_postorder, .-debug_bst_traverse_postorder
	.ident	"GCC: (GNU) 4.0.2"
