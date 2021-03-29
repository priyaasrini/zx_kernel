	.file	"zx_uart2_transmit_server.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"zx_uart2_tx_server\000"
	.text
	.align	2
	.global	zx_uart2_tx_server
	.type	zx_uart2_tx_server, %function
zx_uart2_tx_server:
	@ args = 0, pretend = 0, frame = 1292
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #1296
	ldr	sl, .L47
.L46:
	add	sl, pc, sl
	sub	r3, fp, #76
	str	r3, [fp, #-80]
	mov	r3, #0
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L2
.L3:
	ldr	r3, [fp, #-48]
	ldr	r2, .L47+4
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L2:
	ldr	r2, [fp, #-48]
	ldr	r3, .L47+8
	cmp	r2, r3
	ble	.L3
	sub	r3, fp, #80
	sub	r2, fp, #1280
	mov	r0, r3
	mov	r1, r2
	mov	r2, #1
	mov	r3, #1200
	bl	zx_queue_initialize(PLT)
	sub	r3, fp, #1280
	sub	r3, r3, #1
	str	r3, [fp, #-44]
	mov	r0, #4
	ldr	r3, .L47+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	mvn	r3, #0
	str	r3, [fp, #-1288]
	ldr	r3, .L47+16
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, #1
	str	r3, [fp, #-1296]
	sub	r2, fp, #1296
	sub	ip, fp, #1296
	sub	ip, ip, #8
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-40]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-1304]
	cmp	r3, #1
	beq	.L5
	bl	Exit(PLT)
.L5:
	sub	r2, fp, #1280
	sub	r2, r2, #8
	sub	r3, fp, #1296
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r2, [fp, #-1288]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bne	.L7
	ldr	r3, [fp, #-1304]
	cmp	r3, #1
	beq	.L9
.L7:
	bl	Exit(PLT)
	b	.L44
.L9:
	mov	r3, #1
	str	r3, [fp, #-1296]
	sub	r3, fp, #1296
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #0
	str	r3, [fp, #-36]
	mvn	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L45
.L11:
.L45:
	sub	r2, fp, #1280
	sub	r2, r2, #8
	sub	r3, fp, #1296
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r2, [fp, #-1288]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bne	.L12
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L14
	sub	r3, fp, #80
	mov	r0, r3
	ldr	r1, [fp, #-44]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L16
	mov	r3, #6
	str	r3, [fp, #-1304]
	ldrb	r3, [fp, #-1281]	@ zero_extendqisi2
	str	r3, [fp, #-1300]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	b	.L19
.L16:
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L19
.L14:
	mov	r3, #5
	str	r3, [fp, #-1304]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	ldr	r0, [fp, #-32]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	sub	r3, fp, #1296
	sub	r3, r3, #8
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L20
.L12:
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	bne	.L21
	mov	r3, #12
	str	r3, [fp, #-1304]
	mov	r3, #0
	str	r3, [fp, #-1300]
	ldr	r2, [fp, #-1288]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
.L21:
	ldr	r3, [fp, #-1304]
	str	r3, [fp, #-1308]
	ldr	r1, [fp, #-1308]
	cmp	r1, #5
	beq	.L24
	ldr	r3, [fp, #-1308]
	cmp	r3, #9
	beq	.L25
	ldr	r1, [fp, #-1308]
	cmp	r1, #4
	beq	.L23
	b	.L19
.L23:
	ldr	r3, [fp, #-1300]
	and	r3, r3, #255
	strb	r3, [fp, #-1281]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L26
	mov	r3, #6
	str	r3, [fp, #-1304]
	ldrb	r3, [fp, #-1281]	@ zero_extendqisi2
	str	r3, [fp, #-1300]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	ldr	r3, .L47+20
	str	r3, [fp, #-1304]
	ldr	r2, [fp, #-1288]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L19
.L26:
	sub	r3, fp, #80
	mov	r0, r3
	ldr	r1, [fp, #-44]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	bne	.L29
	ldr	r3, .L47+24
	str	r3, [fp, #-1304]
	b	.L31
.L29:
	ldr	r3, .L47+20
	str	r3, [fp, #-1304]
.L31:
	ldr	r2, [fp, #-1288]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	b	.L19
.L25:
	ldr	r3, [fp, #-1300]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L32
	ldr	r3, .L47+20
	str	r3, [fp, #-1304]
	ldr	r2, [fp, #-1288]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	b	.L19
.L32:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L36
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [fp, #-1281]
	mov	r3, #6
	str	r3, [fp, #-1304]
	ldrb	r3, [fp, #-1281]	@ zero_extendqisi2
	str	r3, [fp, #-1300]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L36
.L37:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [fp, #-1281]
	sub	r3, fp, #80
	mov	r0, r3
	ldr	r1, [fp, #-44]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	bne	.L38
	ldr	r3, .L47+24
	str	r3, [fp, #-1304]
	ldr	r2, [fp, #-1288]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	b	.L40
.L38:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L36:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L37
.L40:
	ldr	r3, .L47+20
	str	r3, [fp, #-1304]
	ldr	r2, [fp, #-1288]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	b	.L19
.L24:
	mov	r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-1288]
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-1288]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L19
	mov	r3, #5
	str	r3, [fp, #-1304]
	sub	r3, fp, #1296
	sub	r3, r3, #8
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
.L19:
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	bne	.L11
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L20
	b	.L11
.L20:
	bl	Exit(PLT)
.L44:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L48:
	.align	2
.L47:
	.word	_GLOBAL_OFFSET_TABLE_-(.L46+8)
	.word	-1264
	.word	1199
	.word	zx_uart2_tx_notifier(GOT)
	.word	.LC0(GOTOFF)
	.word	258
	.word	257
	.size	zx_uart2_tx_server, .-zx_uart2_tx_server
	.align	2
	.global	zx_uart2_tx_notifier
	.type	zx_uart2_tx_notifier, %function
zx_uart2_tx_notifier:
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
	mov	r3, #4
	str	r3, [fp, #-40]
	b	.L56
.L50:
.L56:
	mov	r0, #5
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
	beq	.L51
	ldr	r3, [fp, #-24]
	cmp	r3, #6
	bne	.L50
	ldr	r3, [fp, #-20]
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r0, #1
	mov	r1, r3
	bl	zx_write_byte(PLT)
	b	.L50
.L51:
	bl	Exit(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_uart2_tx_notifier, .-zx_uart2_tx_notifier
	.ident	"GCC: (GNU) 4.0.2"
