.text
	li t0, 100      # r
	li t1, 0   	# a
	li t2, 3   	# p
	#li t3, 0  	# contador de a
	#li t4, 3   	# contador de p
	li t5, 361 	# limite a
	li t6, 16  	# limite r
	la s5, testeinput
forTEXEC:
	bge t1, t5, fimTEXE
	li t2, 3
	j for2T
LABELT:
	addi t1,t1, 15
	j forTEXEC

for2T:
	bge t2, t6, LABELT
	sw t0, 0(s5)
	#printint(t0)
	#printchar(32)
	sw t1, 4(s5)
	#printint(t1)
	#printchar(32)
	sw t2, 8(s5)
	#printint(t2)
	#printchar(32)
	#printchar(10)
	addi sp,sp,-8
	sw t5,0(sp)
	sw t6,4(sp)
	printint(t0)
	printchar(32)
	printint(t1)
	printchar(32)
	printint(t2)
	printchar(32)
	printchar(10)
	jal main
	lw t5,0(sp)
	lw t6,4(sp)
	addi sp,sp,8
	la s5, testeinput
	lw t0,0(s5)
	lw t1,4(s5)
	lw t2,8(s5)
	addi t2, t2, 1
	j for2T

fimTEXE:
	li a7, 10
	ecall