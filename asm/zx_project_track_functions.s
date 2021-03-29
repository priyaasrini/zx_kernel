	.file	"zx_project_track_functions.c"
	.text
	.align	2
	.global	track_init
	.type	track_init, %function
track_init:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	mov	r3, r0
	str	r1, [fp, #-24]
	strb	r3, [fp, #-20]
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #65
	bne	.L2
	ldr	r0, [fp, #-24]
	bl	init_tracka(PLT)
	b	.L4
.L2:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #66
	bne	.L4
	ldr	r0, [fp, #-24]
	bl	init_trackb(PLT)
.L4:
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L6
.L7:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L8
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #44]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #64]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #68]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #72]
	b	.L10
.L8:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	cmp	r3, #5
	beq	.L10
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #44]
.L10:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L6:
	ldr	r3, [fp, #-16]
	cmp	r3, #143
	ble	.L7
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	track_init, .-track_init
	.align	2
	.global	turnout_commit
	.type	turnout_commit, %function
turnout_commit:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #68
	str	r0, [fp, #-76]
	str	r1, [fp, #-80]
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bne	.L15
	mov	r3, #34
	str	r3, [fp, #-16]
	b	.L17
.L15:
	mov	r3, #33
	str	r3, [fp, #-16]
.L17:
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	and	r0, r3, #255
	mvn	r2, #57
	sub	ip, fp, #12
	add	r3, ip, r1
	add	r2, r3, r2
	mov	r3, r0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-80]
	and	r0, r3, #255
	mvn	r2, #57
	sub	ip, fp, #12
	add	r3, ip, r1
	add	r2, r3, r2
	mov	r3, r0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mvn	r2, #57
	sub	r1, fp, #12
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #32
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mvn	r2, #57
	sub	ip, fp, #12
	add	r3, ip, r3
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	sub	r3, fp, #70
	mov	r0, #0
	mov	r1, r3
	bl	PutMultiple(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	turnout_commit, .-turnout_commit
	.align	2
	.global	turnout_toggle
	.type	turnout_toggle, %function
turnout_toggle:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	bl	turnout_commit(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	turnout_toggle, .-turnout_toggle
	.align	2
	.global	turnout_init
	.type	turnout_init, %function
turnout_init:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L22
.L23:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L24
	ldr	r3, [fp, #-20]
	cmp	r3, #22
	ble	.L26
.L24:
	ldr	r3, [fp, #-20]
	cmp	r3, #152
	ble	.L27
.L26:
	ldr	r3, [fp, #-20]
	cmp	r3, #10
	beq	.L28
	ldr	r3, [fp, #-20]
	cmp	r3, #13
	beq	.L28
	ldr	r3, [fp, #-20]
	cmp	r3, #16
	beq	.L28
	ldr	r3, [fp, #-20]
	cmp	r3, #17
	bne	.L32
.L28:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L33
.L32:
	mov	r3, #1
	str	r3, [fp, #-16]
.L33:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-20]
	bl	turnout_commit(PLT)
	b	.L34
.L27:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #0]
.L34:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L22:
	ldr	r3, [fp, #-20]
	cmp	r3, #156
	ble	.L23
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	turnout_init, .-turnout_init
	.ident	"GCC: (GNU) 4.0.2"
