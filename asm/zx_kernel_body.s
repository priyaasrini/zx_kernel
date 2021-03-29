	.file	"zx_kernel_body.c"
	.text
	.align	2
	.global	zx_kernel_init
	.type	zx_kernel_init, %function
zx_kernel_init:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #68
	ldr	sl, .L22
.L21:
	add	sl, pc, sl
	str	r0, [fp, #-88]
	ldr	r3, [fp, #-88]
	cmn	r3, #1
	blt	.L2
	b	.L4
.L2:
	nop
	nop
	nop
	nop
	nop
	nop
	
	SUB sp, sp, #4
	STMFD sp!, {ip}
	STMFD sp!, {r0-r3, lr}
	MRS r2, spsr 
	MRS r0, CPSR 	
AND r0, r0, #0x0000000f 	
CMP r0, #3 
	BEQ svc_only_handler 
	mov r1, ip 
	MRS   r0, CPSR 
	AND   r0,  r0, #0xfffffff0
	ORR   r0,  r0, #0x00000003
	MSR   CPSR, r0
	mov ip, sp 
	MSR spsr, r2 
	MRS   r0, CPSR 
	AND   r0,  r0, #0xfffffff0
	ORR   r0,  r0, #0x00000002
	MSR   CPSR, r0
	mov r0, #123 
	stmfd ip!, {r0} 
	stmfd ip!, {r1} 
	ldmfd sp!, {r0-r3, lr} 
	SUB lr, lr, #4 	
stmfd ip!, {r0-r3, lr} 
	LDMFD sp!, {r1}
	LDMFD sp!, {r0} 
	MRS   r0, CPSR 
	AND   r0,  r0, #0xfffffff0
	ORR   r0,  r0, #0x00000003
	MSR   CPSR, r0
	MOV sp, ip
	MOV ip, r1 
	b generic_handler 
	svc_only_handler: 
	mov r0, #100 
	str r0, [sp, #24] 
	generic_handler: 
	ldmfd sp!, {r0-r3, lr} 
	LDMFD sp!, {ip}
	STMFD sp!, {r0-r3, lr}
	STMFD sp!, {r0-r3}
	STMFD sp!, {ip}
	mov r2, lr
	MRS   r1,  CPSR
	ORR   r1,  r1, #0x0000000f
	MSR   CPSR, r1
	STMFD sp!, {r2}
	MOV r2, lr
	MOV ip, sp
	MRS   r1, CPSR 
	AND   r1,  r1, #0xfffffff0
	ORR   r1,  r1, #0x00000003
	MSR   CPSR, r1
	LDMFD sp!, {r1}
	STMFD ip!, {r1}
	STMFD ip!, {r4-r11}
	mov r5, r1
	mov r4, r2
	LDMFD sp!, {r0-r3}
	STMFD ip!, {r0-r3}
	STMFD ip!, {r4}
	STMFD sp!, {ip}
	MRS r1, spsr
	STMFD sp!, {r1}
	STMFD sp!, {r5}
	B zx_save_context_and_return_to_kernel
	
.L4:
	mov r0, #0 
	mrc p15, 0, r0, c1, c0
	orr r0, r0, #0x1000 
	mcr p15, 0, r0, c1, c0
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	mov r0, #0 
	mrc p15, 0, r0, c1, c0
	orr r0, r0, #0x40000000 
	mcr p15, 0, r0, c1, c0
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	mov r0, #0 
	mrc p15, 0, r0, c1, c0
	orr r0, r0, #0x80000000 
	mcr p15, 0, r0, c1, c0
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	
	ldr	r3, .L22+4
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-80]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+8
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-80]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r3, #413696
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-80]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+12
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-80]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+16
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-80]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+20
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-80]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+24
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-80]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L5
.L6:
	ldr	r3, [fp, #-76]
	mov	r3, r3, asl #2
	add	r3, r3, #413696
	add	r3, r3, #20
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-80]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L5:
	ldr	r3, [fp, #-76]
	cmp	r3, #4
	ble	.L6
	ldr	r0, .L22+28
	bl	zx_timer_disable(PLT)
	ldr	r0, .L22+32
	bl	zx_timer_disable(PLT)
	bl	zx_reset_all_interrupts(PLT)
	mov	r3, #8
	str	r3, [fp, #-84]
	ldr	r3, .L22+36
	add	r3, sl, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	sub	r3, r3, #16
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	mov	r3, r3, asr #2
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	orr	r3, r3, #-369098752
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-68]
	str	r3, [r2, #0]
	mov	r3, #24
	str	r3, [fp, #-84]
	ldr	r3, .L22+36
	add	r3, sl, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	sub	r3, r3, #32
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	mov	r3, r3, asr #2
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	orr	r3, r3, #-369098752
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-68]
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L8
.L9:
	ldr	r0, [fp, #-76]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-76]
	mvn	r3, r3, asl #24
	mvn	r3, r3, lsr #24
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #2
	str	r3, [r2, #8]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L8:
	ldr	r3, [fp, #-76]
	cmp	r3, #63
	ble	.L9
	mov	r3, #0
	str	r3, [fp, #-76]
	mov	r0, #0
	bl	zx_receive_q_get_head_addr(PLT)
	mov	r3, r0
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L11
.L12:
	ldr	r2, [fp, #-64]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #4
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L11:
	ldr	r3, [fp, #-76]
	cmp	r3, #63
	ble	.L12
	mov	r0, #0
	bl	zx_receive_q_get_tail_addr(PLT)
	mov	r3, r0
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L14
.L15:
	ldr	r2, [fp, #-60]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-60]
	add	r3, r3, #4
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L14:
	ldr	r3, [fp, #-76]
	cmp	r3, #63
	ble	.L15
	mov	r3, #0
	str	r3, [fp, #-76]
	mov	r0, #0
	bl	zx_q_get_head_addr(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L17
.L18:
	ldr	r2, [fp, #-56]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-56]
	add	r3, r3, #4
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L17:
	ldr	r3, [fp, #-76]
	cmp	r3, #31
	ble	.L18
	ldr	r3, .L22+40
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-52]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+44
	str	r3, [fp, #-48]
	mvn	r1, #0
	mvn	r2, #0
	str	r1, [fp, #-44]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-48]
	sub	r1, fp, #44
	ldmia	r1, {r1-r2}
	stmia	r3, {r1-r2}
	mov	r0, #20
	ldr	r3, .L22+48
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	zx_create(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r0, [fp, #-36]
	mov	r1, #20
	bl	zx_q_append_to_end(PLT)
	ldr	r3, .L22+52
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+56
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+60
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+64
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+68
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+72
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r0, #31
	ldr	r3, .L22+76
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	zx_create(PLT)
	mov	r0, #48
	mov	r1, #31
	bl	zx_q_append_to_end(PLT)
	bl	zx_initialize_uart2(PLT)
	bl	zx_initialize_uart1(PLT)
	bl	zx_vic_enable_all_interrupts(PLT)
	sub	sp, fp, #20
	ldmfd	sp, {r4, sl, fp, sp, pc}
.L23:
	.align	2
.L22:
	.word	_GLOBAL_OFFSET_TABLE_-(.L21+8)
	.word	413632
	.word	413636
	.word	413700
	.word	413704
	.word	413708
	.word	413712
	.word	-2139029504
	.word	-2139029472
	.word	.L2(GOTOFF)
	.word	413592
	.word	413580
	.word	zx_first_user_task_kernel_4_a0(GOT)
	.word	413640
	.word	413644
	.word	413648
	.word	413652
	.word	413656
	.word	413680
	.word	zx_idle(GOT)
	.size	zx_kernel_init, .-zx_kernel_init
	.align	2
	.global	zx_handle
	.type	zx_handle, %function
zx_handle:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-36]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #28]
	sub	r3, r3, #1
	cmp	r3, #99
	addls	pc, pc, r3, asl #2
	b	.L42
	.p2align 2
.L41:
	b	.L26
	b	.L42
	b	.L28
	b	.L29
	b	.L30
	b	.L31
	b	.L32
	b	.L33
	b	.L34
	b	.L35
	b	.L36
	b	.L37
	b	.L38
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L39
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L42
	b	.L40
.L26:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	mov	r0, r2
	mov	r1, r3
	bl	zx_create(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-32]
	mov	r1, r3
	bl	zx_q_append_to_end(PLT)
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #32]
	b	.L42
.L28:
	bl	zx_exit(PLT)
	b	.L42
.L29:
	bl	zx_my_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #32]
	b	.L42
.L30:
	bl	zx_parent_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #32]
	b	.L42
.L31:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r1, r3
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	mov	lr, r3
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	mov	ip, r3
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, lr
	mov	r3, ip
	bl	zx_send(PLT)
	b	.L42
.L32:
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	zx_receive(PLT)
	b	.L42
.L33:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r1, r3
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	zx_reply(PLT)
	b	.L42
.L34:
	bl	zx_alloc(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #32]
	b	.L42
.L35:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	zx_free(PLT)
	b	.L42
.L36:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	zx_await_event(PLT)
	b	.L42
.L37:
	bl	zx_shutdown(PLT)
	b	.L42
.L38:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	zx_kill(PLT)
.L40:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	zx_handle_hwi(PLT)
	b	.L42
.L39:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	bl	debug_many_args(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #32]
.L42:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_handle, .-zx_handle
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Warning: task '%d' is in SEND_BLOCKED state.\012\000"
	.align	2
.LC1:
	.ascii	"Warning: task '%d' is in RECEIVE_BLOCKED state.\012"
	.ascii	"\000"
	.align	2
.LC2:
	.ascii	"Warning: task '%d' is in REPLY_BLOCKED state.\012\000"
	.align	2
.LC3:
	.ascii	"Warning: task '%d' is in EVENT_BLOCKED state.\012\000"
	.text
	.align	2
	.global	zx_get_closure_errors
	.type	zx_get_closure_errors, %function
zx_get_closure_errors:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L57
.L56:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L44
.L45:
	ldr	r0, [fp, #-28]
	bl	zx_get_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #4
	bne	.L46
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L57+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #255
	str	r3, [fp, #-32]
	b	.L48
.L46:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #3
	bne	.L49
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L57+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #255
	str	r3, [fp, #-32]
	b	.L48
.L49:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #5
	bne	.L51
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L57+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #255
	str	r3, [fp, #-32]
	b	.L48
.L51:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #6
	bne	.L48
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L57+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #255
	str	r3, [fp, #-32]
.L48:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L44:
	ldr	r3, [fp, #-28]
	cmp	r3, #63
	ble	.L45
	ldr	r3, .L57+20
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #28]
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L58:
	.align	2
.L57:
	.word	_GLOBAL_OFFSET_TABLE_-(.L56+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	413596
	.size	zx_get_closure_errors, .-zx_get_closure_errors
	.align	2
	.global	zx_get_next_request
	.type	zx_get_next_request, %function
zx_get_next_request:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	bl	zx_q_get_next_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmn	r3, #1
	beq	.L60
	ldr	r3, [fp, #-20]
	cmp	r3, #48
	bne	.L62
	ldr	r0, .L66
	ldr	r1, .L66+4
	bl	zx_timer_load_val(PLT)
	ldr	r0, .L66
	mov	r1, #1
	bl	zx_timer_set_periodic(PLT)
	ldr	r0, .L66
	mov	r1, #8
	bl	zx_timer_select_clock(PLT)
	ldr	r0, .L66
	bl	zx_timer_enable(PLT)
.L62:
	ldr	r0, [fp, #-20]
	bl	zx_restore_context(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-24]
	b	.L64
.L60:
	mov	r3, #0
	str	r3, [fp, #-24]
.L64:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L67:
	.align	2
.L66:
	.word	-2139029472
	.word	5180
	.size	zx_get_next_request, .-zx_get_next_request
	.align	2
	.global	zx_save_context_and_return_to_kernel
	.type	zx_save_context_and_return_to_kernel, %function
zx_save_context_and_return_to_kernel:
	@ args = 0, pretend = 0, frame = 84
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #84
	mov	r3, #0
	str	r3, [fp, #-56]
	LDMFD ip!, {r0}
	MOV r3, r0
	str	r3, [fp, #-92]
	LDMFD ip!, {r0}
	MOV r3, r0
	str	r3, [fp, #-88]
	LDMFD ip!, {r0}
	MOV r3, r0
	str	r3, [fp, #-96]
	LDMFD ip!, {r0}
	MOV r3, r0
	str	r3, [fp, #-80]
	LDMFD ip!, {r0}
	MOV r3, r0
	str	r3, [fp, #-76]
	LDMFD ip!, {r0}
	MOV r3, r0
	str	r3, [fp, #-72]
	LDMFD ip!, {r0}
	MOV r3, r0
	str	r3, [fp, #-68]
	LDMFD ip!, {r0}
	MOV r3, r0
	str	r3, [fp, #-64]
	LDMFD ip!, {r0}
	MOV r3, r0
	str	r3, [fp, #-84]
	LDR r3, [lr, #-4]
	str	r3, [fp, #-56]
	NOP 
	NOP 
	NOP 
	
	ldr	r3, [fp, #-56]
	bic	r3, r3, #-16777216
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-56]
	and	r3, r3, #251658240
	str	r3, [fp, #-56]
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-80]
	str	r3, [r2, #32]
	ldr	r2, [fp, #-96]
	ldr	r3, [fp, #-52]
	str	r2, [r3, #24]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-88]
	str	r3, [r2, #28]
	ldr	r3, .L77
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-48]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-48]
	str	r2, [r3, #4]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-48]
	str	r2, [r3, #8]
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-48]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-84]
	cmp	r3, #123
	beq	.L69
	ldr	r3, [fp, #-92]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	str	r2, [r3, #16]
	b	.L71
.L69:
	ldr	r2, [fp, #-48]
	mov	r3, #0
	str	r3, [r2, #16]
.L71:
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #0]
	cmp	r3, #48
	bne	.L72
	ldr	r0, .L77+4
	bl	zx_timer_disable(PLT)
	ldr	r0, .L77+4
	bl	zx_timer_get_value(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	rsb	r3, r3, #5120
	add	r3, r3, #60
	ldr	r2, .L77+8
	smull	r1, r2, r3, r2
	add	r2, r2, r3
	mov	r2, r2, asr #8
	mov	r3, r3, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, .L77+12
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, .L77+16
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, .L77+20
	str	r3, [r2, #0]
.L72:
	ldr	r3, [fp, #-84]
	cmp	r3, #123
	bne	.L74
	bl	zx_get_interrupt_source(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	zx_device_intr_clear(PLT)
	mov	r3, #100
	str	r3, [fp, #-60]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-48]
	str	r2, [r3, #0]
.L74:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-60]
	str	r3, [r2, #28]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	MOV r0, r3
	str	r3, [fp, #-44]
	sub	sp, fp, #16 
	ldmfd	sp, {sl, fp, sp} 
	ldmfd	sp!, {r4} 
	ldmfd	sp!, {r4} 
	ldmfd	sp!, {r4} 
	ldmfd	sp!, {r1-r4, lr} 
	ldmfd	sp!, {r4} 
	
	ldmfd sp!, {r4-r12, lr}
	 
	sub	sp, fp, #12 
	ldmfd	sp, {fp, sp, pc} 
	
	NOP 
	NOP 
	NOP 
	
	ldr	r3, .L77
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L78:
	.align	2
.L77:
	.word	413596
	.word	-2139029472
	.word	-2130574327
	.word	413680
	.word	413724
	.word	305419896
	.size	zx_save_context_and_return_to_kernel, .-zx_save_context_and_return_to_kernel
	.align	2
	.global	zx_restore_context
	.type	zx_restore_context, %function
zx_restore_context:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-32]
	ldr	r0, [fp, #-32]
	bl	zx_set_active_task_id(PLT)
	stmfd sp!, {r4-r12, lr}
	
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #32]
	str	r3, [fp, #-24]
	mov r1, r3
	str	r3, [fp, #-24]
	stmfd sp!, {r1}
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #28]
	str	r3, [fp, #-20]
	mov r1, r3
	str	r3, [fp, #-20]
	stmfd sp!, {r1}
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-16]
	mov r5, r3
	str	r3, [fp, #-16]
	MRS   r4,  CPSR
	ORR   r4,  r4, #0x0000000f
	MSR   CPSR, r4
	mov sp, r5 
	LDMFD sp!, {lr}
	LDMFD sp!, {r0-r3}
	MRS   r4, CPSR
	AND   r4,  r4, #0xfffffff0
	ORR   r4,  r4, #0x00000003
	MSR   CPSR, r4
	ldmfd sp!, {r4}  
	STMFD sp!, {r0-r3}
	mov r2, r4
	MRS   r0,  CPSR
	ORR   r0,  r0, #0x0000000f
	MSR   CPSR, r0
	LDMFD sp!, {r4-r11}
	LDMFD sp!, {ip}
	LDMFD sp!, {r1}
	MRS   r0, CPSR
	AND   r0,  r0, #0xfffffff0
	ORR   r0,  r0, #0x00000003
	MSR   CPSR, r0
	msr spsr, r2 
	mov lr, r1   
	LDMFD sp!, {r0-r3}
	ldmfd sp!, {r0}  
	MOVS pc, lr 
	
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_restore_context, .-zx_restore_context
	.align	2
	.global	truly_idle_
	.type	truly_idle_, %function
truly_idle_:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
.L82:
	b	.L82
	.size	truly_idle_, .-truly_idle_
	.align	2
	.global	zx_idle
	.type	zx_idle, %function
zx_idle:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	bl	truly_idle_(PLT)
	ldmfd	sp, {fp, sp, pc}
	.size	zx_idle, .-zx_idle
	.ident	"GCC: (GNU) 4.0.2"
