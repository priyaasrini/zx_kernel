	.file	"zx_uart2_receive_server.c"
	.text
	.align	2
	.global	zx_uart2_rx_notifier
	.type	zx_uart2_rx_notifier, %function
zx_uart2_rx_notifier:
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
	mov	r3, #3
	str	r3, [fp, #-40]
.L2:
	mov	r0, #4
	bl	AwaitEvent(PLT)
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	str	r3, [fp, #-36]
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
	beq	.L3
	b	.L2
.L3:
	bl	Exit(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_uart2_rx_notifier, .-zx_uart2_rx_notifier
	.section	.rodata
	.align	2
.LC0:
	.ascii	"zx_uart2_rx_server\000"
	.align	2
.LC1:
	.ascii	"UART2 Receive Server Error : Buffer Full\012\000"
	.align	2
.LC2:
	.ascii	"UART2 Receive Server Error : Tasks Queue Full\012\000"
	.text
	.align	2
	.global	zx_uart2_rx_server
	.type	zx_uart2_rx_server, %function
zx_uart2_rx_server:
	@ args = 0, pretend = 0, frame = 480
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #484
	ldr	sl, .L43
.L42:
	add	sl, pc, sl
	sub	r3, fp, #72
	str	r3, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L7
.L8:
	ldr	r3, [fp, #-44]
	mvn	r2, #159
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L7:
	ldr	r3, [fp, #-44]
	cmp	r3, #99
	ble	.L8
	sub	r3, fp, #76
	sub	r2, fp, #176
	mov	r0, r3
	mov	r1, r2
	mov	r2, #1
	mov	r3, #100
	bl	zx_queue_initialize(PLT)
	sub	r3, fp, #204
	str	r3, [fp, #-208]
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L10
.L11:
	ldr	r3, [fp, #-44]
	ldr	r2, .L43+4
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r2, r3, r2
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L10:
	ldr	r3, [fp, #-44]
	cmp	r3, #63
	ble	.L11
	sub	r3, fp, #208
	sub	r2, fp, #464
	mov	r0, r3
	mov	r1, r2
	mov	r2, #4
	mov	r3, #64
	bl	zx_queue_initialize(PLT)
	mov	r0, #6
	ldr	r3, .L43+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	mvn	r3, #0
	str	r3, [fp, #-468]
	ldr	r3, .L43+12
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, #1
	str	r3, [fp, #-476]
	sub	r2, fp, #476
	sub	ip, fp, #484
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-40]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-484]
	cmp	r3, #1
	beq	.L13
	bl	Exit(PLT)
.L13:
	sub	r3, fp, #468
	sub	r2, fp, #484
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r2, [fp, #-468]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bne	.L15
	ldr	r3, [fp, #-484]
	cmp	r3, #1
	beq	.L17
.L15:
	bl	Exit(PLT)
	b	.L40
.L17:
	mov	r3, #1
	str	r3, [fp, #-476]
	sub	r3, fp, #476
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #0
	str	r3, [fp, #-36]
	mvn	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-488]
	sub	r3, fp, #488
	str	r3, [fp, #-24]
	sub	r3, fp, #488
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L41
.L19:
.L41:
	sub	r3, fp, #468
	sub	r2, fp, #484
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r2, [fp, #-468]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bne	.L20
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L22
	ldr	r3, [fp, #-480]
	and	r3, r3, #255
	strb	r3, [fp, #-489]
	ldr	r3, [fp, #-468]
	sub	r2, fp, #484
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	sub	r3, fp, #208
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	bne	.L24
	ldr	r3, .L43+16
	str	r3, [fp, #-484]
	ldrb	r3, [fp, #-489]	@ zero_extendqisi2
	str	r3, [fp, #-480]
	ldr	r3, [fp, #-488]
	sub	r2, fp, #484
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L19
.L24:
	sub	r3, fp, #76
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #3
	bne	.L19
	mov	r0, #1
	ldr	r3, .L43+20
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L19
.L22:
	mov	r3, #5
	str	r3, [fp, #-484]
	sub	r3, fp, #484
	ldr	r0, [fp, #-32]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	sub	r3, fp, #484
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	b	.L29
.L30:
	mov	r3, #12
	str	r3, [fp, #-484]
	mov	r3, #0
	str	r3, [fp, #-480]
	ldr	r3, [fp, #-488]
	sub	r2, fp, #484
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
.L29:
	sub	r3, fp, #208
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	beq	.L30
	bl	Exit(PLT)
	b	.L40
.L20:
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	bne	.L32
	mov	r3, #12
	str	r3, [fp, #-484]
	mov	r3, #0
	str	r3, [fp, #-480]
	ldr	r3, [fp, #-468]
	sub	r2, fp, #484
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
.L32:
	ldr	r3, [fp, #-484]
	str	r3, [fp, #-496]
	ldr	r1, [fp, #-496]
	cmp	r1, #3
	beq	.L34
	ldr	r3, [fp, #-496]
	cmp	r3, #5
	beq	.L35
	b	.L19
.L34:
	sub	r3, fp, #76
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	bne	.L36
	ldr	r3, .L43+16
	str	r3, [fp, #-484]
	ldrb	r3, [fp, #-489]	@ zero_extendqisi2
	str	r3, [fp, #-480]
	ldr	r3, [fp, #-468]
	sub	r2, fp, #484
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L19
.L36:
	ldr	r3, [fp, #-468]
	str	r3, [fp, #-488]
	sub	r3, fp, #208
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #3
	bne	.L19
	ldr	r3, .L43+24
	str	r3, [fp, #-484]
	ldr	r3, [fp, #-468]
	sub	r2, fp, #484
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	mov	r0, #1
	ldr	r3, .L43+28
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L19
.L35:
	mov	r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-468]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-468]
	sub	r2, fp, #484
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L19
.L40:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L44:
	.align	2
.L43:
	.word	_GLOBAL_OFFSET_TABLE_-(.L42+8)
	.word	-448
	.word	zx_uart2_rx_notifier(GOT)
	.word	.LC0(GOTOFF)
	.word	258
	.word	.LC1(GOTOFF)
	.word	257
	.word	.LC2(GOTOFF)
	.size	zx_uart2_rx_server, .-zx_uart2_rx_server
	.ident	"GCC: (GNU) 4.0.2"
