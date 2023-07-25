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
	add zero, zero, zero
	add zero, zero, zero
	add zero, zero, zero
	sw t3,12(gp)
	sub s1,t0,zero
	add s0,t0,t0
	add zero, zero, zero
	add zero, zero, zero
	add zero, zero, zero
	sub t0,s0,t0
	add zero, zero, zero
	add zero, zero, zero
	add zero, zero, zero
	and t0,	t0, t1
	add zero, zero, zero
	add zero, zero, zero
	add zero, zero, zero
	or t0,t0,t2
	add zero, zero, zero
	add zero, zero, zero
	add zero, zero, zero
	slt t0,s1,t0
	add zero, zero, zero
	add zero, zero, zero
	add zero, zero, zero
	add t0,t0,s1
	add zero, zero, zero
	add zero, zero, zero
	add zero, zero, zero
	beq t0,s1,PULA
	add zero, zero, zero
	lw t0,12(gp)
	add zero, zero, zero
	add zero, zero, zero
	add zero, zero, zero
	j FIM
PULA:	lw t0,16(gp)
FIM:	j FIM
