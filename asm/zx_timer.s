	.file	"zx_timer.c"
	.text
	.align	2
	.global	zx_timer_load_val
	.type	zx_timer_load_val, %function
zx_timer_load_val:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	str	r2, [fp, #-28]
	ldr	r3, .L7
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L4
	ldr	r3, .L7+4
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L5
	ldr	r3, .L7+8
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L3
	b	.L2
.L3:
	ldr	r3, .L7+8
	str	r3, [fp, #-16]
	b	.L2
.L4:
	ldr	r3, .L7
	str	r3, [fp, #-16]
	b	.L2
.L5:
	ldr	r3, .L7+4
	str	r3, [fp, #-16]
.L2:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L8:
	.align	2
.L7:
	.word	-2139029472
	.word	-2139029376
	.word	-2139029504
	.size	zx_timer_load_val, .-zx_timer_load_val
	.align	2
	.global	zx_timer_set_periodic
	.type	zx_timer_set_periodic, %function
zx_timer_set_periodic:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	str	r2, [fp, #-32]
	ldr	r3, .L18
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	beq	.L12
	ldr	r3, .L18+4
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	beq	.L13
	ldr	r3, .L18+8
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	beq	.L11
	b	.L10
.L11:
	ldr	r3, .L18+12
	str	r3, [fp, #-20]
	b	.L10
.L12:
	ldr	r3, .L18+16
	str	r3, [fp, #-20]
	b	.L10
.L13:
	ldr	r3, .L18+20
	str	r3, [fp, #-20]
.L10:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L14
	ldr	r3, [fp, #-16]
	orr	r3, r3, #64
	str	r3, [fp, #-16]
	b	.L16
.L14:
	ldr	r3, [fp, #-16]
	bic	r3, r3, #64
	str	r3, [fp, #-16]
.L16:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L19:
	.align	2
.L18:
	.word	-2139029472
	.word	-2139029376
	.word	-2139029504
	.word	-2139029496
	.word	-2139029464
	.word	-2139029368
	.size	zx_timer_set_periodic, .-zx_timer_set_periodic
	.align	2
	.global	zx_timer_select_clock
	.type	zx_timer_select_clock, %function
zx_timer_select_clock:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	str	r2, [fp, #-32]
	ldr	r3, .L26
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	beq	.L23
	ldr	r3, .L26+4
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	beq	.L24
	ldr	r3, .L26+8
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	beq	.L22
	b	.L21
.L22:
	ldr	r3, .L26+12
	str	r3, [fp, #-20]
	b	.L21
.L23:
	ldr	r3, .L26+16
	str	r3, [fp, #-20]
	b	.L21
.L24:
	ldr	r3, .L26+20
	str	r3, [fp, #-20]
.L21:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	orr	r2, r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	-2139029472
	.word	-2139029376
	.word	-2139029504
	.word	-2139029496
	.word	-2139029464
	.word	-2139029368
	.size	zx_timer_select_clock, .-zx_timer_select_clock
	.align	2
	.global	zx_timer_enable
	.type	zx_timer_enable, %function
zx_timer_enable:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	ldr	r2, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, .L34
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L31
	ldr	r3, .L34+4
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L32
	ldr	r3, .L34+8
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L30
	b	.L29
.L30:
	ldr	r3, .L34+12
	str	r3, [fp, #-20]
	b	.L29
.L31:
	ldr	r3, .L34+16
	str	r3, [fp, #-20]
	b	.L29
.L32:
	ldr	r3, .L34+20
	str	r3, [fp, #-20]
.L29:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	orr	r2, r3, #128
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	-2139029472
	.word	-2139029376
	.word	-2139029504
	.word	-2139029496
	.word	-2139029464
	.word	-2139029368
	.size	zx_timer_enable, .-zx_timer_enable
	.align	2
	.global	zx_timer_disable
	.type	zx_timer_disable, %function
zx_timer_disable:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	ldr	r2, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, .L42
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L39
	ldr	r3, .L42+4
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L40
	ldr	r3, .L42+8
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L38
	b	.L37
.L38:
	ldr	r3, .L42+12
	str	r3, [fp, #-20]
	b	.L37
.L39:
	ldr	r3, .L42+16
	str	r3, [fp, #-20]
	b	.L37
.L40:
	ldr	r3, .L42+20
	str	r3, [fp, #-20]
.L37:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	bic	r3, r3, #128
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L43:
	.align	2
.L42:
	.word	-2139029472
	.word	-2139029376
	.word	-2139029504
	.word	-2139029496
	.word	-2139029464
	.word	-2139029368
	.size	zx_timer_disable, .-zx_timer_disable
	.align	2
	.global	zx_timer_get_value
	.type	zx_timer_get_value, %function
zx_timer_get_value:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, .L50
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	beq	.L47
	ldr	r3, .L50+4
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	beq	.L48
	ldr	r3, .L50+8
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	beq	.L46
	b	.L45
.L46:
	ldr	r3, .L50+12
	str	r3, [fp, #-16]
	b	.L45
.L47:
	ldr	r3, .L50+16
	str	r3, [fp, #-16]
	b	.L45
.L48:
	ldr	r3, .L50+20
	str	r3, [fp, #-16]
.L45:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L51:
	.align	2
.L50:
	.word	-2139029472
	.word	-2139029376
	.word	-2139029504
	.word	-2139029500
	.word	-2139029468
	.word	-2139029372
	.size	zx_timer_get_value, .-zx_timer_get_value
	.ident	"GCC: (GNU) 4.0.2"
