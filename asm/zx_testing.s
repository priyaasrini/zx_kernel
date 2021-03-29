	.file	"zx_testing.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"MyTid: %d, MyParentTid: %d\012\000"
	.text
	.align	2
	.global	test1_other_task
	.type	test1_other_task, %function
test1_other_task:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	zx_printf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	zx_printf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.size	test1_other_task, .-test1_other_task
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Created: %d\012\000"
	.align	2
.LC2:
	.ascii	"First: Exiting\012\000"
	.text
	.align	2
	.global	test1
	.type	test1, %function
test1:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L9
.L8:
	add	sl, pc, sl
	mov	r0, #21
	ldr	r3, .L9+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L9+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	zx_printf(PLT)
	mov	r0, #21
	ldr	r3, .L9+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L9+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	zx_printf(PLT)
	mov	r0, #19
	ldr	r3, .L9+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L9+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	zx_printf(PLT)
	mov	r0, #19
	ldr	r3, .L9+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L9+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L9+12
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	test1_other_task(GOT)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	test1, .-test1
	.align	2
	.global	test2_other_task
	.type	test2_other_task, %function
test2_other_task:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L14
.L13:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L14+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	zx_printf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L14+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	zx_printf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L15:
	.align	2
.L14:
	.word	_GLOBAL_OFFSET_TABLE_-(.L13+8)
	.word	.LC0(GOTOFF)
	.size	test2_other_task, .-test2_other_task
	.section	.rodata
	.align	2
.LC3:
	.ascii	"First: Starting\012\000"
	.align	2
.LC4:
	.ascii	"Result: %x. \012\000"
	.align	2
.LC5:
	.ascii	"Task Limit Exceeded\000"
	.align	2
.LC6:
	.ascii	"Created: %x\012\000"
	.align	2
.LC7:
	.ascii	"Value: %x\012\000"
	.text
	.align	2
	.global	test2
	.type	test2, %function
test2:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	sl, .L29
.L28:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L29+4
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r3, .L29+8
	str	r3, [sp, #0]
	ldr	r3, .L29+12
	str	r3, [sp, #4]
	ldr	r3, .L29+16
	str	r3, [sp, #8]
	ldr	r0, .L29+20
	ldr	r1, .L29+24
	ldr	r2, .L29+28
	ldr	r3, .L29+32
	bl	DebugManyArgs(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L29+36
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	zx_printf(PLT)
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L17
.L18:
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	cmp	r3, #2
	beq	.L19
	ldr	r3, [fp, #-28]
	cmp	r3, #20
	beq	.L19
	ldr	r3, [fp, #-28]
	cmp	r3, #60
	bne	.L22
.L19:
	mov	r3, #19
	str	r3, [fp, #-24]
	b	.L23
.L22:
	mov	r3, #21
	str	r3, [fp, #-24]
.L23:
	ldr	r0, [fp, #-24]
	ldr	r3, .L29+40
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmn	r3, #1
	bne	.L24
	mov	r0, #1
	ldr	r3, .L29+44
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	bl	Exit(PLT)
.L24:
	mov	r0, #1
	ldr	r3, .L29+48
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L17:
	ldr	r3, [fp, #-28]
	cmp	r3, #65
	ble	.L18
	mov	r0, #1
	ldr	r3, .L29+52
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, .L29+56
	bl	zx_printf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L30:
	.align	2
.L29:
	.word	_GLOBAL_OFFSET_TABLE_-(.L28+8)
	.word	.LC3(GOTOFF)
	.word	1431655766
	.word	1717986919
	.word	2004318072
	.word	286331154
	.word	572662307
	.word	858993460
	.word	1145324613
	.word	.LC4(GOTOFF)
	.word	test2_other_task(GOT)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	413580
	.size	test2, .-test2
	.section	.rodata
	.align	2
.LC8:
	.ascii	"\012First: Starting\012\000"
	.align	2
.LC9:
	.ascii	"Created Sender1: %x\012\000"
	.align	2
.LC10:
	.ascii	"Created Sender2: %x\012\000"
	.align	2
.LC11:
	.ascii	"Created Receiver: %x\012\000"
	.text
	.align	2
	.global	test3
	.type	test3, %function
test3:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L34
.L33:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L34+4
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #22
	ldr	r3, .L34+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L34+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	zx_printf(PLT)
	mov	r0, #22
	ldr	r3, .L34+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L34+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	zx_printf(PLT)
	mov	r0, #21
	ldr	r3, .L34+20
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L34+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	zx_printf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
	.word	.LC8(GOTOFF)
	.word	sender_task(GOT)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	receiver_task(GOT)
	.word	.LC11(GOTOFF)
	.size	test3, .-test3
	.section	.rodata
	.align	2
.LC12:
	.ascii	"--- oooo -- TASK %d: Sending to: %d of the length=%"
	.ascii	"d...\012\000"
	.align	2
.LC13:
	.ascii	"--- oooo -- TASK %d: Return value of Send() : %d by"
	.ascii	"tes\012\000"
	.align	2
.LC14:
	.ascii	"--- oooo -- TASK %d: Reply received: '%s'.\012\000"
	.align	2
.LC15:
	.ascii	"--- oooo -- TASK %d: Reply Not Received. Error: %d\012"
	.ascii	"\000"
	.text
	.align	2
	.global	SendMessageTo
	.type	SendMessageTo, %function
SendMessageTo:
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #92
	ldr	sl, .L45
.L44:
	add	sl, pc, sl
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	mov	r3, #30
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-104]
	str	r3, [fp, #-24]
	b	.L37
.L38:
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	mvn	r2, #45
	sub	ip, fp, #16
	add	r3, ip, r1
	add	r2, r3, r2
	mov	r3, r0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L37:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L38
	ldr	r3, [fp, #-28]
	mvn	r2, #45
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L45+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-100]
	ldr	r3, [fp, #-96]
	bl	zx_printf(PLT)
	sub	r2, fp, #62
	sub	ip, fp, #92
	ldr	r3, [fp, #-32]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-96]
	mov	r1, r2
	ldr	r2, [fp, #-28]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L45+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-100]
	ldr	r3, [fp, #-20]
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L40
	ldr	r3, [fp, #-20]
	mvn	r2, #75
	sub	ip, fp, #16
	add	r3, ip, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	sub	ip, fp, #92
	mov	r0, #1
	ldr	r3, .L45+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-100]
	mov	r3, ip
	bl	zx_printf(PLT)
	b	.L43
.L40:
	mov	r0, #1
	ldr	r3, .L45+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-100]
	ldr	r3, [fp, #-20]
	bl	zx_printf(PLT)
.L43:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L46:
	.align	2
.L45:
	.word	_GLOBAL_OFFSET_TABLE_-(.L44+8)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.size	SendMessageTo, .-SendMessageTo
	.section	.rodata
	.align	2
.LC16:
	.ascii	"--- oooo -- TASK %d: REPLYING with '%s'..\012\000"
	.align	2
.LC17:
	.ascii	"--- oooo -- TASK %d: REPLY SUCCESSFUL ___\012\000"
	.align	2
.LC18:
	.ascii	"--- oooo -- TASK %d: REPLYING ERROR :( %d\012\000"
	.text
	.align	2
	.global	ReplyMessageTo
	.type	ReplyMessageTo, %function
ReplyMessageTo:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #56
	ldr	sl, .L56
.L55:
	add	sl, pc, sl
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	str	r2, [fp, #-72]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-24]
	b	.L48
.L49:
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	mvn	r2, #41
	sub	ip, fp, #16
	add	r3, ip, r1
	add	r2, r3, r2
	mov	r3, r0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L48:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L49
	ldr	r3, [fp, #-28]
	mvn	r2, #41
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	sub	ip, fp, #58
	mov	r0, #1
	ldr	r3, .L56+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-68]
	mov	r3, ip
	bl	zx_printf(PLT)
	sub	r3, fp, #58
	ldr	r0, [fp, #-64]
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	Reply(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L51
	mov	r0, #1
	ldr	r3, .L56+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-68]
	bl	zx_printf(PLT)
	b	.L54
.L51:
	mov	r0, #1
	ldr	r3, .L56+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-20]
	bl	zx_printf(PLT)
.L54:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L57:
	.align	2
.L56:
	.word	_GLOBAL_OFFSET_TABLE_-(.L55+8)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.size	ReplyMessageTo, .-ReplyMessageTo
	.section	.rodata
	.align	2
.LC19:
	.ascii	"\012\015--- oooo -- TASK %d: Receiving... \012\000"
	.align	2
.LC20:
	.ascii	"--- oooo -- TASK %d: Message received from tid = %x"
	.ascii	". Bytes:%d\012\000"
	.align	2
.LC21:
	.ascii	"Message:'%s'\012\000"
	.align	2
.LC22:
	.ascii	"--- oooo -- TASK %d: ERROR receiving. Error code: %"
	.ascii	"d\012\000"
	.text
	.align	2
	.global	ReceiveMessage
	.type	ReceiveMessage, %function
ReceiveMessage:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	ldr	sl, .L64
.L63:
	add	sl, pc, sl
	str	r0, [fp, #-60]
	mov	r3, #30
	strb	r3, [fp, #-21]
	mov	r0, #1
	ldr	r3, .L64+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-60]
	bl	zx_printf(PLT)
	ldrb	ip, [fp, #-21]	@ zero_extendqisi2
	sub	r3, fp, #56
	sub	r2, fp, #51
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L59
	ldr	ip, [fp, #-56]
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L64+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-60]
	mov	r3, ip
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-20]
	mvn	r2, #34
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	sub	r2, fp, #51
	mov	r0, #1
	ldr	r3, .L64+12
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L61
.L59:
	mov	r0, #1
	ldr	r3, .L64+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-20]
	bl	zx_printf(PLT)
.L61:
	ldr	r3, [fp, #-56]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L65:
	.align	2
.L64:
	.word	_GLOBAL_OFFSET_TABLE_-(.L63+8)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.size	ReceiveMessage, .-ReceiveMessage
	.section	.rodata
	.align	2
.LC23:
	.ascii	"MESMESMES1\000"
	.align	2
.LC24:
	.ascii	"MESMESMESMES2\000"
	.align	2
.LC25:
	.ascii	"MESMESMESMESMESMES3\000"
	.align	2
.LC26:
	.ascii	"MESMESMESMESMESMESMESMESMES\000"
	.align	2
.LC27:
	.ascii	"MyTid: %x, MyParentTid: %x\012\000"
	.align	2
.LC28:
	.ascii	"--- oooo -- TASK %d: Finished... \012\015\000"
	.text
	.align	2
	.global	sender_task
	.type	sender_task, %function
sender_task:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L69
.L68:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, #3
	mov	r1, r3
	ldr	r3, .L69+4
	add	r3, sl, r3
	mov	r2, r3
	bl	SendMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, #3
	mov	r1, r3
	ldr	r3, .L69+8
	add	r3, sl, r3
	mov	r2, r3
	bl	SendMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, #3
	mov	r1, r3
	ldr	r3, .L69+12
	add	r3, sl, r3
	mov	r2, r3
	bl	SendMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, #3
	mov	r1, r3
	ldr	r3, .L69+16
	add	r3, sl, r3
	mov	r2, r3
	bl	SendMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L69+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	zx_printf(PLT)
	bl	MyTid(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L69+24
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L70:
	.align	2
.L69:
	.word	_GLOBAL_OFFSET_TABLE_-(.L68+8)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.size	sender_task, .-sender_task
	.section	.rodata
	.align	2
.LC29:
	.ascii	"REPLY1\000"
	.align	2
.LC30:
	.ascii	"REPLY 2\000"
	.align	2
.LC31:
	.ascii	"REPLY  3\000"
	.align	2
.LC32:
	.ascii	"REPLY   4\000"
	.text
	.align	2
	.global	receiver_task
	.type	receiver_task, %function
receiver_task:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L74
.L73:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	ReceiveMessage(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	MyTid(PLT)
	mov	r3, r0
	ldr	r0, [fp, #-20]
	mov	r1, r3
	ldr	r3, .L74+4
	add	r3, sl, r3
	mov	r2, r3
	bl	ReplyMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	ReceiveMessage(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	MyTid(PLT)
	mov	r3, r0
	ldr	r0, [fp, #-20]
	mov	r1, r3
	ldr	r3, .L74+8
	add	r3, sl, r3
	mov	r2, r3
	bl	ReplyMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	ReceiveMessage(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	MyTid(PLT)
	mov	r3, r0
	ldr	r0, [fp, #-20]
	mov	r1, r3
	ldr	r3, .L74+12
	add	r3, sl, r3
	mov	r2, r3
	bl	ReplyMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	ReceiveMessage(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	MyTid(PLT)
	mov	r3, r0
	ldr	r0, [fp, #-20]
	mov	r1, r3
	ldr	r3, .L74+16
	add	r3, sl, r3
	mov	r2, r3
	bl	ReplyMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	ReceiveMessage(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	MyTid(PLT)
	mov	r3, r0
	ldr	r0, [fp, #-20]
	mov	r1, r3
	ldr	r3, .L74+4
	add	r3, sl, r3
	mov	r2, r3
	bl	ReplyMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	ReceiveMessage(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	MyTid(PLT)
	mov	r3, r0
	ldr	r0, [fp, #-20]
	mov	r1, r3
	ldr	r3, .L74+8
	add	r3, sl, r3
	mov	r2, r3
	bl	ReplyMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	ReceiveMessage(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	MyTid(PLT)
	mov	r3, r0
	ldr	r0, [fp, #-20]
	mov	r1, r3
	ldr	r3, .L74+12
	add	r3, sl, r3
	mov	r2, r3
	bl	ReplyMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	ReceiveMessage(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	MyTid(PLT)
	mov	r3, r0
	ldr	r0, [fp, #-20]
	mov	r1, r3
	ldr	r3, .L74+16
	add	r3, sl, r3
	mov	r2, r3
	bl	ReplyMessageTo(PLT)
	bl	MyTid(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L74+20
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L75:
	.align	2
.L74:
	.word	_GLOBAL_OFFSET_TABLE_-(.L73+8)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC28(GOTOFF)
	.size	receiver_task, .-receiver_task
	.section	.rodata
	.align	2
.LC33:
	.ascii	"Created Name Server: %x\012\000"
	.text
	.align	2
	.global	test4
	.type	test4, %function
test4:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L79
.L78:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L79+4
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #22
	ldr	r3, .L79+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L79+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	zx_printf(PLT)
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L80:
	.align	2
.L79:
	.word	_GLOBAL_OFFSET_TABLE_-(.L78+8)
	.word	.LC8(GOTOFF)
	.word	nameserver_task(GOT)
	.word	.LC33(GOTOFF)
	.size	test4, .-test4
	.section	.rodata
	.align	2
.LC34:
	.ascii	"nameserver: Root Node : %x; Root Node ->left :%x; R"
	.ascii	"oot Node ->right :%x \012\000"
	.align	2
.LC35:
	.ascii	"nameserver: Registering as 12345\012\000"
	.align	2
.LC36:
	.ascii	"12345\000"
	.align	2
.LC37:
	.ascii	"nameserver: Who is 12345\012\000"
	.align	2
.LC38:
	.ascii	"nameserver: 12345 : %d\012\000"
	.align	2
.LC39:
	.ascii	"nameserver: Registering as 123456\012\000"
	.align	2
.LC40:
	.ascii	"123456\000"
	.align	2
.LC41:
	.ascii	"nameserver: Who is 123456\012\000"
	.align	2
.LC42:
	.ascii	"nameserver: 123456 : %d\012\000"
	.align	2
.LC43:
	.ascii	"nameserver: Registering as 1234\012\000"
	.align	2
.LC44:
	.ascii	"1234\000"
	.align	2
.LC45:
	.ascii	"nameserver: Who is 1234\012\000"
	.align	2
.LC46:
	.ascii	"nameserver: 1234 : %d\012\000"
	.align	2
.LC47:
	.ascii	"nameserver: Traversing Tree\012\000"
	.align	2
.LC48:
	.ascii	"nameserver: Freeing Tree\012\000"
	.text
	.align	2
	.global	nameserver_task
	.type	nameserver_task, %function
nameserver_task:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	sl, .L84
.L83:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	mov	ip, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L84+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L84+8
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	sub	r3, fp, #34
	mov	r0, r3
	ldr	r3, .L84+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #6
	bl	zx_memcpy(PLT)
	sub	r3, fp, #40
	sub	r2, fp, #34
	mov	r0, r3
	mov	r1, r2
	mov	r2, #444
	bl	zx_bst_add_by_name(PLT)
	ldr	r3, [fp, #-40]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	mov	ip, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L84+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L84+16
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r2, [fp, #-40]
	sub	r3, fp, #34
	mov	r0, r3
	mov	r1, r2
	bl	zx_bst_get_by_name(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L84+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-40]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	mov	ip, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L84+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L84+24
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	sub	r3, fp, #34
	mov	r0, r3
	ldr	r3, .L84+28
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #7
	bl	zx_memcpy(PLT)
	sub	r3, fp, #40
	sub	r2, fp, #34
	mov	r0, r3
	mov	r1, r2
	ldr	r2, .L84+32
	bl	zx_bst_add_by_name(PLT)
	ldr	r3, [fp, #-40]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	mov	ip, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L84+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L84+36
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r2, [fp, #-40]
	sub	r3, fp, #34
	mov	r0, r3
	mov	r1, r2
	bl	zx_bst_get_by_name(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L84+40
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-40]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	mov	ip, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L84+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L84+44
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	sub	r3, fp, #34
	mov	r0, r3
	ldr	r3, .L84+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #5
	bl	zx_memcpy(PLT)
	sub	r3, fp, #40
	sub	r2, fp, #34
	mov	r0, r3
	mov	r1, r2
	ldr	r2, .L84+52
	bl	zx_bst_add_by_name(PLT)
	ldr	r3, [fp, #-40]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	mov	ip, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L84+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L84+56
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r2, [fp, #-40]
	sub	r3, fp, #34
	mov	r0, r3
	mov	r1, r2
	bl	zx_bst_get_by_name(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L84+60
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-40]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	mov	ip, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L84+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L84+64
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-40]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	mov	ip, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L84+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-40]
	mov	r0, r3
	bl	debug_bst_traverse_postorder(PLT)
	mov	r0, #1
	ldr	r3, .L84+68
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-40]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	mov	ip, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L84+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	zx_printf(PLT)
	sub	r3, fp, #40
	mov	r0, r3
	bl	Free_bst(PLT)
	bl	debug_walk_heap(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L85:
	.align	2
.L84:
	.word	_GLOBAL_OFFSET_TABLE_-(.L83+8)
	.word	.LC34(GOTOFF)
	.word	.LC35(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	777
	.word	.LC41(GOTOFF)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	555
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC48(GOTOFF)
	.size	nameserver_task, .-nameserver_task
	.section	.rodata
	.align	2
.LC49:
	.ascii	"Testing Heap: %x\012\000"
	.text
	.align	2
	.global	test5
	.type	test5, %function
test5:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L89
.L88:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L89+4
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #22
	ldr	r3, .L89+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L89+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	zx_printf(PLT)
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L90:
	.align	2
.L89:
	.word	_GLOBAL_OFFSET_TABLE_-(.L88+8)
	.word	.LC8(GOTOFF)
	.word	heap_test(GOT)
	.word	.LC49(GOTOFF)
	.size	test5, .-test5
	.section	.rodata
	.align	2
.LC50:
	.ascii	"heap_test: Allocating node\012\000"
	.align	2
.LC51:
	.ascii	"heap_test: Memory_Address = %x\012\000"
	.align	2
.LC52:
	.ascii	"heap_test: Memory_Address mem2= %x\012\000"
	.align	2
.LC53:
	.ascii	"heap_test: Freeing node mem2\012\000"
	.align	2
.LC54:
	.ascii	"heap_test: Freeing node mem3\012\000"
	.align	2
.LC55:
	.ascii	"heap_test: Freeing node mem1\012\000"
	.text
	.align	2
	.global	heap_test
	.type	heap_test, %function
heap_test:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L94
.L93:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L94+4
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	bl	Alloc(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L94+8
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L94+4
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	bl	Alloc(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L94+12
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L94+16
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r0, [fp, #-24]
	bl	Free(PLT)
	mov	r0, #1
	ldr	r3, .L94+4
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	bl	Alloc(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L94+8
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L94+20
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r0, [fp, #-20]
	bl	Free(PLT)
	mov	r0, #1
	ldr	r3, .L94+24
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r0, [fp, #-28]
	bl	Free(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L95:
	.align	2
.L94:
	.word	_GLOBAL_OFFSET_TABLE_-(.L93+8)
	.word	.LC50(GOTOFF)
	.word	.LC51(GOTOFF)
	.word	.LC52(GOTOFF)
	.word	.LC53(GOTOFF)
	.word	.LC54(GOTOFF)
	.word	.LC55(GOTOFF)
	.size	heap_test, .-heap_test
	.section	.rodata
	.align	2
.LC56:
	.ascii	"Priyaa\000"
	.align	2
.LC57:
	.ascii	"Alex\000"
	.text
	.align	2
	.global	ns_test_task
	.type	ns_test_task, %function
ns_test_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L99
.L98:
	add	sl, pc, sl
	ldr	r3, .L99+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	ldr	r3, .L99+8
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L100:
	.align	2
.L99:
	.word	_GLOBAL_OFFSET_TABLE_-(.L98+8)
	.word	.LC56(GOTOFF)
	.word	.LC57(GOTOFF)
	.size	ns_test_task, .-ns_test_task
	.section	.rodata
	.align	2
.LC58:
	.ascii	"Main\000"
	.align	2
.LC59:
	.ascii	"Main task is: %d\012\000"
	.align	2
.LC60:
	.ascii	"Created Task 1: %x\012\000"
	.align	2
.LC61:
	.ascii	"Priyaa is: %d\012\000"
	.align	2
.LC62:
	.ascii	"Alex is: %d\012\000"
	.align	2
.LC63:
	.ascii	"Unknown\000"
	.align	2
.LC64:
	.ascii	"Unknown is: %d\012\000"
	.text
	.align	2
	.global	test_ns
	.type	test_ns, %function
test_ns:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L104
.L103:
	add	sl, pc, sl
	mov	r0, #20
	ldr	r3, .L104+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L104+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	zx_printf(PLT)
	ldr	r3, .L104+12
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	ldr	r3, .L104+16
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	ldr	r3, .L104+16
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L104+20
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #19
	ldr	r3, .L104+24
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L104+28
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	zx_printf(PLT)
	ldr	r3, .L104+32
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L104+36
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r3, .L104+40
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L104+44
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r3, .L104+48
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L104+52
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	bl	CloseNameServer(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L105:
	.align	2
.L104:
	.word	_GLOBAL_OFFSET_TABLE_-(.L103+8)
	.word	zx_name_server(GOT)
	.word	.LC33(GOTOFF)
	.word	413628
	.word	.LC58(GOTOFF)
	.word	.LC59(GOTOFF)
	.word	ns_test_task(GOT)
	.word	.LC60(GOTOFF)
	.word	.LC56(GOTOFF)
	.word	.LC61(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	.LC62(GOTOFF)
	.word	.LC63(GOTOFF)
	.word	.LC64(GOTOFF)
	.size	test_ns, .-test_ns
	.align	2
	.global	print_difference
	.type	print_difference, %function
print_difference:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldmfd	sp, {r3, fp, sp, pc}
	.size	print_difference, .-print_difference
	.section	.rodata
	.align	2
.LC65:
	.ascii	"first_task_kernel_3\000"
	.align	2
.LC66:
	.ascii	"%d: Delay %d complete. Delay interval: %d. (Delay t"
	.ascii	"icks total: %d)\012\000"
	.align	2
.LC67:
	.ascii	"%d: Exiting...\012\000"
	.text
	.align	2
	.global	zx_clock_client
	.type	zx_clock_client, %function
zx_clock_client:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	ldr	sl, .L114
.L113:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, .L114+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	sub	r2, fp, #36
	sub	ip, fp, #44
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L109
.L110:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	bl	Delay(PLT)
	ldr	r1, [fp, #-44]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mul	r3, r2, r3
	str	r1, [sp, #0]
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r3, .L114+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L109:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L110
	mov	r0, #1
	ldr	r3, .L114+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	zx_printf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L115:
	.align	2
.L114:
	.word	_GLOBAL_OFFSET_TABLE_-(.L113+8)
	.word	.LC65(GOTOFF)
	.word	.LC66(GOTOFF)
	.word	.LC67(GOTOFF)
	.size	zx_clock_client, .-zx_clock_client
	.section	.rodata
	.align	2
	.type	C.52.1935, %object
	.size	C.52.1935, 16
C.52.1935:
	.word	20
	.word	9
	.word	6
	.word	3
	.align	2
	.type	C.51.1934, %object
	.size	C.51.1934, 16
C.51.1934:
	.word	10
	.word	23
	.word	33
	.word	71
	.align	2
	.type	C.50.1933, %object
	.size	C.50.1933, 16
C.50.1933:
	.word	2
	.word	4
	.word	5
	.word	6
	.align	2
.LC68:
	.ascii	"Hello, world!\012\000"
	.text
	.align	2
	.global	zx_first_user_task_kernel_3
	.type	zx_first_user_task_kernel_3, %function
zx_first_user_task_kernel_3:
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #88
	ldr	sl, .L128
.L127:
	add	sl, pc, sl
	ldr	r3, .L128+4
	ldr	r3, [sl, r3]
	sub	ip, fp, #56
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, .L128+8
	ldr	r3, [sl, r3]
	sub	ip, fp, #72
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, .L128+12
	ldr	r3, [sl, r3]
	sub	ip, fp, #88
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r0, #1
	ldr	r3, .L128+16
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	bl	CreateNameServer(PLT)
	bl	CreateClockServer(PLT)
	ldr	r3, .L128+20
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L117
.L118:
	ldr	r4, [fp, #-24]
	ldr	r3, [fp, #-24]
	mvn	r2, #35
	mov	r3, r3, asl #2
	sub	r0, fp, #20
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L128+24
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r1, r0
	mvn	r2, #19
	mov	r3, r4, asl #2
	sub	r0, fp, #20
	add	r3, r3, r0
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L117:
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	ble	.L118
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L120
.L121:
	sub	r3, fp, #92
	sub	r2, fp, #100
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L120:
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	ble	.L121
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L123
.L124:
	ldr	r3, [fp, #-24]
	mvn	r2, #51
	mov	r3, r3, asl #2
	sub	r1, fp, #20
	add	r3, r3, r1
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-24]
	mvn	r2, #67
	mov	r3, r3, asl #2
	sub	r0, fp, #20
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-24]
	mvn	r2, #19
	mov	r3, r3, asl #2
	sub	r1, fp, #20
	add	r3, r3, r1
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	sub	r2, fp, #108
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L123:
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	ble	.L124
	bl	Exit(PLT)
	sub	sp, fp, #20
	ldmfd	sp, {r4, sl, fp, sp, pc}
.L129:
	.align	2
.L128:
	.word	_GLOBAL_OFFSET_TABLE_-(.L127+8)
	.word	C.50.1933(GOT)
	.word	C.51.1934(GOT)
	.word	C.52.1935(GOT)
	.word	.LC68(GOTOFF)
	.word	.LC65(GOTOFF)
	.word	zx_clock_client(GOT)
	.size	zx_first_user_task_kernel_3, .-zx_first_user_task_kernel_3
	.section	.rodata
	.align	2
.LC69:
	.ascii	"Data: %x\012\000"
	.text
	.align	2
	.global	receive_from_uart1
	.type	receive_from_uart1, %function
receive_from_uart1:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L134
.L133:
	add	sl, pc, sl
.L131:
	mov	r0, #0
	bl	GetC(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r3, .L134+4
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L131
.L135:
	.align	2
.L134:
	.word	_GLOBAL_OFFSET_TABLE_-(.L133+8)
	.word	.LC69(GOTOFF)
	.size	receive_from_uart1, .-receive_from_uart1
	.section	.rodata
	.align	2
.LC70:
	.ascii	"Start\000"
	.align	2
.LC71:
	.ascii	"Hello!\000"
	.align	2
.LC72:
	.ascii	"World!\000"
	.align	2
.LC73:
	.ascii	"Sensor query\000"
	.align	2
.LC74:
	.ascii	"Train query\000"
	.text
	.align	2
	.global	zx_first_user_task_kernel_4
	.type	zx_first_user_task_kernel_4, %function
zx_first_user_task_kernel_4:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L140
.L139:
	add	sl, pc, sl
	bl	CreateNameServer(PLT)
	bl	CreateUARTServers(PLT)
	bl	CreateClockServer(PLT)
	mov	r0, #1
	ldr	r3, .L140+4
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #19
	ldr	r3, .L140+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #1
	ldr	r3, .L140+12
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L140+16
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L140+20
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mvn	r3, #122
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #0
	mov	r1, r3
	bl	PutC(PLT)
	mov	r0, #1
	ldr	r3, .L140+24
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r3, #10
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #0
	mov	r1, r3
	bl	PutC(PLT)
	mov	r3, #45
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #0
	mov	r1, r3
	bl	PutC(PLT)
	mov	r3, #10
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #0
	mov	r1, r3
	bl	PutC(PLT)
	mov	r3, #44
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #0
	mov	r1, r3
	bl	PutC(PLT)
.L137:
	b	.L137
.L141:
	.align	2
.L140:
	.word	_GLOBAL_OFFSET_TABLE_-(.L139+8)
	.word	.LC70(GOTOFF)
	.word	receive_from_uart1(GOT)
	.word	.LC71(GOTOFF)
	.word	.LC72(GOTOFF)
	.word	.LC73(GOTOFF)
	.word	.LC74(GOTOFF)
	.size	zx_first_user_task_kernel_4, .-zx_first_user_task_kernel_4
	.align	2
	.global	zx_first_user_task_kernel_4_new
	.type	zx_first_user_task_kernel_4_new, %function
zx_first_user_task_kernel_4_new:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	bl	CreateNameServer(PLT)
	bl	CreateUARTServers(PLT)
	bl	CreateClockServer(PLT)
	ldmfd	sp, {fp, sp, pc}
	.size	zx_first_user_task_kernel_4_new, .-zx_first_user_task_kernel_4_new
	.align	2
	.global	zx_first_user_task_kernel_4_a0
	.type	zx_first_user_task_kernel_4_a0, %function
zx_first_user_task_kernel_4_a0:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L147
.L146:
	add	sl, pc, sl
	bl	CreateClockServer(PLT)
	bl	CreateNameServer(PLT)
	bl	CreateUARTServers(PLT)
	mov	r0, #19
	ldr	r3, .L147+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L148:
	.align	2
.L147:
	.word	_GLOBAL_OFFSET_TABLE_-(.L146+8)
	.word	zx_train_controller_task(GOT)
	.size	zx_first_user_task_kernel_4_a0, .-zx_first_user_task_kernel_4_a0
	.section	.rodata
	.align	2
	.type	C.58.1978, %object
	.size	C.58.1978, 12
C.58.1978:
	.space	12
	.align	2
.LC75:
	.ascii	"Reading queue after insert: %d\012\000"
	.align	2
.LC76:
	.ascii	"Error: Queue Full\012\000"
	.align	2
.LC77:
	.ascii	"Queue not full: errno: %d\012\000"
	.align	2
.LC78:
	.ascii	"Data read from queue: %d\012\000"
	.align	2
.LC79:
	.ascii	"Data not read from queue: errno: %d\012\000"
	.align	2
.LC80:
	.ascii	"Error: Queue Empty\012\000"
	.align	2
.LC81:
	.ascii	"Reading queue after insert: %c\012\000"
	.align	2
.LC82:
	.ascii	"Data read from queue: %c\012\000"
	.text
	.align	2
	.global	zx_first_user_task_queue_test
	.type	zx_first_user_task_queue_test, %function
zx_first_user_task_queue_test:
	@ args = 0, pretend = 0, frame = 100
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #100
	ldr	sl, .L195
.L194:
	add	sl, pc, sl
	sub	r3, fp, #56
	str	r3, [fp, #-60]
	sub	r3, fp, #88
	str	r3, [fp, #-92]
	ldr	r3, .L195+4
	ldr	r3, [sl, r3]
	sub	ip, fp, #104
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	sub	r3, fp, #60
	sub	r2, fp, #104
	mov	r0, r3
	mov	r1, r2
	mov	r2, #4
	mov	r3, #3
	bl	zx_queue_initialize(PLT)
	sub	r3, fp, #112
	str	r3, [fp, #-28]
	mov	r3, #1
	str	r3, [fp, #-112]
	sub	r3, fp, #60
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-104]
	mov	r0, #1
	ldr	r3, .L195+8
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r3, #2
	str	r3, [fp, #-112]
	sub	r3, fp, #60
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-100]
	mov	r0, #1
	ldr	r3, .L195+8
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r3, #3
	str	r3, [fp, #-112]
	sub	r3, fp, #60
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-96]
	mov	r0, #1
	ldr	r3, .L195+8
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r3, #4
	str	r3, [fp, #-112]
	sub	r3, fp, #60
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	bne	.L150
	mov	r0, #1
	ldr	r3, .L195+12
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L152
.L150:
	mov	r0, #1
	ldr	r3, .L195+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	zx_printf(PLT)
.L152:
	sub	r3, fp, #60
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L153
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L195+20
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L155
.L153:
	mov	r0, #1
	ldr	r3, .L195+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	zx_printf(PLT)
.L155:
	sub	r3, fp, #60
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L156
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L195+20
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L158
.L156:
	mov	r0, #1
	ldr	r3, .L195+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	zx_printf(PLT)
.L158:
	sub	r3, fp, #60
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L159
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L195+20
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L161
.L159:
	mov	r0, #1
	ldr	r3, .L195+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	zx_printf(PLT)
.L161:
	sub	r3, fp, #60
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	bne	.L162
	mov	r0, #1
	ldr	r3, .L195+28
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L164
.L162:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L195+20
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
.L164:
	sub	r3, fp, #92
	sub	r2, fp, #106
	mov	r0, r3
	mov	r1, r2
	mov	r2, #1
	mov	r3, #2
	bl	zx_queue_initialize(PLT)
	sub	r3, fp, #113
	str	r3, [fp, #-20]
	mov	r3, #65
	strb	r3, [fp, #-113]
	sub	r3, fp, #92
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	beq	.L165
	ldrb	r3, [fp, #-106]	@ zero_extendqisi2
	mov	r2, r3
	mov	r0, #1
	ldr	r3, .L195+32
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L167
.L165:
	mov	r0, #1
	ldr	r3, .L195+12
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
.L167:
	mov	r3, #66
	strb	r3, [fp, #-113]
	sub	r3, fp, #92
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	beq	.L168
	ldrb	r3, [fp, #-105]	@ zero_extendqisi2
	mov	r2, r3
	mov	r0, #1
	ldr	r3, .L195+32
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L170
.L168:
	mov	r0, #1
	ldr	r3, .L195+12
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
.L170:
	mov	r3, #67
	strb	r3, [fp, #-113]
	sub	r3, fp, #92
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	beq	.L171
	ldrb	r3, [fp, #-104]	@ zero_extendqisi2
	mov	r2, r3
	mov	r0, #1
	ldr	r3, .L195+32
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L173
.L171:
	mov	r0, #1
	ldr	r3, .L195+12
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
.L173:
	mov	r3, #4
	strb	r3, [fp, #-113]
	sub	r3, fp, #92
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	zx_queue_insert(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	beq	.L174
	ldrb	r3, [fp, #-103]	@ zero_extendqisi2
	mov	r2, r3
	mov	r0, #1
	ldr	r3, .L195+32
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L176
.L174:
	mov	r0, #1
	ldr	r3, .L195+12
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
.L176:
	sub	r3, fp, #92
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L177
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	mov	r0, #1
	ldr	r3, .L195+36
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L179
.L177:
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	bne	.L179
	mov	r0, #1
	ldr	r3, .L195+28
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
.L179:
	sub	r3, fp, #92
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L181
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	mov	r0, #1
	ldr	r3, .L195+36
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L183
.L181:
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	bne	.L183
	mov	r0, #1
	ldr	r3, .L195+28
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
.L183:
	sub	r3, fp, #92
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L185
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	mov	r0, #1
	ldr	r3, .L195+36
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L187
.L185:
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	bne	.L187
	mov	r0, #1
	ldr	r3, .L195+28
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
.L187:
	sub	r3, fp, #92
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	zx_queue_remove(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L189
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	mov	r0, #1
	ldr	r3, .L195+36
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	b	.L191
.L189:
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	bne	.L191
	mov	r0, #1
	ldr	r3, .L195+28
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
.L191:
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L196:
	.align	2
.L195:
	.word	_GLOBAL_OFFSET_TABLE_-(.L194+8)
	.word	C.58.1978(GOT)
	.word	.LC75(GOTOFF)
	.word	.LC76(GOTOFF)
	.word	.LC77(GOTOFF)
	.word	.LC78(GOTOFF)
	.word	.LC79(GOTOFF)
	.word	.LC80(GOTOFF)
	.word	.LC81(GOTOFF)
	.word	.LC82(GOTOFF)
	.size	zx_first_user_task_queue_test, .-zx_first_user_task_queue_test
	.ident	"GCC: (GNU) 4.0.2"
