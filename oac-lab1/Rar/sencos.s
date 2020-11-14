.data
.LC0:
        .word   1065353216
.LC1:
        .word   3212836864

.text
exps:
        addi    sp,sp,-48
        sw      s0,44(sp)
        addi    s0,sp,48
        fsw     fa0,-36(s0)
        sw      a0,-40(s0)
        lui     a5,%hi(.LC0)
        flw     fa5,%lo(.LC0)(a5)
        fsw     fa5,-20(s0)
        j       .L2
.L3:
        lw      a5,-40(s0)
        fcvt.s.w        fa5,a5
        flw     fa4,-36(s0)
        fdiv.s  fa5,fa4,fa5
        flw     fa4,-20(s0)
        fmul.s  fa5,fa4,fa5
        fsw     fa5,-20(s0)
        lw      a5,-40(s0)
        addi    a5,a5,-1
        sw      a5,-40(s0)
.L2:
        lw      a5,-40(s0)
        bgtz    a5,.L3
        flw     fa5,-20(s0)
        fmv.s   fa0,fa5
        lw      s0,44(sp)
        addi    sp,sp,48
        jr      ra
seno:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        fsw     fs0,44(sp)
        addi    s0,sp,64
        fsw     fa0,-52(s0)
        sw      zero,-36(s0)
        li      a5,-1
        sw      a5,-44(s0)
        sw      zero,-40(s0)
        j       .L6
.L9:
        lw      a5,-36(s0)
        andi    a5,a5,1
        bnez    a5,.L7
        lui     a5,%hi(.LC0)
        flw     fs0,%lo(.LC0)(a5)
        j       .L8
.L7:
        lui     a5,%hi(.LC1)
        flw     fs0,%lo(.LC1)(a5)
.L8:
        lw      a5,-36(s0)
        slli    a5,a5,1
        addi    a5,a5,1
        mv      a0,a5
        flw     fa0,-52(s0)
        call    exps
        fmv.s   fa5,fa0
        fmul.s  fa5,fs0,fa5
        flw     fa4,-40(s0)
        fadd.s  fa5,fa4,fa5
        fsw     fa5,-40(s0)
        lw      a5,-36(s0)
        addi    a5,a5,1
        sw      a5,-36(s0)
.L6:
        lw      a4,-36(s0)
        li      a5,10
        ble     a4,a5,.L9
        flw     fa5,-40(s0)
        fmv.s   fa0,fa5
        lw      ra,60(sp)
        lw      s0,56(sp)
        flw     fs0,44(sp)
        addi    sp,sp,64
        jr      ra
coseno:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        fsw     fs0,44(sp)
        addi    s0,sp,64
        fsw     fa0,-52(s0)
        sw      zero,-36(s0)
        li      a5,-1
        sw      a5,-44(s0)
        sw      zero,-40(s0)
        j       .L12
.L15:
        lw      a5,-36(s0)
        andi    a5,a5,1
        bnez    a5,.L13
        lui     a5,%hi(.LC0)
        flw     fs0,%lo(.LC0)(a5)
        j       .L14
.L13:
        lui     a5,%hi(.LC1)
        flw     fs0,%lo(.LC1)(a5)
.L14:
        lw      a5,-36(s0)
        slli    a5,a5,1
        mv      a0,a5
        flw     fa0,-52(s0)
        call    exps
        fmv.s   fa5,fa0
        fmul.s  fa5,fs0,fa5
        flw     fa4,-40(s0)
        fadd.s  fa5,fa4,fa5
        fsw     fa5,-40(s0)
        lw      a5,-36(s0)
        addi    a5,a5,1
        sw      a5,-36(s0)
.L12:
        lw      a4,-36(s0)
        li      a5,10
        ble     a4,a5,.L15
        flw     fa5,-40(s0)
        fmv.s   fa0,fa5
        lw      ra,60(sp)
        lw      s0,56(sp)
        flw     fs0,44(sp)
        addi    sp,sp,64
        jr      ra
rad:
        addi    sp,sp,-48
        sw      s0,44(sp)
        addi    s0,sp,48
        fsw     fa0,-36(s0)
        lui     a5,%hi(.LC2)
        flw     fa5,%lo(.LC2)(a5)
        fsw     fa5,-20(s0)
        flw     fa5,-20(s0)
        fadd.s  fa4,fa5,fa5
        flw     fa5,-36(s0)
        fmul.s  fa4,fa4,fa5
        lui     a5,%hi(.LC3)
        flw     fa5,%lo(.LC3)(a5)
        fdiv.s  fa5,fa4,fa5
        fsw     fa5,-24(s0)
        flw     fa5,-24(s0)
        fmv.s   fa0,fa5
        lw      s0,44(sp)
        addi    sp,sp,48
        jr      ra