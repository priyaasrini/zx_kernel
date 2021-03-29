	.file	"zx_project_utilities.c"
	.text
	.align	2
	.global	add_byte_to_buff
	.type	add_byte_to_buff, %function
add_byte_to_buff:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	mov	r3, r0
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	strb	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldrb	r3, [fp, #-16]
	strb	r3, [r2, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	add_byte_to_buff, .-add_byte_to_buff
	.align	2
	.global	print_prompt
	.type	print_prompt, %function
print_prompt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	b	.L4
.L5:
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r2, #0]
	add	r2, r1, #1
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L4:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L5
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	print_prompt, .-print_prompt
	.global	__udivsi3
	.global	__umodsi3
	.align	2
	.global	num_to_string
	.type	num_to_string, %function
num_to_string:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L9
.L10:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L9:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcs	.L10
	b	.L22
.L13:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	__umodsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-32]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L14
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L14
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L12
.L14:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L17
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L19
.L17:
	mov	r3, #87
	str	r3, [fp, #-40]
.L19:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	ldr	r1, [fp, #-40]
	mov	r2, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	ldr	r2, [fp, #-36]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L12:
.L22:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L13
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	num_to_string, .-num_to_string
	.align	2
	.global	atoi
	.type	atoi, %function
atoi:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L24
.L25:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r3, r3, #48
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L24:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L25
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	atoi, .-atoi
	.align	2
	.global	strcmp
	.type	strcmp, %function
strcmp:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	b	.L41
.L30:
	ldr	r3, [fp, #-16]
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	cmp	r2, #0
	beq	.L31
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L33
.L31:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L34
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L36
.L34:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L29
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L29
.L36:
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L33
.L29:
.L41:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L38
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L30
.L38:
	mov	r3, #0
	str	r3, [fp, #-24]
.L33:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	strcmp, .-strcmp
	.align	2
	.global	node_name_to_id
	.type	node_name_to_id, %function
node_name_to_id:
	@ args = 0, pretend = 0, frame = 10956
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #10944
	sub	sp, sp, #12
	ldr	r3, .L50
	sub	r1, fp, #12
	str	r0, [r1, r3]
	sub	r3, fp, #10944
	sub	r3, r3, #12
	sub	r3, r3, #4
	mov	r0, #66
	mov	r1, r3
	bl	track_init(PLT)
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L43
.L44:
	ldr	r2, [fp, #-16]
	ldr	r1, .L50+4
	mov	r0, #4
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	sub	r2, fp, #12
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r2, [r3, #0]
	ldr	r3, .L50
	sub	r1, fp, #12
	ldr	r0, [r1, r3]
	mov	r1, r2
	bl	strcmp(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L45
	ldr	r3, [fp, #-16]
	sub	r2, fp, #8192
	str	r3, [r2, #-2776]
	b	.L47
.L45:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L43:
	ldr	r3, [fp, #-16]
	cmp	r3, #143
	ble	.L44
	mvn	r2, #0
	sub	r1, fp, #8192
	str	r2, [r1, #-2776]
.L47:
	sub	r1, fp, #8192
	ldr	r3, [r1, #-2776]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L51:
	.align	2
.L50:
	.word	-10952
	.word	-10948
	.size	node_name_to_id, .-node_name_to_id
	.section	.rodata
	.align	2
.LC0:
	.ascii	"tr\000"
	.align	2
.LC1:
	.ascii	"rv\000"
	.align	2
.LC2:
	.ascii	"sw\000"
	.align	2
.LC3:
	.ascii	"goto\000"
	.align	2
.LC4:
	.ascii	"quit\000"
	.align	2
.LC5:
	.ascii	"st\000"
	.align	2
.LC6:
	.ascii	"rr\000"
	.text
	.align	2
	.global	find_command_value
	.type	find_command_value, %function
find_command_value:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L70
.L69:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, .L70+4
	add	r3, sl, r3
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	strcmp(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L53
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L55
.L53:
	ldr	r3, .L70+8
	add	r3, sl, r3
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	strcmp(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L56
	mov	r3, #2
	str	r3, [fp, #-24]
	b	.L55
.L56:
	ldr	r3, .L70+12
	add	r3, sl, r3
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	strcmp(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L58
	mov	r3, #3
	str	r3, [fp, #-24]
	b	.L55
.L58:
	ldr	r3, .L70+16
	add	r3, sl, r3
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	strcmp(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L60
	mov	r3, #7
	str	r3, [fp, #-24]
	b	.L55
.L60:
	ldr	r3, .L70+20
	add	r3, sl, r3
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	strcmp(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L62
	mov	r3, #6
	str	r3, [fp, #-24]
	b	.L55
.L62:
	ldr	r3, .L70+24
	add	r3, sl, r3
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	strcmp(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L64
	mov	r3, #5
	str	r3, [fp, #-24]
	b	.L55
.L64:
	ldr	r3, .L70+28
	add	r3, sl, r3
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	strcmp(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L66
	mov	r3, #10
	str	r3, [fp, #-24]
	b	.L55
.L66:
	mov	r3, #0
	str	r3, [fp, #-24]
.L55:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L71:
	.align	2
.L70:
	.word	_GLOBAL_OFFSET_TABLE_-(.L69+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	find_command_value, .-find_command_value
	.align	2
	.global	process_command
	.type	process_command, %function
process_command:
	@ args = 4, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #72
	str	r0, [fp, #-68]
	str	r1, [fp, #-72]
	str	r2, [fp, #-76]
	str	r3, [fp, #-80]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L98
.L74:
	ldr	r3, [fp, #-68]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	bne	.L75
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	mvn	r1, #51
	mov	r3, r3, asl #3
	sub	r0, fp, #12
	add	r3, r3, r0
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-68]
	b	.L73
.L75:
	ldr	r2, [fp, #-24]
	ldr	r0, [fp, #-20]
	ldr	r3, [fp, #-68]
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mvn	r1, #51
	mov	r3, r2, asl #3
	sub	r2, fp, #12
	add	r3, r3, r2
	add	r3, r3, r0
	add	r2, r3, r1
	mov	r3, ip
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-68]
.L73:
.L98:
	ldr	r3, [fp, #-68]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L74
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	mvn	r1, #51
	mov	r3, r3, asl #3
	sub	r0, fp, #12
	add	r3, r3, r0
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L78
.L79:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L80
	sub	r3, fp, #64
	mov	r0, r3
	bl	find_command_value(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-72]
	str	r2, [r3, #0]
	b	.L82
.L80:
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bne	.L83
	sub	r3, fp, #64
	add	r3, r3, #8
	mov	r0, r3
	bl	atoi(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-76]
	str	r2, [r3, #0]
	b	.L82
.L83:
	ldr	r3, [fp, #-16]
	cmp	r3, #2
	bne	.L85
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bne	.L87
	ldrb	r3, [fp, #-48]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-80]
	str	r2, [r3, #0]
	b	.L82
.L87:
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #0]
	cmp	r3, #7
	bne	.L90
	sub	r3, fp, #64
	add	r3, r3, #16
	mov	r0, r3
	bl	node_name_to_id(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-80]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-80]
	ldr	r3, [r3, #0]
	cmn	r3, #1
	bne	.L82
	mov	r2, #0
	str	r2, [fp, #-84]
	b	.L94
.L90:
	sub	r3, fp, #64
	add	r3, r3, #16
	mov	r0, r3
	bl	atoi(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-80]
	str	r2, [r3, #0]
	b	.L82
.L85:
	ldr	r3, [fp, #-16]
	cmp	r3, #3
	bne	.L82
	sub	r3, fp, #64
	add	r3, r3, #24
	mov	r0, r3
	bl	atoi(PLT)
	mov	r2, r0
	ldr	r3, [fp, #4]
	str	r2, [r3, #0]
.L82:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L78:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L79
	mov	r3, #0
	str	r3, [fp, #-84]
.L94:
	ldr	r3, [fp, #-84]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	process_command, .-process_command
	.align	2
	.global	zx_a0_print_error_message
	.type	zx_a0_print_error_message, %function
zx_a0_print_error_message:
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
	mov	r0, #33
	mov	r1, #0
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
	mov	r0, #33
	mov	r1, #0
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
	.size	zx_a0_print_error_message, .-zx_a0_print_error_message
	.ident	"GCC: (GNU) 4.0.2"
