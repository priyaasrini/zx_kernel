	.file	"zx_project_calibration.c"
	.global	__divsi3
	.text
	.align	2
	.global	train_get_stopping_delay
	.type	train_get_stopping_delay, %function
train_get_stopping_delay:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	mov	r1, #132
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L2
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L4
.L2:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	mov	r1, #72
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	mov	r0, r3, asl #1
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	mov	r1, #132
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	mov	r1, r3
	bl	__divsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
.L4:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_get_stopping_delay, .-train_get_stopping_delay
	.align	2
	.global	train_calc_deccelerating_delay
	.type	train_calc_deccelerating_delay, %function
train_calc_deccelerating_delay:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #5
	bne	.L7
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #68]
	ldr	r2, [fp, #-16]
	mov	r1, #252
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	b	.L9
.L7:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #68]
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	train_get_stopping_delay(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
.L9:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_calc_deccelerating_delay, .-train_calc_deccelerating_delay
	.align	2
	.global	train_calc_accelerating_delay
	.type	train_calc_accelerating_delay, %function
train_calc_accelerating_delay:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #68]
	cmp	r3, #5
	bne	.L12
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	mov	r1, #252
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	b	.L14
.L12:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #68]
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	train_get_stopping_delay(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
.L14:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_calc_accelerating_delay, .-train_calc_accelerating_delay
	.align	2
	.global	train_find_velocity_and_distance_in_delta
	.type	train_find_velocity_and_distance_in_delta, %function
train_find_velocity_and_distance_in_delta:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #60
	str	r0, [fp, #-72]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #44]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #48]
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-72]
	ldr	r2, [r3, #56]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #60]
	rsb	r3, r3, r2
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-72]
	ldr	r2, [r3, #64]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #60]
	rsb	r3, r3, r2
	str	r3, [fp, #-56]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-60]
	mul	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-60]
	mul	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-60]
	mul	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-56]
	mul	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-56]
	mul	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-56]
	mul	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-68]
	rsb	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-28]
	mul	r2, r3, r2
	ldr	r3, [fp, #-32]
	mul	r3, r2, r3
	rsb	r2, r3, #0
	ldr	r3, [fp, #-44]
	mov	r3, r3, asl #1
	mov	r0, r2
	mov	r1, r3
	bl	__divsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-28]
	mul	r2, r3, r2
	ldr	r3, [fp, #-36]
	mul	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-48]
	bl	__divsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-68]
	mul	r2, r3, r2
	ldr	r3, [fp, #-56]
	mul	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-60]
	bl	__divsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-72]
	str	r2, [r3, #36]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-36]
	mul	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #31
	rsb	r3, r2, r3
	mov	r3, r3, asl #1
	mov	r0, r3
	ldr	r1, [fp, #-48]
	bl	__divsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-40]
	mul	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r0, r3
	ldr	r1, [fp, #-52]
	bl	__divsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-68]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-72]
	str	r2, [r3, #52]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_find_velocity_and_distance_in_delta, .-train_find_velocity_and_distance_in_delta
	.ident	"GCC: (GNU) 4.0.2"
