.data

.LC0:
        .word   1065353216
.LC1:
        .word   3212836864
.LC2:
        .word   1061752795
.text

main:
        addi    sp,sp,-16
        sw      ra,12(sp)
        li a7, 6
        ecall
        call    calculaSin
        li a7, 2
        ecall
        lw      ra,12(sp)
        addi    sp,sp,16
        li a7, 10
        ecall
fatorial:
        mv      a5,a0
        li      a4,1
        ble     a0,a4,.L4
        li      a0,1
.L3:
        mul     a0,a0,a5
        addi    a5,a5,-1
        bne     a5,a4,.L3
        ret
.L4:
        li      a0,1
        ret
powf:
        bnez    a0,.L15
        lui     a5,%hi(.LC0)
        flw     fa0,%lo(.LC0)(a5)
        ret
.L15:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        fsw     fs0,12(sp)
        mv      s0,a0
        fmv.s   fs0,fa0
        srli    a0,a0,31
        add     a0,a0,s0
        srai    a0,a0,1
        call    powf
        andi    a5,s0,1
        beqz    a5,.L16
        blez    s0,.L9
        fmul.s  fs0,fs0,fa0
        fmul.s  fa0,fs0,fa0
.L6:
        lw      ra,28(sp)
        lw      s0,24(sp)
        flw     fs0,12(sp)
        addi    sp,sp,32
        jr      ra
.L16:
        fmul.s  fa0,fa0,fa0
        j       .L6
.L9:
        fmul.s  fa0,fa0,fa0
        fdiv.s  fa0,fa0,fs0
        j       .L6
calculaSin:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        sw      s1,20(sp)
        sw      s2,16(sp)
        fsw     fs0,12(sp)
        fsw     fs1,8(sp)
        fsw     fs2,4(sp)
        fsw     fs3,0(sp)
        fmv.s   fs3,fa0
        li      s1,1
        li      s0,0
        fmv.s.x fs1,zero
        lui     a5,%hi(.LC1)
        flw     fs2,%lo(.LC1)(a5)
        li      s2,10
.L18:
        mv      a0,s0
        fmv.s   fa0,fs2
        call    powf
        fmv.s   fs0,fa0
        mv      a0,s1
        call    fatorial
        fcvt.s.w        fa0,a0
        fdiv.s  fs0,fs0,fa0
        mv      a0,s1
        fmv.s   fa0,fs3
        call    powf
        fmul.s  fs0,fs0,fa0
        fadd.s  fs1,fs1,fs0
        addi    s0,s0,1
        addi    s1,s1,2
        bne     s0,s2,.L18
        fmv.s   fa0,fs1
        lw      ra,28(sp)
        lw      s0,24(sp)
        lw      s1,20(sp)
        lw      s2,16(sp)
        flw     fs0,12(sp)
        flw     fs1,8(sp)
        flw     fs2,4(sp)
        flw     fs3,0(sp)
        addi    sp,sp,32
        jr      ra
