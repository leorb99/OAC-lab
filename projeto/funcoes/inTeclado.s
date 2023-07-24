inTeclado:
	li t1,0xff200000		# carrega o endereço de controle do KDMMIO
 	lw t0,0(t1)			# Le bit de Controle Teclado
   	andi t0,t0, 1			# mascara o bit menos significativo
   	ble t0,zero,input.fim		# não tem tecla pressionada então sai da função
   	lw t2,4(t1)			# le o valor da tecla
   	
   	li t1, 97			# tecla apertada: "a"
   	beq t2, t1, input.a
   	li t1, 100			# tecla apertada: "d"
   	beq t2, t1, input.d
   	li t1, 114			# tecla apertada: "r"
   	beq t2, t1, input.r
   	li t1, 115			# tecla apertada: "s"
   	beq t2, t1, input.s
   	li t1, 119			# tecla apertada: "w"
   	beq t2, t1, input.w
   	j input.fim
   	
input.a:
	la t0, Mario.dir
	li t1, 1
	sb t1, 0(t0) 
	
	#######
	# atualizaAnim
	la t0, Mario.animacao
	lb t1, 0(t0)
	beqz t1, inputa.anim.movstart
	li t2, 6
	beq t1, t2, inputa.anim.cont
	li t2, 4
	beq t1, t2, inputa.anim.mov4
	addi t1, t1, 1
	j inputa.anim.cont
inputa.anim.movstart:
	li t1, 1
	j inputa.anim.cont
inputa.anim.mov4:
	li t1, 1
	j inputa.anim.cont
inputa.anim.cont:
	sb t1, 0(t0)
	#######
	# atualizaPos
	la t0, Mario.pos
	lw t1, 0(t0)
	addi t1, t1, -4
	sw t1, 0(t0)
	######
	
#	la t0, Mario.mov
#	li t1,1
#	sb t1, 0(t0)
	
	
	j input.fim
input.s:

	j input.fim
input.d:
	la t0, Mario.dir
	li t1, 0
	sb t1, 0(t0) 
	
	
	#######
	# atualizaAnim
	la t0, Mario.animacao
	lb t1, 0(t0)
	beqz t1, inputd.anim.movstart
	li t2, 6
	beq t1, t2, inputd.anim.cont
	li t2, 4
	beq t1, t2, inputd.anim.mov4
	addi t1, t1, 1
	j inputd.anim.cont
inputd.anim.movstart:
	li t1, 1
	j inputd.anim.cont
inputd.anim.mov4:
	li t1, 1
	j inputd.anim.cont
inputd.anim.cont:
	sb t1, 0(t0)
	
	#############
	# atualizaPos
	la t0, Mario.pos
	lw t1, 0(t0)
	addi t1, t1, 4
	sw t1, 0(t0)
	#############
	
#	la t0, Mario.mov
#	li t1,1
#	sb t1, 0(t0)
	
	j input.fim
input.w:
#	la t0, Mario.ar
#	lb t0, 0(t0)
#	bnez t0, input.fim
	
#	la t0, Mario.mov
#	li t1,2
#	sb t1, 0(t0)
	j input.fim
	
input.r:
	li t1, 1
  	la t0, Reset
	sb t1, 0(t0)
	
	j input.fim
   		
input.fim:
	ret
