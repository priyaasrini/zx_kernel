	.file	"zx_clockserver_heap.c"
	.text
	.align	2
	.global	zx_clockserver_heap_init
	.type	zx_clockserver_heap_init, %function
zx_clockserver_heap_init:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r2, [fp, #-32]
	mvn	r3, #0
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L2
.L3:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L2:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_clockserver_heap_init, .-zx_clockserver_heap_init
	.section	.rodata
	.align	2
.LC0:
	.ascii	"zx_clockserver_heap_insert: Something seriously wro"
	.ascii	"ng. Index = %d\012\000"
	.text
	.align	2
	.global	zx_clockserver_heap_insert
	.type	zx_clockserver_heap_insert, %function
zx_clockserver_heap_insert:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L12
.L11:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	cmp	r3, #63
	ble	.L7
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	sub	r2, r3, #1
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L12+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L10
.L7:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	zx_clockserver_min_heapify_after_insert(PLT)
.L10:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.L11+8)
	.word	.LC0(GOTOFF)
	.size	zx_clockserver_heap_insert, .-zx_clockserver_heap_insert
	.align	2
	.global	zx_clockserver_heap_remove
	.type	zx_clockserver_heap_remove, %function
zx_clockserver_heap_remove:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #63
	bgt	.L19
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L17
	ldr	r2, [fp, #-32]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L19
.L17:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-16]
	bl	zx_clockserver_heap_node_swap(PLT)
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	sub	r2, r3, #1
	ldr	r3, [fp, #-32]
	str	r2, [r3, #0]
	ldr	r0, [fp, #-28]
	mov	r1, #0
	bl	zx_clockserver_min_heapify_after_delete(PLT)
.L19:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_clockserver_heap_remove, .-zx_clockserver_heap_remove
	.align	2
	.global	zx_clockserver_min_heapify_after_delete
	.type	zx_clockserver_min_heapify_after_delete, %function
zx_clockserver_min_heapify_after_delete:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #44
	str	r0, [fp, #-52]
	str	r1, [fp, #-56]
	ldr	r3, [fp, #-56]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-56]
	mov	r3, r3, asl #1
	add	r3, r3, #2
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-44]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-48]
	cmp	r3, #63
	bgt	.L21
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	cmn	r3, #1
	beq	.L21
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bge	.L21
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-24]
.L21:
	ldr	r3, [fp, #-44]
	cmp	r3, #63
	bgt	.L25
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	cmn	r3, #1
	beq	.L25
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bge	.L25
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-24]
.L25:
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	beq	.L31
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-56]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-24]
	bl	zx_clockserver_heap_node_swap(PLT)
	ldr	r0, [fp, #-52]
	ldr	r1, [fp, #-40]
	bl	zx_clockserver_min_heapify_after_delete(PLT)
.L31:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_clockserver_min_heapify_after_delete, .-zx_clockserver_min_heapify_after_delete
	.align	2
	.global	zx_clockserver_min_heapify_after_insert
	.type	zx_clockserver_min_heapify_after_insert, %function
zx_clockserver_min_heapify_after_insert:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	ble	.L48
	ldr	r3, [fp, #-60]
	eor	r3, r3, #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L35
	ldr	r3, [fp, #-60]
	sub	r2, r3, #2
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-60]
	sub	r3, r3, #1
	str	r3, [fp, #-48]
	b	.L37
.L35:
	ldr	r3, [fp, #-60]
	sub	r2, r3, #1
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L37:
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-44]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-48]
	cmp	r3, #63
	bgt	.L38
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	cmn	r3, #1
	beq	.L38
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bge	.L38
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-36]
.L38:
	ldr	r3, [fp, #-44]
	cmp	r3, #63
	bgt	.L42
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	cmn	r3, #1
	beq	.L42
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bge	.L42
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-36]
.L42:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	beq	.L48
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-36]
	bl	zx_clockserver_heap_node_swap(PLT)
	ldr	r0, [fp, #-56]
	ldr	r1, [fp, #-52]
	bl	zx_clockserver_min_heapify_after_insert(PLT)
.L48:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_clockserver_min_heapify_after_insert, .-zx_clockserver_min_heapify_after_insert
	.align	2
	.global	zx_clockserver_heap_node_swap
	.type	zx_clockserver_heap_node_swap, %function
zx_clockserver_heap_node_swap:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #4]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_clockserver_heap_node_swap, .-zx_clockserver_heap_node_swap
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Printing heap node at index %d:\000"
	.align	2
.LC2:
	.ascii	"tid =  %d; up_time=%d\012\000"
	.text
	.align	2
	.global	debug_print_clockserver_heap
	.type	debug_print_clockserver_heap, %function
debug_print_clockserver_heap:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L54
.L53:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L54+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	ip, [r3, #4]
	mov	r0, #1
	ldr	r3, .L54+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L55:
	.align	2
.L54:
	.word	_GLOBAL_OFFSET_TABLE_-(.L53+8)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	debug_print_clockserver_heap, .-debug_print_clockserver_heap
	.ident	"GCC: (GNU) 4.0.2"
