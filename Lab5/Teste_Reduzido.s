.data 
GP: .word 0x12345678
    .word 0xFFFFFFF0
    .word 0x0000000F
    .word 0xCCCCCCCC
    .word 0xEEEEEEEE
    
.text	
	lw t0,0(gp)
	lw t1,4(gp)
	lw t2,8(gp)
	lw t3,12(gp)
	sw t3,12(gp)
	sub s1,t0,zero
	add s0,t0,t0
	sub t0,s0,t0
	and t0,	t0, t1
	or t0,t0,t2
	slt t0,s1,t0
	add t0,t0,s1
	beq t0,s1,PULA
	lw t0,12(gp)
	j FIM
PULA:	lw t0,16(gp)
FIM:	j FIM