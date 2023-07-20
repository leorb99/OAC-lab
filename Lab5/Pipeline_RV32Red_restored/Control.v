`ifndef PARAM
	`include "Parametros.v"
`endif

module Control (
	input wire [6:0] OpCode,
	output wire Branch,
	output wire MemRead,
	output wire MemtoReg,
	output wire [1:0] ALUOp,
	output wire MemWrite,
	output wire ALUSrc,
	output wire RegWrite,
	output wire Jal
);
	

always @(*)
	
	case (OpCode)
		OPC_LOAD:
			begin
				Branch <= OFF;
				MemRead <= ON;
				MemtoReg <= ON;
				ALUOp <= 2'b00;
				MemWrite <= OFF;
				ALUSrc <= ON;
				RegWrite <= ON;
				Jal <= OFF;
			end
			
		OPC_STORE:
			begin
				Branch <= OFF;
				MemRead <= OFF;
				MemtoReg <= 1'bx;
				ALUOp <= 2'b00;
				MemWrite <= ON;
				ALUSrc <= ON;
				RegWrite <= OFF;
				Jal <= OFF;
			end
			
		OPC_RTYPE:
			begin
				Branch <= OFF;
				MemRead <= OFF;
				MemtoReg <= OFF;
				ALUOp <= 2'b10;
				MemWrite <= OFF;
				ALUSrc <= OFF;
				RegWrite <= ON;
				Jal <= OFF;
			end
			
		OPC_BRANCH:
			begin
				Branch <= ON;
				MemRead <= OFF;
				MemtoReg <= 1'b00;
				ALUOp <= 2'b01;
				MemWrite <= OFF;
				ALUSrc <= OFF;
				RegWrite <= OFF;
				Jal <= OFF;
			end
			
		//nao sei
		OPC_JAL:
			begin
				Branch <= OFF;
				MemRead <= OFF;
				MemtoReg <= 1'b00;
				ALUOp <= 2'b00;
				MemWrite <= OFF;
				ALUSrc <= ON;
				RegWrite <= ON;
				Jal <= ON;
			end
			
		default:
			begin
				Branch <= OFF;
				MemRead <= OFF;
				MemtoReg <= OFF;
				ALUOp <= 2'b00;
				MemWrite <= OFF;
				ALUSrc <= OFF;
				RegWrite <= OFF;
			end
	endcase

endmodule