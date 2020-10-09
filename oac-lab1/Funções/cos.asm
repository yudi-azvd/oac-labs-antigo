.data

.LC0:
        .word   1065353216
.LC1:
        .word   3212836864
.LC2:
        .word   1060251768
        
.text

main:
        #lui     a5,%hi(.LC2)
        #flw     fa0,%lo(.LC2)(a5)
        li a7, 6
        ecall
        addi    sp,sp,-16
        sw      ra,12(sp)
        call    calculaCos
        li a7, 2
        ecall
        lw      ra,12(sp)
        li      a0,0
        addi    sp,sp,16
        li a7,10
        ecall

fatorial:
        mv      a5,a0
        li      a4,1
        li      a0,1
        ble     a5,a4,.L4
.L3:
        mul     a0,a0,a5
        addi    a5,a5,-1
        bne     a5,a4,.L3
        ret
.L4:
        ret
powf:
        bnez    a0,.L9
        lui     a5,%hi(.LC0)
        flw     fa0,%lo(.LC0)(a5)
        ret
.L9:
        tail    powf.part.0
powf.part.0:
        addi    sp,sp,-32
        sw      s0,24(sp)
        mv      s0,a0
        srli    a0,a0,31
        add     a0,a0,s0
        srai    a0,a0,1
        fsw     fs0,12(sp)
        sw      ra,28(sp)
        fmv.s   fs0,fa0
        call    powf
        andi    a5,s0,1
        beqz    a5,.L15
        blez    s0,.L13
        fmul.s  fs0,fs0,fa0
        lw      ra,28(sp)
        lw      s0,24(sp)
        fmul.s  fa0,fs0,fa0
        flw     fs0,12(sp)
        addi    sp,sp,32
        jr      ra
.L13:
        fmul.s  fa0,fa0,fa0
        lw      ra,28(sp)
        lw      s0,24(sp)
        fdiv.s  fa0,fa0,fs0
        flw     fs0,12(sp)
        addi    sp,sp,32
        jr      ra
.L15:
        lw      ra,28(sp)
        lw      s0,24(sp)
        flw     fs0,12(sp)
        fmul.s  fa0,fa0,fa0
        addi    sp,sp,32
        jr      ra
calculaCos:
        addi    sp,sp,-64
        lui     a5,%hi(.LC0)
        fsw     fs2,20(sp)
        flw     fs2,%lo(.LC0)(a5)
        lui     a5,%hi(.LC1)
        fsw     fs0,28(sp)
        fsw     fs3,16(sp)
        fsw     fs4,12(sp)
        fsw     fs5,8(sp)
        fmv.s   fs4,fa0
        fmv.s.x fs0,zero
        fmv.s   fs5,fs2
        flw     fs3,%lo(.LC1)(a5)
        sw      s0,56(sp)
        sw      s1,52(sp)
        sw      s3,44(sp)
        sw      ra,60(sp)
        sw      s2,48(sp)
        fsw     fs1,24(sp)
        li      s1,0
        li      s3,10
        li      s0,1
.L17:
        slli    s2,s1,1
        beqz    s1,.L18
.L27:
        fmv.s   fa0,fs3
        mv      a0,s1
        call    powf.part.0
        mv      a5,s2
        li      a4,1
.L19:
        mul     a4,a4,a5
        addi    a5,a5,-1
        bne     a5,s0,.L19
        fcvt.s.w        fs1,a4
        fdiv.s  fs1,fa0,fs1
.L22:
        fmv.s   fa0,fs4
        mv      a0,s2
        addi    s1,s1,1
        call    powf.part.0
        fmadd.s fs0,fa0,fs1,fs0
        bne     s1,s3,.L17
        lw      ra,60(sp)
        lw      s0,56(sp)
        fmv.s   fa0,fs0
        lw      s1,52(sp)
        lw      s2,48(sp)
        lw      s3,44(sp)
        flw     fs0,28(sp)
        flw     fs1,24(sp)
        flw     fs2,20(sp)
        flw     fs3,16(sp)
        flw     fs4,12(sp)
        flw     fs5,8(sp)
        addi    sp,sp,64
        jr      ra
.L18:
        bnez    s2,.L23
        fadd.s  fs0,fs0,fs2
        li      s1,1
        li      s2,2
        j       .L27
.L23:
        fmv.s   fs1,fs5
        j       .L22
