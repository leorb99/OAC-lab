# Mario.size: 	.byte 1		# 0 --> Normal; 1 --> Grande
# Mario.dir: 	.byte 0		# 0 --> Direita; 1 --> Esquerda
# Mario.mov:	.byte 0		# 0 --> Parado; 1 --> Movendo; 2 --> Pulando
# Mario.ar:	.byte 0		# 0 --> Nao; 1 --> sim
# Mario.pos: 	.word 96, 192	# ( X , Y )
# Mario.Vely: 	.word 0		# Velocidade vertical 
# .include "sprites/mapa1.s"
# Mapa.offset: 	.word 0		# Entre 0 e 3056	

atualizaPos:
	addi sp, sp, -4
	sw ra, 0(sp)
	
	la t0,Mario.mov
	lb a0, 0(t0)
	
	la t0, Mario.size
	lb a5, 0(t0)
	
	beqz a0, updpos.parado
	li t1, 1
	beq a0, t1, updpos.move

updpos.jump:
	la t0, Mario.Vely
	li t1, vely
	sw t1, 0(t0)
	
	j updpos.fim
updpos.move:
		la t0, Mario.dir
		lb t0, 0(t0)
		bnez t0, updpos.move.esq
		
	updpos.move.dir:
		la t4, Mario.pos
		lw a0, 0(t4)
		lw a1, 4(t4)
		addi a0, a0, 17
		jal colisao
		bnez a0, updpos.fim
	
		lw a0, 0(t4)
		lw a1, 4(t4)
		addi a0, a0, 17
		addi a1, a1, 16
		jal colisao
		bnez a0, updpos.fim
		
		beqz a5, updpos.move.dir.small
		lw a0, 0(t4)
		lw a1, 4(t4)
		addi a0, a0, 17
		addi a1, a1, -16
		jal colisao
		bnez a0, updpos.fim
		
	updpos.move.dir.small:	
		la t0, Mario.Velx
		li t1, velx
		sw t1, 0(t0)
		j updpos.fim
		
	updpos.move.esq:
		la t4, Mario.pos
		lw a0, 0(t4)
		lw a1, 4(t4)
		addi a0, a0, -1
		jal colisao
		bnez a0, updpos.fim
	
		lw a0, 0(t4)
		lw a1, 4(t4)
		addi a0, a0, -1
		addi a1, a1, 16
		jal colisao
		bnez a0, updpos.fim
		
		beqz a5, updpos.move.esq.small
		lw a0, 0(t4)
		lw a1, 4(t4)
		addi a0, a0, -1
		addi a1, a1, -16
		jal colisao
		bnez a0, updpos.fim
		
	updpos.move.esq.small:	
		la t0, Mario.Velx
		li t1, velx
		sub t1, zero, t1
		sw t1, 0(t0)
		j updpos.fim
	
updpos.parado:
	la t0, Mario.Velx
	sw zero, 0(t0)
		
	
updpos.fim:


	lw ra, 0(sp)
	addi sp, sp, 4
	ret


updpos.ar1:
	li	t5, 1	
	j updpos.continue1
updpos.ar2:
	li 	t6, 1
	j updpos.continue2
	
	
	