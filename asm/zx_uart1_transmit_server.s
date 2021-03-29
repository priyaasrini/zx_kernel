	.file	"zx_uart1_transmit_server.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"zx_uart1_tx_server\000"
	.text
	.align	2
	.global	zx_uart1_tx_server
	.type	zx_uart1_tx_server, %function
zx_uart1_tx_server:
	@ args = 0, pretend = 0, frame = 496
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #500
	ldr	sl, .L51
.L50:
	add	sl, pc, sl
	sub	r3, fp, #80
	str	r3, [fp, #-84]
	mov	r3, #0
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-52]
	b	.L2
.L3:
	ldr	r3, [fp, #-52]
	ldr	r2, .L51+4
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-52]
	add	r3, r3, #1
	str	r3, [fp, #-52]
.L2:
	ldr	r2, [fp, #-52]
	ldr	r3, .L51+8
	cmp	r2, r3
	ble	.L3
	sub	r3, fp, #84
	sub	r2, fp, #484
	mov	r0, r3
	mov	r1, r2
	mov	r2, #1
	mov	r3, #400
	bl	zx_queue_initialize(PLT)
	sub	r3, fp, #484
	sub	r3, r3, #1
	str	r3, [fp, #-48]
	mov	r0, #0
	ldr	r3, .L51+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-44]
	mvn	r3, #0
	str	r3, [fp, #-492]
	ldr	r3, .L51+16
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, #1
	str	r3, [fp, #-500]
	sub	r2, fp, #500
	sub	ip, fp, #508
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-508]
	cmp	r3, #1
	beq	.L5
	bl	Exit(PLT)
.L5:
	sub	r3, fp, #492
	sub	r2, fp, #508
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r2, [fp, #-492]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bne	.L7
	ldr	r3, [fp, #-508]
	cmp	r3, #1
	beq	.L9
.L7:
	bl	Exit(PLT)
	b	.L48
.L9:
	mov	r3, #1
	str	r3, [fp, #-500]
	sub	r3, fp, #500
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #0
	str	r3, [fp, #-40]
	mvn	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L49
.L11:
.L49:
	sub	r3, fp, #492
	sub	r2, fp, #508
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r2, [fp, #-492]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bne	.L12
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L14
	sub	r3, fp, #84
	mov	r0, r3
	ldr	r1, [fp, #-48]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	bne	.L16
	mov	r3, #6
	str	r3, [fp, #-508]
	ldrb	r3, [fp, #-485]	@ zero_extendqisi2
	str	r3, [fp, #-504]
	sub	r3, fp, #508
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	b	.L21
.L16:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L19
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #6
	str	r3, [fp, #-508]
	mov	r3, #133
	str	r3, [fp, #-504]
	sub	r3, fp, #508
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	b	.L21
.L19:
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L21
.L14:
	mov	r3, #5
	str	r3, [fp, #-508]
	sub	r3, fp, #508
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	sub	r3, fp, #508
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L22
.L12:
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	bne	.L23
	mov	r3, #12
	str	r3, [fp, #-508]
	mov	r3, #0
	str	r3, [fp, #-504]
	ldr	r3, [fp, #-492]
	sub	r2, fp, #508
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
.L23:
	ldr	r3, [fp, #-508]
	str	r3, [fp, #-512]
	ldr	r1, [fp, #-512]
	cmp	r1, #5
	beq	.L26
	ldr	r3, [fp, #-512]
	cmp	r3, #8
	beq	.L27
	ldr	r1, [fp, #-512]
	cmp	r1, #2
	beq	.L25
	b	.L21
.L25:
	ldr	r3, [fp, #-504]
	and	r3, r3, #255
	strb	r3, [fp, #-485]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L28
	mov	r3, #6
	str	r3, [fp, #-508]
	ldrb	r3, [fp, #-485]	@ zero_extendqisi2
	str	r3, [fp, #-504]
	sub	r3, fp, #508
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	ldr	r3, .L51+20
	str	r3, [fp, #-508]
	ldr	r3, [fp, #-492]
	sub	r2, fp, #508
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L21
.L28:
	ldrb	r3, [fp, #-485]	@ zero_extendqisi2
	cmp	r3, #133
	bne	.L31
	mov	r3, #1
	str	r3, [fp, #-20]
	ldr	r3, .L51+20
	str	r3, [fp, #-508]
	b	.L33
.L31:
	sub	r3, fp, #84
	mov	r0, r3
	ldr	r1, [fp, #-48]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #3
	bne	.L34
	ldr	r3, .L51+24
	str	r3, [fp, #-508]
	b	.L33
.L34:
	ldr	r3, .L51+20
	str	r3, [fp, #-508]
.L33:
	ldr	r3, [fp, #-492]
	sub	r2, fp, #508
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L21
.L27:
	ldr	r3, [fp, #-504]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L36
	ldr	r3, .L51+20
	str	r3, [fp, #-508]
	ldr	r3, [fp, #-492]
	sub	r2, fp, #508
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L21
.L36:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L40
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [fp, #-485]
	mov	r3, #6
	str	r3, [fp, #-508]
	ldrb	r3, [fp, #-485]	@ zero_extendqisi2
	str	r3, [fp, #-504]
	sub	r3, fp, #508
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L40
.L41:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [fp, #-485]
	sub	r3, fp, #84
	mov	r0, r3
	ldr	r1, [fp, #-48]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #3
	bne	.L42
	ldr	r3, .L51+24
	str	r3, [fp, #-508]
	ldr	r3, [fp, #-492]
	sub	r2, fp, #508
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L44
.L42:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L40:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L41
.L44:
	ldr	r3, .L51+20
	str	r3, [fp, #-508]
	ldr	r3, [fp, #-492]
	sub	r2, fp, #508
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L21
.L26:
	mov	r3, #1
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-492]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-492]
	sub	r2, fp, #508
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L21
	mov	r3, #5
	str	r3, [fp, #-508]
	sub	r3, fp, #508
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
.L21:
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	bne	.L11
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L22
	b	.L11
.L22:
	bl	Exit(PLT)
.L48:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L52:
	.align	2
.L51:
	.word	_GLOBAL_OFFSET_TABLE_-(.L50+8)
	.word	-468
	.word	399
	.word	zx_uart1_tx_notifier(GOT)
	.word	.LC0(GOTOFF)
	.word	258
	.word	257
	.size	zx_uart1_tx_server, .-zx_uart1_tx_server
	.align	2
	.global	zx_uart1_tx_notifier
	.type	zx_uart1_tx_notifier, %function
zx_uart1_tx_notifier:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	mov	r3, #0
	strb	r3, [fp, #-13]
	sub	r3, fp, #44
	sub	r2, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	sub	r2, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-44]
	sub	r1, fp, #32
	sub	ip, fp, #24
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, #2
	str	r3, [fp, #-40]
	mov	r0, #1
	bl	zx_device_init(PLT)
	b	.L60
.L54:
.L60:
	mov	r0, #3
	bl	AwaitEvent(PLT)
	ldr	r2, [fp, #-44]
	sub	r1, fp, #40
	sub	ip, fp, #24
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-24]
	cmp	r3, #5
	beq	.L55
	ldr	r3, [fp, #-24]
	cmp	r3, #6
	bne	.L54
	ldr	r3, [fp, #-20]
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r0, #0
	mov	r1, r3
	bl	zx_write_byte(PLT)
	b	.L54
.L55:
	bl	Exit(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_uart1_tx_notifier, .-zx_uart1_tx_notifier
	.ident	"GCC: (GNU) 4.0.2"
