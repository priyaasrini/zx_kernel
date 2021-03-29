	.file	"zx_project_test_functions.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Hello\012\000"
	.align	2
.LC1:
	.ascii	"End1\012\000"
	.align	2
.LC2:
	.ascii	"%s\012\000"
	.align	2
.LC3:
	.ascii	"End2\012\000"
	.align	2
.LC4:
	.ascii	"Reservation Unavailable\000"
	.align	2
.LC5:
	.ascii	"Reservation Available\000"
	.align	2
.LC6:
	.ascii	"Reservation result: %s \012\000"
	.align	2
.LC7:
	.ascii	"===============\012\000"
	.align	2
.LC8:
	.ascii	"\012%s -> %s: offset %d, edge.dist=%d train %d\012\000"
	.align	2
.LC9:
	.ascii	"---End---\012\000"
	.text
	.align	2
	.global	reservation_testing
	.type	reservation_testing, %function
reservation_testing:
	@ args = 0, pretend = 0, frame = 18092
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #17920
	sub	sp, sp, #188
	ldr	sl, .L10
.L9:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L10+4
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	sub	r3, fp, #10944
	sub	r3, r3, #24
	sub	r3, r3, #20
	mov	r0, #66
	mov	r1, r3
	bl	track_init(PLT)
	sub	r3, fp, #11584
	sub	r3, r3, #24
	sub	r3, r3, #8
	mov	r0, r3
	bl	turnout_init(PLT)
	sub	r3, fp, #17920
	sub	r3, r3, #24
	sub	r3, r3, #168
	mov	r0, r3
	mov	r1, #49
	bl	train_init(PLT)
	ldr	r3, .L10+8
	ldr	r2, .L10+12
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L10+8
	ldr	r2, .L10+16
	sub	r1, fp, #24
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #6
	str	r3, [r2, #0]
	sub	r3, fp, #10944
	sub	r3, r3, #24
	sub	r3, r3, #20
	add	r2, r3, #5376
	add	r2, r2, #20
	sub	r3, fp, #17920
	sub	r3, r3, #24
	sub	r3, r3, #168
	sub	ip, fp, #11584
	sub	ip, ip, #24
	sub	ip, ip, #8
	mov	r0, r3
	mov	r1, r2
	mov	r2, #0
	mov	r3, ip
	bl	train_adjust_position_by_sensor_toggle(PLT)
	ldr	r3, .L10+8
	mov	r2, #12
	sub	r4, fp, #24
	add	r3, r4, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	add	r2, r3, #49920
	add	r2, r2, #80
	ldr	r3, .L10+8
	mov	r1, #12
	sub	r5, fp, #24
	add	r3, r5, r3
	add	r3, r3, r1
	str	r2, [r3, #0]
	ldr	r3, .L10+8
	mov	r2, #28
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L10+8
	mov	r2, #32
	sub	r4, fp, #24
	add	r3, r4, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	mov	r3, r2
	mov	r3, r3, asl #25
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r1, r3
	add	r2, r3, #49920
	add	r2, r2, #80
	ldr	r3, .L10+8
	mov	r1, #28
	sub	r5, fp, #24
	add	r3, r5, r3
	add	r3, r3, r1
	str	r2, [r3, #0]
	sub	r3, fp, #10944
	sub	r3, r3, #24
	sub	r3, r3, #20
	add	r2, r3, #5376
	add	r2, r2, #20
	ldr	r3, .L10+8
	mov	r1, #24
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r3, r3, r1
	str	r2, [r3, #0]
	ldr	r3, .L10+8
	mov	r2, #32
	sub	r1, fp, #24
	add	r3, r1, r3
	add	r2, r3, r2
	sub	r3, fp, #10944
	sub	r3, r3, #24
	sub	r3, r3, #20
	add	r3, r3, #5376
	add	r3, r3, #40
	str	r3, [r2, #0]
	ldr	r3, .L10+8
	mov	r2, #16
	sub	r4, fp, #24
	add	r3, r4, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-44]
	ldr	r3, .L10+8
	mov	r2, #32
	sub	r5, fp, #24
	add	r3, r5, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-40]
	mov	r3, #31
	str	r3, [fp, #-36]
	sub	r2, fp, #10944
	sub	r2, r2, #24
	sub	r2, r2, #20
	sub	r3, fp, #17920
	sub	r3, r3, #24
	sub	r3, r3, #168
	add	r3, r3, #576
	str	r3, [sp, #0]
	sub	r3, fp, #17920
	sub	r3, r3, #24
	sub	r3, r3, #168
	add	r3, r3, #1152
	str	r3, [sp, #4]
	sub	r3, fp, #17920
	sub	r3, r3, #24
	sub	r3, r3, #168
	add	r3, r3, #512
	str	r3, [sp, #8]
	sub	r3, fp, #17920
	sub	r3, r3, #24
	sub	r3, r3, #168
	add	r3, r3, #1728
	add	r3, r3, #12
	str	r3, [sp, #12]
	mov	r0, r2
	ldr	r1, [fp, #-44]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-36]
	bl	track_calc_shortest_path_from_two_dest(PLT)
	mov	r0, #1
	ldr	r3, .L10+20
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r3, .L10+8
	mov	r2, #576
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	mov	r0, #1
	ldr	r3, .L10+24
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r3, .L10+8
	mov	r2, #580
	sub	r1, fp, #24
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	mov	r0, #1
	ldr	r3, .L10+24
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r3, .L10+8
	mov	r2, #584
	sub	r4, fp, #24
	add	r3, r4, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	mov	r0, #1
	ldr	r3, .L10+24
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r3, .L10+8
	mov	r2, #588
	sub	r5, fp, #24
	add	r3, r5, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	mov	r0, #1
	ldr	r3, .L10+24
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r3, .L10+8
	mov	r2, #592
	sub	r0, fp, #24
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	mov	r0, #1
	ldr	r3, .L10+24
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	sub	r3, fp, #17920
	sub	r3, r3, #24
	sub	r3, r3, #168
	mov	r0, r3
	mov	r1, #1
	bl	train_next_waypoint(PLT)
	sub	r3, fp, #17920
	sub	r3, r3, #24
	sub	r3, r3, #168
	mov	r0, r3
	mov	r1, #14
	bl	reserve_path(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L10+28
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L2
	ldr	r3, .L10+32
	add	r3, sl, r3
	sub	r1, fp, #16384
	str	r3, [r1, #-1732]
	b	.L4
.L2:
	ldr	r3, .L10+36
	add	r3, sl, r3
	sub	r2, fp, #16384
	str	r3, [r2, #-1732]
.L4:
	mov	r0, #1
	ldr	r3, .L10+40
	add	r3, sl, r3
	mov	r1, r3
	sub	r3, fp, #16384
	ldr	r2, [r3, #-1732]
	bl	zx_printf(PLT)
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L10+44
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L10+44
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #1
	ldr	r3, .L10+44
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L5
.L6:
	ldr	r3, [fp, #-28]
	ldr	r2, .L10+8
	ldr	r1, .L10+48
	mov	r3, r3, asl #2
	sub	r4, fp, #24
	add	r3, r3, r4
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-28]
	ldr	r2, .L10+8
	ldr	r1, .L10+48
	mov	r3, r3, asl #2
	sub	r5, fp, #24
	add	r3, r3, r5
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	ldr	lr, [r3, #4]
	ldr	r3, [fp, #-28]
	ldr	r2, .L10+8
	ldr	r1, .L10+48
	mov	r3, r3, asl #2
	sub	r0, fp, #24
	add	r3, r3, r0
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r0, [r3, #20]
	ldr	r3, [fp, #-28]
	ldr	r2, .L10+8
	ldr	r1, .L10+48
	mov	r3, r3, asl #2
	sub	r4, fp, #24
	add	r3, r3, r4
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r4, [r3, #12]
	ldr	r3, [fp, #-28]
	ldr	r2, .L10+8
	ldr	r1, .L10+48
	mov	r3, r3, asl #2
	sub	r5, fp, #24
	add	r3, r3, r5
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #24]
	str	r0, [sp, #0]
	str	r4, [sp, #4]
	str	r3, [sp, #8]
	mov	r0, #1
	ldr	r3, .L10+52
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, ip
	mov	r3, lr
	bl	zx_printf(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #50
	beq	.L7
.L5:
	ldr	r3, [fp, #-28]
	ldr	r2, .L10+8
	ldr	r1, .L10+48
	mov	r3, r3, asl #2
	sub	r0, fp, #24
	add	r3, r3, r0
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L6
.L7:
	mov	r0, #1
	ldr	r3, .L10+56
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
	mov	r0, #1
	bl	GetC(PLT)
	bl	Shutdown(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, sl, fp, sp, pc}
.L11:
	.align	2
.L10:
	.word	_GLOBAL_OFFSET_TABLE_-(.L9+8)
	.word	.LC0(GOTOFF)
	.word	-18088
	.word	3020
	.word	3016
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	3036
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.size	reservation_testing, .-reservation_testing
	.ident	"GCC: (GNU) 4.0.2"
