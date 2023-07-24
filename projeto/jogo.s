.include "./MACROSv21.s"

.eqv velx	4
.eqv vely	10
.eqv g		-1

.data
.include "sprites/mario1.s"
.include "sprites/peach1.s"
.include "sprites/PeachDialog.s"
.include "sprites/MarioDialog.s"
.include "sprites/FundoPreto.s"
.include "sprites/mapa1.s"
.include "sprites/Mario.s"
.include "sprites/MarioG.s"

Reset: .byte 0

	#################
	#	Mapa	#
	#################
	
Mapa.offset: 	.word 0		# Entre 0 e 3056	
	
	#################
	#	Mario	#
	#################

Mario.size: 	.byte 1		# 0 --> Normal; 1 --> Grande
Mario.dir: 	.byte 0		# 0 --> Direita; 1 --> Esquerda
Mario.mov:	.byte 0		# 0 --> Parado, 1 --> Movendo; 2 --> Pulando
Mario.ar:	.byte 0		# 0 --> Nao; 1 --> sim
Mario.Velx:	.word 0
Mario.Vely: 	.word 0		# Velocidade vertical 
Mario.pos: 	.word 96, 192	# ( X , Y )
Mario.animacao:	.byte 0 	# 0: parado; 1-5: andando; 6: pulando	
	
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
	sw zero, 0(t0)
	
	la t0, Reset
	sb zero, 0(t0)
	
	la t0, Mario.dir
	sb zero, 0(t0)
	
	la t0, Mario.mov
	sb zero, 0(t0)
	
	la t0, Mario.ar
	sb zero, 0(t0)
	
	la t0, Mario.size 
	sb zero, 0(t0)
	
	la t0, Mario.Velx 
	sw zero, 0(t0)
	
	la t0, Mario.Vely 
	sw zero, 0(t0)
	
	la t0, Mario.animacao 
	sb zero, 0(t0)
	
	la t0, Mario.pos
	li t1, 96
	sw t1, 0(t0)
	li t1, 192
	sw t1, 4(t0)
	
	mv t0, zero
	mv t1, zero
	
	li a1, 0
	li a3, 0
	jal PrintMapa
	li a3, 1
	jal PrintMapa
	csrr s11, 3073
LOOP:	
	# REALIZA TODOS OS CALCULOS

	jal inTeclado
	
	la t0, Reset
	lb t0, 0(t0)
	beqz t0, CONTINUAR
	j init
CONTINUAR:
	
	#jal atualizaPos		# incompleto
	#jal atualuzaAnim		# incompleto


TIMER:	csrr t0, 3073		
	sub t0, t0, s11
	li t1, 16
	blt t0, t1, TIMER	# VERIFICA SE JA PASSARAM 16 ms
	
	csrr s11, 3073 	

	# IMPRIME NA TELA
	li t0, 0xff200604
	lw a3, 0(t0)
	andi a3, a3, 1
	xori a3, a3, 1
	
	la t0, Mapa.offset
	lw a1, 0(t0)
	jal PrintMapa
	
	jal PrintMario
	li t0, 0xff200604
	sw a3, 0(t0)
	
	
	beqz s6,FIM
	lw a0,0(s5)		# le o valor da nota
	lw a1,4(s5)		# le a duracao da nota
	li a7,31		# define a chamada de syscall
	#ecall			# toca a nota
	mv a0, a1
	li a7,32		# define a chamada de syscal 
	#ecall			# realiza uma pausa de a0 ms
	addi s5,s5,8		# incrementa para o endere?o da pr?xima nota
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

.include	"./funcoes/inTeclado.s"
.include	"./funcoes/PrintMapa.s"
.include	"./funcoes/Print.s"
.include	"./funcoes/PrintMario.s"
#.include	"./funcoes/colisao.s"
#.include	"./funcoes/atualizaPos.s"
#.include	"./funcoes/atualizaAnim.s"
#.include	"./funcoes/Dialogo.s"
.include 	"./funcoes/story.s"
.include 	"./funcoes/midi.s"
.include 	"./SYSTEMv21.s"
