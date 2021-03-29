	.file	"zx_uart_io.c"
	.text
	.align	2
	.global	zx_setfifo
	.type	zx_setfifo, %function
zx_setfifo:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L3
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	beq	.L4
	b	.L2
.L3:
	ldr	r3, .L11
	str	r3, [fp, #-20]
	b	.L5
.L4:
	ldr	r3, .L11+4
	str	r3, [fp, #-20]
	b	.L5
.L2:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L6
.L5:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L7
	ldr	r3, [fp, #-16]
	orr	r3, r3, #16
	str	r3, [fp, #-32]
	b	.L9
.L7:
	ldr	r3, [fp, #-16]
	bic	r3, r3, #16
	str	r3, [fp, #-32]
.L9:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-36]
.L6:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	-2138308600
	.word	-2138243064
	.size	zx_setfifo, .-zx_setfifo
	.align	2
	.global	zx_initialize_uart2
	.type	zx_initialize_uart2, %function
zx_initialize_uart2:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	r0, #1
	mov	r1, #0
	bl	zx_setfifo(PLT)
	ldr	r3, .L15
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	orr	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L16:
	.align	2
.L15:
	.word	-2138243052
	.size	zx_initialize_uart2, .-zx_initialize_uart2
	.align	2
	.global	zx_initialize_uart1
	.type	zx_initialize_uart1, %function
zx_initialize_uart1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	mov	r0, #0
	mov	r1, #0
	bl	zx_setfifo(PLT)
	ldr	r2, .L19
	mov	r3, #191
	str	r3, [r2, #0]
	ldr	r2, .L19+4
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L19+8
	mov	r3, #104
	str	r3, [r2, #0]
	ldr	r2, .L19+12
	ldr	r3, .L19+12
	ldr	r3, [r3, #0]
	orr	r3, r3, #1
	str	r3, [r2, #0]
	bl	zx_init_modem_intr(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L20:
	.align	2
.L19:
	.word	-2138308592
	.word	-2138308596
	.word	-2138308600
	.word	-2138308588
	.size	zx_initialize_uart1, .-zx_initialize_uart1
	.global	__udivsi3
	.global	__umodsi3
	.align	2
	.global	zx_print_number
	.type	zx_print_number, %function
zx_print_number:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #1
	str	r3, [fp, #-20]
	mov	r3, #10
	str	r3, [fp, #-16]
	b	.L22
.L23:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mul	r3, r2, r3
	str	r3, [fp, #-20]
.L22:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bcs	.L23
	b	.L35
.L26:
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
	bne	.L27
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bgt	.L27
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L25
.L27:
	ldr	r3, [fp, #-24]
	cmp	r3, #9
	bgt	.L30
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L32
.L30:
	mov	r3, #87
	str	r3, [fp, #-40]
.L32:
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	ldr	r1, [fp, #-40]
	mov	r2, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	ldr	r0, [fp, #-32]
	mov	r1, r3
	bl	zx_putc(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L25:
.L35:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L26
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_print_number, .-zx_print_number
	.align	2
	.global	zx_read_byte
	.type	zx_read_byte, %function
zx_read_byte:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L38
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	beq	.L39
	b	.L37
.L38:
	ldr	r3, .L43
	str	r3, [fp, #-24]
	ldr	r3, .L43+4
	str	r3, [fp, #-20]
	b	.L40
.L39:
	ldr	r3, .L43+8
	str	r3, [fp, #-24]
	ldr	r3, .L43+12
	str	r3, [fp, #-20]
	b	.L40
.L37:
	mov	r3, #255
	str	r3, [fp, #-32]
	b	.L41
.L40:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	str	r3, [fp, #-32]
.L41:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L44:
	.align	2
.L43:
	.word	-2138308584
	.word	-2138308608
	.word	-2138243048
	.word	-2138243072
	.size	zx_read_byte, .-zx_read_byte
	.align	2
	.global	zx_write_byte
	.type	zx_write_byte, %function
zx_write_byte:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	mov	r3, r1
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L47
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	beq	.L48
	b	.L46
.L47:
	ldr	r3, .L52
	str	r3, [fp, #-20]
	ldr	r3, .L52+4
	str	r3, [fp, #-16]
	b	.L49
.L48:
	ldr	r3, .L52+8
	str	r3, [fp, #-20]
	ldr	r3, .L52+12
	str	r3, [fp, #-16]
	b	.L49
.L46:
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L50
.L49:
	ldrb	r2, [fp, #-28]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-32]
.L50:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L53:
	.align	2
.L52:
	.word	-2138308584
	.word	-2138308608
	.word	-2138243048
	.word	-2138243072
	.size	zx_write_byte, .-zx_write_byte
	.align	2
	.global	zx_putc
	.type	zx_putc, %function
zx_putc:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-20]
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	PutC(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_putc, .-zx_putc
	.align	2
	.global	zx_c2x
	.type	zx_c2x, %function
zx_c2x:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #9
	bhi	.L57
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #48
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
	b	.L59
.L57:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #87
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
.L59:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_c2x, .-zx_c2x
	.align	2
	.global	zx_putx
	.type	zx_putx, %function
zx_putx:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	mov	r3, r1
	strb	r3, [fp, #-24]
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #255
	mov	r0, r3
	bl	zx_c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	and	r3, r3, #15
	mov	r0, r3
	bl	zx_c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	zx_putc(PLT)
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	zx_putc(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_putx, .-zx_putx
	.align	2
	.global	zx_putr
	.type	zx_putr, %function
zx_putr:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	sub	r3, fp, #28
	str	r3, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-20]
	b	.L64
.L65:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	zx_putx(PLT)
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L64:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L65
	ldr	r0, [fp, #-24]
	mov	r1, #32
	bl	zx_putc(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_putr, .-zx_putr
	.align	2
	.global	zx_putstr
	.type	zx_putstr, %function
zx_putstr:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	b	.L69
.L70:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	zx_putc(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L71
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L73
.L71:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L69:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L70
	mov	r3, #0
	str	r3, [fp, #-24]
.L73:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_putstr, .-zx_putstr
	.align	2
	.global	zx_putw
	.type	zx_putw, %function
zx_putw:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r3, [fp, #-36]
	mov	r3, r2
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	b	.L77
.L78:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L77:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	eor	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L81
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bgt	.L78
	b	.L81
.L82:
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	zx_putc(PLT)
.L81:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	cmp	r2, #0
	bne	.L82
	b	.L84
.L85:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	zx_putc(PLT)
.L84:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	cmp	r2, #0
	bne	.L85
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_putw, .-zx_putw
	.align	2
	.global	zx_a2d
	.type	zx_a2d, %function
zx_a2d:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L89
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L89
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	b	.L92
.L89:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L93
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L93
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #87
	str	r3, [fp, #-20]
	b	.L92
.L93:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L96
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L96
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #55
	str	r3, [fp, #-20]
	b	.L92
.L96:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L92:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_a2d, .-zx_a2d
	.align	2
	.global	zx_a2i
	.type	zx_a2i, %function
zx_a2i:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	str	r3, [fp, #-40]
	mov	r3, r0
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L101
.L102:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L103
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	mul	r2, r3, r2
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L101:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	zx_a2d(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L102
.L103:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_a2i, .-zx_a2i
	.align	2
	.global	zx_ui2a
	.type	zx_ui2a, %function
zx_ui2a:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L107
.L108:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L107:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcs	.L108
	b	.L120
.L111:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	__umodsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-32]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L112
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L112
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L110
.L112:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L115
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L117
.L115:
	mov	r3, #87
	str	r3, [fp, #-40]
.L117:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	ldr	r1, [fp, #-40]
	mov	r2, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	ldr	r2, [fp, #-36]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L110:
.L120:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L111
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_ui2a, .-zx_ui2a
	.align	2
	.global	zx_i2a
	.type	zx_i2a, %function
zx_i2a:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L122
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #45
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L122:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	mov	r1, #10
	ldr	r2, [fp, #-20]
	bl	zx_ui2a(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_i2a, .-zx_i2a
	.align	2
	.global	zx_format
	.type	zx_format, %function
zx_format:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	b	.L144
.L127:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L128
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	zx_putc(PLT)
	b	.L126
.L128:
	mov	r3, #0
	strb	r3, [fp, #-13]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	beq	.L131
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	blt	.L130
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	bgt	.L130
	b	.L132
.L131:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	b	.L130
.L132:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	sub	r2, fp, #40
	sub	ip, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #10
	mov	r3, ip
	bl	zx_a2i(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
.L130:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	beq	.L137
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	bgt	.L140
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	beq	.L135
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	bgt	.L141
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L143
	ldr	r3, [fp, #-48]
	cmp	r3, #37
	beq	.L134
	b	.L126
.L141:
	ldr	r3, [fp, #-48]
	cmp	r3, #100
	beq	.L136
	b	.L126
.L140:
	ldr	r3, [fp, #-48]
	cmp	r3, #117
	beq	.L138
	ldr	r3, [fp, #-48]
	cmp	r3, #120
	beq	.L139
	b	.L126
.L135:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	zx_putc(PLT)
	b	.L126
.L137:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	mov	r2, #0
	bl	zx_putw(PLT)
	b	.L126
.L138:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #10
	bl	zx_ui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	zx_putw(PLT)
	b	.L126
.L136:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, r2
	bl	zx_i2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	zx_putw(PLT)
	b	.L126
.L139:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #16
	bl	zx_ui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	zx_putw(PLT)
	b	.L126
.L134:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	zx_putc(PLT)
.L126:
.L144:
	ldr	r1, [fp, #-40]
	ldrb	r3, [r1, #0]
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-40]
	cmp	r2, #0
	bne	.L127
.L143:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_format, .-zx_format
	.align	2
	.global	zx_printf
	.type	zx_printf, %function
zx_printf:
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 1
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3}
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #16
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	add	r3, fp, #8
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #4]
	ldr	r2, [fp, #-16]
	bl	zx_format(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_printf, .-zx_printf
	.ident	"GCC: (GNU) 4.0.2"
