PrintMario:
	addi sp, sp, -4
	sw ra, 0(sp)

	la t0, Mario.pos
	lw a1, 0(t0)
	lw a2, 4(t0)
	
	la t0, Mapa.offset
	lw t1 ,(t0)
	sub a1, a1,t1
	
	#########################################
	# 	mover p/ func calcular pos	#
	
	# Centraliza o mapa no mario
	
	li t2, 160
	blt a1, t2, printmario.jump
	add t1, t1, a1
	addi t1, t1, -160
	sw t1, 0 (t0)
	
	#					#
	#########################################
printmario.jump:
	la t0, Mario.size
	lb t0, 0(t0)
	
	 beqz t0, printmario.pequeno
	addi a2, a2, -16
printmario.grande:
	la t0, Mario.dir
	lb t0, 0(t0)
	
	beqz t0, printmario.GR
	
	printmario.GL:
		la t0, Mario.animacao
		lb t0, 0(t0)
		
		beqz t0, printmario.GL.parado
		li t1, 1
		beq t0,t1, printmario.GL.mov0
		li t1, 2
		beq t0,t1, printmario.GL.mov1
		li t1, 3
		beq t0,t1, printmario.GL.mov2
		li t1, 4
		beq t0,t1, printmario.GL.mov3
		li t1, 5
		beq t0,t1, printmario.GL.mov4
		
		printmario.GL.jump:
			la a0, big_mario_jump_left
			
			j printmario.fim
			
		printmario.GL.parado:
			la a0, big_mario_left_0
			
			j printmario.fim
			
		printmario.GL.mov0:
			la a0, big_mario_left_0
			
			j printmario.fim
			
		printmario.GL.mov1:
			la a0, big_mario_left_1
			
			j printmario.fim
			
		printmario.GL.mov2:
			la a0, big_mario_left_2
			
			j printmario.fim
			
		printmario.GL.mov3:
			la a0, big_mario_left_3
			
			j printmario.fim
			
		printmario.GL.mov4:
			la a0, big_mario_left_4
			
			j printmario.fim
	
	printmario.GR:
		la t0, Mario.animacao
		lb t0, 0(t0)
		
		beqz t0, printmario.GR.parado
		li t1, 1
		beq t0,t1, printmario.GR.mov0
		li t1, 2
		beq t0,t1, printmario.GR.mov1
		li t1, 3
		beq t0,t1, printmario.GR.mov2
		li t1, 4
		beq t0,t1, printmario.GR.mov3
		li t1, 5
		beq t0,t1, printmario.GR.mov4
		
		printmario.GR.jump:
			la a0, big_mario_jump_right
			
			j printmario.fim
			
		printmario.GR.parado:
			la a0, big_mario_right_0
			
			j printmario.fim
			
		printmario.GR.mov0:
			la a0, big_mario_right_0
			
			j printmario.fim
			
		printmario.GR.mov1:
			la a0, big_mario_right_1
			
			j printmario.fim
			
		printmario.GR.mov2:
			la a0, big_mario_right_2
			
			j printmario.fim
			
		printmario.GR.mov3:
			la a0, big_mario_right_3
			
			j printmario.fim
			
		printmario.GR.mov4:
			la a0, big_mario_right_4
			
			j printmario.fim
     
printmario.pequeno:
	la t0, Mario.dir
	lb t0, 0(t0)
	
	beqz t0, printmario.PR
	
	printmario.PL:
		la t0, Mario.animacao
		lb t0, 0(t0)
		
		beqz t0, printmario.PL.parado
		li t1, 1
		beq t0,t1, printmario.PL.mov0
		li t1, 2
		beq t0,t1, printmario.PL.mov1
		li t1, 3
		beq t0,t1, printmario.PL.mov2
		li t1, 4
		beq t0,t1, printmario.PL.mov3
		li t1, 5
		beq t0,t1, printmario.PL.mov4
		
		printmario.PL.jump:
			la a0, mario_jump_left
			
			j printmario.fim
			
		printmario.PL.parado:
			la a0, mario_left_0
			
			j printmario.fim
			
		printmario.PL.mov0:
			la a0, mario_left_0
			
			j printmario.fim
			
		printmario.PL.mov1:
			la a0, mario_left_1
			
			j printmario.fim
			
		printmario.PL.mov2:
			la a0, mario_left_2
			
			j printmario.fim
			
		printmario.PL.mov3:
			la a0, mario_left_3
			
			j printmario.fim
			
		printmario.PL.mov4:
			la a0, mario_left_4
			
			j printmario.fim
	
	printmario.PR:
		la t0, Mario.animacao
		lb t0, 0(t0)
		
		beqz t0, printmario.PR.parado
		li t1, 1
		beq t0,t1, printmario.PR.mov0
		li t1, 2
		beq t0,t1, printmario.PR.mov1
		li t1, 3
		beq t0,t1, printmario.PR.mov2
		li t1, 4
		beq t0,t1, printmario.PR.mov3
		li t1, 5
		beq t0,t1, printmario.PR.mov4
		
		printmario.PR.jump:
			la a0, mario_jump_right
			
			j printmario.fim
		printmario.PR.parado:
			la a0, mario_right_0
			
			j printmario.fim
		printmario.PR.mov0:
			la a0, mario_right_0
			
			j printmario.fim
		printmario.PR.mov1:
			la a0, mario_right_1
			
			j printmario.fim
		printmario.PR.mov2:
			la a0, mario_right_2
			
			j printmario.fim
		printmario.PR.mov3:
			la a0, mario_right_3
			
			j printmario.fim
		printmario.PR.mov4:
			la a0, mario_right_4
			
			j printmario.fim
	
printmario.fim:	
	jal Print
	lw ra, 0(sp)
	addi sp, sp, 4
	
	ret	
	
	
	
	
	
	
	
	
	
	
