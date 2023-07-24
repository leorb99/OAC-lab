#	Imagem
#	a0 = file descriptor
#	a3 = offset da imagem
#	a4 = largura da imagem
#	
#	Tela
#	a5 = enderresso da tela
#	
#

RENDER:	mv 	t2, a3			# salvar offset original

	li	t0, 0 			# contador de linhas
	li	t1, 240			# maximo de linhas
RENDER_LOOP:
	mv	t6, a0
	
	li	a7, 62
	mv	a1, a3			# offset
	li	a2, 0
	ecall
	
	mv	a0, t6
	
	mv	a1, a5
	li	a2, 320			# print uma linha
	li	a7, 63
	ecall
	
	mv	a0, t6
	
	addi 	a5,a5, 320		# proxima linha da tela
	add	a3,a3, a4		# proxima linha na imagem
	addi	t0,t0, 1
	
	blt	t0, t1, RENDER_LOOP
	
	mv	a3, t2
	ret
	
	