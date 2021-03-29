	.file	"zx_project_path_reservation.c"
	.text
	.align	2
	.global	reserve_path
	.type	reserve_path, %function
reserve_path:
	@ args = 0, pretend = 0, frame = 440
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #440
	str	r0, [fp, #-448]
	str	r1, [fp, #-452]
	mov	r3, #0
	str	r3, [fp, #-444]
	ldr	r3, [fp, #-448]
	ldr	r3, [r3, #496]
	cmp	r3, #0
	bne	.L2
	ldr	r3, [fp, #-452]
	ldr	r2, [fp, #-448]
	mov	r1, #72
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r1, [r3, #0]
	ldr	r3, .L21
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	add	r3, r3, #215
	str	r3, [fp, #-36]
.L2:
	ldr	r0, [fp, #-448]
	bl	unreserve_previous_reservation(PLT)
	ldr	r3, [fp, #-448]
	ldr	r3, [r3, #32]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-448]
	ldr	r1, [r3, #28]
	ldr	r3, .L21
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-40]
	ldr	r0, [r3, #12]
	ldr	r3, [fp, #-448]
	ldr	r1, [r3, #28]
	ldr	r3, .L21
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	rsb	r3, r3, r0
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bge	.L4
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-36]
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	ble	.L6
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-36]
	add	r3, r3, r2
	str	r3, [fp, #-16]
	b	.L8
.L6:
	ldr	r3, [fp, #-28]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
.L8:
	sub	r3, fp, #440
	sub	ip, fp, #444
	ldr	r0, [fp, #-40]
	ldr	r1, [fp, #-16]
	mov	r2, r3
	mov	r3, ip
	bl	reserve_edge(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L9
.L4:
	ldr	r3, [fp, #-28]
	rsb	r3, r3, #0
	sub	r2, fp, #440
	sub	ip, fp, #444
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r3, ip
	bl	reserve_edge(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-448]
	add	r3, r3, #1728
	add	r3, r3, #12
	ldr	r0, [fp, #-40]
	mov	r1, r3
	bl	get_next_edge(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
.L9:
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L10
	b	.L12
.L13:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	ble	.L14
	sub	r3, fp, #440
	sub	ip, fp, #444
	ldr	r0, [fp, #-40]
	ldr	r1, [fp, #-36]
	mov	r2, r3
	mov	r3, ip
	bl	reserve_edge(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L16
.L14:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	sub	r2, fp, #440
	sub	ip, fp, #444
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r3, ip
	bl	reserve_edge(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-36]
	rsb	r3, r2, r3
	str	r3, [fp, #-36]
.L16:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #8]
	cmp	r3, #5
	beq	.L10
	ldr	r3, [fp, #-448]
	add	r3, r3, #1728
	add	r3, r3, #12
	ldr	r0, [fp, #-40]
	mov	r1, r3
	bl	get_next_edge(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
.L12:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bgt	.L13
.L10:
	ldr	r2, [fp, #-444]
	sub	r3, fp, #440
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-448]
	bl	commit_current_reservation(PLT)
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	1374389535
	.size	reserve_path, .-reserve_path
	.align	2
	.global	reserve_edge
	.type	reserve_edge, %function
reserve_edge:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #68
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	str	r2, [fp, #-72]
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-64]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-68]
	cmp	r2, r3
	bge	.L24
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L26
.L24:
	mov	r3, #0
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-64]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-68]
	cmp	r2, r3
	ble	.L27
	mov	r3, #1
	str	r3, [fp, #-52]
.L27:
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	beq	.L29
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #8]
	cmp	r3, #3
	bne	.L29
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	bne	.L29
	ldr	r0, [fp, #-64]
	ldr	r1, [fp, #-68]
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L33
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L26
.L33:
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #48]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	bne	.L35
	ldr	r3, [fp, #-44]
	add	r3, r3, #20
	str	r3, [fp, #-40]
	b	.L37
.L35:
	ldr	r3, [fp, #-44]
	add	r3, r3, #20
	add	r3, r3, #28
	str	r3, [fp, #-40]
.L37:
	ldr	r0, [fp, #-40]
	mov	r1, #190
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L40
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L26
.L29:
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L41
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #8]
	cmp	r3, #3
	beq	.L41
	ldr	r0, [fp, #-64]
	ldr	r1, [fp, #-68]
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L44
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L26
.L44:
	ldr	r3, [fp, #-60]
	add	r3, r3, #20
	add	r2, r3, #28
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	bne	.L46
	ldr	r3, [fp, #-60]
	add	r3, r3, #20
	str	r3, [fp, #-36]
	b	.L48
.L46:
	ldr	r3, [fp, #-60]
	add	r3, r3, #20
	add	r3, r3, #28
	str	r3, [fp, #-36]
.L48:
	ldr	r0, [fp, #-36]
	mov	r1, #190
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L40
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L26
.L41:
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L51
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #8]
	cmp	r3, #3
	bne	.L51
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	bne	.L51
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-64]
	ldr	r1, [fp, #-68]
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L55
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L26
.L55:
	ldr	r3, [fp, #-28]
	add	r3, r3, #20
	add	r2, r3, #28
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	bne	.L57
	ldr	r3, [fp, #-28]
	add	r3, r3, #20
	str	r3, [fp, #-24]
	b	.L59
.L57:
	ldr	r3, [fp, #-28]
	add	r3, r3, #20
	add	r3, r3, #28
	str	r3, [fp, #-24]
.L59:
	ldr	r0, [fp, #-24]
	mov	r1, #190
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L60
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L26
.L60:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-64]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #20
	add	r3, r3, #28
	cmp	r2, r3
	bne	.L62
	ldr	r3, [fp, #-20]
	add	r3, r3, #20
	str	r3, [fp, #-16]
	b	.L64
.L62:
	ldr	r3, [fp, #-20]
	add	r3, r3, #20
	add	r3, r3, #28
	str	r3, [fp, #-16]
.L64:
	ldr	r0, [fp, #-16]
	mov	r1, #190
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L40
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L26
.L51:
	ldr	r0, [fp, #-64]
	ldr	r1, [fp, #-68]
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L40
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L26
.L40:
	ldr	r3, [fp, #-76]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	bge	.L68
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #0]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	rsb	r3, r3, #0
	str	r3, [r2, #4]
	b	.L70
.L68:
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	str	r3, [r2, #4]
.L70:
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-48]
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-80]
.L26:
	ldr	r3, [fp, #-80]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	reserve_edge, .-reserve_edge
	.align	2
	.global	unreserve_previous_reservation
	.type	unreserve_previous_reservation, %function
unreserve_previous_reservation:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L73
.L74:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r1, .L77
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #20]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #24]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r1, .L77
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #50
	beq	.L76
.L73:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r1, .L77
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L74
.L76:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L78:
	.align	2
.L77:
	.word	3036
	.size	unreserve_previous_reservation, .-unreserve_previous_reservation
	.align	2
	.global	check_reservation_status
	.type	check_reservation_status, %function
check_reservation_status:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bne	.L80
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L82
.L80:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	ble	.L83
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L85
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L82
.L85:
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L87
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-20]
.L87:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L91
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L82
.L83:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bge	.L91
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L93
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L82
.L93:
	ldr	r3, [fp, #-44]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L95
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-16]
.L95:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-28]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L91
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L82
.L91:
	mov	r3, #1
	str	r3, [fp, #-48]
.L82:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	check_reservation_status, .-check_reservation_status
	.align	2
	.global	commit_current_reservation
	.type	commit_current_reservation, %function
commit_current_reservation:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L100
.L101:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bge	.L102
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #1
	str	r3, [r2, #16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #20]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #24]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	ldr	r1, .L107
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	b	.L104
.L102:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	ldr	r1, .L107
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
.L104:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L100:
	ldr	r3, [fp, #-24]
	cmp	r3, #49
	ble	.L101
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L108:
	.align	2
.L107:
	.word	3036
	.size	commit_current_reservation, .-commit_current_reservation
	.align	2
	.global	get_next_edge
	.type	get_next_edge, %function
get_next_edge:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L110
	ldr	r3, [fp, #-16]
	add	r1, r3, #20
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r1, r1, r3
	str	r1, [fp, #-28]
	b	.L112
.L110:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	cmp	r3, #5
	bne	.L113
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L112
.L113:
	ldr	r3, [fp, #-16]
	add	r3, r3, #20
	str	r3, [fp, #-28]
.L112:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	get_next_edge, .-get_next_edge
	.ident	"GCC: (GNU) 4.0.2"
