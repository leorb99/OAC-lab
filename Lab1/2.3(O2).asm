.data
.LANCHOR0:
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
.text
main:
        addi    sp,sp,-16
        sw      s0,8(sp)
        lui     s0,%hi(.LANCHOR0)
        addi    a0,s0,%lo(.LANCHOR0)
        li      a1,30
        sw      ra,12(sp)
        call    show
        addi    a0,s0,%lo(.LANCHOR0)
        li      a1,30
        call    sort
        addi    a0,s0,%lo(.LANCHOR0)
        li      a1,30
        call    show
        lw      ra,12(sp)
        lw      s0,8(sp)
        li      a0,0
        addi    sp,sp,16
        li a7, 10
        ecall
show:
         mv     t0,a0 
         mv     t1,a1 
         mv     t2,zero 
loop1:  beq     t2,t1,fim1 
        li      a7,1 
        lw      a0,0(t0) 
        ecall 
        li      a7,11 
        li      a0,9 
        ecall 
        addi    t0,t0,4 
        addi    t2,t2,1 
        j       loop1 
fim1:   li      a7,11 
        li      a0,10 
        ecall 

        ret
swap:
        slli    a1,a1,2
        add     a0,a0,a1
        lw      a4,0(a0)
        lw      a5,4(a0)
        sw      a4,4(a0)
        sw      a5,0(a0)
        ret
sort:
        ble     a1,zero,.L4
        addi    a7,a1,-1
        li      a6,-1
        li      a1,-1
.L7:
        mv      a4,a6
        mv      a5,a0
        bne     a6,a1,.L6
        j       .L8
.L9:
        sw      a3,-4(a5)
        sw      a2,0(a5)
        addi    a5,a5,-4
        beq     a4,a1,.L8
.L6:
        lw      a2,-4(a5)
        lw      a3,0(a5)
        addi    a4,a4,-1
        bgt     a2,a3,.L9
.L8:
        addi    a6,a6,1
        addi    a0,a0,4
        bne     a6,a7,.L7
        ret
.L4:
        ret
