.include "System\MACROSv21.s"
.data

N: .word 5
C: .word 155,115
   .space 160
D: .space 1600


.text
	la t0,N
	lw a0,0(t0)
	la a1,C
	la a2,D
	jal SORTEIO
	jal DESENHA
	jal ROTAS
	li a7, 10
	ecall
	
SORTEIO:addi sp, sp, -12
	sw a0, 8(sp)		#salva a0 na pilha
	sw a1, 4(sp)
	sw a2, 0(sp)
	li t1, 310
	li t2, 230
	li t3, 0		#i=0
	lw t4, 8(sp)		#t4=N

gera:	addi a1, a1, 8		#aloca espaco no conjunto C
	li a7, 41		#gera x
	ecall
	remu a0, a0, t1		#x pertence (0, 310)
	sw a0, 0(a1)		#armazena o valor de x
	
	li a7, 41		#gera y
	ecall
	remu a0, a0, t2		#y pertence (0, 230)
	sw a0, 4(a1)		#armazena o valor de y

	addi t3, t3, 1		#incrementa i
	bne t3, t4, gera	#i!=N ? gera : continua
	lw a0, 8(sp)		#a0 volta a ter o valor seu valor original
	lw a1, 4(sp)
	lw a2, 0(sp)
	addi sp, sp, 12		#desempilha
	ret
	
DESENHA:addi sp, sp, -12		
	sw a0, 8(sp)		#salva a0 na pilha
	sw a1, 4(sp)		#salva a1 na pilha
	sw a2, 0(sp)		#salva a2 na pilha
	
	mv t0, a1		#t0 recebe o endereco do vetor C
	mv t1, a0		#t1 recebe o tamanho do vetor
	li a0, 65		#codigo ASCII para A
	li a1, 155		#posicao x da loja
	li a2, 115		#posicao y da loja
	li a3, 0x0700		#cor background vermelho foreground preto
	li a4, 0		#frame 0
	li a7, 111		
	ecall			#imprime A
	addi t0, t0, 8		#t0 aponta para o proximo elementos do vetor
	li t2, 0		#i=0

print:	addi a0, a0, 1		#incrementa a0 para imprimir a proxima letra
	lw a1, 0(t0)		#pega a posicao x da casa
	lw a2, 4(t0)		#pega a posicao y da casa
	li a3, 0x3000		#cor background verde foreground preto
	li a7, 111
	ecall			#imprime a casa
	addi t0, t0, 8		#t0 aponta para o proximo elementos do vetor
	addi t2, t2, 1		#incrementa i
	bne t2, t1, print	#i!=N ? print : continua
	
	lw a0, 8(sp)		#a0 volta a ter seu valor original
	lw a1, 4(sp)		#a1 volta a ter seu valor original
	lw a2, 0(sp)		#a2 volta a ter seu valor original
	addi sp, sp, 12		#desempilha
	ret

ROTAS:	addi sp, sp, -12
	sw a0, 8(sp)
	sw a1, 4(sp)
	sw a2, 0(sp)
	
matriz_dist:
	mv t0, a0		# N
	mv t1, a1		# C
	mv t2, a2		# D
	li t3, 0		# i --> linha

LOOPm1:	beq t3, t0, FIMm1
	
	slli t3, t3, 3
	add t3, t3, t1
	
	lw a0, 0(t3)
	lw a1, 4(t3)
	
	sub t3, t3, t1
	srli t3, t3, 3
	
	li t4, 0 		# j --> coluna
	
LOOPm2:	beq t4, t0, FIMm2
			
	slli t4, t4, 3
	add t4, t4, t1
	
	lw a2, 0(t4)
	lw a3, 4(t4)

	sub t4, t4, t1
	srli t4, t4, 3
	
	sub t5, a0, a2
	sub t6, a1, a3
	mul t5, t5, t5
	mul t6, t6, t6
	add t5, t5, t6
	fcvt.s.w ft0, t5
	fsqrt.s ft0, ft0

	li t6, 0
	mul t3, t3, t0
	add t6, t4, t3
	slli t6, t6, 2
	add t6, t6, t2
	
	fsw ft0, 0(t6)
	
	div t3, t3, t0
	
	li t6, 0
	mul t4, t4, t0
	add t6, t4, t3
	slli t6, t6, 2
	add t6, t6, t2
	
	fsw ft0, 0(t6)
	
	div t4, t4, t0
	
	addi t4, t4, 1
	j LOOPm2
	
FIMm2:	addi t3, t3, 1 
	j LOOPm1
	
FIMm1:	
	lw a0, 8(sp)		#a0 volta a ter seu valor original
	lw a1, 4(sp)		#a1 volta a ter seu valor original
	lw a2, 0(sp)
	
	mv t0, a1
	mv t1, a0
	mv t4, a2
	
	

pick_one:li t2, 0
	lw a0, 0(t0)
	lw a1, 4(t0)
	addi t0, t0, 8
	mv t3, t0
	
draw_path:lw a2, 0(t0)
	lw a3, 4(t0)
	li a4, 0xFFFF
	li a5, 0
	li a7, 147
	ecall
	
	addi t0, t0, 8
	addi t2, t2, 1
	
	bne t2, t1, draw_path
	addi t1, t1, -1
	mv t0, t3
	bne t1, zero, pick_one
	
	
	
	
	lw a0, 8(sp)		#a0 volta a ter seu valor original
	lw a1, 4(sp)		#a1 volta a ter seu valor original
	lw a2, 0(sp)
	addi sp, sp, 12		#desempilha	
	
	ret


	
	
	
.include "System/SYSTEMv21.s"
