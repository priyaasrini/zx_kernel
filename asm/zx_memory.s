	.file	"zx_memory.c"
	.text
	.align	2
	.global	zx_memcpy
	.type	zx_memcpy, %function
zx_memcpy:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-16]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
.L2:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L3
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_memcpy, .-zx_memcpy
	.align	2
	.global	zx_alloc
	.type	zx_alloc, %function
zx_alloc:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #36]
	cmp	r3, #0
	bne	.L7
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L9
.L7:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #36]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #36]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #36]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #36]
	cmp	r3, #0
	bne	.L10
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #40]
.L10:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-24]
.L9:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_alloc, .-zx_alloc
	.align	2
	.global	zx_free
	.type	zx_free, %function
zx_free:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L21
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #36]
	cmp	r3, #0
	bne	.L18
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #40]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #40]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #36]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #36]
	mov	r3, #0
	str	r3, [r2, #0]
	b	.L20
.L18:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #40]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #40]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #40]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #40]
	mov	r3, #0
	str	r3, [r2, #0]
.L20:
	mov	r3, #0
	str	r3, [fp, #-20]
.L21:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_free, .-zx_free
	.align	2
	.global	zx_heap_create
	.type	zx_heap_create, %function
zx_heap_create:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-36]
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r3, r3, #102400
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #36]
	b	.L23
.L24:
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #16
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L23:
	ldr	r3, [fp, #-20]
	sub	r3, r3, #16
	mov	r2, r3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L24
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #40]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_heap_create, .-zx_heap_create
	.section	.rodata
	.align	2
.LC0:
	.ascii	"zx_heap_walk: Begin address read = %x\012\000"
	.align	2
.LC1:
	.ascii	"zx_heap_walk: Last address read = %x\012\000"
	.align	2
.LC2:
	.ascii	"zx_heap_walk: number of chunks = %d\012\000"
	.text
	.align	2
	.global	debug_walk_heap
	.type	debug_walk_heap, %function
debug_walk_heap:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L33
.L32:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-32]
	bl	zx_get_active_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #36]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #40]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L33+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L28
.L29:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
.L28:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L29
	ldr	r2, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L33+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L33+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L34:
	.align	2
.L33:
	.word	_GLOBAL_OFFSET_TABLE_-(.L32+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	debug_walk_heap, .-debug_walk_heap
	.align	2
	.global	zx_memset
	.type	zx_memset, %function
zx_memset:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-16]
	b	.L36
.L37:
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	ldr	r2, [fp, #-16]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L36:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmn	r3, #1
	bne	.L37
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_memset, .-zx_memset
	.ident	"GCC: (GNU) 4.0.2"
