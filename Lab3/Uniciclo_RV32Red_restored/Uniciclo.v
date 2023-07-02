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
	output wire [31:0] regt0, regt2, regs0, regs1
	///////////////////////////////////
	
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
wire			 wCzero;

wire [31:0]	 wCreg1;
wire [31:0]  wCreg2;
wire [31:0]  wCregdata;

wire [31:0]  wCiULA2;
wire [31:0]  wCImm;
wire [31:0]  wCsaidaULA;
wire [3:0]   wCALUContr;
wire [31:0]  wCsaidaMEM;

wire 			 wCPCfonte;

assign wCPCFonte = wCJal | (wCBranch & wCzero);



wire [31:0] wPC4;
wire [31:0] wBranchPC;


//wPC4 <= PC + mais4PC;
//wBranchPC <= PC + wCImm;

wire [31:0] mais4PC;
wire [31:0] wiPC;	 
always @(*)
	begin
		case(wCPCFonte)
			1'b0:     
				begin 
					mais4PC <= 32'h0000_0001;
					wiPC <= PC + mais4PC;
				end
			1'b1:     wiPC <= PC + wCImm;
		endcase
	end


Pc pc(
	.clk(clock),
	.rst(reset),
	.PCNext(wiPC),
	.PC(PC)
);




InstRAM MemInstr(
	.address(PC),
	.clock(clock2),
	.q(Instr)
);


Registers reg0(
	.CLK(clock), 
	.RST(reset), 
	.RegWrite(wCRegWrite), 
	.RS1(Instr[19:15]), 
	.RS2(Instr[24:20]), 
	.RD(Instr[11:7]), 
	.WriteData(wCregdata), 
	.ReadData1(wCreg1), 
	.ReadData2(wCreg2),
	.Rin(regin),
	.Rout(regout),
	////////////////////////////////////////////////
	.t0(regt0),
	.t2(regt2),
	.s0(regs0),
	.s1(regs1)
	////////////////////////////////////////////////
);


always @(*)
begin
	case(wCALUSrc)
		1'b0:
		wCiULA2 <= wCreg2;
		1'b1:
		wCiULA2 <= wCImm;
	endcase
end

ALU ALU0(
	.iControl(wCALUContr),
	.iA(wCreg1),
	.iB(wCiULA2),
	.oResult(wCsaidaULA),
	.zero(wCzero),
);


ALUControl ALUControl(
	.Funct10({{Instr[31:25]},{Instr[14:12]}}),
	.ALUOp(wCALUOp),
	.ALUCtrl(wCALUContr)
);


ImmGen ImmGen0(
	.iInstrucao(Instr),
	.oImm(wCImm)
	);

Control Ctrl0 (
	.OpCode(Instr[6:0]),
	.Branch(wCBranch),
	.MemRead(wCMemRead),
	.MemtoReg(wCMemtoReg),
	.ALUOp(wCALUOp),
	.MemWrite(wCMemWrite),
	.ALUSrc(wCALUSrc),
	.RegWrite(wCRegWrite),
	.Jal(wCJal)
);


DataRAM MemData (
	.address(wCsaidaULA),
	.clock(clock2),
	.data(wCreg2),
	.wren(wCMemWrite),
	.q(wCsaidaMEM)
);


always @(*)
begin 
	case (wCMemtoReg)
	1'b0:
		wCregdata <= wCsaidaULA;
	1'b1:
		wCregdata <= wCsaidaMEM;
	endcase
end

endmodule
