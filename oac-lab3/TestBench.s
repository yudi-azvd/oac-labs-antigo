.data 
	data_0: .word 1, 2, 3, 4
	data_1: .word 5, 6, 7, 8

.text
# ignorar na FPGA
la a0, data_0
la a1, data_1
# ignorar na FPGA

lw t0, 0(a0)    	# t0 = 1; a0 vai ser carregado com endr de memoria. 
lw t1, 4(a1)			# t1 = 6; a1 vai ser carregado com endr de memoria. 
add t2, t1, t1		# t2 = 6 + 6   = 12
sub t3, t2, t0		# t3 = 12 - 1  = 11
and	t4, t0, t1		# t4 = 1 AND 6 = 0b0000
or	t5, t0, t1		# t5 = 1 OR 6  = 0b0111
slt t6, t0, t1		# t6 = 1 < 6 ? = 1
jal ra, A_LABEL		

EQUALS:
	beq t0, t1, EQUALS 	# t0 deve ser diferente de t1
	sw t3, 0(a1)			 	# data_1[0] = 0b0111 = 11
	sw t4, 4(a1)			 	# data_1[1] = 0b0111 = 0
	sw t5, 8(a1)			 	# data_1[2] = 0b0111 = 7
	sw t6, 12(a1)			 	# data_1[3] = 0b0111 = 1
	jal ra, EXIT

A_LABEL:
	beq t0, t0, EQUALS
	
EXIT:
	add a0, zero, zero
	add a1, zero, zero	
