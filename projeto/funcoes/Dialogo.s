#.include "../MACROSv21.s"

.data
msg1: .string "Depois do grande sucesso do filme do   "
msg2: .string "Mario, o encanador bigodudo passou a    " 
msg3: .string "frequentar Hollywood e fazer novos      "
msg4: .string "amigos."

#PASSA PARA OUTRA TELA

msg5: .string "Pediam autografos, recebia propostas    "
msg6: .string "para uma continuacao e era amado e      "
msg7: .string "reconhecido por todo mundo. "

# PASSA PARA OUTRA TELA

msg8: .string "Porem a Princesa Peach percebeu que nao\n"
msg9: .string "estava mais recebendo a atencao devida. "

# PASSA PARA OUTRA TELA

msg10: .string "Podemos conversar? "			#PEACH

msg11: .string "Claro, mas seja rapida,  tenho que "		#MARIO
msg12: .string "encontrar o The Rock em um evento"

msg13: .string "Voce tem sempre um compromisso, ne\n"		#PEACH
msg14: .string "e nunca eh comigo ou com o Reino do\n"
msg15: .string "Cogumelo"

msg16: .string "Desculpa, Peach, mas voce sabe como eh,\n"	#MARIO
msg17: .string "eu tenho outros compromissos agora"

msg18: .string "Entao se eh assim, talvez eu tenha que\n"		#PEACH
msg19: .string "encontrar outra coisa pra fazer"

msg20: .string "Peach da as costas e sai"

msg21: .string "Mario desesperado tenta impedi-la,       mas\n"
msg22: .string "nao consegue"

msg23: .string "Dias depois, Mario ainda nao conseguiu\n"
msg24: .string "convencer a Princesa Peach a voltar,         \n"
msg25: .string "   entao ele decide ir mais uma vez tentar   \n"
msg26: .string "    reconquista-la"

.text

STORY:		
		addi sp, sp, -4 
		sw ra, 0(sp)
		
		jal dialogo.CLEAR
		li a7,104	# ecall print string
		li a1,5
		li a2,5
		li a3,0xFF00
		li a4,0
		la a0,msg1
		ecall
		addi a2, a2, 8
		la a0, msg2
		jal dialogo.PRINTSTR
		la a0, msg3
		jal dialogo.PRINTSTR				
		la a0, msg4
		jal dialogo.PRINTSTR
		jal dialogo.READ_CHAR
		
		la a0, msg5
		jal dialogo.PRINTSTR
		la a0, msg6
		jal dialogo.PRINTSTR
		la a0, msg7
		jal dialogo.PRINTSTR
		jal dialogo.READ_CHAR
		
		la a0, msg8
		jal dialogo.PRINTSTR
		la a0, msg9
		jal dialogo.PRINTSTR
		jal dialogo.READ_CHAR
		
		# Peach
		la a0, PeachDialog
		mv a5, a1
		mv a6, a2
		mv a7, a3
		li a1, 300
		li a2, 32
		li a3, 0
		jal Print
		mv a1, a5
		mv a2, a6
		mv a3, a7
		#####################		
		la a0, msg10
		jal dialogo.PRINTSTR
		jal dialogo.READ_CHAR
		#####################
		la a0, FundoPreto
		mv a5, a1
		mv a6, a2
		mv a7, a3
		li a1, 300
		li a2, 32
		li a3, 0
		jal Print
		mv a1, a5
		mv a2, a6
		mv a3, a7
		
		# Mario
		la a0, MarioDialog
		mv a5, a1
		mv a6, a2
		mv a7, a3
		li a1, 4
		li a2, 32
		li a3, 0
		jal Print
		mv a1, a5
		mv a2, a6
		mv a3, a7
		#####################
		la a0, msg11
		jal dialogo.PRINTSTR
		la a0, msg12
		jal dialogo.PRINTSTR
		jal dialogo.READ_CHAR
		#####################
		la a0, FundoPreto
		mv a5, a1
		mv a6, a2
		mv a7, a3
		li a1, 4
		li a2, 32
		li a3, 0
		jal Print
		mv a1, a5
		mv a2, a6
		mv a3, a7
		
		# Peach
		la a0, PeachDialog
		mv a5, a1
		mv a6, a2
		mv a7, a3
		li a1, 300
		li a2, 32
		li a3, 0
		jal Print
		mv a1, a5
		mv a2, a6
		mv a3, a7
		#####################
		la a0, msg13
		jal dialogo.PRINTSTR
		la a0, msg14
		jal dialogo.PRINTSTR
		la a0, msg15
		jal dialogo.PRINTSTR
		jal dialogo.READ_CHAR
		#####################
		la a0, FundoPreto
		mv a5, a1
		mv a6, a2
		mv a7, a3
		li a1, 300
		li a2, 32
		li a3, 0
		jal Print
		mv a1, a5
		mv a2, a6
		mv a3, a7
		
		# Mario
		la a0, MarioDialog
		mv a5, a1
		mv a6, a2
		mv a7, a3
		li a1, 4
		li a2, 32
		li a3, 0
		jal Print
		mv a1, a5
		mv a2, a6
		mv a3, a7
		######################
		la a0, msg16
		jal dialogo.PRINTSTR
		la a0, msg17
		jal dialogo.PRINTSTR
		jal dialogo.READ_CHAR
		######################
		la a0, FundoPreto
		mv a5, a1
		mv a6, a2
		mv a7, a3
		li a1, 4
		li a2, 32
		li a3, 0
		jal Print
		mv a1, a5
		mv a2, a6
		mv a3, a7
		
		# Peach
		la a0, PeachDialog
		mv a5, a1
		mv a6, a2
		mv a7, a3
		li a1, 300
		li a2, 32
		li a3, 0
		jal Print
		mv a1, a5
		mv a2, a6
		mv a3, a7
		#################
		la a0, msg18
		jal dialogo.PRINTSTR
		la a0, msg19
		jal dialogo.PRINTSTR
		jal dialogo.READ_CHAR
		################
		la a0, FundoPreto
		mv a5, a1
		mv a6, a2
		mv a7, a3
		li a1, 300
		li a2, 32
		li a3, 0
		jal Print
		mv a1, a5
		mv a2, a6
		mv a3, a7
		
		# Narrador
		
		la a0, msg20
		jal dialogo.PRINTSTR
		jal dialogo.READ_CHAR
		
		la a0, msg21
		jal dialogo.PRINTSTR
		la a0, msg22
		jal dialogo.PRINTSTR
		jal dialogo.READ_CHAR
		
		la a0, msg23
		jal dialogo.PRINTSTR
		la a0, msg24
		jal dialogo.PRINTSTR
		la a0, msg25
		jal dialogo.PRINTSTR
		la a0, msg26
		jal dialogo.PRINTSTR
		jal dialogo.READ_CHAR
		
		
		lw ra, 0(sp)
		addi sp, sp, 4 
		ret
dialogo.PRINTSTR: 	
		li a7, 104
		ecall
		addi a2, a2, 8
		ret
dialogo.READ_CHAR:	
		csrr t4, 3073
		li t0, 110			# ascii do 'n'
	 	li t1,0xFF200000		# carrega o endereço de controle do KDMMIO
	 	
dialogo.LOOP: 	li t3, 20000
		csrr t5, 3073
		sub t5, t5, t4
		bgt t5,t3, dialogo.LOOPFIM	# Checa se passou 5s
		
		lw t2,0(t1)			# Le bit de Controle Teclado
	   	andi t2,t2,0x0001		# mascara o bit menos significativo
	   	beq t2,zero,dialogo.LOOP	# não tem tecla pressionada então volta ao loop
	   	lw t3,4(t1)			# le o valor da tecla
		bne t3, t0, dialogo.LOOP
dialogo.LOOPFIM:
		li a1, 5
		li a2, 5
		
dialogo.CLEAR:
		li t1,0xFF000000		# endereco inicial da Memoria VGA - Frame 0
		li t2,0xFF002E40		# endereco final 
		li t3,0xFFFFFFFF		# cor vermelho|vermelho|vermelhor|vermelho
dialogo.LOOP1: 		
		sw t3,0(t1)			# escreve a word na mem?ria VGA
		addi t1,t1,4			# soma 4 ao endere?o
		bne t1,t2,dialogo.LOOP1			# Se for o ?ltimo endere?o ent?o sai do loop
		ret
		

#.include "../SYSTEMv21.s"
