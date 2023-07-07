`ifndef PARAM
	`include "Parametros.v"
`endif

module Controle (
	input wire iCLK, iRST,
	input wire [6:0] iOpCode,
	output reg [1:0] oMem2Reg, oOrigAULA, oOrigBULA, oALUOp,
	output reg oOrigPC, oEscrevePCB, oEscreveReg, oEscreveIR, oLeMem, oEscreveMem, oIouD, oEscrevePC, oEscrevePCCond
);
reg [3:0] estado;
parameter inicio 				= 4'b0000,
			 decod 				= 4'b0001,
			 load_store 		= 4'b0010,
			 load 				= 4'b0011,
			 conclusao_lw 		= 4'b0100,
			 store 				= 4'b0101,
			 tipo_r 				= 4'b0110,
			 conclusao_tipo_r = 4'b0111,
			 beq 					= 4'b1000,
			 jal 					= 4'b1001;

initial 
	begin
		estado <= inicio;
	end

always @(posedge iCLK, posedge iRST)
	begin
		if(iRST == 1'b1)
			estado <= inicio;
		else
			begin
				case(estado)
					inicio:
						begin
							estado <= decod;
						end
					decod:
						begin
							case(iOpCode)
								OPC_LOAD, OPC_STORE:
									estado <= load_store;
								OPC_RTYPE:
									estado <= tipo_r;
								OPC_BRANCH:
									estado <= beq;
								OPC_JAL:
									estado <= jal;
							endcase
						end
					load_store:
						begin
							case(iOpCode)
								OPC_LOAD:
									estado <= load;
								OPC_STORE:
									estado <= store;
							endcase	
						end
					load:
						begin
							estado <= conclusao_lw;
						end
					tipo_r:
						begin
							estado <= conclusao_tipo_r;
						end
					default:
						begin
							estado <= inicio;
						end
			endcase
		end
	end
	
always @(estado)
	begin
		case(estado)
			inicio:
				begin
					oMem2Reg 		= 2'b00;
					oOrigAULA 		= 2'b10;
					oOrigBULA 		= 2'b01;
					oALUOp 			= 2'b00;
					oOrigPC 			= OFF;
					oEscrevePCB 	= ON;
					oEscreveReg 	= OFF;
					oEscreveIR 		= ON;
					oLeMem 			= ON;
					oEscreveMem 	= OFF;
					oIouD 			= OFF;
					oEscrevePC 		= ON;
					oEscrevePCCond = OFF;
				end
			decod:
				begin
					oMem2Reg 		= 2'b00;
					oOrigAULA 		= 2'b00;
					oOrigBULA 		= 2'b11;
					oALUOp 			= 2'b00;
					oOrigPC 			= OFF;
					oEscrevePCB 	= OFF;
					oEscreveReg 	= OFF;
					oEscreveIR 		= OFF;
					oLeMem 			= OFF;
					oEscreveMem 	= OFF;
					oIouD 			= OFF;
					oEscrevePC 		= OFF;
					oEscrevePCCond = OFF;
				end
			load_store:
				begin
					oMem2Reg 		= 2'b00;
					oOrigAULA 		= 2'b01;
					oOrigBULA 		= 2'b10;
					oALUOp 			= 2'b00;
					oOrigPC 			= OFF;
					oEscrevePCB 	= OFF;
					oEscreveReg 	= OFF;
					oEscreveIR 		= OFF;
					oLeMem 			= OFF;
					oEscreveMem 	= OFF;
					oIouD 			= OFF;
					oEscrevePC 		= OFF;
					oEscrevePCCond = OFF;
				end			
			load:
				begin
					oMem2Reg 		= 2'b00;
					oOrigAULA 		= 2'b00;
					oOrigBULA 		= 2'b00;
					oALUOp 			= 2'b00;
					oOrigPC 			= OFF;
					oEscrevePCB 	= OFF;
					oEscreveReg 	= OFF;
					oEscreveIR 		= OFF;
					oLeMem 			= ON;
					oEscreveMem 	= OFF;
					oIouD 			= ON;
					oEscrevePC 		= OFF;
					oEscrevePCCond = OFF;
				end			
			conclusao_lw:
				begin
					oMem2Reg 		= 2'b10;
					oOrigAULA 		= 2'b00;
					oOrigBULA 		= 2'b00;
					oALUOp 			= 2'b00;
					oOrigPC 			= OFF;
					oEscrevePCB 	= OFF;
					oEscreveReg 	= ON;
					oEscreveIR 		= OFF;
					oLeMem 			= OFF;
					oEscreveMem 	= OFF;
					oIouD 			= OFF;
					oEscrevePC 		= OFF;
					oEscrevePCCond = OFF;
				end			
			store:
				begin
					oMem2Reg 		= 2'b00;
					oOrigAULA 		= 2'b00;
					oOrigBULA 		= 2'b00;
					oALUOp 			= 2'b00;
					oOrigPC 			= OFF;
					oEscrevePCB 	= OFF;
					oEscreveReg 	= OFF;
					oEscreveIR 		= OFF;
					oLeMem 			= OFF;
					oEscreveMem 	= ON;
					oIouD 			= ON;
					oEscrevePC 		= OFF;
					oEscrevePCCond = OFF;
				end			
			tipo_r:
				begin
					oMem2Reg 		= 2'b00;
					oOrigAULA 		= 2'b01;
					oOrigBULA 		= 2'b00;
					oALUOp 			= 2'b10;
					oOrigPC 			= OFF;
					oEscrevePCB 	= OFF;
					oEscreveReg 	= OFF;
					oEscreveIR 		= OFF;
					oLeMem 			= OFF;
					oEscreveMem 	= OFF;
					oIouD 			= OFF;
					oEscrevePC 		= OFF;
					oEscrevePCCond = OFF;
				end			
			conclusao_tipo_r:
				begin
					oMem2Reg 		= 2'b00;
					oOrigAULA 		= 2'b00;
					oOrigBULA 		= 2'b00;
					oALUOp 			= 2'b00;
					oOrigPC 			= OFF;
					oEscrevePCB 	= OFF;
					oEscreveReg 	= ON;
					oEscreveIR 		= OFF;
					oLeMem 			= OFF;
					oEscreveMem 	= OFF;
					oIouD 			= OFF;
					oEscrevePC 		= OFF;
					oEscrevePCCond = OFF;
				end			
			beq:
				begin
					oMem2Reg 		= 2'b00;
					oOrigAULA 		= 2'b01;
					oOrigBULA 		= 2'b00;
					oALUOp 			= 2'b01;
					oOrigPC 			= ON;
					oEscrevePCB 	= OFF;
					oEscreveReg 	= OFF;
					oEscreveIR 		= OFF;
					oLeMem 			= OFF;
					oEscreveMem 	= OFF;
					oIouD 			= OFF;
					oEscrevePC 		= OFF;
					oEscrevePCCond = ON;
				end			
			jal:
				begin
					oMem2Reg 		= 2'b01;
					oOrigAULA 		= 2'b00;
					oOrigBULA 		= 2'b00;
					oALUOp 			= 2'b00;
					oOrigPC 			= ON;
					oEscrevePCB 	= OFF;
					oEscreveReg 	= ON;
					oEscreveIR 		= OFF;
					oLeMem 			= OFF;
					oEscreveMem 	= OFF;
					oIouD 			= OFF;
					oEscrevePC 		= ON;
					oEscrevePCCond = OFF;
				end			
			default:
				begin
					oMem2Reg 		= 2'b00;
					oOrigAULA 		= 2'b00;
					oOrigBULA 		= 2'b00;
					oALUOp 			= 2'b00;
					oOrigPC 			= OFF;
					oEscrevePCB 	= OFF;
					oEscreveReg 	= OFF;
					oEscreveIR 		= OFF;
					oLeMem 			= OFF;
					oEscreveMem 	= OFF;
					oIouD 			= OFF;
					oEscrevePC 		= OFF;
					oEscrevePCCond = OFF;
				end
		endcase
	end	
endmodule	