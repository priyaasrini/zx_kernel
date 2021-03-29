	.file	"zx_project_train_functions.c"
	.text
	.align	2
	.global	train_init
	.type	train_init, %function
train_init:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #12]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #48]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #48]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #44]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #44]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #52]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #60]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #60]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #56]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #56]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #64]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #68]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #132]
	ldr	r2, [fp, #-20]
	mov	r3, #35
	str	r3, [r2, #136]
	ldr	r2, [fp, #-20]
	mov	r3, #80
	str	r3, [r2, #140]
	ldr	r2, [fp, #-20]
	mov	r3, #130
	str	r3, [r2, #144]
	ldr	r2, [fp, #-20]
	mov	r3, #180
	str	r3, [r2, #148]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #72]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #76]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #252]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #256]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #260]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #264]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #268]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #272]
	ldr	r3, [fp, #-24]
	cmp	r3, #49
	bne	.L2
	ldr	r2, [fp, #-20]
	ldr	r3, .L28
	str	r3, [r2, #80]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+4
	str	r3, [r2, #84]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+8
	str	r3, [r2, #88]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+12
	str	r3, [r2, #92]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+16
	str	r3, [r2, #96]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+20
	str	r3, [r2, #100]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+24
	str	r3, [r2, #104]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+28
	str	r3, [r2, #108]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+32
	str	r3, [r2, #112]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+36
	str	r3, [r2, #116]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+40
	str	r3, [r2, #120]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+44
	str	r3, [r2, #124]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+48
	str	r3, [r2, #128]
	ldr	r2, [fp, #-20]
	mov	r3, #235
	str	r3, [r2, #152]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+52
	str	r3, [r2, #156]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+56
	str	r3, [r2, #160]
	ldr	r2, [fp, #-20]
	mov	r3, #404
	str	r3, [r2, #164]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+60
	str	r3, [r2, #168]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+64
	str	r3, [r2, #172]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+68
	str	r3, [r2, #176]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+72
	str	r3, [r2, #180]
	ldr	r2, [fp, #-20]
	mov	r3, #684
	str	r3, [r2, #184]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+76
	str	r3, [r2, #188]
	ldr	r2, [fp, #-20]
	mov	r3, #250
	str	r3, [r2, #276]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+80
	str	r3, [r2, #280]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+84
	str	r3, [r2, #284]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+88
	str	r3, [r2, #288]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+92
	str	r3, [r2, #292]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+96
	str	r3, [r2, #296]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+100
	str	r3, [r2, #300]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+104
	str	r3, [r2, #304]
	ldr	r2, [fp, #-20]
	mov	r3, #276
	str	r3, [r2, #308]
.L2:
	ldr	r3, [fp, #-24]
	cmp	r3, #50
	bne	.L4
	ldr	r2, [fp, #-20]
	ldr	r3, .L28
	str	r3, [r2, #80]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+4
	str	r3, [r2, #84]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+8
	str	r3, [r2, #88]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+12
	str	r3, [r2, #92]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+16
	str	r3, [r2, #96]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+20
	str	r3, [r2, #100]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+24
	str	r3, [r2, #104]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+28
	str	r3, [r2, #108]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+32
	str	r3, [r2, #112]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+36
	str	r3, [r2, #116]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+40
	str	r3, [r2, #120]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+44
	str	r3, [r2, #124]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+48
	str	r3, [r2, #128]
	ldr	r2, [fp, #-20]
	mov	r3, #222
	str	r3, [r2, #152]
	ldr	r2, [fp, #-20]
	mov	r3, #272
	str	r3, [r2, #156]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+108
	str	r3, [r2, #160]
	ldr	r2, [fp, #-20]
	mov	r3, #384
	str	r3, [r2, #164]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+112
	str	r3, [r2, #168]
	ldr	r2, [fp, #-20]
	mov	r3, #492
	str	r3, [r2, #172]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+116
	str	r3, [r2, #176]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+120
	str	r3, [r2, #180]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+124
	str	r3, [r2, #184]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+128
	str	r3, [r2, #188]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+132
	str	r3, [r2, #276]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+136
	str	r3, [r2, #280]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+140
	str	r3, [r2, #284]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+144
	str	r3, [r2, #288]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+148
	str	r3, [r2, #292]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+152
	str	r3, [r2, #296]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+156
	str	r3, [r2, #300]
	ldr	r2, [fp, #-20]
	ldr	r3, .L28+160
	str	r3, [r2, #304]
	ldr	r2, [fp, #-20]
	mov	r3, #324
	str	r3, [r2, #308]
.L4:
	ldr	r3, [fp, #-20]
	mov	r2, #1
	str	r2, [r3, #492]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L6
.L7:
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r0, #312
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r0, #316
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r0, #320
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L6:
	ldr	r3, [fp, #-16]
	cmp	r3, #14
	ble	.L7
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L9
.L10:
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r0, #512
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r0, #516
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r0, #520
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L9:
	ldr	r3, [fp, #-16]
	cmp	r3, #4
	ble	.L10
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L12
.L13:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r1, #1728
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L12:
	ldr	r3, [fp, #-16]
	cmp	r3, #2
	ble	.L13
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L15
.L16:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r1, #576
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r1, #1152
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L15:
	ldr	r3, [fp, #-16]
	cmp	r3, #143
	ble	.L16
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L18
.L19:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r1, .L28+164
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L18:
	ldr	r3, [fp, #-16]
	cmp	r3, #156
	ble	.L19
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L21
.L22:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r1, #2368
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L21:
	ldr	r3, [fp, #-16]
	cmp	r3, #156
	ble	.L22
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L24
.L25:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r1, .L28+168
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L24:
	ldr	r3, [fp, #-16]
	cmp	r3, #49
	ble	.L25
	ldr	r2, [fp, #-20]
	mov	r3, #1
	str	r3, [r2, #2996]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #572]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #496]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #3000]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #3004]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #3008]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #3012]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #3236]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #3240]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #3032]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #3244]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L29:
	.align	2
.L28:
	.word	4987
	.word	12500
	.word	19450
	.word	25550
	.word	32487
	.word	41100
	.word	46737
	.word	52437
	.word	58925
	.word	66787
	.word	73837
	.word	81662
	.word	81975
	.word	290
	.word	347
	.word	466
	.word	523
	.word	582
	.word	650
	.word	686
	.word	338
	.word	357
	.word	359
	.word	371
	.word	337
	.word	319
	.word	277
	.word	331
	.word	443
	.word	534
	.word	583
	.word	646
	.word	638
	.word	346
	.word	385
	.word	403
	.word	393
	.word	386
	.word	363
	.word	378
	.word	314
	.word	1740
	.word	3036
	.size	train_init, .-train_init
	.align	2
	.global	train_commit_reverse
	.type	train_commit_reverse, %function
train_commit_reverse:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #60
	str	r0, [fp, #-72]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mvn	r2, #53
	sub	r1, fp, #12
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #15
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #0]
	and	r0, r3, #255
	mvn	r2, #53
	sub	ip, fp, #12
	add	r3, ip, r1
	add	r2, r3, r2
	mov	r3, r0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mvn	r2, #53
	sub	r1, fp, #12
	add	r3, r1, r3
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	sub	r3, fp, #66
	mov	r0, #0
	mov	r1, r3
	bl	PutMultiple(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_commit_reverse, .-train_commit_reverse
	.align	2
	.global	train_commit
	.type	train_commit, %function
train_commit:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #60
	str	r0, [fp, #-72]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #68]
	and	r0, r3, #255
	mvn	r2, #53
	sub	ip, fp, #12
	add	r3, ip, r1
	add	r2, r3, r2
	mov	r3, r0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #0]
	and	r0, r3, #255
	mvn	r2, #53
	sub	ip, fp, #12
	add	r3, ip, r1
	add	r2, r3, r2
	mov	r3, r0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mvn	r2, #53
	sub	r1, fp, #12
	add	r3, r1, r3
	add	r2, r3, r2
	mvn	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	sub	r3, fp, #66
	mov	r0, #0
	mov	r1, r3
	bl	PutMultiple(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_commit, .-train_commit
	.align	2
	.global	train_set_speed
	.type	train_set_speed, %function
train_set_speed:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	bl	Time(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #64]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #48]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #52]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #68]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L35
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	bl	train_calc_accelerating_delay(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #56]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	mov	r1, #132
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #48]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #68]
	ldr	r2, [fp, #-20]
	mov	r3, #1
	str	r3, [r2, #40]
	b	.L37
.L35:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #68]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	ble	.L37
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	bl	train_calc_deccelerating_delay(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #56]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	mov	r1, #132
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #48]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #68]
	ldr	r2, [fp, #-20]
	mov	r3, #3
	str	r3, [r2, #40]
.L37:
	ldr	r0, [fp, #-20]
	bl	train_commit(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_set_speed, .-train_set_speed
	.align	2
	.global	train_update_velocity_and_offset
	.type	train_update_velocity_and_offset, %function
train_update_velocity_and_offset:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-28]
	bl	Time(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #52]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #44]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #64]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #60]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #64]
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #56]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L41
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #40]
	cmp	r3, #1
	beq	.L43
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #40]
	cmp	r3, #3
	bne	.L41
.L43:
	mov	r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #56]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #64]
.L41:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L45
	ldr	r0, [fp, #-28]
	bl	train_find_velocity_and_distance_in_delta(PLT)
	b	.L47
.L45:
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #36]
.L47:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L56
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #36]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #48]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #52]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #52]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #44]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #64]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #60]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #68]
	cmp	r3, #0
	bne	.L50
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #40]
	b	.L52
.L50:
	ldr	r2, [fp, #-28]
	mov	r3, #2
	str	r3, [r2, #40]
.L52:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #64]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L53
	ldr	r0, [fp, #-28]
	bl	train_find_velocity_and_distance_in_delta(PLT)
	b	.L55
.L53:
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #36]
.L55:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #36]
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #36]
.L56:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_update_velocity_and_offset, .-train_update_velocity_and_offset
	.align	2
	.global	train_update_expected_sensors_rec
	.type	train_update_expected_sensors_rec, %function
train_update_expected_sensors_rec:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #44
	str	r0, [fp, #-44]
	str	r1, [fp, #-48]
	str	r2, [fp, #-52]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-40]
	mvn	r3, #0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	beq	.L76
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L60
.L61:
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-44]
	mov	r0, #316
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L62
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-36]
	b	.L64
.L62:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L60:
	ldr	r3, [fp, #-32]
	cmp	r3, #14
	ble	.L61
.L64:
	ldr	r3, [fp, #-36]
	cmn	r3, #1
	beq	.L76
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-24]
	b	.L66
.L67:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	cmp	r3, #1
	bne	.L68
	ldr	r2, [fp, #-36]
	ldr	r1, [fp, #-44]
	mov	r0, #316
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	ldr	r3, [fp, #-40]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-36]
	ldr	r1, [fp, #-44]
	mov	r0, #320
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #3
	beq	.L76
	ldr	r3, [fp, #-36]
	cmp	r3, #15
	beq	.L76
	b	.L72
.L68:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L72
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #32]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #60]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-52]
	sub	r3, r3, #1
	ldr	r0, [fp, #-44]
	mov	r1, r2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	train_update_expected_sensors_rec(PLT)
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #56]
	ldr	r3, [fp, #-52]
	sub	r3, r3, #1
	ldr	r0, [fp, #-44]
	mov	r1, r2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	bl	train_update_expected_sensors_rec(PLT)
	b	.L76
.L72:
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #496]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bne	.L74
	ldr	r2, [fp, #-44]
	mov	r3, #1
	str	r3, [r2, #508]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #500]
.L74:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #32]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	str	r3, [fp, #-40]
.L66:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	cmp	r3, #5
	bne	.L67
.L76:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_update_expected_sensors_rec, .-train_update_expected_sensors_rec
	.align	2
	.global	train_update_expected_sensors
	.type	train_update_expected_sensors, %function
train_update_expected_sensors:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L78
.L79:
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r0, #312
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r0, #316
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r0, #320
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L78:
	ldr	r3, [fp, #-24]
	cmp	r3, #14
	ble	.L79
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L83
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #16]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #16]
	ldr	r2, [r3, #12]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #12]
	rsb	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-20]
	mov	r2, #2
	ldr	r3, [fp, #-16]
	bl	train_update_expected_sensors_rec(PLT)
.L83:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_update_expected_sensors, .-train_update_expected_sensors
	.align	2
	.global	train_get_run_speed_from_distance
	.type	train_get_run_speed_from_distance, %function
train_get_run_speed_from_distance:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #10
	str	r3, [fp, #-20]
	b	.L85
.L86:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	mov	r1, #72
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #1
	add	r3, r3, #19968
	add	r3, r3, #32
	ldr	r2, [fp, #-28]
	cmp	r3, r2
	bgt	.L87
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-16]
	b	.L89
.L87:
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L85:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L86
.L89:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_get_run_speed_from_distance, .-train_get_run_speed_from_distance
	.align	2
	.global	train_stop_task
	.type	train_stop_task, %function
train_stop_task:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	mov	r3, #0
	str	r3, [fp, #-20]
.L92:
	sub	r3, fp, #20
	sub	r2, fp, #28
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r3, [fp, #-20]
	sub	r2, fp, #28
	mov	r0, r3
	mov	r1, r2
	mov	r2, #8
	bl	Reply(PLT)
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bge	.L93
	ldr	r0, [fp, #-16]
	mov	r1, #0
	bl	train_set_speed(PLT)
	ldr	r2, [fp, #-16]
	mov	r3, #1
	str	r3, [r2, #3244]
	bl	Exit(PLT)
	b	.L95
.L93:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	bl	Delay(PLT)
	ldr	r0, [fp, #-16]
	mov	r1, #0
	bl	train_set_speed(PLT)
	b	.L92
.L95:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_stop_task, .-train_stop_task
	.align	2
	.global	train_update_vertices_by_distance_traveled
	.type	train_update_vertices_by_distance_traveled, %function
train_update_vertices_by_distance_traveled:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #36]
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #36]
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #28]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #20]
	b	.L114
.L98:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	ldr	r2, [r3, #12]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-28]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-32]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L99
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L101
	ldr	r3, [fp, #-24]
	add	r2, r3, #20
	ldr	r3, [fp, #-32]
	str	r2, [r3, #16]
	b	.L97
.L101:
	ldr	r3, [fp, #-24]
	add	r3, r3, #20
	add	r2, r3, #28
	ldr	r3, [fp, #-32]
	str	r2, [r3, #16]
	b	.L97
.L99:
	ldr	r3, [fp, #-24]
	add	r2, r3, #20
	ldr	r3, [fp, #-32]
	str	r2, [r3, #16]
.L97:
.L114:
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	ldr	r2, [r3, #12]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	cmp	r1, r3
	bge	.L98
	b	.L115
.L106:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #32]
	ldr	r2, [r3, #12]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #32]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #24]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-20]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-32]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L107
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L109
	ldr	r3, [fp, #-16]
	add	r2, r3, #20
	ldr	r3, [fp, #-32]
	str	r2, [r3, #32]
	b	.L105
.L109:
	ldr	r3, [fp, #-16]
	add	r3, r3, #20
	add	r2, r3, #28
	ldr	r3, [fp, #-32]
	str	r2, [r3, #32]
	b	.L105
.L107:
	ldr	r3, [fp, #-16]
	add	r2, r3, #20
	ldr	r3, [fp, #-32]
	str	r2, [r3, #32]
.L105:
.L115:
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #32]
	ldr	r2, [r3, #12]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	cmp	r1, r3
	bge	.L106
	ldr	r0, [fp, #-32]
	bl	train_update_edges(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_update_vertices_by_distance_traveled, .-train_update_vertices_by_distance_traveled
	.align	2
	.global	train_reverse
	.type	train_reverse, %function
train_reverse:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #24]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #16]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #28]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	ldr	r2, [r3, #12]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-32]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #32]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #32]
	ldr	r2, [r3, #12]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #28]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-32]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #32]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #24]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #492]
	rsb	r2, r3, #0
	ldr	r3, [fp, #-32]
	str	r2, [r3, #492]
	ldr	r0, [fp, #-32]
	bl	train_update_expected_sensors(PLT)
	ldr	r0, [fp, #-32]
	bl	train_update_edges(PLT)
	ldr	r0, [fp, #-32]
	bl	train_commit_reverse(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_reverse, .-train_reverse
	.align	2
	.global	train_next_waypoint
	.type	train_next_waypoint, %function
train_next_waypoint:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L119
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #572]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #572]
	b	.L121
.L119:
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #572]
.L121:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #572]
	cmp	r3, #4
	bgt	.L122
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #572]
	ldr	r1, [fp, #-16]
	mov	r0, #512
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L122
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #572]
	ldr	r1, [fp, #-16]
	mov	r0, #512
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #496]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #572]
	ldr	r1, [fp, #-16]
	mov	r0, #520
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #500]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #572]
	ldr	r1, [fp, #-16]
	mov	r0, #516
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #504]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #508]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L125
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #500]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	ldr	r2, [r3, #12]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	rsb	r3, r3, r2
	add	r2, r1, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #500]
.L125:
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L127
.L122:
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #496]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #508]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #500]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #504]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #572]
	mov	r3, #0
	str	r3, [fp, #-24]
.L127:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_next_waypoint, .-train_next_waypoint
	.align	2
	.global	train_update_edges
	.type	train_update_edges, %function
train_update_edges:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1728]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1732]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1732]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1728]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	beq	.L130
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1732]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1728]
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L132
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1732]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1728]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L132
.L130:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #1736]
	b	.L142
.L132:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #32]
	ldr	r3, [r3, #8]
	add	r3, r3, #20
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #16]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L135
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #1736]
	b	.L142
.L135:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #32]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L137
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #32]
	ldr	r3, [r3, #8]
	add	r3, r3, #20
	add	r3, r3, #28
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #16]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L139
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #1736]
	b	.L142
.L139:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #1736]
	b	.L142
.L137:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #1736]
.L142:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_update_edges, .-train_update_edges
	.align	2
	.global	train_sensor_search_rec
	.type	train_sensor_search_rec, %function
train_sensor_search_rec:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L144
.L145:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #1
	bne	.L146
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L148
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L150
.L148:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #3
	beq	.L151
	b	.L153
.L146:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L153
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #28]
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	train_sensor_search_rec(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L155
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #56]
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	train_sensor_search_rec(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L157
.L155:
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L158
.L157:
	mov	r3, #0
	str	r3, [fp, #-32]
.L158:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-36]
	b	.L150
.L153:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #28]
	str	r3, [fp, #-20]
.L144:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #5
	bne	.L145
.L151:
	mov	r3, #0
	str	r3, [fp, #-36]
.L150:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_sensor_search_rec, .-train_sensor_search_rec
	.align	2
	.global	train_adjust_position_by_sensor_toggle
	.type	train_adjust_position_by_sensor_toggle, %function
train_adjust_position_by_sensor_toggle:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #52
	str	r0, [fp, #-52]
	str	r1, [fp, #-56]
	str	r2, [fp, #-60]
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #492]
	cmp	r3, #0
	ble	.L161
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-56]
	str	r3, [r2, #8]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-60]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-52]
	ldr	r3, .L181
	str	r3, [r2, #12]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #8]
	add	r2, r3, #20
	ldr	r3, [fp, #-52]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #16]
	add	r3, r3, #20
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #179
	ble	.L163
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-52]
	str	r2, [r3, #24]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-60]
	str	r3, [r2, #20]
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #12]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	sub	r3, r3, #17920
	sub	r3, r3, #80
	ldr	r2, [fp, #-52]
	str	r3, [r2, #28]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-44]
	str	r3, [r2, #32]
	b	.L171
.L163:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	beq	.L166
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-44]
	b	.L168
.L166:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #56]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #3000]
	ldr	r3, [r3, #16]
	mov	r0, r2
	mov	r1, r3
	bl	train_sensor_search_rec(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L169
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #48]
	str	r3, [fp, #-44]
	b	.L168
.L169:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-44]
.L168:
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-52]
	str	r2, [r3, #24]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-60]
	str	r3, [r2, #20]
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	sub	r3, r3, #17920
	sub	r3, r3, #80
	ldr	r2, [fp, #-52]
	str	r3, [r2, #28]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-44]
	str	r3, [r2, #32]
	b	.L171
.L161:
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #16]
	add	r3, r3, #20
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-52]
	str	r2, [r3, #24]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-60]
	str	r3, [r2, #20]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #12]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	sub	r3, r3, #3488
	sub	r3, r3, #12
	ldr	r2, [fp, #-52]
	str	r3, [r2, #28]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #32]
	ldr	r3, [fp, #-56]
	add	r3, r3, #20
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	cmp	r3, #179
	ble	.L172
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-56]
	str	r3, [r2, #8]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-60]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-52]
	ldr	r3, .L181+4
	str	r3, [r2, #12]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #16]
	b	.L171
.L172:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L174
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #12]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L176
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	add	r3, r3, #20
	str	r3, [fp, #-16]
	b	.L179
.L176:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	add	r3, r3, #20
	add	r3, r3, #28
	str	r3, [fp, #-16]
	b	.L179
.L174:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	add	r3, r3, #20
	str	r3, [fp, #-16]
.L179:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-52]
	str	r2, [r3, #8]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-60]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	rsb	r2, r3, #180
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-52]
	str	r2, [r3, #12]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #16]
.L171:
	ldr	r0, [fp, #-52]
	bl	train_update_edges(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L182:
	.align	2
.L181:
	.word	3500
	.word	18000
	.size	train_adjust_position_by_sensor_toggle, .-train_adjust_position_by_sensor_toggle
	.global	__divsi3
	.align	2
	.global	train_calibrate_velocity
	.type	train_calibrate_velocity, %function
train_calibrate_velocity:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #3008]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bge	.L194
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #3012]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #52]
	cmp	r2, r3
	bne	.L194
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #3000]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bne	.L194
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #3000]
	ldr	r3, [r3, #0]
	cmp	r3, #46
	bne	.L188
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	cmp	r3, #59
	beq	.L190
.L188:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #3000]
	ldr	r3, [r3, #0]
	cmp	r3, #51
	bne	.L191
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	cmp	r3, #21
	beq	.L190
.L191:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #3000]
	ldr	r3, [r3, #0]
	cmp	r3, #16
	bne	.L194
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	cmp	r3, #61
	bne	.L194
.L190:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #68]
	ldr	r2, [fp, #-28]
	mov	r1, #132
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #3000]
	ldr	r2, [r3, #32]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r1, r3
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #3008]
	ldr	r3, [fp, #-36]
	rsb	r3, r2, r3
	mov	r0, r1
	mov	r1, r3
	bl	__divsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r2, r3, r2
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	add	r2, r3, #3
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #68]
	ldr	r2, [fp, #-28]
	mov	r1, #132
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
.L194:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_calibrate_velocity, .-train_calibrate_velocity
	.ident	"GCC: (GNU) 4.0.2"
