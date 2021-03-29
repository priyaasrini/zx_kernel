	.file	"zx_project_ui.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"===============================================\012"
	.ascii	"\000"
	.align	2
.LC1:
	.ascii	"Train: \000"
	.align	2
.LC2:
	.ascii	"\012\000"
	.align	2
.LC3:
	.ascii	"Head (Mark | off mm):\012\000"
	.align	2
.LC4:
	.ascii	"Tail (Mark | off mm):\012\000"
	.align	2
.LC5:
	.ascii	"Last sensor (ID | error mm):\012\000"
	.align	2
.LC6:
	.ascii	"Direction:\012\000"
	.align	2
.LC7:
	.ascii	"Edges:\012\000"
	.align	2
.LC8:
	.ascii	"Velocity (mm / ticks):\012\000"
	.align	2
.LC9:
	.ascii	"Acceleration state:\012\000"
	.align	2
.LC10:
	.ascii	"Exp. sensors (id | dist mm):\012\000"
	.align	2
.LC11:
	.ascii	"Route waypoints:\012\000"
	.align	2
.LC12:
	.ascii	"Route nodes:\012\000"
	.align	2
.LC13:
	.ascii	"Route edges:\012\000"
	.align	2
.LC14:
	.ascii	"Reservation:\012\000"
	.text
	.align	2
	.global	train_ui_print_initial_screen
	.type	train_ui_print_initial_screen, %function
train_ui_print_initial_screen:
	@ args = 0, pretend = 0, frame = 508
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #508
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	str	r0, [fp, #-524]
	mov	r3, #0
	str	r3, [fp, #-520]
	mov	r3, #0
	str	r3, [fp, #-520]
	ldr	r3, [fp, #-524]
	ldr	r3, [r3, #3016]
	sub	r2, fp, #516
	sub	ip, fp, #520
	mov	r0, r3
	mov	r1, #1
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+8
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-524]
	ldr	r3, [r3, #0]
	sub	r2, fp, #516
	sub	ip, fp, #520
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+16
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+20
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+24
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+28
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+32
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+36
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+40
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+44
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+48
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+52
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+56
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+60
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #516
	sub	ip, fp, #520
	ldr	r3, .L4+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r1, [fp, #-520]
	ldr	r2, .L4+64
	sub	r0, fp, #16
	add	r3, r0, r1
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-520]
	sub	r3, fp, #516
	mov	r0, #1
	mov	r1, r3
	bl	PutMultiple(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	-500
	.size	train_ui_print_initial_screen, .-train_ui_print_initial_screen
	.align	2
	.global	zx_print_error_message
	.type	zx_print_error_message, %function
zx_print_error_message:
	@ args = 0, pretend = 0, frame = 108
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #108
	str	r0, [fp, #-120]
	mov	r3, #0
	str	r3, [fp, #-116]
	mov	r3, #0
	str	r3, [fp, #-116]
	sub	r3, fp, #112
	sub	ip, fp, #116
	mov	r0, #58
	mov	r1, #1
	mov	r2, r3
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	sub	r3, fp, #112
	sub	r2, fp, #116
	mov	r0, r3
	mov	r1, r2
	bl	zx_erase_line(PLT)
	sub	r3, fp, #112
	sub	ip, fp, #116
	mov	r0, #58
	mov	r1, #1
	mov	r2, r3
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	sub	r3, fp, #112
	sub	r2, fp, #116
	ldr	r0, [fp, #-120]
	mov	r1, r3
	bl	zx_put_string(PLT)
	ldr	r1, [fp, #-116]
	mvn	r2, #99
	sub	r0, fp, #12
	add	r3, r0, r1
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-116]
	sub	r3, fp, #112
	mov	r0, #1
	mov	r1, r3
	bl	PutMultiple(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_print_error_message, .-zx_print_error_message
	.section	.rodata
	.align	2
.LC15:
	.ascii	"Command is sucessful\000"
	.text
	.align	2
	.global	zx_print_success_message
	.type	zx_print_success_message, %function
zx_print_success_message:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #104
	ldr	sl, .L11
.L10:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-120]
	mov	r3, #0
	str	r3, [fp, #-120]
	sub	r3, fp, #116
	sub	ip, fp, #120
	mov	r0, #58
	mov	r1, #1
	mov	r2, r3
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	sub	r3, fp, #116
	sub	r2, fp, #120
	mov	r0, r3
	mov	r1, r2
	bl	zx_erase_line(PLT)
	sub	r3, fp, #116
	sub	ip, fp, #120
	mov	r0, #58
	mov	r1, #1
	mov	r2, r3
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	sub	r2, fp, #116
	sub	ip, fp, #120
	ldr	r3, .L11+4
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r1, [fp, #-120]
	mvn	r2, #99
	sub	r0, fp, #16
	add	r3, r0, r1
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-120]
	sub	r3, fp, #116
	mov	r0, #1
	mov	r1, r3
	bl	PutMultiple(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	.LC15(GOTOFF)
	.size	zx_print_success_message, .-zx_print_success_message
	.section	.rodata
	.align	2
.LC16:
	.ascii	" \000"
	.align	2
.LC17:
	.ascii	" [\000"
	.align	2
.LC18:
	.ascii	" => \000"
	.align	2
.LC19:
	.ascii	"]\000"
	.align	2
.LC20:
	.ascii	"         \000"
	.align	2
.LC21:
	.ascii	"]    \000"
	.align	2
.LC22:
	.ascii	"    \000"
	.align	2
.LC23:
	.ascii	"none                 \000"
	.align	2
.LC24:
	.ascii	"Direct  \000"
	.align	2
.LC25:
	.ascii	"Reverse \000"
	.align	2
.LC26:
	.ascii	"[\000"
	.align	2
.LC27:
	.ascii	"] \000"
	.align	2
.LC28:
	.ascii	"                  \000"
	.align	2
.LC29:
	.ascii	" ]    \000"
	.align	2
.LC30:
	.ascii	"Immobile\000"
	.align	2
.LC31:
	.ascii	"Accelerating\000"
	.align	2
.LC32:
	.ascii	"Deccelerating\000"
	.align	2
.LC33:
	.ascii	"Moving uniformly\000"
	.align	2
.LC34:
	.ascii	" ]\000"
	.align	2
.LC35:
	.ascii	"                \000"
	.align	2
.LC36:
	.ascii	": \000"
	.align	2
.LC37:
	.ascii	"mm | \000"
	.align	2
.LC38:
	.ascii	"            \000"
	.align	2
.LC39:
	.ascii	"(\000"
	.align	2
.LC40:
	.ascii	";\000"
	.align	2
.LC41:
	.ascii	")\000"
	.align	2
.LC42:
	.ascii	"                     \000"
	.align	2
.LC43:
	.ascii	"Idle. No route is assigned.                        "
	.ascii	"                                                   "
	.ascii	"             \000"
	.align	2
.LC44:
	.ascii	"Idle. No route is assigned.                        "
	.ascii	"                                                   "
	.ascii	"            \000"
	.align	2
.LC45:
	.ascii	">\000"
	.align	2
.LC46:
	.ascii	"Available \000"
	.align	2
.LC47:
	.ascii	"Not Enough\000"
	.align	2
.LC48:
	.ascii	" -> \000"
	.align	2
.LC49:
	.ascii	" out of \000"
	.text
	.align	2
	.global	train_ui_print_data
	.type	train_ui_print_data, %function
train_ui_print_data:
	@ args = 0, pretend = 0, frame = 912
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #912
	ldr	sl, .L68
.L67:
	add	sl, pc, sl
	str	r0, [fp, #-928]
	mov	r3, #0
	str	r3, [fp, #-924]
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #3016]
	add	r3, r3, #2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #3020]
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-924]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+4
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-928]
	ldr	r1, [r3, #12]
	ldr	r3, .L68+8
	smull	r0, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #16]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+16
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #16]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+20
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+24
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-40]
	add	r3, r3, #2
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #24]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+4
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-928]
	ldr	r1, [r3, #28]
	ldr	r3, .L68+8
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #32]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+16
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #32]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+28
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-40]
	add	r3, r3, #3
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #3000]
	cmp	r3, #0
	beq	.L14
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #3000]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+4
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-928]
	ldr	r1, [r3, #3004]
	ldr	r3, .L68+8
	smull	r0, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+32
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	b	.L16
.L14:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+36
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
.L16:
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #492]
	cmp	r3, #0
	ble	.L17
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+40
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	b	.L19
.L17:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+44
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
.L19:
	ldr	r3, [fp, #-40]
	add	r3, r3, #5
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L20
.L21:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-928]
	mov	r1, #1728
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L22
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+120
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-928]
	mov	r1, #1728
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+16
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-928]
	mov	r1, #1728
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+136
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
.L22:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L20:
	ldr	r3, [fp, #-32]
	cmp	r3, #2
	ble	.L21
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+48
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-40]
	add	r3, r3, #6
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #52]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #68]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+52
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-40]
	add	r3, r3, #7
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	bne	.L25
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+56
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	b	.L27
.L25:
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #40]
	cmp	r3, #1
	bne	.L28
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+60
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	b	.L27
.L28:
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #40]
	cmp	r3, #3
	bne	.L30
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+64
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	b	.L27
.L30:
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #40]
	cmp	r3, #2
	bne	.L27
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+68
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
.L27:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #56]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+72
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+76
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-40]
	add	r3, r3, #8
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L33
.L34:
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-928]
	mov	r0, #316
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L35
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-928]
	mov	r0, #316
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+128
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-928]
	mov	r0, #320
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r1, [r3, #0]
	ldr	r3, .L68+8
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+80
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
.L35:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L33:
	ldr	r3, [fp, #-32]
	cmp	r3, #14
	ble	.L34
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+84
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #2996]
	cmp	r3, #0
	beq	.L38
	ldr	r2, [fp, #-928]
	mov	r3, #0
	str	r3, [r2, #2996]
	ldr	r3, [fp, #-40]
	add	r3, r3, #9
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #512]
	cmp	r3, #0
	beq	.L40
	b	.L42
.L43:
	ldr	r2, [fp, #-28]
	ldr	r1, [fp, #-928]
	mov	r0, #512
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L44
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+88
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r2, [fp, #-28]
	ldr	r1, [fp, #-928]
	mov	r0, #512
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+92
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r2, [fp, #-28]
	ldr	r1, [fp, #-928]
	mov	r0, #516
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+92
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r2, [fp, #-28]
	ldr	r1, [fp, #-928]
	mov	r0, #520
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+96
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L42:
	ldr	r3, [fp, #-28]
	cmp	r3, #4
	ble	.L43
.L44:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+144
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	b	.L46
.L40:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+100
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
.L46:
	ldr	r3, [fp, #-40]
	add	r3, r3, #10
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #576]
	cmp	r3, #0
	beq	.L47
	b	.L49
.L50:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-928]
	mov	r1, #576
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L51
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-928]
	mov	r1, #576
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+4
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L49:
	ldr	r3, [fp, #-24]
	cmp	r3, #143
	ble	.L50
.L51:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+144
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	b	.L53
.L47:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+104
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
.L53:
	ldr	r3, [fp, #-40]
	add	r3, r3, #12
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #1152]
	cmp	r3, #0
	beq	.L54
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L56
.L57:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-928]
	mov	r1, #1152
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L58
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+120
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-928]
	mov	r1, #1152
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+108
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-928]
	mov	r1, #1152
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+20
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L56:
	ldr	r3, [fp, #-20]
	cmp	r3, #143
	ble	.L57
.L58:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+144
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	b	.L38
.L54:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+104
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
.L38:
	ldr	r3, [fp, #-40]
	add	r3, r3, #15
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	ldr	r1, [fp, #-36]
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	ldr	r3, [fp, #-928]
	ldr	r3, [r3, #3236]
	cmp	r3, #0
	beq	.L60
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+112
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	b	.L62
.L60:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+116
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
.L62:
	ldr	r3, [fp, #-40]
	add	r3, r3, #16
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, #1
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L63
.L69:
	.align	2
.L68:
	.word	_GLOBAL_OFFSET_TABLE_-(.L67+8)
	.word	.LC16(GOTOFF)
	.word	1374389535
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	.LC35(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	.LC41(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC48(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC49(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	3036
	.word	.LC42(GOTOFF)
	.word	-904
.L64:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+120
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-928]
	ldr	r1, .L68+140
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+124
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-928]
	ldr	r1, .L68+140
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #4]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+128
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-928]
	ldr	r1, .L68+140
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+132
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-928]
	ldr	r1, .L68+140
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	sub	r2, fp, #920
	sub	ip, fp, #924
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_number(PLT)
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+136
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #50
	beq	.L65
.L63:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-928]
	ldr	r1, .L68+140
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L64
.L65:
	sub	r2, fp, #920
	sub	ip, fp, #924
	ldr	r3, .L68+144
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r1, [fp, #-924]
	ldr	r2, .L68+148
	sub	r0, fp, #16
	add	r3, r0, r1
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-924]
	sub	r3, fp, #920
	mov	r0, #1
	mov	r1, r3
	bl	PutMultiple(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
	.size	train_ui_print_data, .-train_ui_print_data
	.section	.rodata
	.align	2
.LC50:
	.ascii	":\000"
	.align	2
.LC51:
	.ascii	".\000"
	.align	2
.LC52:
	.ascii	"   \000"
	.align	2
.LC53:
	.ascii	"%\000"
	.text
	.align	2
	.global	ui_print_data
	.type	ui_print_data, %function
ui_print_data:
	@ args = 0, pretend = 0, frame = 216
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #216
	ldr	sl, .L73
.L72:
	add	sl, pc, sl
	str	r0, [fp, #-228]
	str	r1, [fp, #-232]
	mov	r3, #0
	str	r3, [fp, #-224]
	mov	r3, #0
	str	r3, [fp, #-224]
	sub	r3, fp, #220
	sub	ip, fp, #224
	mov	r0, #4
	mov	r1, #30
	mov	r2, r3
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	ldr	r1, [fp, #-228]
	ldr	r3, .L73+4
	smull	r0, r3, r1, r3
	mov	r2, r3, asr #7
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	sub	r3, fp, #220
	sub	r2, fp, #224
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	zx_put_number(PLT)
	sub	r2, fp, #220
	sub	ip, fp, #224
	ldr	r3, .L73+8
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	mov	r2, r3
	ldr	r3, [fp, #-228]
	rsb	r3, r2, r3
	str	r3, [fp, #-228]
	ldr	r1, [fp, #-228]
	ldr	r3, .L73+12
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	sub	r3, fp, #220
	sub	r2, fp, #224
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	zx_put_number(PLT)
	sub	r2, fp, #220
	sub	ip, fp, #224
	ldr	r3, .L73+16
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-228]
	rsb	r3, r2, r3
	str	r3, [fp, #-228]
	ldr	r1, [fp, #-228]
	ldr	r3, .L73+20
	smull	r0, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	sub	r3, fp, #220
	sub	r2, fp, #224
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	zx_put_number(PLT)
	sub	r2, fp, #220
	sub	ip, fp, #224
	ldr	r3, .L73+24
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r3, fp, #220
	sub	ip, fp, #224
	mov	r0, #5
	mov	r1, #30
	mov	r2, r3
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	sub	r3, fp, #220
	sub	r2, fp, #224
	ldr	r0, [fp, #-232]
	mov	r1, r3
	bl	zx_put_number(PLT)
	sub	r2, fp, #220
	sub	ip, fp, #224
	ldr	r3, .L73+28
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #220
	sub	ip, fp, #224
	ldr	r3, .L73+24
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r1, [fp, #-224]
	mvn	r2, #203
	sub	r0, fp, #16
	add	r3, r0, r1
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-224]
	sub	r3, fp, #220
	mov	r0, #1
	mov	r1, r3
	bl	PutMultiple(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L74:
	.align	2
.L73:
	.word	_GLOBAL_OFFSET_TABLE_-(.L72+8)
	.word	91625969
	.word	.LC50(GOTOFF)
	.word	1374389535
	.word	.LC51(GOTOFF)
	.word	1717986919
	.word	.LC52(GOTOFF)
	.word	.LC53(GOTOFF)
	.size	ui_print_data, .-ui_print_data
	.section	.rodata
	.align	2
.LC54:
	.ascii	"==================================================="
	.ascii	"===\012\000"
	.align	2
.LC55:
	.ascii	"=======  Project 1 Demo  ==  Alex and Priyaa  ====="
	.ascii	"===\012\000"
	.align	2
.LC56:
	.ascii	"Time:\012\000"
	.align	2
.LC57:
	.ascii	"Idle task time:\012\000"
	.text
	.align	2
	.global	ui_print_initial_screen
	.type	ui_print_initial_screen, %function
ui_print_initial_screen:
	@ args = 0, pretend = 0, frame = 204
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #204
	ldr	sl, .L78
.L77:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-220]
	mov	r3, #0
	str	r3, [fp, #-220]
	sub	r3, fp, #216
	sub	r2, fp, #220
	mov	r0, r3
	mov	r1, r2
	bl	zx_clear_screen(PLT)
	sub	r3, fp, #216
	sub	ip, fp, #220
	mov	r0, #1
	mov	r1, #1
	mov	r2, r3
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	sub	r2, fp, #216
	sub	ip, fp, #220
	ldr	r3, .L78+4
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #216
	sub	ip, fp, #220
	ldr	r3, .L78+8
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #216
	sub	ip, fp, #220
	ldr	r3, .L78+4
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #216
	sub	ip, fp, #220
	ldr	r3, .L78+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	sub	r2, fp, #216
	sub	ip, fp, #220
	ldr	r3, .L78+16
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r1, [fp, #-220]
	mvn	r2, #199
	sub	r0, fp, #16
	add	r3, r0, r1
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-220]
	sub	r3, fp, #216
	mov	r0, #1
	mov	r1, r3
	bl	PutMultiple(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L79:
	.align	2
.L78:
	.word	_GLOBAL_OFFSET_TABLE_-(.L77+8)
	.word	.LC54(GOTOFF)
	.word	.LC55(GOTOFF)
	.word	.LC56(GOTOFF)
	.word	.LC57(GOTOFF)
	.size	ui_print_initial_screen, .-ui_print_initial_screen
	.section	.rodata
	.align	2
.LC58:
	.ascii	"ui_server\000"
	.align	2
.LC59:
	.ascii	"Incorrect arg\000"
	.align	2
.LC60:
	.ascii	"Incorrect arg(2)\000"
	.align	2
.LC61:
	.ascii	"Incorrect arg(3)\000"
	.align	2
.LC62:
	.ascii	"Incorrect command\000"
	.text
	.align	2
	.global	zx_command_task
	.type	zx_command_task, %function
zx_command_task:
	@ args = 0, pretend = 0, frame = 116
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #120
	ldr	sl, .L116
.L115:
	add	sl, pc, sl
	ldr	r3, .L116+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-84]
	sub	r3, fp, #99
	mov	r0, r3
	bl	zx_initialize_prompt(PLT)
	sub	r3, fp, #80
	sub	ip, fp, #84
	mov	r0, #55
	mov	r1, #1
	mov	r2, r3
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	sub	r3, fp, #99
	sub	r2, fp, #80
	sub	ip, fp, #84
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	zx_put_string(PLT)
	ldr	r1, [fp, #-84]
	mvn	r2, #63
	sub	r0, fp, #16
	add	r3, r0, r1
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-84]
	sub	r3, fp, #80
	mov	r0, #1
	mov	r1, r3
	bl	PutMultiple(PLT)
	mvn	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #11
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L114
.L81:
.L114:
	mov	r0, #1
	bl	GetC(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmn	r3, #4
	beq	.L81
	ldr	r3, [fp, #-20]
	strb	r3, [fp, #-37]
	ldrb	r3, [fp, #-37]	@ zero_extendqisi2
	cmp	r3, #13
	bne	.L83
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	sub	r3, fp, #129
	mov	r0, #0
	mov	r1, r3
	ldr	r2, [fp, #-36]
	bl	add_byte_to_buff(PLT)
	mvn	r3, #0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	add	r2, r3, #1
	ldr	r3, .L116+8
	smull	r0, r1, r3, r2
	mov	r3, r2, asr #31
	rsb	r1, r3, r1
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	rsb	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L85
	mov	r3, #0
	str	r3, [fp, #-84]
	sub	r3, fp, #80
	sub	ip, fp, #84
	mov	r0, #55
	mov	r1, #1
	mov	r2, r3
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	sub	r3, fp, #80
	sub	r2, fp, #84
	mov	r0, r3
	mov	r1, r2
	bl	zx_erase_from_current_to_scrend(PLT)
	ldr	r1, [fp, #-84]
	mvn	r2, #63
	sub	r0, fp, #16
	add	r3, r0, r1
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-84]
	sub	r3, fp, #80
	mov	r0, #1
	mov	r1, r3
	bl	PutMultiple(PLT)
.L85:
	mov	r3, #0
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-28]
	add	r3, r3, #55
	sub	r2, fp, #80
	sub	ip, fp, #84
	mov	r0, r3
	mov	r1, #1
	mov	r3, ip
	bl	zx_set_cursor(PLT)
	sub	r3, fp, #99
	sub	r2, fp, #80
	sub	ip, fp, #84
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	print_prompt(PLT)
	ldr	r1, [fp, #-84]
	mvn	r2, #63
	sub	r0, fp, #16
	add	r3, r0, r1
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-84]
	sub	r3, fp, #80
	mov	r0, #1
	mov	r1, r3
	bl	PutMultiple(PLT)
	mov	r3, #11
	str	r3, [fp, #-24]
	b	.L87
.L83:
	ldrb	r3, [fp, #-37]	@ zero_extendqisi2
	cmp	r3, #8
	bne	.L88
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	blt	.L87
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-28]
	add	r2, r3, #55
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	sub	ip, fp, #80
	sub	lr, fp, #84
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	mov	r3, lr
	bl	zx_set_cursor(PLT)
	sub	r3, fp, #80
	sub	r2, fp, #84
	mov	r0, r3
	mov	r1, r2
	bl	zx_erase_line(PLT)
	ldr	r1, [fp, #-84]
	mvn	r2, #63
	sub	r0, fp, #16
	add	r3, r0, r1
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-84]
	sub	r3, fp, #80
	mov	r0, #1
	mov	r1, r3
	bl	PutMultiple(PLT)
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	b	.L87
.L88:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldrb	r3, [fp, #-37]	@ zero_extendqisi2
	sub	r2, fp, #129
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-36]
	bl	add_byte_to_buff(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-28]
	add	r2, r3, #55
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	sub	ip, fp, #80
	sub	lr, fp, #84
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	mov	r3, lr
	bl	zx_set_cursor(PLT)
	ldr	r1, [fp, #-84]
	mvn	r2, #63
	sub	r0, fp, #16
	add	r3, r0, r1
	add	r2, r3, r2
	ldrb	r3, [fp, #-37]
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-84]
	ldr	r1, [fp, #-84]
	mvn	r2, #63
	sub	r0, fp, #16
	add	r3, r0, r1
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	add	r3, r1, #1
	str	r3, [fp, #-84]
	sub	r3, fp, #80
	mov	r0, #1
	mov	r1, r3
	bl	PutMultiple(PLT)
.L87:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L81
	mov	r3, #0
	str	r3, [fp, #-32]
	mvn	r3, #0
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-60]
	sub	r2, fp, #129
	sub	r1, fp, #60
	sub	r3, fp, #60
	add	ip, r3, #4
	sub	r3, fp, #60
	add	lr, r3, #8
	sub	r3, fp, #60
	add	r3, r3, #12
	str	r3, [sp, #0]
	mov	r0, r2
	mov	r2, ip
	mov	r3, lr
	bl	process_command(PLT)
	ldr	r3, [fp, #-60]
	sub	r3, r3, #1
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L94
	.p2align 2
.L100:
	b	.L95
	b	.L96
	b	.L95
	b	.L94
	b	.L97
	b	.L98
	b	.L99
	b	.L94
	b	.L94
	b	.L96
.L95:
	ldr	r3, [fp, #-56]
	cmn	r3, #1
	beq	.L101
	ldr	r3, [fp, #-52]
	cmn	r3, #1
	bne	.L103
.L101:
	ldr	r3, .L116+12
	add	r3, sl, r3
	mov	r0, r3
	bl	zx_print_error_message(PLT)
	b	.L81
.L103:
	sub	r3, fp, #60
	sub	ip, fp, #60
	mov	r2, #16
	str	r2, [sp, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #16
	mov	r3, ip
	bl	Send(PLT)
	bl	zx_print_success_message(PLT)
	b	.L81
.L96:
	sub	r3, fp, #60
	sub	ip, fp, #60
	mov	r2, #16
	str	r2, [sp, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #16
	mov	r3, ip
	bl	Send(PLT)
	bl	zx_print_success_message(PLT)
	b	.L81
.L99:
	ldr	r3, [fp, #-56]
	cmn	r3, #1
	bne	.L105
	ldr	r3, .L116+16
	add	r3, sl, r3
	mov	r0, r3
	bl	zx_print_error_message(PLT)
	b	.L81
.L105:
	ldr	r3, [fp, #-56]
	cmn	r3, #1
	bne	.L108
	ldr	r3, .L116+20
	add	r3, sl, r3
	mov	r0, r3
	bl	zx_print_error_message(PLT)
	b	.L81
.L108:
	sub	r3, fp, #60
	sub	ip, fp, #60
	mov	r2, #16
	str	r2, [sp, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #16
	mov	r3, ip
	bl	Send(PLT)
	bl	zx_print_success_message(PLT)
	b	.L81
.L97:
	ldr	r3, [fp, #-56]
	cmn	r3, #1
	bne	.L110
	ldr	r3, .L116+12
	add	r3, sl, r3
	mov	r0, r3
	bl	zx_print_error_message(PLT)
	b	.L81
.L110:
	sub	r3, fp, #60
	sub	ip, fp, #60
	mov	r2, #16
	str	r2, [sp, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #16
	mov	r3, ip
	bl	Send(PLT)
	bl	zx_print_success_message(PLT)
	b	.L81
.L98:
	sub	r3, fp, #60
	sub	ip, fp, #60
	mov	r2, #16
	str	r2, [sp, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	mov	r2, #16
	mov	r3, ip
	bl	Send(PLT)
	bl	zx_print_success_message(PLT)
	bl	Exit(PLT)
	b	.L81
.L94:
	ldr	r3, .L116+24
	add	r3, sl, r3
	mov	r0, r3
	bl	zx_print_error_message(PLT)
	b	.L81
.L117:
	.align	2
.L116:
	.word	_GLOBAL_OFFSET_TABLE_-(.L115+8)
	.word	.LC58(GOTOFF)
	.word	1431655766
	.word	.LC59(GOTOFF)
	.word	.LC60(GOTOFF)
	.word	.LC61(GOTOFF)
	.word	.LC62(GOTOFF)
	.size	zx_command_task, .-zx_command_task
	.align	2
	.global	zx_ui_server_task
	.type	zx_ui_server_task, %function
zx_ui_server_task:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	ldr	sl, .L130
.L129:
	add	sl, pc, sl
	ldr	r3, .L130+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r0, #19
	ldr	r3, .L130+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L128
.L119:
.L128:
	sub	r3, fp, #32
	sub	r2, fp, #64
	mov	r0, r3
	mov	r1, r2
	mov	r2, #16
	bl	Receive(PLT)
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L120
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-36]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L119
.L120:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	bne	.L123
	ldr	r3, [fp, #-32]
	sub	r2, fp, #48
	mov	r0, r3
	mov	r1, r2
	mov	r2, #16
	bl	Reply(PLT)
	sub	r3, fp, #64
	ldr	r0, [fp, #-24]
	mov	r1, r3
	mov	r2, #16
	bl	Reply(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-64]
	cmp	r3, #6
	beq	.L125
	b	.L119
.L123:
	mvn	r3, #0
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-32]
	sub	r2, fp, #64
	mov	r0, r3
	mov	r1, r2
	mov	r2, #16
	bl	Reply(PLT)
	b	.L119
.L125:
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L131:
	.align	2
.L130:
	.word	_GLOBAL_OFFSET_TABLE_-(.L129+8)
	.word	.LC58(GOTOFF)
	.word	zx_command_task(GOT)
	.size	zx_ui_server_task, .-zx_ui_server_task
	.ident	"GCC: (GNU) 4.0.2"
