######################################################################
#                                                                    #
# Alunos: Enzo, Guilherme, Yudi                                      #
# Turma: OAC                                                         #
# Os comentários vão ser o código do goldbolt, antes de ser          #
# modificado para ser montado no RARS                                #
#                                                                    #
######################################################################

.data
v:
        .word   9
        .word   2
        .word   5
        .word   1
        .word   8
        .word   2
        .word   4
        .word   3
        .word   6
        .word   7
        .word   10
        .word   2
        .word   32
        .word   54
        .word   2
        .word   12
        .word   6
        .word   3
        .word   1
        .word   78
        .word   54
        .word   23
        .word   1
        .word   54
        .word   2
        .word   65
        .word   3
        .word   6
        .word   55
        .word   31
.LC0:			   #vamos usar o procedimento SHOW como sugerido pelo Lamar
        .string "%d\t"
.text
	jal main
	li a7, 10
	ecall
show:
        addi    sp,sp,-48
        sw	ra,40(sp)	# sd      ra,40(sp)
        sw	s0,32(sp)	# sd      s0,32(sp)
        addi    s0,sp,48
        sw	a0,-40(s0)	# sd      a0,-40(s0)
        mv      a5,a1
        sw      a5,-44(s0)
        sw      zero,-20(s0)
.L3:
        lw      a4,-20(s0)
        lw      a5,-44(s0)
        # sext.w  a4,a4		extende pra 64bits
        # sext.w  a5,a5		extende pra 64bits
        bge     a4,a5,.L2
        lw      a5,-20(s0)	# carrega a posicao pra printar
        slli    a5,a5,2
        lw      a4,-40(s0)	# ld      a4,-40(s0) # carrega end inicial de v
        add     a5,a4,a5		
        lw      a5,0(a5)		# carrega o valor em a5
        mv      a0,a5
        #lui     a5,%hi(.LC0)
        #addi    a0,a5,%lo(.LC0)
        li a7, 1
        ecall
        li a7, 11
        li a0, 9
        ecall
        # call    printf
        lw      a5,-20(s0)
        addi   a5,a5,1
        sw      a5,-20(s0)
        j       .L3
.L2:
        li a7,11
	li a0,10	
	ecall			# call    putchar
        nop
        lw	ra,40(sp)	# ld      ra,40(sp)
        lw	s0,32(sp)	# ld      s0,32(sp)
        addi    sp,sp,48
        jr      ra
swap:
        addi    sp,sp,-48
        sw	s0,40(sp)	# sd      s0,40(sp)
        addi    s0,sp,48
        sw	a0,-40(s0)	# sd      a0,-40(s0)
        mv      a5,a1
        sw      a5,-44(s0)
        lw      a5,-44(s0)
        slli    a5,a5,2
        lw	a4,-40(s0)	# ld      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        sw      a5,-20(s0)
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a5,a5,2
        lw	a4,-40(s0)	# ld      a4,-40(s0)
        add     a4,a4,a5
        lw      a5,-44(s0)
        slli    a5,a5,2
        lw	a3,-40(s0)	# ld      a3,-40(s0)
        add     a5,a3,a5
        lw      a4,0(a4)
        sw      a4,0(a5)
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a5,a5,2
        lw	a4,-40(s0)	# ld      a4,-40(s0)
        add     a5,a4,a5
        lw      a4,-20(s0)
        sw      a4,0(a5)
        nop
        lw	s0,40(sp)	# ld      s0,40(sp)
        addi    sp,sp,48
        jr      ra
sort:
        addi    sp,sp,-48
        sw	ra,40(sp)	# sd      ra,40(sp)
        sw	s0,32(sp)	# sd      s0,32(sp)
        addi    s0,sp,48
        sw	a0,-40(s0)	# sd      a0,-40(s0)
        mv      a5,a1
        sw      a5,-44(s0)
        sw      zero,-20(s0)
.L9:
        lw      a4,-20(s0)
        lw      a5,-44(s0)
        # sext.w  a4,a4
        # sext.w  a5,a5
        bge     a4,a5,.L10
        lw      a5,-20(s0)
        addi   a5,a5,-1
        sw      a5,-24(s0)
.L8:
        lw      a5,-24(s0)
        # sext.w  a5,a5
        bltz    a5,.L7
        lw      a5,-24(s0)
        slli    a5,a5,2
        lw	a4,-40(s0)	# ld      a4,-40(s0)
        add     a5,a4,a5
        lw      a3,0(a5)
        lw      a5,-24(s0)
        addi    a5,a5,1
        slli    a5,a5,2
        lw	a4,-40(s0)	# ld      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        mv      a4,a3
        ble     a4,a5,.L7
        lw      a5,-24(s0)
        mv      a1,a5
        lw	a0,-40(s0)	# ld      a0,-40(s0)
        call    swap
        lw      a5,-24(s0)
        addi    a5,a5,-1
        sw      a5,-24(s0)
        j       .L8
.L7:
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
        j       .L9
.L10:
        nop
        lw	ra,40(sp)	# ld      ra,40(sp)
        lw	s0,32(sp)	# ld      s0,32(sp)
        addi    sp,sp,48
        jr      ra
main:
        addi    sp,sp,-16
        sw	ra,8(sp)		# sd      ra,8(sp)
        sw	s0,0(sp)		# sd      s0,0(sp)
        addi    s0,sp,16
        li      a1,30
        lui     a5,%hi(v)
        addi    a0,a5,%lo(v)
        call    show
        li      a1,30
        lui     a5,%hi(v)
        addi    a0,a5,%lo(v)
        call    sort
        li      a1,30
        lui     a5,%hi(v)
        addi    a0,a5,%lo(v)
        call    show
        li      a5,0
        mv      a0,a5
        lw	ra,8(sp)		# ld      ra,8(sp)
        lw	s0,0(sp)		# ld      s0,0(sp)
        addi    sp,sp,16
        jr      ra