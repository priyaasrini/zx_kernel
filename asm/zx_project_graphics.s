	.file	"zx_project_graphics.c"
	.text
	.align	2
	.global	zx_set_cursor
	.type	zx_set_cursor, %function
zx_set_cursor:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #27
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #91
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	sub	r2, fp, #25
	mov	r0, r3
	mov	r1, #10
	bl	num_to_string(PLT)
	b	.L2
.L3:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r1, r2, r3
	ldr	r3, [fp, #-16]
	mvn	r2, #12
	sub	r0, fp, #12
	add	r3, r0, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	mvn	r2, #12
	sub	r1, fp, #12
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #59
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	sub	r2, fp, #25
	mov	r0, r3
	mov	r1, #10
	bl	num_to_string(PLT)
	b	.L5
.L6:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r1, r2, r3
	ldr	r3, [fp, #-16]
	mvn	r2, #12
	sub	r0, fp, #12
	add	r3, r0, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L5:
	ldr	r3, [fp, #-16]
	mvn	r2, #12
	sub	r1, fp, #12
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L6
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #72
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_set_cursor, .-zx_set_cursor
	.align	2
	.global	zx_clear_screen
	.type	zx_clear_screen, %function
zx_clear_screen:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #27
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #91
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #50
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #74
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_clear_screen, .-zx_clear_screen
	.align	2
	.global	zx_draw_h_line
	.type	zx_draw_h_line, %function
zx_draw_h_line:
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	strb	r3, [fp, #-36]
	ldr	r3, [fp, #8]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	sub	r3, fp, #20
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #4]
	bl	zx_set_cursor(PLT)
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-16]
	b	.L12
.L13:
	ldr	r1, [fp, #-20]
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #4]
	add	r2, r2, r3
	ldrb	r3, [fp, #-36]
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L12:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	ble	.L13
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_draw_h_line, .-zx_draw_h_line
	.align	2
	.global	zx_erase_line
	.type	zx_erase_line, %function
zx_erase_line:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #27
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #91
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #75
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_erase_line, .-zx_erase_line
	.align	2
	.global	zx_erase_from_current_to_scrend
	.type	zx_erase_from_current_to_scrend, %function
zx_erase_from_current_to_scrend:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #27
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #91
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #74
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_erase_from_current_to_scrend, .-zx_erase_from_current_to_scrend
	.align	2
	.global	zx_initialize_prompt
	.type	zx_initialize_prompt, %function
zx_initialize_prompt:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #99
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	mov	r3, #111
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r2, r3, #2
	mov	r3, #110
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r2, r3, #3
	mov	r3, #116
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r2, r3, #4
	mov	r3, #114
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r2, r3, #5
	mov	r3, #111
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r2, r3, #6
	mov	r3, #108
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r2, r3, #7
	mov	r3, #108
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r2, r3, #8
	mov	r3, #101
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r2, r3, #9
	mov	r3, #114
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r2, r3, #10
	mov	r3, #35
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r2, r3, #11
	mov	r3, #0
	strb	r3, [r2, #0]
	ldmfd	sp, {r3, fp, sp, pc}
	.size	zx_initialize_prompt, .-zx_initialize_prompt
	.global	__udivsi3
	.global	__umodsi3
	.align	2
	.global	zx_put_number
	.type	zx_put_number, %function
zx_put_number:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bge	.L23
	ldr	r3, [fp, #-36]
	rsb	r3, r3, #0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #45
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L23:
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #1
	str	r3, [fp, #-20]
	mov	r3, #10
	str	r3, [fp, #-16]
	b	.L25
.L26:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mul	r3, r2, r3
	str	r3, [fp, #-20]
.L25:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bcs	.L26
	b	.L38
.L29:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	__umodsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L30
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bgt	.L30
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L28
.L30:
	ldr	r3, [fp, #-32]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	str	r2, [fp, #-52]
	ldr	r3, [fp, #-24]
	cmp	r3, #9
	bgt	.L33
	mov	r1, #48
	str	r1, [fp, #-48]
	b	.L35
.L33:
	mov	r2, #87
	str	r2, [fp, #-48]
.L35:
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	ldr	r1, [fp, #-48]
	mov	r2, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	ldr	r2, [fp, #-52]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L28:
.L38:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L29
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_put_number, .-zx_put_number
	.align	2
	.global	zx_put_string
	.type	zx_put_string, %function
zx_put_string:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	b	.L40
.L41:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L40:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L41
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_put_string, .-zx_put_string
	.ident	"GCC: (GNU) 4.0.2"
