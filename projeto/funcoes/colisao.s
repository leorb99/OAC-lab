#IN:	# a0 = x_pos
	# a1 = y_pos
	
#OUT	# a0 = {0/1} = s/n
colisao:
	srli a0, a0, 4
	srli a1, a1, 4
	
	la t0, mapaColisao
	lw t1, 0(t0)
	addi t0, t0, 8
	
	mul t1, t1, a1		# y * largura
	add t0, t0, t1
	add t0, t1, a0
	
	lb t0, 0(t0)
	li a0, 1
	
	beqz t0, colisao.fim
	li t1,3
	beq t0, t1, colisao.fim
	li t1,7
	blt t1, t0, colisao.fim
	li a0, 0
	
colisao.fim:	
	ret
	
	