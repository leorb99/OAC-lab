####
#	a1 = x_offset
#	a3 = frame

PrintMapa:
	addi sp, sp, -12
	sw ra, 0(sp)
	sw a1, 4(sp)
	sw a3, 8(sp)

		
	la a0, mapa1Colisao
	lw a4, 0(a0)	# Largura do mapa de colisão
	addi a0, a0, 8	# Inicio do mapa de colisão
	
	li t0, 16
	rem a5, a1, t0
	sub a5, zero, a5
	div a1, a1, t0
	
	add a0, a0, a1	# inicio do print mapa
	
	li a1, 0	# contador linha
	li a2, 0	# contador coluna
	mv a7, a0	# salva o inicio
	
mapa.looplinha:
	
	lbu a6, 0(a7)
	
	
	slli a1, a1, 4	# Calcula x_offset
	add a1, a1, a5
	slli a2, a2, 4	# Calcula y_offset
		
	li t3, 1
	beq a6, t3, mapa.bloco
	li t3, 2
	beq a6, t3, mapa.blocoexp
	li t3, 3
	beq a6, t3, mapa.mastro
	li t3, 4
	beq a6, t3, mapa.canotopoL
	li t3, 5
	beq a6, t3, mapa.canotopoR
	li t3, 6
	beq a6, t3, mapa.canoL
	li t3, 7
	beq a6, t3, mapa.canoR
	li t3, 8
	beq a6, t3, mapa.bandeira
	li t3, 9
	beq a6, t3, mapa.bandeiraL
	
	
mapa.ceu: # imprimir ceu	
	la a0, ceu_azul
	jal Print
	
	j mapa.fimlinha
	
mapa.bloco: # imprimir bloco
	la a0, chao
	jal Print

	j mapa.fimlinha
	
mapa.blocoexp: # imprimir "?"
	la a0, interrogacao
	jal Print
	
	j mapa.fimlinha
	
mapa.mastro: # imprimir mastro
	la a0, mastro
	jal Print

	j mapa.fimlinha
	
mapa.canotopoL: # imprimir topo esq cano
	la a0, topo_cano_esq
	jal Print

	j mapa.fimlinha
	
mapa.canotopoR: # imprimir topo dir cano
	la a0, topo_cano_dir
	jal Print
	
	j mapa.fimlinha
	
mapa.canoL: # imprimir cano esq
	la a0, cano_esq
	jal Print
	
	j mapa.fimlinha
	
mapa.canoR: # imprimir cano dir
	la a0, cano_dir
	jal Print
	
	j mapa.fimlinha
	
mapa.bandeira: # imprimir bandeira
	la a0, bandeira
	jal Print

	j mapa.fimlinha
	
mapa.bandeiraL: # imprimir bandeira esq
	la a0, bandeira_esq
	jal Print
	

mapa.fimlinha:
	sub a1, a1, a5
	srli a1, a1, 4
	srli a2, a2, 4
		
	li t3, 20
	addi a7, a7, 1
	ble t3, a1, mapa.proxColuna
	
	addi a1, a1, 1
	
	j mapa.looplinha
	
mapa.proxColuna:

	
	li t3, 14
	ble t3, a2, mapa.fim
	
	addi a7, a7, -20
	li, a1, 0
	add a7, a7, a4
	addi a2, a2, 1
	j mapa.looplinha
	

mapa.fim:
	
	lw ra, 0(sp)
	lw a1, 4(sp)
	lw a3, 8(sp)
	
	addi sp, sp, 12
	
gfim:	#j gfim
	ret
