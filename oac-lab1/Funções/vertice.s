vertices:
	#seno cos e rad mandam e recebem fa0
	addi sp,sp,-8
	sw ra,0(sp)
	sw s0, 4(sp)
	mv s0, a0
	mv s1, a1
	mv s2, a2
	la s3, VET
	mv s5,s3
	addi s5,s5,4
	sw s2, 0(s3)
	li s4, 0
loopv:
	bge s4,s2, fimv
	fcvt.s.w fa0, s1
	call rad
	call coseno
	fcvt.s.w ft0, s0
	fmul.s fa0,fa0,ft0
	fcvt.w.s t0, fa0
	sw t0,0(s5)
	addi s5,s5,4
	#
	fcvt.s.w fa0, s1
	call rad
	call seno
	fcvt.s.w ft0, s0
	fmul.s fa0,fa0,ft0
	fcvt.w.s t0, fa0
	sw t0,0(s5)
	addi s5,s5,4
	li t0,360
	div t1,t0,s2
	add s1,t1,s1
	rem s1,s1,t0
	addi s4,s4,1
	j loopv		
fimv:
	lw ra, 0(sp)
	lw s0, 4(sp)
	addi sp,sp,8
	ret