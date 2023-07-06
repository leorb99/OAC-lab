module Uniciclo (
	input wire clock,
	input wire reset,
	output reg [31:0] PC,
	output reg [31:0] Instr,
	input wire[4:0] regin,
	output reg [31:0] regout
	);
	
	initial
		begin
			PC<=32'h0040_0000;
			Instr<=32'b0;
			regout<=32'b0;
		end
		

// Aqui vai o seu código do processador
wire 			 wCBranch;
wire			 wCMemRead;
wire  		 wCMemtoReg;
wire [1:0]	 wCALUOp;
wire			 wCMemWrite; 
wire			 wCALUSrc;
wire			 wCRegWrite; 
wire			 wCJal;
wire			 wCze	ro;

wire [31:0]	 wCreg1;
wire [31:0]  wCreg2;
wire [31:0]  wCregdata;

wire [31:0]  wCiULA2;
wire [31:0]  wCImm;
wire [31:0]  wCsaidaULA;
wire [3:0]   wCALUContr;
wire 			 wCPCfonte;
wire [31:0] wPC4;
wire [31:0] wBranchPC;


//wPC4 <= PC + mais4PC;
//wBranchPC <= PC + wCImm;

wire [31:0] mais4PC;
wire [31:0] wiPC;
wire [31:0]  wCsaidaMEM;
Memoria MemInstr(
	.address(wCIouD),
	.data(wCRegB),
	.clock(clock2),
	.wren(wCMemWrite),
	.q(wCsaidaMEM)
);




			
endmodule
