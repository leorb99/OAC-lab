`ifndef PARAM
	`include "Parametros.v"
`endif

module Uniciclo (
	input wire clock,
	input wire clock2,
	input wire reset,
	output reg [31:0] PC,
	output reg [31:0] Instr,
	input wire[4:0] regin,
	output reg [31:0] regout,
	///////////////////////////////////
	output wire [31:0] regt0, regt2, regs0, regs1,
	output reg [3:0] regEstados
	///////////////////////////////////
		
	);
	
	initial
		begin
			PC<=32'h0040_0000;
			Instr<=32'b0;
			regout<=32'b0;
		end
		

// Aqui vai o seu código do processador

////////////Fios do controle////////////
wire 			 wCOrigPC;
wire [1:0]	 wCALUOp;
wire [1:0]	 wCOrigAULA;
wire [1:0]	 wCOrigBULA;
wire 			 wCEscrevePCB;
wire 			 wCEscreveReg;
wire [1:0] 	 wCMemtoReg;
wire 			 wCEscrevePCCond;
wire 			 wCEscrevePC;
wire			 wCIouD;
wire			 wCEscreveMem;
wire			 wCLeMem;			// n foi usado
wire 			 wCEscreveIR;
////////////////////////////////////////

///////////////Fios do PC///////////////
wire [31:0]  wCEntraPC;
wire [31:0]  wCSaiPC;
wire 			 wCSaltoPC;
assign 		 wCSaltoPC = wCEscrevePC | (wCEscrevePCCond & wCZero);
////////////////////////////////////////

////////////Fios da Memoria/////////////
wire [10:0]	 wCEnderecoMem;
wire [31:0]  wCSaiMem;			// pode ser uma instrucao ou dado
////////////////////////////////////////

////////////////Fios BR/////////////////
wire [4:0]  wCRS1;
assign wCRS1 = regInstr[19:15];
wire [4:0]  wCRS2;
assign wCRS2 = regInstr[24:20];
wire [4:0]  wCRD;
assign wCRD = regInstr[11:7];
wire [31:0]	 wCDadoEscrita;
wire [6:0] 	 wCOpcode;
assign wCOpcode = regInstr[6:0];
wire [31:0]  wCDadoA;
wire [31:0]  wCDadoB;
////////////////////////////////////////

////////////Fios Ula e Imm//////////////
wire [31:0]  wCSaiImm;
wire [31:0]  wCEntraAULA;
wire [31:0]  wCEntraBULA;
wire 			 wCZero;
wire [31:0]  wCResultadoULA;
wire [3:0]   wCControleULA;
wire [9:0]   wCFunct10;
assign wCFunct10 = {{regInstr[31:25]}, {regInstr[14:12]}};
////////////////////////////////////////

reg [31:0] regInstr, regDados, regPCB, regA, regB, regSaidaULA;

always @(posedge clock or posedge reset)
	begin
		if(reset)
			begin	
				regInstr 	<= 32'b0;
				regDados 	<= 32'b0;
				regPCB 		<= 32'b0;
				regA 			<= 32'b0;
				regB 			<= 32'b0;
				regSaidaULA <= 32'b0;
			end
		else
			begin
				regDados 	<= wCSaiMem;
				regA 			<= wCDadoA;
				regB 			<= wCDadoB;
				regSaidaULA <= wCResultadoULA;
				if(wCEscreveIR)
					regInstr    <= wCSaiMem;
				if(wCEscrevePCB)
					regPCB      <= wCSaiPC;
			end		
	end


Controle ctrl(
	.iCLK(clock),
	.iRST(reset),
	.iOpCode(wCOpcode),
	.oMem2Reg(wCMemtoReg),
	.oOrigAULA(wCOrigAULA),
	.oOrigBULA(wCOrigBULA),
	.oOrigPC(wCOrigPC),
	.oALUOp(wCALUOp),
	.oEscrevePCB(wCEscrevePCB),
	.oEscreveReg(wCEscreveReg),
	.oEscreveIR(wCEscreveIR),
	.oLeMem(wCLeMem),
	.oEscreveMem(wCEscreveMem),
	.oIouD(wCIouD),
	.oEscrevePC(wCEscrevePC),
	.oEscrevePCCond(wCEscrevePCCond),
	.estado(regEstados)
);

Pc ProgramCounter(
	.clk(clock),
	.rst(reset),
	.PCNext(wCEntraPC),
	.EscrevePC(wCSaltoPC),
	.PC(wCSaiPC)
	);
	
always @ (*)
	case (wCIouD)
		1'b0:
			wCEnderecoMem <= wCSaiPC;
		1'b1:
			wCEnderecoMem <= regSaidaULA;
		default:
			wCEnderecoMem <= 32'b0;
	endcase

Memoria Mem(
	.address(wCEnderecoMem),
	.data(regB),
	.clock(clock2),
	.wren(wCEscreveMem),
	.q(wCSaiMem)
);

always @(*)
	case(wCMemtoReg)
		2'b00:
			wCDadoEscrita <= regSaidaULA;
		2'b01:
			wCDadoEscrita <= wCSaiPC;
		2'b10:
			wCDadoEscrita <= regDados;
		default:
			wCDadoEscrita <= 32'b0;
	endcase

Registers reg0(
	.CLK(clock), 
	.RST(reset), 
	.RegWrite(wCEscreveReg), 
	.RS1(wCRS1), 
	.RS2(wCRS2), 
	.RD(wCRD), 
	.WriteData(wCDadoEscrita), 
	.ReadData1(wCDadoA), 
	.ReadData2(wCDadoB),
	.Rin(regin),
	.Rout(regout),
	////////////////////////////////////////////////
	.t0(regt0),
	.t2(regt2),
	.s0(regs0),
	.s1(regs1)
	////////////////////////////////////////////////
);

ImmGen imm(
	.iInstrucao(regInstr),
	.oImm(wCSaiImm)
);

always @(*)
	case(wCOrigAULA)
		2'b00:
			wCEntraAULA <= regPCB;
		2'b01:
			wCEntraAULA <= regA;
		2'b10:
			wCEntraAULA <= wCSaiPC;
		default:
			wCEntraAULA <= 32'h00000000;
	endcase

always @(*)
	case(wCOrigBULA)
		2'b00:
			wCEntraBULA <= regB;
		2'b01:
			wCEntraBULA <= 32'h00000001;
		2'b10:
			wCEntraBULA <= wCSaiImm;
		default:
			wCEntraBULA <= 32'h00000000;
	endcase

ALUControl ControleULA(
	.Funct10(wCFunct10),
	.ALUOp(wCALUOp),
	.ALUCtrl(wCControleULA)
);

ALU ULA(
	.iControl(wCControleULA),
	.iA(wCEntraAULA),
	.iB(wCEntraBULA),
	.oResult(wCResultadoULA),
	.zero(wCZero)
);

always @(*)
	if(wCOrigPC)
		wCEntraPC <= wCResultadoULA;
	else
		wCEntraPC <= regSaidaULA;

endmodule
