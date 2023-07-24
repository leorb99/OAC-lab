.include "MACROSv21.s"
.data

	#################
	#	Mapa	#
	#################
	
Mapa.offset: 	.word 0	# Entre 0 e 192	
	
.include "sprites/mapa1.s"

	#################
	#	Mario	#
	#################
	
.include "sprites/Mario.s"

Mario.size: 	.word 0		# 0 --> Normal; 1 --> Grande
Mario.dir: 	.word 0		# 0 --> Direita; 1 --> Esquerda
Mario.Velx:	.word 0
Mario.Vely: 	.word 0	# Velocidade vertical 
Mario.pos: 	.word 96, 192	# ( X , Y )

Mario.animado:	.byte 0 	# 0: parado; 1-3: andando; 4: pulando	
	
	
.text
	jal STORY

MUSICA:	la s5, NOTES
	lw s6, LEN_MUSIC
	mv t6, s6
	mv s11, a0 
	mv s10, a7
	mv s9, a1
	mv s8, a2
	mv s7, a3
	
	li a2,68		# define o instrumento
	li a3,127		# define o volume
	
init:				# Reseta todos os dados
	la t0, Mapa.offset 
	lw zero, 0(t0)
	
	la t0, Mario.size 
	lw zero, 0(t0)
	
	la t0, Mario.Velx 
	lw zero, 0(t0)
	
	la t0, Mario.Vely 
	lw zero, 0(t0)
	
	la t0, Mario.animado 
	lw zero, 0(t0)
	
	la t0, Mario.pos
	li t1, 96
	lw t1, 0(t0)
	li t1, 208
	lw t1, 4(t0)
	
	mv t0, zero
	mv t1, zero
	
main:	li a1, 0
	li a3, 0
	jal PrintMapa
	li a3, 1
	jal PrintMapa
	
LOOP:	
	jal inTeclado
	
	la t0, Mapa.offset
	lw a1, 0(t0)
	jal PrintMapa
	
	jal PrintMario
	li t0, 0xff200604
	sw a3, 0(t0)
	xori a3, a3, 1

	mv s11, a0 
	mv s10, a7
	mv s9, a1
	mv s8, a2
	mv s7, a3
	
	beqz s6,FIM
	lw a0,0(s5)		# le o valor da nota
	lw a1,4(s5)		# le a duracao da nota
	li a7,31		# define a chamada de syscall
	#ecall			# toca a nota
	mv a0, a1
	li a7,32		# define a chamada de syscal 
	#ecall			# realiza uma pausa de a0 ms
	addi s5,s5,8		# incrementa para o endere�o da pr�xima nota
	addi s6,s6,-1		# incrementa o contador de notas
	
	mv a0, s11 
	mv a7, s10
	mv a1, s9
	mv a2, s8
	mv a3, s7
	
	
	j LOOP
	
	
	
FIM:		
	mv s6, t6
	j LOOP
	
fim:	j	fim

.include 	"story.s"
.include	"./funcoes/inTeclado.s"
.include	"./funcoes/PrintMapa.s"
.include	"./funcoes/Print.s"
.include	"./funcoes/PrintMario.s"
.include 	"midi.s"
