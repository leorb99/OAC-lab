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

Mario.size: 	.byte 0		# 0 --> Normal; 1 --> Grande
Mario.dir: 	.byte 0		# 0 --> Direita; 1 --> Esquerda
Mario.Velx:	.word 0
Mario.Vely: 	.word 0	# Velocidade vertical 
Mario.pos: 	.word 96, 192	# ( X , Y )

Mario.animado:	.byte 0 	# 0: parado; 1-3: andando; 4: pulando	
	
	
.text
	jal STORY

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

	j LOOP
fim:	j	fim

.include 	"story.s"
.include	"./funcoes/inTeclado.s"
.include	"./funcoes/PrintMapa.s"
.include	"./funcoes/Print.s"
.include	"./funcoes/PrintMario.s"

