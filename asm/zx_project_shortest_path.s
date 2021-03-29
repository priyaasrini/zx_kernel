	.file	"zx_project_shortest_path.c"
	.text
	.align	2
	.global	track_calc_shortest_path_from_two_dest
	.type	track_calc_shortest_path_from_two_dest, %function
track_calc_shortest_path_from_two_dest:
	@ args = 16, pretend = 0, frame = 2360
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #2368
	sub	sp, sp, #4
	str	r0, [fp, #-2356]
	str	r1, [fp, #-2360]
	str	r2, [fp, #-2364]
	str	r3, [fp, #-2368]
	sub	r2, fp, #616
	sub	ip, fp, #1168
	sub	ip, ip, #12
	sub	ip, ip, #12
	sub	r3, fp, #1184
	sub	r3, r3, #12
	str	r3, [sp, #0]
	ldr	r3, [fp, #-2356]
	str	r3, [sp, #4]
	mov	r3, #400
	str	r3, [sp, #8]
	ldr	r0, [fp, #-2360]
	ldr	r1, [fp, #-2368]
	mov	r3, ip
	bl	zx_shortest_path(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	sub	r2, fp, #1760
	sub	r2, r2, #12
	sub	ip, fp, #2336
	sub	ip, ip, #12
	sub	r3, fp, #2336
	sub	r3, r3, #12
	sub	r3, r3, #4
	str	r3, [sp, #0]
	ldr	r3, [fp, #-2356]
	str	r3, [sp, #4]
	mov	r3, #400
	str	r3, [sp, #8]
	ldr	r0, [fp, #-2364]
	ldr	r1, [fp, #-2368]
	mov	r3, ip
	bl	zx_shortest_path(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	mvn	r3, #-268435456
	str	r3, [fp, #-32]
	mvn	r3, #-268435456
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L2
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L2
	mov	r1, #0
	str	r1, [fp, #-2372]
	b	.L5
.L2:
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L6
	ldr	r3, [fp, #-616]
	ldr	r2, .L23
	mov	r3, r3, asl #2
	sub	ip, fp, #12
	add	r3, r3, ip
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	str	r3, [fp, #-32]
.L6:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L8
	ldr	r3, [fp, #-1772]
	ldr	r2, .L23+4
	mov	r3, r3, asl #2
	sub	r1, fp, #12
	add	r3, r3, r1
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
.L8:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bgt	.L10
	ldr	r2, [fp, #-1196]
	sub	ip, fp, #616
	sub	r3, fp, #1168
	sub	r3, r3, #12
	sub	r3, r3, #12
	str	r3, [sp, #0]
	ldr	r3, [fp, #-2356]
	str	r3, [sp, #4]
	str	r2, [sp, #8]
	ldr	r0, [fp, #12]
	ldr	r1, [fp, #8]
	ldr	r2, [fp, #16]
	mov	r3, ip
	bl	zx_get_edges_waypoints_turnouts(PLT)
	b	.L12
.L13:
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #4]
	add	r1, r2, r3
	ldr	r0, [fp, #-1196]
	ldr	r2, .L23+8
	mov	r3, r0, asl #2
	sub	ip, fp, #12
	add	r3, r3, ip
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-2356]
	add	r3, r2, r3
	str	r3, [r1, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	sub	r3, r0, #1
	str	r3, [fp, #-1196]
.L12:
	ldr	r3, [fp, #-1196]
	cmn	r3, #1
	bne	.L13
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L15
.L10:
	ldr	r2, [fp, #-2352]
	sub	ip, fp, #1760
	sub	ip, ip, #12
	sub	r3, fp, #2336
	sub	r3, r3, #12
	str	r3, [sp, #0]
	ldr	r3, [fp, #-2356]
	str	r3, [sp, #4]
	str	r2, [sp, #8]
	ldr	r0, [fp, #12]
	ldr	r1, [fp, #8]
	ldr	r2, [fp, #16]
	mov	r3, ip
	bl	zx_get_edges_waypoints_turnouts(PLT)
	b	.L16
.L17:
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #4]
	add	r1, r2, r3
	ldr	r0, [fp, #-2352]
	ldr	r2, .L23+8
	mov	r3, r0, asl #2
	sub	ip, fp, #12
	add	r3, r3, ip
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-2356]
	add	r3, r2, r3
	str	r3, [r1, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	sub	r3, r0, #1
	str	r3, [fp, #-2352]
.L16:
	ldr	r3, [fp, #-2352]
	cmn	r3, #1
	bne	.L17
	mov	r3, #2
	str	r3, [fp, #-20]
.L15:
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-16]
	b	.L19
.L20:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #4]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L19:
	ldr	r3, [fp, #-16]
	cmp	r3, #143
	ble	.L20
	ldr	r1, [fp, #-20]
	str	r1, [fp, #-2372]
.L5:
	ldr	r3, [fp, #-2372]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	-1180
	.word	-2336
	.word	-604
	.size	track_calc_shortest_path_from_two_dest, .-track_calc_shortest_path_from_two_dest
	.align	2
	.global	zx_get_edges_waypoints_turnouts
	.type	zx_get_edges_waypoints_turnouts, %function
zx_get_edges_waypoints_turnouts:
	@ args = 12, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L26
.L27:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	ble	.L28
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	sub	r3, r3, #12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	b	.L30
.L28:
	mov	r3, #0
	str	r3, [fp, #-16]
.L30:
	ldr	r3, [fp, #12]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #4]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #12]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #8]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #12]
	sub	r3, r3, #1
	str	r3, [fp, #12]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L31
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L33
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bne	.L35
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-44]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, #20
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #0]
	b	.L38
.L35:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-44]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, #20
	add	r3, r3, #28
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	mov	r3, #1
	str	r3, [r2, #0]
	b	.L38
.L33:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-44]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, #20
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L38:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L39
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #8]
	cmp	r3, #3
	bne	.L41
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L41
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #200
	str	r3, [r2, #4]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r1, r2, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	str	r3, [r1, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L41:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L31
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	cmp	r3, #3
	bne	.L31
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #200
	str	r3, [r2, #4]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r1, r2, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	str	r3, [r1, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	b	.L31
.L39:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #8]
	cmp	r3, #1
	bne	.L31
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	cmp	r3, #1
	bne	.L31
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	eor	r3, r3, #1
	and	r3, r3, #1
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L49
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	add	r2, r3, #1
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L49
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #200
	str	r3, [r2, #4]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r1, r2, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	str	r3, [r1, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	b	.L31
.L49:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	eor	r3, r3, #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L31
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	add	r2, r3, #1
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L31
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #200
	str	r3, [r2, #4]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r1, r2, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	str	r3, [r1, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L31:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-36]
.L26:
	ldr	r3, [fp, #12]
	cmn	r3, #1
	bne	.L27
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	b	.L55
.L56:
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L55:
	ldr	r3, [fp, #-28]
	cmp	r3, #4
	ble	.L56
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	zx_get_edges_waypoints_turnouts, .-zx_get_edges_waypoints_turnouts
	.section	.rodata
	.align	2
.LC0:
	.ascii	"INVALID NODE TYPE\000"
	.text
	.align	2
	.global	zx_shortest_path
	.type	zx_shortest_path, %function
zx_shortest_path:
	@ args = 12, pretend = 0, frame = 784
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #784
	ldr	sl, .L103
.L102:
	add	sl, pc, sl
	str	r0, [fp, #-784]
	str	r1, [fp, #-788]
	str	r2, [fp, #-792]
	str	r3, [fp, #-796]
	ldr	r2, [fp, #4]
	mvn	r3, #0
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-56]
	mvn	r3, #0
	str	r3, [fp, #-52]
	mvn	r3, #0
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-60]
	b	.L60
.L61:
	ldr	r3, [fp, #-60]
	mvn	r2, #187
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #110
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-60]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r2, r2, r3
	mvn	r3, #-268435456
	str	r3, [r2, #0]
	ldr	r3, [fp, #-60]
	ldr	r2, .L103+4
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r2, r3, r2
	ldr	r3, [fp, #-784]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-60]
.L60:
	ldr	r3, [fp, #-60]
	cmp	r3, #143
	ble	.L61
	ldr	r3, [fp, #-784]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #0]
	b	.L101
.L64:
	sub	r3, fp, #204
	ldr	r0, [fp, #-796]
	mov	r1, r3
	bl	find_shortest_distance_node(PLT)
	mov	r3, r0
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	mvn	r2, #187
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #121
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-52]
	cmn	r3, #1
	bne	.L65
	mov	r3, #0
	str	r3, [fp, #-800]
	b	.L67
.L65:
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-788]
	cmp	r2, r3
	bne	.L68
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-788]
	str	r3, [fp, #-36]
	b	.L70
.L71:
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-792]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	ldr	r2, .L103+4
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L70:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-784]
	cmp	r2, r3
	bne	.L71
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-792]
	add	r2, r2, r3
	ldr	r3, [fp, #-784]
	str	r3, [r2, #0]
	ldr	r2, [fp, #4]
	ldr	r3, [fp, #-40]
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-800]
	b	.L67
.L68:
	ldr	r2, [fp, #-52]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #8]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	cmp	r3, #5
	beq	.L63
	ldr	r2, [fp, #-52]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #8]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	cmp	r3, #4
	bne	.L74
	ldr	r2, [fp, #-52]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #8]
	add	r3, r2, r3
	add	r3, r3, #20
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	add	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L63
	ldr	r3, [fp, #-32]
	mvn	r2, #187
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #110
	beq	.L63
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #1
	bne	.L63
	ldr	r3, [fp, #-32]
	ldr	r2, .L103+4
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r2, r3, r2
	ldr	r3, [fp, #-52]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r1, r2, r3
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	add	r3, r2, r3
	str	r3, [r1, #0]
	b	.L63
.L74:
	ldr	r2, [fp, #-52]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #8]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	cmp	r3, #3
	beq	.L80
	ldr	r2, [fp, #-52]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #8]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	cmp	r3, #1
	bne	.L82
.L80:
	ldr	r2, [fp, #-52]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #8]
	add	r3, r2, r3
	add	r3, r3, #20
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	add	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L83
	ldr	r3, [fp, #-28]
	mvn	r2, #187
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #110
	bne	.L83
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #1
	bne	.L83
	ldr	r3, [fp, #-28]
	ldr	r2, .L103+4
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r2, r3, r2
	ldr	r3, [fp, #-52]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r1, r2, r3
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	add	r3, r2, r3
	str	r3, [r1, #0]
.L83:
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #8]
	add	r3, r2, r3
	ldr	r3, [r3, #16]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #12]
	add	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L63
	ldr	r3, [fp, #-28]
	mvn	r2, #187
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #110
	bne	.L63
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #1
	bne	.L63
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r1, r2, r3
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #12]
	add	r3, r2, r3
	str	r3, [r1, #0]
	ldr	r3, [fp, #-28]
	ldr	r2, .L103+4
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r2, r3, r2
	ldr	r3, [fp, #-52]
	str	r3, [r2, #0]
	b	.L63
.L82:
	ldr	r2, [fp, #-52]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #8]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L91
	ldr	r2, [fp, #-52]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #8]
	add	r3, r2, r3
	add	r3, r3, #20
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	add	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L93
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #1
	bne	.L93
	ldr	r3, [fp, #-20]
	ldr	r2, .L103+4
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r2, r3, r2
	ldr	r3, [fp, #-52]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r2, r2, r3
	ldr	r3, [fp, #-48]
	str	r3, [r2, #0]
.L93:
	ldr	r2, [fp, #-52]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #8]
	add	r3, r2, r3
	add	r3, r3, #20
	add	r3, r3, #28
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	add	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L63
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	check_reservation_status(PLT)
	mov	r3, r0
	cmp	r3, #1
	bne	.L63
	ldr	r3, [fp, #-20]
	ldr	r2, .L103+4
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r2, r3, r2
	ldr	r3, [fp, #-52]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-796]
	add	r2, r2, r3
	ldr	r3, [fp, #-48]
	str	r3, [r2, #0]
	b	.L63
.L91:
	mov	r0, #1
	ldr	r3, .L103+8
	add	r3, sl, r3
	mov	r1, r3
	bl	zx_printf(PLT)
.L63:
.L101:
	ldr	r3, [fp, #-56]
	cmp	r3, #143
	ble	.L64
	mov	r3, #0
	str	r3, [fp, #-800]
.L67:
	ldr	r3, [fp, #-800]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L104:
	.align	2
.L103:
	.word	_GLOBAL_OFFSET_TABLE_-(.L102+8)
	.word	-764
	.word	.LC0(GOTOFF)
	.size	zx_shortest_path, .-zx_shortest_path
	.align	2
	.global	find_shortest_distance_node
	.type	find_shortest_distance_node, %function
find_shortest_distance_node:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	mvn	r3, #-268435456
	str	r3, [fp, #-24]
	mvn	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L106
.L107:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #110
	bne	.L108
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L108
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
.L108:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L106:
	ldr	r3, [fp, #-16]
	cmp	r3, #143
	ble	.L107
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	find_shortest_distance_node, .-find_shortest_distance_node
	.ident	"GCC: (GNU) 4.0.2"
