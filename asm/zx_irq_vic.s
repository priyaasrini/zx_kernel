	.file	"zx_irq_vic.c"
	.text
	.align	2
	.global	zx_reset_all_interrupts
	.type	zx_reset_all_interrupts, %function
zx_reset_all_interrupts:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	bl	zx_vic_disable_all_interrupts(PLT)
	bl	zx_device_intr_disable_all(PLT)
	bl	zx_device_intr_clear_all(PLT)
	ldmfd	sp, {fp, sp, pc}
	.size	zx_reset_all_interrupts, .-zx_reset_all_interrupts
	.align	2
	.global	zx_vic_disable_all_interrupts
	.type	zx_vic_disable_all_interrupts, %function
zx_vic_disable_all_interrupts:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	r3, .L5
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L5+4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldmfd	sp, {r3, fp, sp, pc}
.L6:
	.align	2
.L5:
	.word	-2146762732
	.word	-2146697196
	.size	zx_vic_disable_all_interrupts, .-zx_vic_disable_all_interrupts
	.align	2
	.global	zx_vic_enable_all_interrupts
	.type	zx_vic_enable_all_interrupts, %function
zx_vic_enable_all_interrupts:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	bl	zx_vic_disable_all_interrupts(PLT)
	mov	r0, #4
	bl	zx_vic_enable_interrupt(PLT)
	mov	r0, #54
	bl	zx_vic_enable_interrupt(PLT)
	mov	r0, #52
	bl	zx_vic_enable_interrupt(PLT)
	ldmfd	sp, {fp, sp, pc}
	.size	zx_vic_enable_all_interrupts, .-zx_vic_enable_all_interrupts
	.align	2
	.global	zx_vic_disable_interrupt
	.type	zx_vic_disable_interrupt, %function
zx_vic_disable_interrupt:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	bgt	.L10
	ldr	r3, .L14
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-24]
	b	.L12
.L10:
	ldr	r3, .L14+4
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	sub	r3, r3, #32
	str	r3, [fp, #-24]
.L12:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r2, #1
	ldr	r3, [fp, #-24]
	mov	r2, r2, asl r3
	ldr	r3, [fp, #-16]
	orr	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L15:
	.align	2
.L14:
	.word	-2146762732
	.word	-2146697196
	.size	zx_vic_disable_interrupt, .-zx_vic_disable_interrupt
	.align	2
	.global	zx_vic_enable_interrupt
	.type	zx_vic_enable_interrupt, %function
zx_vic_enable_interrupt:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	bgt	.L17
	ldr	r3, .L21
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-24]
	b	.L19
.L17:
	ldr	r3, .L21+4
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	sub	r3, r3, #32
	str	r3, [fp, #-24]
.L19:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r2, #1
	ldr	r3, [fp, #-24]
	mov	r2, r2, asl r3
	ldr	r3, [fp, #-16]
	orr	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	-2146762736
	.word	-2146697200
	.size	zx_vic_enable_interrupt, .-zx_vic_enable_interrupt
	.align	2
	.global	zx_get_interrupt_source
	.type	zx_get_interrupt_source, %function
zx_get_interrupt_source:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	ldr	r3, .L40
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-40]
	ldr	r3, .L40+4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	and	r3, r3, #1048576
	cmp	r3, #0
	ble	.L24
	ldr	r3, .L40+8
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	and	r3, r3, #1
	cmp	r3, #0
	ble	.L26
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L32
.L26:
	ldr	r3, [fp, #-24]
	and	r3, r3, #2
	cmp	r3, #0
	ble	.L29
	mov	r3, #23
	str	r3, [fp, #-32]
	b	.L32
.L29:
	ldr	r3, [fp, #-24]
	and	r3, r3, #4
	cmp	r3, #0
	ble	.L32
	mov	r3, #24
	str	r3, [fp, #-32]
	b	.L32
.L24:
	ldr	r3, [fp, #-40]
	and	r3, r3, #16
	cmp	r3, #0
	ble	.L33
	mov	r3, #4
	str	r3, [fp, #-32]
	b	.L32
.L33:
	ldr	r3, [fp, #-36]
	and	r3, r3, #4194304
	cmp	r3, #0
	ble	.L32
	ldr	r3, .L40+12
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	and	r3, r3, #2
	cmp	r3, #0
	ble	.L36
	mov	r3, #25
	str	r3, [fp, #-32]
	b	.L32
.L36:
	ldr	r3, [fp, #-16]
	and	r3, r3, #4
	cmp	r3, #0
	ble	.L32
	mov	r3, #26
	str	r3, [fp, #-32]
.L32:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L41:
	.align	2
.L40:
	.word	-2146762752
	.word	-2146697216
	.word	-2138308580
	.word	-2138243044
	.size	zx_get_interrupt_source, .-zx_get_interrupt_source
	.ident	"GCC: (GNU) 4.0.2"
