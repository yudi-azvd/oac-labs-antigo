.include "MACROSv21.s"

.data
VET: .space 1000

.LC2:
        .word   1078530010
.LC3:
        .word   1135869952
.LC4:
        .word   1119092736

newl: .string "\n"
tab: .string " "

.text
main:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        li      a5,100
        sw      a5,-20(s0)
        lui     a5,%hi(.LC4)
        flw     fa5,%lo(.LC4)(a5)
        fsw     fa5,-24(s0)
        li      a5,3
        sw      a5,-28(s0)
        flw     fa5,-24(s0)
        fcvt.w.s a5,fa5,rtz
        lw      a2,-28(s0)
        mv      a1,a5
        lw      a0,-20(s0)
        call    vertices
        li      a5,0
        mv      a0,a5
        lw      ra,28(sp)
        lw a1, -28(s0)
        lw      s0,24(sp)
        slli a1, a1, 1
        addi a1,a1,1
        addi    sp,sp,32
        la a0, VET
        mv s5, a0
        mv s6, a1
        call show
        mv a0, s5
        mv a1, s6
        call desenha
       	li a7,10
       	ecall

vertices:
	la s1, VET
	sw a2, 0(s1)
        addi    sp,sp,-80
        sw      ra,76(sp)
        sw      s0,72(sp)
        fsw     fs0,60(sp)
        addi    s0,sp,80
        sw      a0,-68(s0)
        sw      a1,-72(s0)
        sw      a2,-76(s0)
        lw      a5,-76(s0)
        fcvt.s.w        fa5,a5
        fsw     fa5,-64(s0)
        sw      zero,-36(s0)
        j       .L20
.L21:
	mv t0,a4 # t0 eh o contador
        lw      a5,-68(s0)
        fcvt.s.w        fs0,a5
        lw      a5,-72(s0)
        fcvt.s.w        fa5,a5
        fmv.s   fa0,fa5
        call    rad
        fmv.s   fa5,fa0
        fmv.s   fa0,fa5
        call    coseno
        fmv.s   fa5,fa0
        lw      a5,-36(s0)
        slli    a5,a5,1
        addi    a5,a5,1
        fmul.s  fa5,fs0,fa5
        fmv.s fa0, fa5 
        # salvando no vet
        fcvt.w.s t1,fa0
        slli t2,t0,1
        addi t2,t2,1
        slli t2,t2,2
        add t2,t2,s1
        sw t1, 0(t2)
        #terminou de salvar
        slli    a5,a5,2
        addi    a4,s0,-32
        add     a5,a4,a5
        fsw     fa5,-32(a5)
        lw      a5,-68(s0)
        fcvt.s.w        fs0,a5
        lw      a5,-72(s0)
        fcvt.s.w        fa5,a5
        fmv.s   fa0,fa5
        call    rad
        fmv.s   fa5,fa0
        fmv.s   fa0,fa5
        call    seno
        fmv.s   fa5,fa0
        lw      a5,-36(s0)
        addi    a5,a5,1
        slli    a5,a5,1
        fmul.s  fa5,fs0,fa5
        # salvando no vet
        fcvt.w.s t1,fa5
        slli t2,t0,1
        addi t2,t2,2
        slli t2,t2,2
        add t2,t2,s1
        sw t1, 0(t2)
        #terminou de salvar
        slli    a5,a5,2
        addi    a4,s0,-32
        add     a5,a4,a5
        fsw     fa5,-32(a5)
        li      a4,360
        lw      a5,-76(s0)
        div     a4,a4,a5
        lw      a5,-72(s0)
        add     a4,a4,a5
        li      a5,360
        rem     a5,a4,a5
        sw      a5,-72(s0)
        lw      a5,-36(s0)
        addi    a5,a5,1
        sw      a5,-36(s0)
.L20:
        lw      a4,-36(s0)
        lw      a5,-76(s0)
        blt     a4,a5,.L21
        nop
        lw      ra,76(sp)
        lw      s0,72(sp)
        flw     fs0,60(sp)
        addi    sp,sp,80
        mv	a0,s1
        jr      ra
        
show:
    add t0, a0, zero    # t0 = &arr[0]
    slli t1, a1, 2        # t1 = n4
    add t1, t1, a0        # t1 = &arr[0] + n4
    addi sp, sp, -4    # abrir espaço p/ 1 word na pilha 
    sw a0, 0(sp)        # guardar a0 (endr. do vetor) na pilha
loop:
    lw a0, 0(t0)        # a0 = *(arr+t0)
    li a7, 1                # imprimir inteiro em a0
    ecall
    la a0, tab            # a0 = tab
    li a7, 4                # imprimir string em a0
    ecall

    addi t0, t0, 4    # t0 = t0 + 4 => próximo endereço no array
    bltu t0, t1, loop    # se o prox ender. do array for menor 
                                        # que o último ender+1,vah p/ loop

    la a0, newl            # a0 = newl
    ecall
    lw a0, 0(sp)        # restaurar a0 (endr. do vetor) da pilha
    addi sp, sp, 4    # desempilhar 1 word da pilha 
    ret

.include "sencos.s"
.include "desenha.s"
.include "SYSTEMv21.s"