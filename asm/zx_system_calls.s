	.file	"zx_system_calls.c"
	.text
	.align	2
	.global	Create
	.type	Create, %function
Create:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	swi #1 
	
	mov r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	Create, .-Create
	.align	2
	.global	Pass
	.type	Pass, %function
Pass:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	swi #2 
	
	ldmfd	sp, {fp, sp, pc}
	.size	Pass, .-Pass
	.align	2
	.global	Exit
	.type	Exit, %function
Exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	swi #3 
	
	ldmfd	sp, {fp, sp, pc}
	.size	Exit, .-Exit
	.align	2
	.global	MyTid
	.type	MyTid, %function
MyTid:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	swi #4 
	
	mov r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	MyTid, .-MyTid
	.align	2
	.global	MyParentTid
	.type	MyParentTid, %function
MyParentTid:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	swi #5 
	
	mov r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	MyParentTid, .-MyParentTid
	.align	2
	.global	Send
	.type	Send, %function
Send:
	@ args = 4, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	str	r3, [fp, #-32]
	swi #6 
	
	mov r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	Send, .-Send
	.align	2
	.global	Receive
	.type	Receive, %function
Receive:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	swi #7 
	
	mov r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	Receive, .-Receive
	.align	2
	.global	Reply
	.type	Reply, %function
Reply:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	swi #8 
	
	mov r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	Reply, .-Reply
	.align	2
	.global	Alloc
	.type	Alloc, %function
Alloc:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	swi #9 
	
	mov r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	Alloc, .-Alloc
	.align	2
	.global	Free
	.type	Free, %function
Free:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	swi #10 
	
	ldmfd	sp, {fp, sp, pc}
	.size	Free, .-Free
	.align	2
	.global	AwaitEvent
	.type	AwaitEvent, %function
AwaitEvent:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	swi #11 
	
	mov r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	AwaitEvent, .-AwaitEvent
	.align	2
	.global	Delay
	.type	Delay, %function
Delay:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-44]
	ldr	r3, .L30
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	sub	r2, fp, #32
	sub	ip, fp, #40
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L24
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-48]
	b	.L26
.L24:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r3, #12
	bne	.L27
	mvn	r3, #1
	str	r3, [fp, #-16]
.L27:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-48]
.L26:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L31:
	.align	2
.L30:
	.word	413660
	.size	Delay, .-Delay
	.align	2
	.global	Time
	.type	Time, %function
Time:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	ldr	r3, .L39
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	mov	r3, #3
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	sub	r2, fp, #32
	sub	ip, fp, #40
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L33
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-44]
	b	.L35
.L33:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r3, #12
	bne	.L36
	mvn	r3, #1
	str	r3, [fp, #-16]
.L36:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-44]
.L35:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	413660
	.size	Time, .-Time
	.align	2
	.global	DelayUntil
	.type	DelayUntil, %function
DelayUntil:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-44]
	ldr	r3, .L48
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	mov	r3, #2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	sub	r2, fp, #32
	sub	ip, fp, #40
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L42
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-48]
	b	.L44
.L42:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r3, #12
	bne	.L45
	mvn	r3, #1
	str	r3, [fp, #-16]
.L45:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-48]
.L44:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L49:
	.align	2
.L48:
	.word	413660
	.size	DelayUntil, .-DelayUntil
	.align	2
	.global	WhoIs
	.type	WhoIs, %function
WhoIs:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-48]
	ldr	r3, .L52
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-24]
	sub	r2, fp, #32
	sub	ip, fp, #44
	mov	r3, #12
	str	r3, [sp, #0]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, #12
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L53:
	.align	2
.L52:
	.word	413628
	.size	WhoIs, .-WhoIs
	.align	2
	.global	RegisterAs
	.type	RegisterAs, %function
RegisterAs:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-48]
	ldr	r3, .L56
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-24]
	sub	r2, fp, #32
	sub	ip, fp, #44
	mov	r3, #12
	str	r3, [sp, #0]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, #12
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L57:
	.align	2
.L56:
	.word	413628
	.size	RegisterAs, .-RegisterAs
	.align	2
	.global	GetC
	.type	GetC, %function
GetC:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #44
	str	r0, [fp, #-44]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	beq	.L60
	ldr	r3, [fp, #-52]
	cmp	r3, #1
	beq	.L61
	b	.L59
.L60:
	ldr	r3, .L72
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L62
.L61:
	ldr	r3, .L72+4
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-32]
	b	.L62
.L59:
	mvn	r3, #0
	str	r3, [fp, #-48]
	b	.L63
.L62:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	sub	r2, fp, #32
	sub	ip, fp, #40
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L64
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-48]
	b	.L63
.L64:
	ldr	r3, [fp, #-40]
	cmp	r3, #12
	bne	.L66
	mvn	r3, #1
	str	r3, [fp, #-48]
	b	.L63
.L66:
	ldr	r2, [fp, #-36]
	ldr	r3, .L72+8
	cmp	r2, r3
	bne	.L68
	mvn	r3, #3
	str	r3, [fp, #-16]
	b	.L70
.L68:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
.L70:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-48]
.L63:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L73:
	.align	2
.L72:
	.word	413668
	.word	413676
	.word	257
	.size	GetC, .-GetC
	.align	2
	.global	PutC
	.type	PutC, %function
PutC:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	str	r0, [fp, #-44]
	mov	r3, r1
	strb	r3, [fp, #-48]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L76
	ldr	r3, [fp, #-56]
	cmp	r3, #1
	beq	.L77
	b	.L75
.L76:
	ldr	r3, .L85
	str	r3, [fp, #-24]
	mov	r3, #2
	str	r3, [fp, #-32]
	b	.L78
.L77:
	ldr	r3, .L85+4
	str	r3, [fp, #-24]
	mov	r3, #4
	str	r3, [fp, #-32]
	b	.L78
.L75:
	mvn	r3, #0
	str	r3, [fp, #-52]
	b	.L79
.L78:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-48]	@ zero_extendqisi2
	str	r3, [fp, #-28]
	sub	r2, fp, #32
	sub	ip, fp, #40
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r3, #12
	bne	.L80
	mvn	r3, #1
	str	r3, [fp, #-52]
	b	.L79
.L80:
	ldr	r2, [fp, #-36]
	ldr	r3, .L85+8
	cmp	r2, r3
	bne	.L82
	mvn	r3, #3
	str	r3, [fp, #-16]
.L82:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-52]
.L79:
	ldr	r3, [fp, #-52]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L86:
	.align	2
.L85:
	.word	413664
	.word	413672
	.word	257
	.size	PutC, .-PutC
	.align	2
	.global	CreateNameServer
	.type	CreateNameServer, %function
CreateNameServer:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L90
.L89:
	add	sl, pc, sl
	mov	r0, #10
	ldr	r3, .L90+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, .L90+8
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L91:
	.align	2
.L90:
	.word	_GLOBAL_OFFSET_TABLE_-(.L89+8)
	.word	zx_name_server(GOT)
	.word	413628
	.size	CreateNameServer, .-CreateNameServer
	.align	2
	.global	CloseNameServer
	.type	CloseNameServer, %function
CloseNameServer:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	ldr	r3, .L94
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #4
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-24]
	sub	r2, fp, #32
	sub	ip, fp, #44
	mov	r3, #12
	str	r3, [sp, #0]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, #12
	mov	r3, ip
	bl	Send(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L95:
	.align	2
.L94:
	.word	413628
	.size	CloseNameServer, .-CloseNameServer
	.align	2
	.global	CreateClockServer
	.type	CreateClockServer, %function
CreateClockServer:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L99
.L98:
	add	sl, pc, sl
	mov	r0, #3
	ldr	r3, .L99+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, .L99+8
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L100:
	.align	2
.L99:
	.word	_GLOBAL_OFFSET_TABLE_-(.L98+8)
	.word	zx_clock_server(GOT)
	.word	413660
	.size	CreateClockServer, .-CreateClockServer
	.align	2
	.global	CloseClockServer
	.type	CloseClockServer, %function
CloseClockServer:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	r3, .L103
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r3, #4
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	sub	r2, fp, #28
	sub	ip, fp, #36
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L104:
	.align	2
.L103:
	.word	413660
	.size	CloseClockServer, .-CloseClockServer
	.align	2
	.global	CreateUARTServers
	.type	CreateUARTServers, %function
CreateUARTServers:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L108
.L107:
	add	sl, pc, sl
	mov	r0, #5
	ldr	r3, .L108+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, .L108+8
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	mov	r0, #7
	ldr	r3, .L108+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, .L108+16
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	mov	r0, #1
	ldr	r3, .L108+20
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, .L108+24
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	mov	r0, #1
	ldr	r3, .L108+28
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, .L108+32
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L109:
	.align	2
.L108:
	.word	_GLOBAL_OFFSET_TABLE_-(.L107+8)
	.word	zx_uart2_tx_server(GOT)
	.word	413672
	.word	zx_uart2_rx_server(GOT)
	.word	413676
	.word	zx_uart1_tx_server(GOT)
	.word	413664
	.word	zx_uart1_rx_server(GOT)
	.word	413668
	.size	CreateUARTServers, .-CreateUARTServers
	.align	2
	.global	CloseUARTServers
	.type	CloseUARTServers, %function
CloseUARTServers:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	mov	r3, #5
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, .L112
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	sub	r1, fp, #36
	sub	ip, fp, #44
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r2, [fp, #-28]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L112+4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #0]
	sub	r1, fp, #36
	sub	ip, fp, #44
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r2, [fp, #-24]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L112+8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	sub	r1, fp, #36
	sub	ip, fp, #44
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L112+12
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	sub	r1, fp, #36
	sub	ip, fp, #44
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L113:
	.align	2
.L112:
	.word	413664
	.word	413668
	.word	413672
	.word	413676
	.size	CloseUARTServers, .-CloseUARTServers
	.global	__udivsi3
	.align	2
	.global	Shutdown
	.type	Shutdown, %function
Shutdown:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	bl	CloseNameServer(PLT)
	bl	CloseClockServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	bl	CloseUARTServers(PLT)
	ldr	r3, .L116
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-28]
	mov	r0, r3
	mov	r1, r2
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, .L116+4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	swi #12 
	
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L117:
	.align	2
.L116:
	.word	413680
	.word	413636
	.size	Shutdown, .-Shutdown
	.align	2
	.global	Kill
	.type	Kill, %function
Kill:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	swi #13 
	
	ldmfd	sp, {r3, fp, sp, pc}
	.size	Kill, .-Kill
	.align	2
	.global	DebugManyArgs
	.type	DebugManyArgs, %function
DebugManyArgs:
	@ args = 12, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	str	r3, [fp, #-32]
	swi #90 
	
	mov r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	DebugManyArgs, .-DebugManyArgs
	.align	2
	.global	PutMultiple
	.type	PutMultiple, %function
PutMultiple:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	str	r0, [fp, #-44]
	str	r1, [fp, #-48]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L124
	ldr	r3, [fp, #-56]
	cmp	r3, #1
	beq	.L125
	b	.L123
.L124:
	ldr	r3, .L131
	str	r3, [fp, #-24]
	mov	r3, #8
	str	r3, [fp, #-32]
	b	.L126
.L125:
	ldr	r3, .L131+4
	str	r3, [fp, #-24]
	mov	r3, #9
	str	r3, [fp, #-32]
	b	.L126
.L123:
	mvn	r3, #0
	str	r3, [fp, #-52]
	b	.L127
.L126:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-28]
	sub	r2, fp, #32
	sub	ip, fp, #40
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r3, #12
	bne	.L128
	mvn	r3, #1
	str	r3, [fp, #-52]
	b	.L127
.L128:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-52]
.L127:
	ldr	r3, [fp, #-52]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L132:
	.align	2
.L131:
	.word	413664
	.word	413672
	.size	PutMultiple, .-PutMultiple
	.ident	"GCC: (GNU) 4.0.2"
