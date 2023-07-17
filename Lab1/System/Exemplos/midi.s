###############################################
#  Programa de exemplo para Syscall MIDI      #
#  ISC Abr 2018				      #
#  Marcus Vinicius Lamar		      #
###############################################

.data
# Numero de Notas a tocar
NUM: .word 41
# lista de nota,dura��o,nota,dura��o,nota,dura��o,...
NOTAS: 76,150,76,300,76,300,72,150,76,300,79,600,55,600,72,450,67,450,64,450,69,300,71,300,70,150,69,300,67,201,76,197,79,201,81,300,77,150,79,300,76,300,72,150,74,150,71,450,72,450,67,450,64,450,69,300,71,300,70,150,69,300,67,201,76,198,79,201,81,300,77,150,79,300,76,300,72,150,74,150,71,150

.text
#	la s0,NUM		# define o endere�o do n�mero de notas
#	lw s1,0(s0)		# le o numero de notas
#	la s0,NOTAS		# define o endere�o das notas
#	li t0,0			# zera o contador de notas
#	li a2,68		# define o instrumento
#	li a3,127		# define o volume

#LOOP:	beq t0,s1, FIM		# contador chegou no final? ent�o  v� para FIM
#	lw a0,0(s0)		# le o valor da nota
#	lw a1,4(s0)		# le a duracao da nota
#	li a7,31		# define a chamada de syscall
#	ecall			# toca a nota
#	mv a0,a1		# passa a dura��o da nota para a pausa
#	li a7,32		# define a chamada de syscal 
#	ecall			# realiza uma pausa de a0 ms
#	addi s0,s0,8		# incrementa para o endere�o da pr�xima nota
#	addi t0,t0,1		# incrementa o contador de notas
#	j LOOP			# volta ao loop
	
FIM:	li a0,70		# define a nota
	li a1,300		# define a dura��o da nota em ms
	li a2,0	         	# define o instrumento
	li a3,127		# define o volume
	li a7,33		# define o syscall
	ecall			# toca a nota
	li a0, 60
	ecall
	li a7,10		# define o syscall Exit
	ecall			# exit

