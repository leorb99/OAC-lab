.data
A: .word 100
B: .word 1
S: .word 0
F: .word 0x9A380

.text
	#########################################
	#pra funcionar no RARS			#
	#la s0, A				#
	#lw s1, 0(s0)				#
	#lw s2, 4(s0)				#
	#lw s3, 8(s0)				#
	#lw s4, 12(s0)				#
	#sw s1, 0(gp)				#
	#sw s2, 4(gp)				#
	#sw s3, 8(gp)				#
	#sw s4, 12(gp)				#
	#lw t0, A				#
	#lw t1, B				#
	#lw t2, S				#
	#lw t3, F				#
	lw t0, 0(gp)				#
	lw t1, 4(gp)				#
	lw t2, 8(gp)				#
	lw t3, 12(gp)				#
	#li sp, 0x000103fc			#
	#########################################

soma: 
	beq t0, zero, fim
	add t2, t2, t0
	sub t0, t0, t1
	jal soma
	
fim:	
	add t0,t2,zero
	and t1, t0, sp
	or t2, t2, sp
	slt s0, t1, t2
	add s1, t1, t2
	add s1, s1, t0
	add s1, s1, t3

	sw t2, 8(gp)
	
exit:	jal exit


######################################################################
# t0 é o resultado da soma
# t1 é o resultado do and
# t2 é o resultado do or
# s0 é o resultado do set on less than
# s1 é o resultado final
#######################################################################





