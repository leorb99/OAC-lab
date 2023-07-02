.include "System/MACROSv21.s"
.data

N: .word 10
C: .word 155,115
.space 160


.text
	la t0,N
	lw a0,0(t0)
	la a1,C
	jal SORTEIO
	jal DESENHA
	li a7, 10
	ecall
	
SORTEIO:
	li t3, 0		#i=0
	addi sp, sp, -4
	sw a0, 0(sp)		#salva a0 na pilha
	lw t4, 0(sp)		#t4=N
	li t1, 310
	li t2, 230
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
	lw a0, 0(sp)		#a0 volta a ter o valor seu valor original
	addi sp, sp, 4		#desempilha
	ret
	
DESENHA:
	addi sp, sp, -8		
	sw a0, 4(sp)		#salva a0 na pilha
	sw a1, 0(sp)		#salva a1 na pilha

	la t0, C		#t0 recebe o endereco do vetor C
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
	
	lw a0, 4(sp)		#a0 volta a ter seu valor original
	lw a1, 0(sp)		#a1 volta a ter seu valor original
	addi sp, sp, 8		#desempilha
	ret

.include "System/SYSTEMv21.s"
