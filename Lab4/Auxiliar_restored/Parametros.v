`define UNICICLO

`ifndef PARAM
`define PARAM 

/* Parametros Gerais*/
parameter
    ON          = 1'b1,
    OFF         = 1'b0,
    ZERO        = 32'h00000000,	 

/* Operacoes da ULA */
	OPAND		= 4'd0,
	OPOR		= 4'd1,
	OPADD		= 4'd2,
	OPSUB		= 4'd6,
	OPSLT		= 4'd7,
	OPNULL	= 4'd15	, // saída ZERO

/* Campo OpCode */
	OPC_LOAD       	= 7'b0000011,
	OPC_STORE      	= 7'b0100011,
	OPC_RTYPE    		= 7'b0110011,
	OPC_BRANCH     	= 7'b1100011,
	OPC_JAL        	= 7'b1101111,

	FUNADD = 10'b0000000_000,
	FUNSUB = 10'b0100000_000,
	FUNAND = 10'b0000000_111,
	FUNOR = 10'b0000000_110,
	FUNSLT = 10'b0000000_010,
    
	 BEGINNING_TEXT      = 32'h0040_0000,
	 TEXT_WIDTH				= 8+2,					// 1024words = 1024x4 = 4ki bytes	 
    END_TEXT            = (BEGINNING_TEXT + 2**TEXT_WIDTH) - 1,	 

	 
    BEGINNING_DATA1      = 32'h1001_0000,
	 DATA_WIDTH1			 = 8+2,					// 1024 words = 1024x4 = 4ki bytes
    END_DATA            = (BEGINNING_DATA1 + 2**DATA_WIDTH1) - 1,	 

	 BEGINNING_DATA		= BEGINNING_DATA1,
	 
	 STACK_ADDRESS       = END_DATA-3;
`endif