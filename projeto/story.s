
.data

.include "sprites/mario1.s"
.include "sprites/peach1.s"

msg1: .string "Depois do grande sucesso do filme do"
msg2: .string "Mario, o encanador bigodudo passou a" 
msg3: .string "frequentar Hollywood e fazer novos"
msg4: .string "amigos. "

msg5: .string "Pediam autografos, recebia propostas"
msg6: .string "para uma continuacao e era amado e"
msg7: .string "reconhecido por todo mundo."

msg8: .string "Porem a Princesa Peach percebeu que nao"
msg9: .string "estava mais recebendo a atencao devida."

msg10: .string "Podemos conversar?"				#PEACH

msg11: .string "Claro, mas seja rapida, tenho que"		#MARIO
msg12: .string "encontrar o The Rock em um evento..."

msg13: .string "Voce tem sempre um compromisso, ne"		#PEACH
msg14: .string "e nunca eh comigo ou com o Reino do"
msg15: .string "Cogumelo."

msg16: .string "Desculpa, Peach, mas voce sabe como eh,"	#MARIO
msg17: .string "eu tenho outros compromissos agora."

msg18: .string "Entao se eh assim, talvez eu tenha que"		#PEACH
msg19: .string "encontrar outra coisa pra fazer."

msg20: .string "Peach da as costas e sai!"

msg21: .string "Mario desesperado tenta impedi-la, mas"
msg22: .string "nao consegue."

msg23: .string "Dias depois, Mario ainda nao conseguiu"
msg24: .string "convencer a Princesa Peach a voltar,"
msg25: .string "entao ele decide ir mais uma vez tentar"
msg26: .string "reconquista-la!"

.text

STORY:		
		addi sp, sp, -4
		sw ra, 0(sp)
		li a7, 148
		li a0, 0xF0FF
		ecall
#		jal PLAY_MUSIC

		li a7,104	# ecall print string
		li a1,5
		li a2,5
		li a3,0xFF00
		li a4,0
		la a0,msg1
		ecall
		addi a2, a2, 10
		la a0, msg2
		jal PRINTSTR
		la a0, msg3
		jal PRINTSTR				
		la a0, msg4
		jal PRINTSTR
		jal CLEAR
		
		la a0, msg5
		jal PRINTSTR
		la a0, msg6
		jal PRINTSTR
		la a0, msg7
		jal PRINTSTR
		jal CLEAR
		
		la a0, msg8
		jal PRINTSTR
		la a0, msg9
		jal PRINTSTR
		jal CLEAR
		
		jal PRINT_PEACH
		la a0, msg10
		jal PRINTSTR
		jal CLEAR

		jal PRINT_MARIO
		la a0, msg11
		jal PRINTSTR
		la a0, msg12
		jal PRINTSTR
		jal CLEAR
		
		la a0, msg13
		jal PRINTSTR
		la a0, msg14
		jal PRINTSTR
		la a0, msg15
		jal PRINTSTR
		jal CLEAR
		
		la a0, msg16
		jal PRINTSTR
		la a0, msg17
		jal PRINTSTR
		jal CLEAR
		
		la a0, msg18
		jal PRINTSTR
		la a0, msg19
		jal PRINTSTR
		jal CLEAR
		
		la a0, msg20
		jal PRINTSTR
		jal CLEAR
		
		la a0, msg21
		jal PRINTSTR
		la a0, msg22
		jal PRINTSTR
		jal CLEAR
		la a0, msg23
		jal PRINTSTR
		la a0, msg24
		jal PRINTSTR
		la a0, msg25
		jal PRINTSTR
		la a0, msg26
		jal PRINTSTR
		jal CLEAR
		
		lw ra, 0(sp)
		addi sp, sp, 4
		ret

PRINTSTR: 	
		li a7, 104
		ecall
		addi a2, a2, 10
		ret
CLEAR:
		li a7, 32
		li a0, 500
		ecall
		li t1,0xFF000000		# endereco inicial da Memoria VGA - Frame 0
		li t2,0xFF0035C0		# endereco final 
		li t3,0xFFFFFFFF		# cor branco|branco|branco|branco
LOOP_CLEAR: 		
		sw t3,0(t1)			# escreve a word na mem�ria VGA
		addi t1,t1,4			# soma 4 ao endere�o
		bne t1,t2,LOOP_CLEAR		# Se for o �ltimo endere�o ent�o sai do loop
		li a1, 5
		li a2, 5
		ret

PRINT_PEACH:
		la a0,peach1			# carrega o endereco do sprite 'map' em a0
		li t0,0xFF00B280		# carrega 0xFF0 em t0
		j PRINT_SETUP

PRINT_MARIO:
		la a0,mario1			# carrega o endereco do sprite 'map' em a0
		li t0,0xFF00BE00		# carrega 0xFF0 em t0
		
PRINT_SETUP:	
		li a1,0				# x = 0
		li a2,0				# y = 0
		li a3,0				# frame = 0
		
		add t0,t0,a3			# adiciona o frame ao FF0 (se o frame for 1 vira FF1, se for 0 fica FF0)
		
		add t0,t0,a1			# adiciona x ao t0
		
		li t1,320			# t1 = 320
		mul t1,t1,a2			# t1 = 320 * y
		add t0,t0,t1			# adiciona t1 ao t0
		
		addi t1,a0,8			# t1 = a0 + 8
		
		mv t2,zero			# zera t2
		mv t3,zero			# zera t3
			
		lw t4,0(a0)			# carrega a largura em t4
		lw t5,4(a0)			# carrega a altura em t5
		
PRINT_LINHA:	
		
		lw t6,0(t1)			# carrega em t6 uma word (4 pixeis) da imagem
		sw t6,0(t0)			# imprime no bitmap a word (4 pixeis) da imagem
	
		addi t0,t0,4			# incrementa endereco do bitmap
		addi t1,t1,4			# incrementa endereco da imagem
			
		addi t3,t3,4			# incrementa contador de coluna
		blt t3,t4,PRINT_LINHA		# se contador da coluna < largura, continue imprimindo
	
		addi t0,t0,320			# t0 += 320
		sub t0,t0,t4			# t0 -= largura da imagem
		# ^ isso serve pra "pular" de linha no bitmap display
		
		mv t3,zero			# zera t3 (contador de coluna)
		addi t2,t2,1			# incrementa contador de linha
		bgt t5,t2,PRINT_LINHA		# se altura > contador de linha, continue imprimindo
		li a3,0xFF00
		li a1, 5
		li a2, 5
		ret
				
.include "SYSTEMv21.s"
#.include "midi.s"

