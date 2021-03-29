	.file	"zx_clock_server.c"
	.text
	.align	2
	.global	zx_clock_notifier
	.type	zx_clock_notifier, %function
zx_clock_notifier:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	sub	r3, fp, #24
	sub	r2, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-24]
	sub	r2, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-24]
	sub	r1, fp, #32
	sub	ip, fp, #20
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, #2
	str	r3, [fp, #-40]
	mov	r0, #4
	bl	zx_device_init(PLT)
	mov	r0, #4
	bl	zx_device_intr_on(PLT)
.L2:
	mov	r0, #1
	bl	AwaitEvent(PLT)
	ldr	r2, [fp, #-24]
	sub	r1, fp, #40
	sub	ip, fp, #20
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-20]
	cmp	r3, #4
	bne	.L2
	ldr	r0, .L6
	bl	zx_timer_disable(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	-2139029504
	.size	zx_clock_notifier, .-zx_clock_notifier
	.section	.rodata
	.align	2
.LC0:
	.ascii	"zx_clock_server\000"
	.text
	.align	2
	.global	zx_clock_server
	.type	zx_clock_server, %function
zx_clock_server:
	@ args = 0, pretend = 0, frame = 560
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #564
	ldr	sl, .L36
.L35:
	add	sl, pc, sl
	sub	r3, fp, #552
	sub	r2, fp, #556
	mov	r0, r3
	mov	r1, #64
	bl	zx_clockserver_heap_init(PLT)
	mov	r0, #2
	ldr	r3, .L36+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, .L36+8
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, #1
	str	r3, [fp, #-564]
	sub	r2, fp, #564
	sub	ip, fp, #572
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-572]
	cmp	r3, #1
	beq	.L9
	bl	Exit(PLT)
.L9:
	sub	r3, fp, #576
	sub	r2, fp, #572
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r2, [fp, #-576]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bne	.L11
	ldr	r3, [fp, #-572]
	cmp	r3, #1
	beq	.L13
.L11:
	bl	Exit(PLT)
	b	.L33
.L13:
	mov	r3, #1
	str	r3, [fp, #-564]
	sub	r3, fp, #564
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-32]
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L34
.L15:
.L34:
	sub	r3, fp, #576
	sub	r2, fp, #572
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r2, [fp, #-576]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bne	.L16
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L18
	mov	r3, #1
	str	r3, [fp, #-572]
	sub	r3, fp, #572
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	b	.L20
.L18:
	mov	r3, #4
	str	r3, [fp, #-572]
	sub	r3, fp, #572
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
	sub	r3, fp, #552
	sub	r2, fp, #556
	mov	r0, r3
	mov	r1, r2
	bl	zx_empty_heap_and_notify_client_tasks(PLT)
	ldr	r3, [fp, #-28]
	cmn	r3, #1
	beq	.L21
	b	.L22
.L16:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L23
	mov	r3, #12
	str	r3, [fp, #-572]
	mov	r3, #0
	str	r3, [fp, #-568]
	ldr	r3, [fp, #-576]
	sub	r2, fp, #572
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
.L23:
	ldr	r3, [fp, #-572]
	sub	r3, r3, #1
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L20
	.p2align 2
.L29:
	b	.L25
	b	.L26
	b	.L27
	b	.L28
.L25:
	ldr	r3, [fp, #-568]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	ip, [fp, #-576]
	sub	r3, fp, #552
	sub	r2, fp, #556
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	ldr	r3, [fp, #-20]
	bl	zx_clockserver_heap_insert(PLT)
	b	.L20
.L27:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-568]
	ldr	r3, [fp, #-576]
	sub	r2, fp, #572
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L20
.L26:
	ldr	ip, [fp, #-576]
	ldr	lr, [fp, #-568]
	sub	r3, fp, #552
	sub	r2, fp, #556
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	mov	r3, lr
	bl	zx_clockserver_heap_insert(PLT)
	b	.L20
.L28:
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-576]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-568]
	sub	r3, fp, #572
	ldr	r0, [fp, #-28]
	mov	r1, r3
	mov	r2, #8
	bl	Reply(PLT)
.L20:
	sub	r3, fp, #552
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	cmn	r3, #1
	beq	.L15
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bhi	.L15
	mov	r3, #1
	str	r3, [fp, #-572]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-568]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	sub	r2, fp, #572
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	sub	r3, fp, #552
	sub	r2, fp, #556
	mov	r0, r3
	mov	r1, r2
	bl	zx_clockserver_heap_remove(PLT)
	b	.L15
.L21:
	bl	Exit(PLT)
.L22:
	bl	Exit(PLT)
.L33:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	_GLOBAL_OFFSET_TABLE_-(.L35+8)
	.word	zx_clock_notifier(GOT)
	.word	.LC0(GOTOFF)
	.size	zx_clock_server, .-zx_clock_server
	.align	2
	.global	zx_empty_heap_and_notify_client_tasks
	.type	zx_empty_heap_and_notify_client_tasks, %function
zx_empty_heap_and_notify_client_tasks:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-16]
	b	.L39
.L40:
	mov	r3, #12
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	sub	r2, fp, #24
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-32]
	bl	zx_clockserver_heap_remove(PLT)
.L39:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	cmn	r3, #1
	bne	.L40
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_empty_heap_and_notify_client_tasks, .-zx_empty_heap_and_notify_client_tasks
	.ident	"GCC: (GNU) 4.0.2"
