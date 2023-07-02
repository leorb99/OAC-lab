.include "System/MACROSv21.s"
.data

N: .word 7
C: .word 155,115,65,35,250,42,80,210,220,210,155,22,245,115,60,115
   .space 124
D: .space 1600


.text
	la t0,N
	lw a0,0(t0)
	la a1,C
	la a2,D
	#jal SORTEIO
	jal DESENHA
	jal ROTAS
	#jal ORDENA
	li a7, 10
	ecall
	
SORTEIO:
	addi sp, sp, -12
	sw a0, 8(sp)		#salva a0 na pilha
	sw a1, 4(sp)
	sw a2, 0(sp)
	li t1, 310
	li t2, 230
	li t3, 0		#i=0
	lw t4, 8(sp)		#t4=N
gera:	
	addi a1, a1, 8		#aloca espaco no conjunto C
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
	
DESENHA:
	addi sp, sp, -12		
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

print:	
	addi a0, a0, 1		#incrementa a0 para imprimir a proxima letra
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

ROTAS:	
	addi sp, sp, -12
	sw a0, 8(sp)		#N
	sw a1, 4(sp)		#C
	sw a2, 0(sp)		#D
	mv s0, a0		#s0=N
	mv s1, a1		#s1 tem o endereco inicial de C
	mv s2, a2		#s2 tem o endereco inicial de D
	mv t3, s1		#percorre a lista
	mv t4, s2		#percorre a matriz
	li t0, 0		#representa a linha	
	li t1, 0		#representa a coluna

pick_one:
	lw a0, 0(t3)		#a0=x0
	lw a1, 4(t3)		#a1=y0
	addi t3, t3, 8		#aponta para o proximo par de coordenadas
	fcvt.s.w ft1, zero	#diagonal principal
	fsw ft1, 0(t4)		#armazena o 0 na diagonal principal
	mv t6, t3		#nem lembro
	
draw_calc:
	addi t4, t4, 4		#aponta o proximo endereco da matriz
	lw a2, 0(t3)		#a2=x1
	lw a3, 4(t3)		#a3=y1
	li a4, 0xFFFF		#cor da linha
	li a5, 0		#frame
	li a7, 147		#procedimento para desenhar a linha
	ecall

	addi t1, t1, 1		#incrementa o numero da coluna		
	sub a2, a0, a2		#(x0-x1)
	sub a3, a1, a3		#(y0-y1)
	mul a2, a2, a2		#(x0-x1)^2
	mul a3, a3, a3		#(y0-y1)^2
	add a2, a3, a2		#(x0-x1)^2+(y0-y1)^2
	fcvt.s.w ft0, a2	#converte o valor calculado para float
	fsqrt.s ft0, ft0	#sqrt((x0-x1)^2+(y0-y1)^2)
	fsw ft0, 0(t4)		#armazena na matriz
	
	sub a2, t1, t0		#(coluna-linha)
	mul a2, a2, s0		#(coluna-linha)*N
	slli a2, a2, 2		#(coluna-linha)*N*4
	add t4, t4, a2		#endereco onde deve ser armazenado o dado
	
	fsw ft0, 0(t4)		#armazena na matriz
	sub t4, t4, a2		#volta para o endereco adequado
	addi t3, t3, 8		#aponta para o proximo ponto

	blt t1, s0, draw_calc	#verifica se ja terminou uma linha da matriz
	#calcula o endereco que deve continuar na linha seguinte
	slli t0, t0, 2		#linha*4
	addi t0, t0, 8		#linha*4+8
	add t4, t4, t0		#t4 aponta para o endereco da diagonal na linha seguinte
	
	addi t0, t0, -8		#t0-8
	srli t0, t0, 2		#(t0-8)/4 volta t0 ao valor correto
	
	addi t0, t0, 1		#incrementa o numero da linha
	mv t1, t0		#a coluna começa no msm indice da linha
	mv t3, t6		
	bne t0, s0, pick_one	#verifica se ja terminou todas as linhas

	lw a0, 8(sp)		#a0 volta a ter seu valor original
	lw a1, 4(sp)		#a1 volta a ter seu valor original
	lw a2, 0(sp)
	addi sp, sp, 12		#desempilha
	ret

.include "System/SYSTEMv21.s"
