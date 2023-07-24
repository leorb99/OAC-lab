# Mario.size: 	.byte 0		# 0 --> Normal; 1 --> Grande
# Mario.dir: 	.byte 0		# 0 --> Direita; 1 --> Esquerda
# Mario.velx:	.float 0
# Mario.Vely: 	.float 0	# Velocidade vertical 
# Mario.pos: 	.word 96, 192	# ( X , Y )
# Mario.anima��o:	.byte 0 # 0: parado; 1-3: andando; 4: pulando	
	





PrintMario:
	addi sp, sp, -4
	sw ra, 0(sp)

	la t0, Mario.pos
	lw a1, 0(t0)
	lw a2, 4(t0)
	
	la t0, Mapa.offset
	lw t1 ,(t0)
	slli t1,t1, 4
	sub a1, a1,t1
	li t2, 224
	blt a1, t2, printmario.jump
	add t1, t1, a1
	addi t1, t1, -32
	srli t1, t1, 4
	sw t1, 0(t0)
printmario.jump:
	
	
	la t0, Mario.dir
	lb t0, 0(t0)
	beqz t0, printmario.right	
	la a0, mario_left_0
	jal Print
	j printmario.fim

printmario.right:	
	la a0, mario_right_0
	jal Print
	
printmario.fim:	
	lw ra, 0(sp)
	addi sp, sp, 4
	
	ret
	
	
	
	
	la t0, Mario.size
	lb t0, 0(t0)
	
	 beqz t0, printmario.pequeno
	
printmario.grande:
	la t0, Mario.dir
	lb t0, 0(t0)
	
	beqz t0, printmario.GR
	printmario.GL:
		
	printmario.GR:
	  
	    
	      
	          
printmario.pequeno:
	la t0, Mario.dir
	lb t0, 0(t0)
	
	beqz t0, printmario.PR
	
	printmario.PL:
	
	printmario.PR:
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
