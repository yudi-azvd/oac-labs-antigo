.include "MACROSv21.s"

.macro printint(%x)
	li a7,1
	mv a0, %x
	ecall
.end_macro

.macro printchar(%x)
	li a7,11
	li a0, %x
	ecall
.end_macro

.data
VET: .space 1000

.LC2:
        .word   1078530010
.LC3:
        .word   1135869952
.LC4:
        .word   1119092736
testeinput: .space 12
inputs: .space 12
newl: .string "\n"
tab: .string " "
req: .string "r="
aeq: .string "a="
peq: .string "p="
par1: .string "("
par2: .string ")\n"
vr: .string ","

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
main:
	#jal 	lerInput
	la 	s5,testeinput
	la 	t0, inputs
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        li      a5,10 # AQUI A GENTE DEFINE O RAIO
        #lw 	a5,0(t0) #INPUT PRO RAIO
        lw	a5,0(s5) #tester input raio
        sw      a5,-20(s0)
        lui     a5,%hi(.LC4)
        flw     fa5,%lo(.LC4)(a5)
        lw 	t1,4(t0) 
        #fcvt.s.w fa5, t1 #INPUT PRO A
        lw 	t2,4(s5) #tester input A
        fcvt.s.w fa5, t2
        fsw     fa5,-24(s0) # AQUI A GENTE DEFINE O A
        li      a5,3 # AQUI A GENTE DEFINE O P
        #lw 	a5,8(t0) #INPUT PRO P
        lw	a5,8(s5) #tester input p
        sw      a5,-28(s0)
        flw     fa5,-24(s0)
        fcvt.w.s a5,fa5,rtz
        lw      a2,-28(s0)
        mv      a1,a5
        lw      a0,-20(s0)
        csrr s8,3073
        call    vertices
        csrr s9,3073
        sub s9, s9, s8
        li      a5,0
        mv      a0,a5
        lw      ra,28(sp)
        lw a1, -28(s0)
        lw      s0,24(sp)
        slli a1, a1, 1
        addi a1,a1,1
        la a0, VET
        mv s5, a0
        mv s6, a1
        #call show
        printint(s9)
        printchar(10)
        mv a0, s5
        mv a1, s6
        csrr s8,3073
        call desenha
        csrr s9,3073
        sub s9, s9, s8
        printint(s9)
        printchar(10)
        lw ra,28(sp)
       	addi    sp,sp,32
       	ret        	
       	
lerInput:
	la t0,inputs
	li a7, 5
	ecall	
	sw a0, 0(t0)
	li a7, 5
	ecall	
	sw a0, 4(t0)
	li a7, 5
	ecall	
	sw a0, 8(t0)
	ret
        
show:
	add t0, a0, zero    # t0 = &arr[0]
    	slli t1, a1, 2        # t1 = n4
    	add t1, t1, a0        # t1 = &arr[0] + n4
    	addi sp, sp, -4    # abrir espaço p/ 1 word na pilha 
    	sw a0, 0(sp)        # guardar a0 (endr. do vetor) na pilha
    	la t2,inputs
	la a0,req
	li a7,4
	ecall
	lw a0,0(t2)
	li a7,1
	ecall
	la a0, newl
	li a7,4
	ecall
	#
	la a0,aeq
	li a7,4
	ecall
	lw a0,4(t2)
	li a7,1
	ecall
	la a0, newl
	li a7,4
	ecall
	#
	la a0,peq
	li a7,4
	ecall	
	lw a0, 0(t0)        # a0 = *(arr+t0)
    	li a7, 1                # imprimir inteiro em a0
    	ecall
    	la a0, newl            # a0 = tab
    	li a7, 4                # impri-mir string em a0
    	ecall

    	addi t0, t0, 4    # t0 = t0 + 4 => próximo endereço no array
loop:	
	la a0, par1
	li a7,4
	ecall
    	lw a0, 0(t0)        # a0 = *(arr+t0)
    	li a7, 1                # imprimir inteiro em a0
    	ecall
    	la a0, vr
	li a7,4
	ecall
    	addi t0, t0, 4       # t0 = t0 + 4 => próximo endereço no array
     	lw a0, 0(t0)         # a0 = *(arr+t0)
    	li a7, 1             # imprimir inteiro em a0
    	ecall
	la a0, par2
	li a7,4
	ecall
	addi t0,t0,4
     	bltu t0, t1, loop    # se o prox ender. do array for menor 
                             # que o último ender+1,vah p/ loop
    	la a0, newl          # a0 = newl
    	ecall
    	lw a0, 0(sp)         # restaurar a0 (endr. do vetor) da pilha
    	addi sp, sp, 4       # desempilhar 1 word da pilha 
    	ret

.include "SYSTEMv21.s"
.include "sencos.s"
.include "desenha.s"
.include "vertice.s"
