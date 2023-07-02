.data
N: .word 10
C: .word 155,115
   .space 160

.text
	la t0,N
	lw a0,0(t0)
	la a1,C
	jal SORTEIO
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
	bne t3, t4, gera	#i=N ? continua : j gera
	lw a0, 0(sp)		#a0 volta a ter o valor seu valor original
	addi sp, sp, 4		#desempilha
	ret
