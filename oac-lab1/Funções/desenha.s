desenha:
	mv s0,a0
	mv s1,a1
	li s4,4
	slli t2, s4, 2
	add t2,t2,s0
	lw s2,-12(t2)
	lw s3, -8(t2)
ford:	bge s4,s1,fim
	slli t1,s4,2
	add t1,t1,s0
	lw a0, -12(t1)
	lw a1, -8(t1)
	lw a2, -4(t1)
	lw a3, 0(t1)
	li a4, 0x070707
	li a5, 0
	addi a0,a0,160
	addi a2,a2,160
	li t1,120
	sub a1,t1,a1
	sub a3,t1,a3
	li a7, 47
	ecall		
	addi s4,s4,2
	j ford
fim:
	li t1,120
	sub s3,t1,s3
	addi s2,s2,160
	mv a0,s2
	mv a1,s3
	li a7, 47
	ecall
	ret
