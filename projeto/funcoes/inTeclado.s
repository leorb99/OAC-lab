

inTeclado:
	li t1,0xff200000		# carrega o endere�o de controle do KDMMIO
 	lw t0,0(t1)			# Le bit de Controle Teclado
   	andi t0,t0, 1			# mascara o bit menos significativo
   	ble t0,zero,input.fim		# n�o tem tecla pressionada ent�o sai da fun��o
   	lw t2,4(t1)			# le o valor da tecla
   	
   	li t1, 97			# tecla apertada: "a"
   	beq t2, t1, input.a
   	li t1, 100			# tecla apertada: "d"
   	beq t2, t1, input.d
   	li t1, 114			# tecla apertada: "r"
   	beq t2, t1, input.r
   	li t1, 115			# tecla apertada: "r"
   	beq t2, t1, input.s
   	li t1, 119			# tecla apertada: "r"
   	beq t2, t1, input.w
   	j input.fim
input.a:
	la t0, Mario.dir
	li t1, 1
	sw t1, 0(t0) 
	
	la t0, Mario.pos
	lw t1, 0(t0)
	addi t1, t1, -4
	sw t1, 0(t0)
	addi a1, a1, -4
	
	j input.fim
input.s:

	j input.fim
input.d:
	la t0, Mario.dir
	li t1, 0
	sw t1, 0(t0) 
	
	la t0, Mario.pos
	lw t1, 0(t0)
	addi t1, t1, 4
	sw t1, 0(t0)
	addi a1, a1, 4
	
	j input.fim
input.w:

	j input.fim
input.r:
   	
   		
input.fim:
	ret
