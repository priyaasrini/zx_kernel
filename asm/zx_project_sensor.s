	.file	"zx_project_sensor.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"sensor_courier\000"
	.text
	.align	2
	.global	zx_track_sensor_task
	.type	zx_track_sensor_task, %function
zx_track_sensor_task:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #64
	ldr	sl, .L20
.L19:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-48]
	mvn	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	strb	r3, [fp, #-33]
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L2
.L3:
	ldr	r3, [fp, #-48]
	mvn	r2, #41
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L2:
	ldr	r3, [fp, #-48]
	cmp	r3, #9
	ble	.L3
	mov	r3, #10
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	beq	.L18
	mov	r3, #0
	str	r3, [fp, #-20]
.L7:
	ldr	r3, [fp, #-32]
	cmp	r3, #10
	bne	.L8
	mov	r0, #0
	mov	r1, #133
	bl	PutC(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-32]
.L8:
	mov	r0, #0
	bl	GetC(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	cmp	r3, #99
	bgt	.L10
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L10:
	ldr	r3, [fp, #-28]
	cmn	r3, #1
	beq	.L12
	ldr	r3, [fp, #-28]
	cmn	r3, #2
	beq	.L12
	ldr	r3, [fp, #-28]
	strb	r3, [fp, #-41]
	ldr	r3, [fp, #-40]
	add	r1, r3, #1
	ldr	r3, .L20+8
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r3, r3, r1
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-40]
	mvn	r2, #41
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	and	r3, r3, #255
	mvn	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-41]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r2
	and	r3, r1, r3
	and	r3, r3, #255
	strb	r3, [fp, #-33]
	ldrb	r3, [fp, #-33]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L15
	ldr	r3, [fp, #-20]
	cmp	r3, #10
	ble	.L15
	ldrb	r2, [fp, #-33]	@ zero_extendqisi2
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #8
	orr	r3, r2, r3
	str	r3, [fp, #-68]
	sub	r2, fp, #68
	sub	ip, fp, #76
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-24]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-76]
	cmn	r3, #1
	beq	.L12
.L15:
	ldr	r3, [fp, #-40]
	mvn	r2, #41
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	ldrb	r3, [fp, #-41]
	strb	r3, [r2, #0]
	b	.L7
.L12:
	bl	Exit(PLT)
.L18:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L21:
	.align	2
.L20:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
	.word	.LC0(GOTOFF)
	.word	1717986919
	.size	zx_track_sensor_task, .-zx_track_sensor_task
	.align	2
	.global	zx_sensor_courier_task
	.type	zx_sensor_courier_task, %function
zx_sensor_courier_task:
	@ args = 0, pretend = 0, frame = 720
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #720
	ldr	sl, .L36
.L35:
	add	sl, pc, sl
	ldr	r3, .L36+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r0, #16
	ldr	r3, .L36+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-44]
	sub	r3, fp, #76
	str	r3, [fp, #-80]
	sub	r3, fp, #80
	sub	r2, fp, #720
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	mov	r3, #80
	bl	zx_queue_initialize(PLT)
	mov	r3, #0
	str	r3, [fp, #-728]
	mov	r3, #0
	str	r3, [fp, #-724]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L34
.L23:
.L34:
	sub	r3, fp, #48
	sub	r2, fp, #36
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L24
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	bne	.L26
	mvn	r3, #0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-48]
	sub	r2, fp, #44
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L33
.L26:
	ldr	r3, [fp, #-48]
	sub	r2, fp, #44
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	bl	Time(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	sub	r3, fp, #80
	sub	r2, fp, #36
	mov	r0, r3
	mov	r1, r2
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L23
.L24:
	ldr	r3, [fp, #-36]
	cmn	r3, #1
	bne	.L29
	mvn	r3, #0
	str	r3, [fp, #-736]
	mvn	r3, #0
	str	r3, [fp, #-732]
	ldr	r3, [fp, #-48]
	sub	r2, fp, #736
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #1
	str	r3, [fp, #-20]
.L29:
	sub	r3, fp, #80
	sub	r2, fp, #736
	mov	r0, r3
	mov	r1, r2
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L31
	ldr	r3, [fp, #-48]
	sub	r2, fp, #736
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L23
.L31:
	mvn	r3, #0
	str	r3, [fp, #-736]
	mvn	r3, #0
	str	r3, [fp, #-732]
	ldr	r3, [fp, #-48]
	sub	r2, fp, #736
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L23
.L33:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	_GLOBAL_OFFSET_TABLE_-(.L35+8)
	.word	.LC0(GOTOFF)
	.word	zx_track_sensor_task(GOT)
	.size	zx_sensor_courier_task, .-zx_sensor_courier_task
	.align	2
	.global	zx_sensor_secretary_task
	.type	zx_sensor_secretary_task, %function
zx_sensor_secretary_task:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	sl, .L44
.L43:
	add	sl, pc, sl
	mov	r0, #20
	ldr	r3, .L44+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
.L39:
	sub	r3, fp, #40
	sub	r2, fp, #28
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r3, [fp, #-28]
	cmn	r3, #1
	bne	.L40
	mvn	r3, #0
	str	r3, [fp, #-28]
	sub	r2, fp, #28
	sub	ip, fp, #36
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-40]
	sub	r2, fp, #36
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	bl	Exit(PLT)
	b	.L42
.L40:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-28]
	sub	r2, fp, #28
	sub	ip, fp, #36
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-40]
	sub	r2, fp, #36
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	b	.L39
.L42:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L45:
	.align	2
.L44:
	.word	_GLOBAL_OFFSET_TABLE_-(.L43+8)
	.word	zx_sensor_courier_task(GOT)
	.size	zx_sensor_secretary_task, .-zx_sensor_secretary_task
	.ident	"GCC: (GNU) 4.0.2"
