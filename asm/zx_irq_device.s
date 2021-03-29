	.file	"zx_irq_device.c"
	.text
	.align	2
	.global	zx_device_init
	.type	zx_device_init, %function
zx_device_init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	beq	.L3
	ldr	r3, [fp, #-20]
	cmp	r3, #4
	beq	.L4
	b	.L5
.L4:
	ldr	r0, .L6
	bl	zx_timer_disable(PLT)
	ldr	r0, .L6
	ldr	r1, .L6+4
	bl	zx_timer_load_val(PLT)
	ldr	r0, .L6
	mov	r1, #1
	bl	zx_timer_set_periodic(PLT)
	ldr	r0, .L6
	mov	r1, #8
	bl	zx_timer_select_clock(PLT)
	ldr	r0, .L6
	bl	zx_timer_enable(PLT)
	b	.L5
.L3:
	bl	zx_init_modem_intr(PLT)
.L5:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	-2139029504
	.word	5080
	.size	zx_device_init, .-zx_device_init
	.align	2
	.global	zx_init_modem_intr
	.type	zx_init_modem_intr, %function
zx_init_modem_intr:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	r3, .L10
	str	r3, [fp, #-28]
	ldr	r3, .L10+4
	str	r3, [fp, #-24]
	ldr	r3, .L10+8
	str	r3, [fp, #-20]
	ldr	r3, .L10+12
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	and	r2, r3, #1
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L11:
	.align	2
.L10:
	.word	413688
	.word	413684
	.word	413692
	.word	-2138308584
	.size	zx_init_modem_intr, .-zx_init_modem_intr
	.align	2
	.global	zx_device_intr_disable_all
	.type	zx_device_intr_disable_all, %function
zx_device_intr_disable_all:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	mov	r0, #4
	bl	zx_device_intr_off(PLT)
	mov	r0, #24
	bl	zx_device_intr_off(PLT)
	mov	r0, #1
	bl	zx_device_intr_off(PLT)
	mov	r0, #26
	bl	zx_device_intr_off(PLT)
	mov	r0, #23
	bl	zx_device_intr_off(PLT)
	mov	r0, #25
	bl	zx_device_intr_off(PLT)
	ldmfd	sp, {fp, sp, pc}
	.size	zx_device_intr_disable_all, .-zx_device_intr_disable_all
	.align	2
	.global	zx_device_intr_clear_all
	.type	zx_device_intr_clear_all, %function
zx_device_intr_clear_all:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	mov	r0, #4
	bl	zx_device_intr_clear(PLT)
	mov	r0, #24
	bl	zx_device_intr_clear(PLT)
	mov	r0, #1
	bl	zx_device_intr_clear(PLT)
	mov	r0, #26
	bl	zx_device_intr_clear(PLT)
	mov	r0, #23
	bl	zx_device_intr_clear(PLT)
	mov	r0, #25
	bl	zx_device_intr_clear(PLT)
	ldmfd	sp, {fp, sp, pc}
	.size	zx_device_intr_clear_all, .-zx_device_intr_clear_all
	.align	2
	.global	zx_device_intr_clear
	.type	zx_device_intr_clear, %function
zx_device_intr_clear:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	cmp	r3, #25
	addls	pc, pc, r3, asl #2
	b	.L23
	.p2align 2
.L22:
	b	.L18
	b	.L23
	b	.L23
	b	.L19
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
	b	.L23
.L19:
	ldr	r3, .L24
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L24+4
	str	r3, [r2, #0]
	b	.L23
.L18:
	ldr	r3, .L24+8
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	bic	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
.L23:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L25:
	.align	2
.L24:
	.word	-2139029492
	.word	121112121
	.word	-2138308580
	.size	zx_device_intr_clear, .-zx_device_intr_clear
	.align	2
	.global	zx_device_intr_off
	.type	zx_device_intr_off, %function
zx_device_intr_off:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	cmp	r3, #25
	addls	pc, pc, r3, asl #2
	b	.L35
	.p2align 2
.L34:
	b	.L28
	b	.L35
	b	.L35
	b	.L29
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L30
	b	.L31
	b	.L32
	b	.L33
.L29:
	ldr	r0, [fp, #-24]
	bl	zx_vic_disable_interrupt(PLT)
	b	.L35
.L30:
	ldr	r3, .L36
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	bic	r2, r3, #16
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	b	.L35
.L32:
	ldr	r3, .L36+4
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	bic	r2, r3, #16
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	b	.L35
.L31:
	ldr	r3, .L36
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	bic	r2, r3, #32
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	b	.L35
.L28:
	ldr	r3, .L36
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	bic	r2, r3, #8
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	b	.L35
.L33:
	ldr	r3, .L36+4
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	bic	r2, r3, #32
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
.L35:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	-2138308588
	.word	-2138243052
	.size	zx_device_intr_off, .-zx_device_intr_off
	.align	2
	.global	zx_device_intr_on
	.type	zx_device_intr_on, %function
zx_device_intr_on:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	cmp	r3, #25
	addls	pc, pc, r3, asl #2
	b	.L47
	.p2align 2
.L46:
	b	.L40
	b	.L47
	b	.L47
	b	.L41
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L42
	b	.L43
	b	.L44
	b	.L45
.L41:
	ldr	r0, [fp, #-24]
	bl	zx_vic_enable_interrupt(PLT)
	b	.L47
.L42:
	ldr	r3, .L48
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	orr	r2, r3, #16
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	b	.L47
.L44:
	ldr	r3, .L48+4
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	orr	r2, r3, #16
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	b	.L47
.L43:
	ldr	r3, .L48
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	orr	r2, r3, #32
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	b	.L47
.L40:
	ldr	r3, .L48
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	orr	r2, r3, #8
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	b	.L47
.L45:
	ldr	r3, .L48+4
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	orr	r2, r3, #32
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
.L47:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L49:
	.align	2
.L48:
	.word	-2138308588
	.word	-2138243052
	.size	zx_device_intr_on, .-zx_device_intr_on
	.align	2
	.global	zx_handle_timer_interrupt
	.type	zx_handle_timer_interrupt, %function
zx_handle_timer_interrupt:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-32]
	ldr	r3, .L59
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmn	r3, #1
	bne	.L51
	mov	r3, #413696
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	b	.L58
.L51:
	ldr	r0, [fp, #-28]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L54
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #32]
	b	.L56
.L54:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #32]
.L56:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	zx_q_append_to_end(PLT)
	ldr	r3, .L59
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L58
	mov	r0, #4
	bl	zx_device_intr_on(PLT)
.L58:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L60:
	.align	2
.L59:
	.word	413640
	.size	zx_handle_timer_interrupt, .-zx_handle_timer_interrupt
	.align	2
	.global	zx_handle_uart1_transmit_interrupt
	.type	zx_handle_uart1_transmit_interrupt, %function
zx_handle_uart1_transmit_interrupt:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #60
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	ldr	r3, .L81
	str	r3, [fp, #-60]
	ldr	r3, .L81+4
	str	r3, [fp, #-56]
	ldr	r3, .L81+8
	str	r3, [fp, #-52]
	ldr	r3, .L81+12
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-68]
	cmp	r3, #1
	bne	.L62
	mov	r3, #1
	str	r3, [fp, #-44]
.L62:
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	cmp	r3, #1
	beq	.L65
	ldr	r3, [fp, #-72]
	cmp	r3, #24
	beq	.L66
	b	.L64
.L66:
	ldr	r0, [fp, #-64]
	bl	zx_device_intr_off(PLT)
	mov	r3, #1
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-40]
	str	r3, [r2, #0]
	b	.L64
.L65:
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	eor	r3, r3, #1
	and	r3, r3, #1
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L67
	ldr	r3, [fp, #-32]
	and	r3, r3, #1
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L67
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L70
.L67:
	mov	r3, #0
	str	r3, [fp, #-44]
.L70:
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-44]
	str	r3, [r2, #0]
.L64:
	ldr	r3, [fp, #-44]
	cmp	r3, #1
	bne	.L80
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	beq	.L73
	b	.L80
.L73:
	ldr	r2, [fp, #-56]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-52]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L81+16
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L75
	ldr	r3, .L81+20
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	b	.L80
.L75:
	ldr	r0, [fp, #-24]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r3, [fp, #-68]
	cmp	r3, #1
	bne	.L77
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #32]
	b	.L79
.L77:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #32]
.L79:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	zx_q_append_to_end(PLT)
	ldr	r3, .L81+16
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	mvn	r3, #0
	str	r3, [r2, #0]
.L80:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L82:
	.align	2
.L81:
	.word	413688
	.word	413684
	.word	413692
	.word	-2138308584
	.word	413644
	.word	413700
	.size	zx_handle_uart1_transmit_interrupt, .-zx_handle_uart1_transmit_interrupt
	.align	2
	.global	zx_handle_uart_interrupt
	.type	zx_handle_uart_interrupt, %function
zx_handle_uart_interrupt:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-40]
	bl	zx_device_intr_off(PLT)
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #25
	beq	.L86
	ldr	r3, [fp, #-48]
	cmp	r3, #26
	beq	.L87
	ldr	r3, [fp, #-48]
	cmp	r3, #23
	beq	.L85
	b	.L84
.L85:
	mov	r0, #0
	bl	zx_read_byte(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, .L95
	str	r3, [fp, #-32]
	ldr	r3, .L95+4
	str	r3, [fp, #-24]
	b	.L84
.L87:
	ldr	r3, .L95+8
	str	r3, [fp, #-32]
	ldr	r3, .L95+12
	str	r3, [fp, #-24]
	b	.L84
.L86:
	mov	r0, #1
	bl	zx_read_byte(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, .L95+16
	str	r3, [fp, #-32]
	ldr	r3, .L95+20
	str	r3, [fp, #-24]
.L84:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmn	r3, #1
	bne	.L88
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	b	.L94
.L88:
	ldr	r0, [fp, #-36]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r3, [fp, #-44]
	cmp	r3, #1
	bne	.L91
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #32]
	b	.L93
.L91:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #32]
.L93:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	zx_q_append_to_end(PLT)
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #0]
.L94:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L96:
	.align	2
.L95:
	.word	413648
	.word	413704
	.word	413652
	.word	413708
	.word	413656
	.word	413712
	.size	zx_handle_uart_interrupt, .-zx_handle_uart_interrupt
	.ident	"GCC: (GNU) 4.0.2"
