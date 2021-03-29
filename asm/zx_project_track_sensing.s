	.file	"zx_project_track_sensing.c"
	.text
	.align	2
	.global	absolute
	.type	absolute, %function
absolute:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L2
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	b	.L4
.L2:
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	str	r3, [fp, #-20]
.L4:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	absolute, .-absolute
	.align	2
	.global	zx_route_task
	.type	zx_route_task, %function
zx_route_task:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #60
	b	.L12
.L7:
.L12:
	sub	r3, fp, #24
	sub	r2, fp, #60
	mov	r0, r3
	mov	r1, r2
	mov	r2, #36
	bl	Receive(PLT)
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	beq	.L9
	b	.L8
.L9:
	ldr	ip, [fp, #-44]
	ldr	lr, [fp, #-56]
	ldr	r4, [fp, #-52]
	ldr	r5, [fp, #-48]
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-40]
	ldr	r0, [fp, #-28]
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	str	r0, [sp, #12]
	mov	r0, ip
	mov	r1, lr
	mov	r2, r4
	mov	r3, r5
	bl	track_calc_shortest_path_from_two_dest(PLT)
	mov	r3, r0
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-24]
	sub	r2, fp, #64
	mov	r0, r3
	mov	r1, r2
	mov	r2, #4
	bl	Reply(PLT)
	b	.L7
.L8:
	ldr	r3, [fp, #-24]
	sub	r2, fp, #64
	mov	r0, r3
	mov	r1, r2
	mov	r2, #4
	bl	Reply(PLT)
	b	.L7
	.size	zx_route_task, .-zx_route_task
	.global	__divsi3
	.global	__udivsi3
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\012\012\012\012\012\012\012\012\012\012\012Exiting"
	.ascii	"...\012\000"
	.align	2
.LC1:
	.ascii	"%s\012\000"
	.align	2
.LC2:
	.ascii	"Stats.\012\000"
	.align	2
.LC3:
	.ascii	"Train %d:\012\000"
	.align	2
.LC4:
	.ascii	"------------\012\000"
	.align	2
.LC5:
	.ascii	"[%d]: %d\012\000"
	.text
	.align	2
	.global	zx_train_controller_task
	.type	zx_train_controller_task, %function
zx_train_controller_task:
	@ args = 0, pretend = 0, frame = 18412
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #18176
	sub	sp, sp, #240
	ldr	sl, .L154
.L153:
	add	sl, pc, sl
	mov	r0, #15
	ldr	r3, .L154+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-172]
	mov	r0, #19
	ldr	r3, .L154+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-168]
	mov	r0, #18
	ldr	r3, .L154+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-164]
	sub	r3, fp, #11136
	sub	r3, r3, #24
	sub	r3, r3, #4
	mov	r0, #66
	mov	r1, r3
	bl	track_init(PLT)
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	mov	r0, r3
	mov	r1, #49
	bl	train_init(PLT)
	ldr	r3, .L154+84
	ldr	r2, .L154+16
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #30
	str	r3, [r2, #0]
	ldr	r3, .L154+84
	ldr	r2, .L154+20
	sub	r1, fp, #24
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #7
	str	r3, [r2, #0]
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, #3248
	mov	r0, r3
	mov	r1, #50
	bl	train_init(PLT)
	ldr	r3, .L154+84
	ldr	r2, .L154+24
	sub	ip, fp, #24
	add	r3, ip, r3
	add	r2, r3, r2
	mov	r3, #30
	str	r3, [r2, #0]
	ldr	r3, .L154+84
	ldr	r2, .L154+28
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #29
	str	r3, [r2, #0]
	bl	ui_print_initial_screen(PLT)
	mov	r3, #0
	str	r3, [fp, #-160]
	b	.L14
.L15:
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	bl	train_ui_print_initial_screen(PLT)
	ldr	r3, [fp, #-160]
	add	r3, r3, #1
	str	r3, [fp, #-160]
.L14:
	ldr	r3, [fp, #-160]
	cmp	r3, #1
	ble	.L15
	mov	r3, #0
	str	r3, [fp, #-160]
	b	.L17
.L18:
	ldr	r4, [fp, #-160]
	mov	r0, #15
	ldr	r3, .L154+32
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r1, r0
	ldr	r3, .L154+36
	sub	ip, fp, #24
	add	r2, ip, r3
	mov	r3, r4, asl #2
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	mov	r0, #3024
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	mov	r1, #1
	bl	train_set_speed(PLT)
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	ldr	r0, .L154+72
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-160]
	add	r3, r3, #1
	str	r3, [fp, #-160]
.L17:
	ldr	r3, [fp, #-160]
	cmp	r3, #1
	ble	.L18
	sub	r3, fp, #11712
	sub	r3, r3, #24
	sub	r3, r3, #56
	mov	r0, r3
	bl	turnout_init(PLT)
	mov	r3, #0
	str	r3, [fp, #-156]
.L20:
	mov	r0, #10
	bl	Delay(PLT)
	mov	r3, r0
	str	r3, [fp, #-144]
	ldr	r3, [fp, #-156]
	cmp	r3, #0
	bne	.L21
	sub	r2, fp, #204
	sub	ip, fp, #220
	mov	r3, #16
	str	r3, [sp, #0]
	ldr	r0, [fp, #-168]
	mov	r1, r2
	mov	r2, #16
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-220]
	cmp	r3, #0
	blt	.L21
	ldr	r3, [fp, #-220]
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-128]
	cmp	r3, #6
	bne	.L24
	mov	r3, #1
	str	r3, [fp, #-156]
	b	.L21
.L24:
	ldr	r3, [fp, #-128]
	cmp	r3, #3
	bne	.L26
	ldr	r3, [fp, #-216]
	cmp	r3, #0
	ble	.L21
	ldr	r3, [fp, #-216]
	cmp	r3, #156
	bgt	.L21
	ldr	r3, [fp, #-212]
	cmp	r3, #67
	bne	.L31
	mov	r3, #1
	str	r3, [fp, #-124]
	b	.L33
.L31:
	mov	r3, #0
	str	r3, [fp, #-124]
.L33:
	ldr	r3, [fp, #-216]
	sub	r2, fp, #11712
	sub	r2, r2, #24
	sub	r2, r2, #56
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-124]
	bl	turnout_toggle(PLT)
	mov	r3, #0
	str	r3, [fp, #-120]
	b	.L34
.L35:
	ldr	r2, [fp, #-120]
	ldr	r1, .L154+84
	ldr	r0, .L154+80
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #1
	beq	.L36
	ldr	r2, [fp, #-120]
	ldr	r1, [fp, #-216]
	ldr	r0, .L154+84
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	add	r3, r3, r1
	ldr	r2, .L154+76
	mov	r3, r3, asl #2
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r0
	add	r2, r3, r2
	ldr	r3, [fp, #-124]
	str	r3, [r2, #0]
.L36:
	ldr	r3, [fp, #-120]
	add	r3, r3, #1
	str	r3, [fp, #-120]
.L34:
	ldr	r3, [fp, #-120]
	cmp	r3, #1
	ble	.L35
	b	.L21
.L26:
	ldr	r3, [fp, #-216]
	str	r3, [fp, #-116]
	ldr	r2, [fp, #-216]
	ldr	r3, .L154+84
	sub	r0, fp, #24
	ldr	r3, [r0, r3]
	cmp	r2, r3
	bne	.L38
	mov	r3, #0
	str	r3, [fp, #-116]
	b	.L40
.L38:
	ldr	r1, [fp, #-216]
	ldr	r3, .L154+84
	mov	r2, #3248
	sub	ip, fp, #24
	add	r3, ip, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r1, r3
	bne	.L40
	mov	r3, #1
	str	r3, [fp, #-116]
.L40:
	ldr	r3, [fp, #-116]
	cmp	r3, #0
	bge	.L42
	ldr	r3, [fp, #-116]
	cmp	r3, #1
	bgt	.L21
.L42:
	ldr	r3, [fp, #-128]
	cmp	r3, #7
	bne	.L44
	ldr	r2, [fp, #-116]
	ldr	r1, .L154+84
	ldr	r0, .L154+80
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, [fp, #-212]
	str	r3, [fp, #-112]
	ldr	r2, [fp, #-116]
	ldr	r1, .L154+84
	mov	r0, #16
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	ldr	r1, [r3, #0]
	ldr	r3, .L154+40
	mov	r2, #4
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r2, [fp, #-116]
	ldr	r1, .L154+84
	mov	r0, #32
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r3, #0]
	ldr	r3, .L154+40
	mov	r2, #8
	sub	ip, fp, #24
	add	r3, ip, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, .L154+40
	mov	r2, #12
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r2, r3, r2
	ldr	r3, [fp, #-112]
	str	r3, [r2, #0]
	ldr	r2, .L154+40
	mov	r3, #1
	sub	r1, fp, #24
	str	r3, [r1, r2]
	ldr	r3, .L154+40
	mov	r2, #16
	sub	ip, fp, #24
	add	r3, ip, r3
	add	r2, r3, r2
	sub	r3, fp, #11136
	sub	r3, r3, #24
	sub	r3, r3, #4
	str	r3, [r2, #0]
	ldr	r2, [fp, #-116]
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r3, #512
	add	r1, r1, r3
	ldr	r3, .L154+40
	mov	r2, #20
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r2, [fp, #-116]
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r3, #576
	add	r1, r1, r3
	ldr	r3, .L154+40
	mov	r2, #24
	sub	ip, fp, #24
	add	r3, ip, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r2, [fp, #-116]
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r3, #1152
	add	r1, r1, r3
	ldr	r3, .L154+40
	mov	r2, #28
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r2, [fp, #-116]
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r3, #1728
	add	r3, r3, #12
	add	r1, r1, r3
	ldr	r3, .L154+40
	mov	r2, #32
	sub	ip, fp, #24
	add	r3, ip, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	sub	r2, fp, #18176
	sub	r2, r2, #24
	sub	r2, r2, #136
	sub	ip, fp, #18176
	sub	ip, ip, #24
	sub	ip, ip, #100
	mov	r3, #4
	str	r3, [sp, #0]
	ldr	r0, [fp, #-164]
	mov	r1, r2
	mov	r2, #36
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, #0
	str	r3, [fp, #-108]
	mov	r3, #0
	str	r3, [fp, #-108]
	b	.L46
.L47:
	ldr	r2, [fp, #-116]
	ldr	r1, [fp, #-108]
	ldr	r0, .L154+84
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	add	r3, r3, r1
	mov	r2, #2368
	mov	r3, r3, asl #2
	sub	r1, fp, #24
	add	r3, r3, r1
	add	r3, r3, r0
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-108]
	add	r3, r3, #1
	str	r3, [fp, #-108]
.L46:
	ldr	r3, [fp, #-108]
	cmp	r3, #156
	ble	.L47
	ldr	r3, .L154+44
	sub	r2, fp, #24
	ldr	r3, [r2, r3]
	cmp	r3, #0
	bne	.L49
	ldr	r2, [fp, #-116]
	ldr	r1, .L154+84
	ldr	r0, .L154+80
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	b	.L21
.L49:
	ldr	r2, [fp, #-116]
	ldr	r1, .L154+84
	ldr	r0, .L154+48
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L154+44
	sub	ip, fp, #24
	ldr	r3, [ip, r3]
	cmp	r3, #2
	bne	.L52
	ldr	r2, [fp, #-116]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	bl	train_reverse(PLT)
.L52:
	ldr	r2, [fp, #-116]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	mov	r1, #1
	bl	train_next_waypoint(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L21
	ldr	r2, [fp, #-116]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	add	r1, r1, r3
	ldr	r2, [fp, #-116]
	ldr	r0, .L154+84
	mov	ip, #500
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	mov	r0, r1
	mov	r1, r3
	bl	train_get_run_speed_from_distance(PLT)
	mov	r3, r0
	str	r3, [fp, #-104]
	ldr	r2, [fp, #-116]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	ldr	r1, [fp, #-104]
	bl	train_set_speed(PLT)
	ldr	r2, [fp, #-116]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	bl	train_update_expected_sensors(PLT)
	ldr	r2, [fp, #-116]
	ldr	r1, .L154+84
	ldr	r0, .L154+72
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	b	.L21
.L44:
	ldr	r3, [fp, #-128]
	cmp	r3, #1
	bne	.L55
	mov	r3, #0
	str	r3, [fp, #-100]
	mov	r3, #0
	str	r3, [fp, #-100]
	b	.L57
.L58:
	ldr	r2, [fp, #-116]
	ldr	r0, [fp, #-100]
	ldr	r3, [fp, #-100]
	ldr	r1, .L154+52
	mov	r3, r3, asl #2
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	ldr	r1, [r3, #0]
	ldr	ip, .L154+84
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	add	r3, r3, r0
	ldr	r2, .L154+76
	mov	r3, r3, asl #2
	sub	r0, fp, #24
	add	r3, r3, r0
	add	r3, r3, ip
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-100]
.L57:
	ldr	r3, [fp, #-100]
	cmp	r3, #156
	ble	.L58
	ldr	r2, [fp, #-116]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	ldr	r2, [fp, #-212]
	mov	r0, r3
	mov	r1, r2
	bl	train_set_speed(PLT)
	ldr	r2, [fp, #-116]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	bl	train_update_expected_sensors(PLT)
	b	.L21
.L55:
	ldr	r3, [fp, #-128]
	cmp	r3, #5
	bne	.L60
	ldr	r2, [fp, #-116]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	mov	r1, #0
	bl	train_set_speed(PLT)
	b	.L21
.L60:
	ldr	r3, [fp, #-128]
	cmp	r3, #2
	bne	.L62
	ldr	r2, [fp, #-116]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	bl	train_reverse(PLT)
	b	.L21
.L62:
	ldr	r3, [fp, #-128]
	cmp	r3, #10
	bne	.L21
	mov	r3, #0
	str	r3, [fp, #-96]
	mov	r3, #0
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	ldr	r2, .L154+56
	sub	r1, fp, #24
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #15
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-96]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	ldr	r0, [fp, #-96]
	ldr	r2, [fp, #-116]
	ldr	r1, .L154+84
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	and	r1, r3, #255
	ldr	r2, .L154+56
	sub	ip, fp, #24
	add	r3, ip, r0
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-96]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	ldr	r2, .L154+56
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-96]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #234
	mov	r0, #0
	mov	r1, r3
	bl	PutMultiple(PLT)
.L21:
	ldr	r3, [fp, #-156]
	cmp	r3, #0
	beq	.L65
	mvn	r3, #0
	str	r3, [fp, #-180]
	b	.L67
.L65:
	mov	r3, #0
	str	r3, [fp, #-180]
.L67:
	sub	r2, fp, #180
	sub	ip, fp, #188
	mov	r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-172]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-156]
	cmp	r3, #0
	bne	.L68
	ldr	r3, [fp, #-184]
	cmn	r3, #1
	beq	.L70
	ldr	r3, [fp, #-188]
	and	r3, r3, #255
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-188]
	mov	r3, r3, asr #8
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-184]
	str	r3, [fp, #-84]
	mov	r3, #0
	str	r3, [fp, #-80]
	mvn	r3, #0
	str	r3, [fp, #-76]
	b	.L152
.L72:
.L152:
	ldr	r3, [fp, #-92]
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	bl	find_next_bit_set(PLT)
	mov	r3, r0
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-80]
	cmn	r3, #1
	beq	.L70
	ldr	r2, [fp, #-88]
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-80]
	sub	r3, r3, #1
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-88]
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #31
	add	r3, r2, r1
	and	r3, r3, #1
	rsb	r3, r1, r3
	cmp	r3, #1
	bne	.L74
	ldr	r3, [fp, #-68]
	add	r3, r3, #8
	str	r3, [fp, #-68]
.L74:
	ldr	r3, [fp, #-72]
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-160]
	b	.L76
.L155:
	.align	2
.L154:
	.word	_GLOBAL_OFFSET_TABLE_-(.L153+8)
	.word	zx_sensor_secretary_task(GOT)
	.word	zx_ui_server_task(GOT)
	.word	zx_route_task(GOT)
	.word	3020
	.word	3016
	.word	6268
	.word	6264
	.word	train_stop_task(GOT)
	.word	-18272
	.word	-18312
	.word	-18276
	.word	2996
	.word	-11768
	.word	-18410
	.word	3004
	.word	3000
	.word	3012
	.word	3028
	.word	1740
	.word	3032
	.word	-18264
.L77:
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	ldr	r0, .L154+72
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L78
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	mov	r1, #0
	bl	train_set_speed(PLT)
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	add	r1, r1, r3
	ldr	r2, [fp, #-76]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	sub	r3, fp, #11136
	sub	r3, r3, #24
	sub	r3, r3, #4
	add	r3, r3, r2
	sub	ip, fp, #11712
	sub	ip, ip, #24
	sub	ip, ip, #56
	mov	r0, r1
	mov	r1, r3
	ldr	r2, [fp, #-84]
	mov	r3, ip
	bl	train_adjust_position_by_sensor_toggle(PLT)
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	mov	r0, #40
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	ldr	r0, .L154+72
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #4
	str	r3, [r2, #0]
	ldr	r0, [fp, #-160]
	ldr	r2, [fp, #-76]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	sub	r1, fp, #11136
	sub	r1, r1, #24
	sub	r1, r1, #4
	add	r1, r1, r3
	ldr	ip, .L154+84
	mov	lr, #316
	mov	r3, r0
	mov	r3, r3, asl #3
	rsb	r3, r0, r3
	mov	r3, r3, asl #2
	add	r3, r3, r0
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r0, fp, #24
	add	r3, r3, r0
	add	r3, r3, ip
	add	r3, r3, lr
	str	r1, [r3, #0]
.L78:
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	ldr	r0, .L154+72
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L80
	mov	r3, #0
	str	r3, [fp, #-64]
	mvn	r3, #0
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-56]
	b	.L82
.L83:
	ldr	r2, [fp, #-160]
	ldr	r1, [fp, #-56]
	ldr	r0, .L154+84
	mov	ip, #316
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r1, r3, asl #2
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r1, r3
	sub	r1, fp, #24
	add	r3, r3, r1
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-76]
	cmp	r2, r3
	bne	.L84
	mov	r3, #1
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-52]
	b	.L86
.L87:
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-160]
	cmp	r2, r3
	beq	.L88
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L90
.L91:
	ldr	r2, [fp, #-52]
	ldr	r1, [fp, #-48]
	ldr	r0, .L154+84
	mov	ip, #316
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r1, r3, asl #2
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r1, r3
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-76]
	cmp	r2, r3
	bne	.L92
	ldr	r2, [fp, #-160]
	ldr	r1, [fp, #-56]
	ldr	r0, .L154+84
	mov	ip, #320
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r1, r3, asl #2
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r1, r3
	sub	r1, fp, #24
	add	r3, r3, r1
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	absolute(PLT)
	mov	r4, r0
	ldr	r2, [fp, #-52]
	ldr	r1, [fp, #-48]
	ldr	r0, .L154+84
	mov	ip, #320
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r1, r3, asl #2
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r1, r3
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	absolute(PLT)
	mov	r3, r0
	cmp	r4, r3
	ble	.L92
	mov	r3, #0
	str	r3, [fp, #-64]
	b	.L88
.L92:
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L90:
	ldr	r3, [fp, #-48]
	cmp	r3, #14
	ble	.L91
.L88:
	ldr	r3, [fp, #-52]
	add	r3, r3, #1
	str	r3, [fp, #-52]
.L86:
	ldr	r3, [fp, #-52]
	cmp	r3, #1
	ble	.L87
	b	.L96
.L84:
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
.L82:
	ldr	r3, [fp, #-56]
	cmp	r3, #14
	ble	.L83
.L96:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L80
	ldr	r2, [fp, #-160]
	ldr	r1, [fp, #-60]
	ldr	r0, .L154+84
	mov	ip, #320
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r1, r3, asl #2
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r1, r3
	sub	r1, fp, #24
	add	r3, r3, r1
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bge	.L98
	ldr	r3, [fp, #-44]
	rsb	r3, r3, #0
	str	r3, [fp, #-44]
.L98:
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	ldr	r0, .L154+60
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	ldr	r3, [fp, #-44]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	add	r1, r1, r3
	ldr	r2, [fp, #-76]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	sub	r3, fp, #11136
	sub	r3, r3, #24
	sub	r3, r3, #4
	add	r3, r3, r2
	sub	ip, fp, #11712
	sub	ip, ip, #24
	sub	ip, ip, #56
	mov	r0, r1
	mov	r1, r3
	ldr	r2, [fp, #-84]
	mov	r3, ip
	bl	train_adjust_position_by_sensor_toggle(PLT)
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	add	r1, r1, r3
	ldr	r2, [fp, #-76]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	sub	r3, fp, #11136
	sub	r3, r3, #24
	sub	r3, r3, #4
	add	r3, r3, r2
	mov	r0, r1
	mov	r1, r3
	ldr	r2, [fp, #-144]
	bl	train_calibrate_velocity(PLT)
	ldr	r0, [fp, #-160]
	ldr	r2, [fp, #-76]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	sub	r1, fp, #11136
	sub	r1, r1, #24
	sub	r1, r1, #4
	add	r1, r1, r3
	ldr	ip, .L154+84
	ldr	lr, .L154+64
	mov	r3, r0
	mov	r3, r3, asl #3
	rsb	r3, r0, r3
	mov	r3, r3, asl #2
	add	r3, r3, r0
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r0, fp, #24
	add	r3, r3, r0
	add	r3, r3, ip
	add	r3, r3, lr
	str	r1, [r3, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	mov	r0, #3008
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	ldr	r3, [fp, #-84]
	str	r3, [r2, #0]
	ldr	r1, [fp, #-160]
	ldr	r2, [fp, #-160]
	ldr	r0, .L154+84
	mov	ip, #52
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r0, [r3, #0]
	ldr	ip, .L154+84
	ldr	lr, .L154+68
	mov	r3, r1
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r1, fp, #24
	add	r3, r3, r1
	add	r3, r3, ip
	add	r3, r3, lr
	str	r0, [r3, #0]
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	bl	train_update_expected_sensors(PLT)
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	ldr	r0, .L154+72
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #4
	bne	.L72
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	mov	r0, #316
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-76]
	cmp	r2, r3
	bne	.L72
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	mov	r1, #0
	bl	train_set_speed(PLT)
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	ldr	r0, .L154+72
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #3
	str	r3, [r2, #0]
	b	.L72
.L80:
	ldr	r3, [fp, #-160]
	add	r3, r3, #1
	str	r3, [fp, #-160]
.L76:
	ldr	r3, [fp, #-160]
	cmp	r3, #1
	ble	.L77
	b	.L72
.L70:
	mov	r3, #0
	str	r3, [fp, #-160]
	b	.L104
.L105:
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	ldr	r0, .L154+72
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L106
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	bl	train_update_velocity_and_offset(PLT)
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	sub	r2, fp, #11712
	sub	r2, r2, #24
	sub	r2, r2, #56
	mov	r0, r3
	ldr	r1, [fp, #-144]
	bl	train_update_vertices_by_distance_traveled(PLT)
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	mov	r0, #16
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	ldr	r0, .L154+80
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bne	.L108
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L108
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-40]
	ldr	r1, [r3, #12]
	ldr	r0, .L154+84
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	add	r3, r3, r1
	mov	r2, #2368
	mov	r3, r3, asl #2
	sub	r1, fp, #24
	add	r3, r3, r1
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L108
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	mov	r0, #16
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	ldr	ip, [r3, #12]
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-40]
	ldr	r1, [r3, #12]
	ldr	r0, .L154+84
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	add	r3, r3, r1
	ldr	r2, .L154+76
	mov	r3, r3, asl #2
	sub	r1, fp, #24
	add	r3, r3, r1
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	sub	r3, fp, #11712
	sub	r3, r3, #24
	sub	r3, r3, #56
	mov	r0, r3
	mov	r1, ip
	bl	turnout_toggle(PLT)
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-40]
	ldr	r1, [r3, #12]
	ldr	r0, .L154+84
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	add	r3, r3, r1
	mov	r2, #2368
	mov	r3, r3, asl #2
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r0
	add	r2, r3, r2
	mov	r3, #1
	str	r3, [r2, #0]
.L108:
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L112
.L113:
	ldr	r2, [fp, #-160]
	ldr	r1, [fp, #-36]
	ldr	r0, .L154+84
	mov	ip, #316
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r1, r3, asl #2
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r1, r3
	sub	r1, fp, #24
	add	r3, r3, r1
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L114
	ldr	r0, [fp, #-160]
	ldr	ip, [fp, #-36]
	ldr	r2, [fp, #-160]
	ldr	r1, [fp, #-36]
	ldr	lr, .L154+84
	mov	r4, #320
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r1, r3, asl #2
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r1, r3
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, lr
	add	r3, r3, r4
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-160]
	ldr	lr, .L154+84
	mov	r4, #36
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, lr
	add	r3, r3, r4
	ldr	r3, [r3, #0]
	rsb	lr, r3, r1
	ldr	r4, .L154+84
	mov	r5, #320
	mov	r3, ip
	mov	r3, r3, asl #1
	add	r3, r3, ip
	mov	r1, r3, asl #2
	mov	r3, r0
	mov	r3, r3, asl #3
	rsb	r3, r0, r3
	mov	r3, r3, asl #2
	add	r3, r3, r0
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	add	r3, r1, r3
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r4
	add	r3, r3, r5
	str	lr, [r3, #0]
.L114:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L112:
	ldr	r3, [fp, #-36]
	cmp	r3, #14
	ble	.L113
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	ldr	r0, .L154+80
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bne	.L117
	ldr	r1, [fp, #-160]
	ldr	r2, [fp, #-160]
	ldr	r0, .L154+84
	mov	ip, #500
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r0, [r3, #0]
	ldr	r2, [fp, #-160]
	ldr	ip, .L154+84
	mov	lr, #36
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, ip
	add	r3, r3, lr
	ldr	r3, [r3, #0]
	rsb	r0, r3, r0
	ldr	ip, .L154+84
	mov	lr, #500
	mov	r3, r1
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r1, fp, #24
	add	r3, r3, r1
	add	r3, r3, ip
	add	r3, r3, lr
	str	r0, [r3, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	mov	r0, #500
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-160]
	ldr	r0, .L154+84
	mov	ip, #504
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	add	r3, r1, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-160]
	ldr	r1, .L154+84
	mov	r0, #52
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L117
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	mov	r0, #3024
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L117
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	mov	r0, #36
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	rsb	ip, r2, r3
	ldr	r1, [fp, #-160]
	ldr	r2, [fp, #-160]
	ldr	r0, .L156+72
	mov	lr, #68
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, lr
	ldr	r0, [r3, #0]
	ldr	lr, .L156+72
	mov	r3, r1
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	add	r3, r3, r0
	mov	r2, #72
	mov	r3, r3, asl #2
	sub	r0, fp, #24
	add	r3, r3, r0
	add	r3, r3, lr
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	ip, r3
	bgt	.L117
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	ldr	r2, .L156
	sub	r1, fp, #24
	add	r2, r1, r2
	str	r3, [r2, #0]
	ldr	r1, [fp, #-160]
	ldr	r2, [fp, #-160]
	ldr	r0, .L156+72
	mov	ip, #68
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r0, [r3, #0]
	ldr	ip, .L156+72
	mov	r3, r1
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	add	r3, r3, r0
	mov	r2, #72
	mov	r3, r3, asl #2
	sub	r0, fp, #24
	add	r3, r3, r0
	add	r3, r3, ip
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	rsb	r1, r2, r3
	ldr	r2, [fp, #-160]
	ldr	r0, .L156+72
	mov	ip, #52
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	mov	r0, r1
	mov	r1, r3
	bl	__divsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L156
	sub	ip, fp, #24
	add	r3, ip, r3
	str	r2, [r3, #4]
	ldr	r3, .L156
	sub	r0, fp, #24
	add	r3, r0, r3
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bgt	.L122
	ldr	r3, .L156
	sub	r1, fp, #24
	add	r2, r1, r3
	mov	r3, #1
	str	r3, [r2, #4]
.L122:
	ldr	r1, [fp, #-160]
	ldr	r3, .L156+36
	sub	ip, fp, #24
	add	r2, ip, r3
	mov	r3, r1, asl #2
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	sub	r2, fp, #18176
	sub	r2, r2, #24
	sub	r2, r2, #160
	sub	ip, fp, #18176
	sub	ip, ip, #24
	sub	ip, ip, #168
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	mov	r0, #3024
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+24
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #3
	str	r3, [r2, #0]
.L117:
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+24
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #2
	beq	.L124
	ldr	r4, [fp, #-160]
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	add	r1, r1, r3
	ldr	r2, [fp, #-160]
	ldr	r0, .L156+72
	mov	ip, #68
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	mov	r0, r1
	mov	r1, r3
	bl	reserve_path(PLT)
	mov	r1, r0
	ldr	r0, .L156+72
	ldr	ip, .L156+4
	mov	r3, r4
	mov	r3, r3, asl #3
	rsb	r3, r4, r3
	mov	r3, r3, asl #2
	add	r3, r3, r4
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	str	r1, [r3, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+4
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L124
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+24
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L124
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	mov	r0, #40
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L124
	ldr	r1, [fp, #-160]
	ldr	r2, [fp, #-160]
	ldr	r0, .L156+72
	mov	ip, #68
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r0, [r3, #0]
	ldr	ip, .L156+72
	ldr	lr, .L156+8
	mov	r3, r1
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r1, fp, #24
	add	r3, r3, r1
	add	r3, r3, ip
	add	r3, r3, lr
	str	r0, [r3, #0]
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	mov	r1, #5
	bl	train_set_speed(PLT)
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+24
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #2
	str	r3, [r2, #0]
.L124:
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+24
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #2
	bne	.L129
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	mov	r0, #40
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #2
	bne	.L129
	ldr	r4, [fp, #-160]
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	add	r1, r1, r3
	ldr	r2, [fp, #-160]
	ldr	r0, .L156+72
	ldr	ip, .L156+8
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	mov	r0, r1
	mov	r1, r3
	bl	reserve_path(PLT)
	mov	r1, r0
	ldr	r0, .L156+72
	ldr	ip, .L156+4
	mov	r3, r4
	mov	r3, r3, asl #3
	rsb	r3, r4, r3
	mov	r3, r3, asl #2
	add	r3, r3, r4
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	str	r1, [r3, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+4
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L132
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	add	r1, r1, r3
	ldr	r2, [fp, #-160]
	ldr	r0, .L156+72
	ldr	ip, .L156+8
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	mov	r0, r1
	mov	r1, r3
	bl	train_set_speed(PLT)
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+24
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	b	.L129
.L132:
	ldr	r4, [fp, #-160]
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	mov	r1, #5
	bl	reserve_path(PLT)
	mov	r1, r0
	ldr	r0, .L156+72
	ldr	ip, .L156+4
	mov	r3, r4
	mov	r3, r3, asl #3
	rsb	r3, r4, r3
	mov	r3, r3, asl #2
	add	r3, r3, r4
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	str	r1, [r3, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+4
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L129
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	mov	r1, #0
	bl	train_set_speed(PLT)
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+24
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #3
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+12
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #2
	str	r3, [r2, #0]
.L129:
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	bl	train_ui_print_data(PLT)
.L106:
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+24
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bne	.L135
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	mov	r0, #40
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L135
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	mov	r0, #3024
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+12
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bne	.L135
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	mov	r1, #0
	bl	train_next_waypoint(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L139
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	bl	train_reverse(PLT)
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+24
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r1, fp, #18176
	sub	r1, r1, #24
	sub	r1, r1, #88
	add	r1, r1, r3
	ldr	r2, [fp, #-160]
	ldr	r0, .L156+72
	mov	ip, #500
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, ip
	ldr	r3, [r3, #0]
	mov	r0, r1
	mov	r1, r3
	bl	train_get_run_speed_from_distance(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	train_set_speed(PLT)
	b	.L135
.L157:
	.align	2
.L156:
	.word	-18336
	.word	3236
	.word	3240
	.word	3244
	.word	2996
	.word	3032
	.word	3028
	.word	413680
	.word	-18352
	.word	-18272
	.word	-18312
	.word	.LC0(GOTOFF)
	.word	-18328
	.word	-18322
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	-18264
	.word	.LC5(GOTOFF)
.L139:
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	mov	r0, #512
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	mov	r0, #576
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	mov	r0, #1152
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+16
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+20
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-160]
	ldr	r1, .L156+72
	ldr	r0, .L156+24
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
.L135:
	ldr	r3, [fp, #-160]
	add	r3, r3, #1
	str	r3, [fp, #-160]
.L104:
	ldr	r3, [fp, #-160]
	cmp	r3, #1
	ble	.L105
	ldr	r3, .L156+28
	str	r3, [fp, #-140]
	ldr	r2, [fp, #-144]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-140]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-136]
	mov	r0, r3
	mov	r1, r2
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-132]
	ldr	r0, [fp, #-144]
	ldr	r1, [fp, #-132]
	bl	ui_print_data(PLT)
	b	.L20
.L68:
	mov	r3, #0
	str	r3, [fp, #-160]
	b	.L142
.L143:
	ldr	r2, [fp, #-160]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #88
	add	r3, r3, r2
	ldr	r2, .L156+32
	sub	ip, fp, #24
	add	r2, ip, r2
	str	r3, [r2, #0]
	ldr	r3, .L156+32
	sub	r0, fp, #24
	add	r2, r0, r3
	mvn	r3, #0
	str	r3, [r2, #4]
	ldr	r1, [fp, #-160]
	ldr	r3, .L156+36
	sub	ip, fp, #24
	add	r2, ip, r3
	mov	r3, r1, asl #2
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	sub	r2, fp, #18176
	sub	r2, r2, #24
	sub	r2, r2, #176
	sub	ip, fp, #18176
	sub	ip, ip, #24
	sub	ip, ip, #184
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-160]
	add	r3, r3, #1
	str	r3, [fp, #-160]
.L142:
	ldr	r3, [fp, #-160]
	cmp	r3, #1
	ble	.L143
	ldr	r2, .L156+40
	mov	r3, #3
	sub	r0, fp, #24
	str	r3, [r0, r2]
	sub	r2, fp, #18176
	sub	r2, r2, #24
	sub	r2, r2, #136
	sub	ip, fp, #18176
	sub	ip, ip, #24
	sub	ip, ip, #100
	mov	r3, #4
	str	r3, [sp, #0]
	ldr	r0, [fp, #-164]
	mov	r1, r2
	mov	r2, #36
	mov	r3, ip
	bl	Send(PLT)
	mov	r0, #1
	ldr	r3, .L156+44
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r2, .L156+48
	mov	r3, #0
	sub	r1, fp, #24
	str	r3, [r1, r2]
	sub	r2, fp, #18176
	sub	r2, r2, #24
	sub	r2, r2, #146
	sub	r3, fp, #18176
	sub	r3, r3, #24
	sub	r3, r3, #152
	mov	r0, r2
	mov	r1, r3
	bl	zx_clear_screen(PLT)
	ldr	r3, .L156+48
	sub	r2, fp, #24
	ldr	r3, [r2, r3]
	ldr	r2, .L156+52
	sub	ip, fp, #24
	add	r3, ip, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	sub	r2, fp, #18176
	sub	r2, r2, #24
	sub	r2, r2, #146
	mov	r0, #1
	ldr	r3, .L156+56
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L156+60
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r3, #0
	str	r3, [fp, #-152]
	b	.L145
.L146:
	ldr	r2, [fp, #-152]
	ldr	r1, .L156+72
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r0, fp, #24
	add	r3, r3, r0
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L156+64
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r2, [fp, #-152]
	ldr	r1, .L156+72
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	sub	r2, fp, #24
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L156+68
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r3, #0
	str	r3, [fp, #-148]
	b	.L147
.L148:
	ldr	r2, [fp, #-152]
	ldr	r1, [fp, #-148]
	ldr	r0, .L156+72
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	add	r3, r3, r1
	mov	r2, #132
	mov	r3, r3, asl #2
	sub	ip, fp, #24
	add	r3, r3, ip
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	ip, [r3, #0]
	mov	r0, #1
	ldr	r3, .L156+76
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-148]
	mov	r3, ip
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-148]
	add	r3, r3, #1
	str	r3, [fp, #-148]
.L147:
	ldr	r3, [fp, #-148]
	cmp	r3, #13
	ble	.L148
	ldr	r3, [fp, #-152]
	add	r3, r3, #1
	str	r3, [fp, #-152]
.L145:
	ldr	r3, [fp, #-152]
	cmp	r3, #1
	ble	.L146
	bl	Shutdown(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, sl, fp, sp, pc}
	.size	zx_train_controller_task, .-zx_train_controller_task
	.section	.rodata
	.align	2
.LC6:
	.ascii	"Started\000"
	.align	2
.LC7:
	.ascii	"\012 Current Velocity | Distance Travelled | State "
	.ascii	"of the Train \000"
	.align	2
.LC8:
	.ascii	"\012 %d               | %d                 | %d    "
	.ascii	"      | %d)\000"
	.text
	.align	2
	.global	acceleration_profile_testing
	.type	acceleration_profile_testing, %function
acceleration_profile_testing:
	@ args = 0, pretend = 0, frame = 17444
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #17408
	sub	sp, sp, #44
	ldr	sl, .L164
.L163:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L164+4
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	sub	r3, fp, #10944
	sub	r3, r3, #16
	sub	r3, r3, #4
	mov	r0, #66
	mov	r1, r3
	bl	track_init(PLT)
	sub	r3, fp, #17408
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	mov	r1, #44
	bl	train_init(PLT)
	sub	r3, fp, #10944
	sub	r3, r3, #16
	sub	r3, r3, #4
	add	r1, r3, #532
	ldr	r3, .L164+8
	mov	r2, #8
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, .L164+8
	mov	r2, #4
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L164+8
	mov	r2, #12
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
	sub	r3, fp, #17408
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	mov	r1, #7
	bl	train_set_speed(PLT)
	sub	r3, fp, #17408
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	mov	r1, #0
	bl	train_set_speed(PLT)
	mov	r0, #1
	ldr	r3, .L164+12
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L159
.L160:
	sub	r3, fp, #17408
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	bl	train_update_velocity_and_offset(PLT)
	ldr	r3, .L164+8
	mov	r2, #12
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L164+8
	mov	r2, #36
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	add	r1, r1, r3
	ldr	r3, .L164+8
	mov	r2, #12
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, .L164+8
	mov	r2, #52
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	ip, [r3, #0]
	ldr	r3, .L164+8
	mov	r2, #12
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	lr, [r3, #0]
	ldr	r3, .L164+8
	mov	r2, #40
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L164+8
	mov	r2, #64
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	str	r1, [sp, #0]
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r3, .L164+16
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, ip
	mov	r3, lr
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L159:
	ldr	r3, [fp, #-20]
	cmp	r3, #99
	ble	.L160
	bl	Shutdown(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L165:
	.align	2
.L164:
	.word	_GLOBAL_OFFSET_TABLE_-(.L163+8)
	.word	.LC6(GOTOFF)
	.word	-17444
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.size	acceleration_profile_testing, .-acceleration_profile_testing
	.ident	"GCC: (GNU) 4.0.2"
