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
	output wire [31:0] regt0, regt1, regt2, regs0, regs1 //regsp, wCsaidaMEM,
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

wire 			 wCPCFonte;
wire 			 wCEqual;

reg [63:0] ifid;			// pc + instrucao
reg [118:0] idex;			// wb + m + ex + A + B + imm + funct10 + rd
reg [73:0] x_men;			// wb + m + ula + B + rd
reg [70:0] memwb; 	   // wb + data + ula + rd

assign wCPCFonte = wCJal | (wCBranch & wCEqual);
wire [31:0] wPC4;
wire [31:0] wBranchPC;
wire [31:0] wiPC;
wire [31:0] mais4PC;
assign mais4PC = PC + 32'h0000_0001;

always @(*)
begin
	if (wCPCFonte)
		wiPC <= wImm;
	else
		wiPC <= mais4PC;
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

always @(posedge clock or posedge reset)
	begin
	if (reset)
		begin
			ifid <= 64'b0;
		end
	else
		begin
			ifid <= {PC, Instr};
		end
	end


Registers reg0(
	.CLK(clock), 
	.RST(reset), 
	.RegWrite(memwb[69]), 
	.RS1(ifid[19:15]), 
	.RS2(ifid[24:20]), 
	.RD(memwb[4:0]), 
	.WriteData(wCregdata), 
	.ReadData1(wCreg1), 
	.ReadData2(wCreg2),
	.Rin(regin),
	.Rout(regout),
	////////////////////////////////////////////////
	.t0(regt0),
	.t1(regt1),
	.t2(regt2),
	.s0(regs0),
	.s1(regs1)
	//.sp(regsp)
	////////////////////////////////////////////////
);
assign wCEqual = wCreg1 == wCreg2;

ImmGen ImmGen0(
	.iInstrucao(ifid[31:0]),
	.oImm(wCImm)
	);
	
wire [31:0] wImm;
assign wImm = ifid[63:32] + wCImm;

Control Ctrl0 (
	.OpCode(ifid[6:0]),
	.Branch(wCBranch),
	.MemRead(wCMemRead),
	.MemtoReg(wCMemtoReg),
	.ALUOp(wCALUOp),
	.MemWrite(wCMemWrite),
	.ALUSrc(wCALUSrc),
	.RegWrite(wCRegWrite),
	.Jal(wCJal)
);

always @(posedge clock or posedge reset)
	begin
	if (reset)
		begin
			idex <= 119'b0;
		end
	else
		begin
			idex <= {wCMemtoReg, wCRegWrite, wCMemWrite, wCMemRead, wCBranch, wCALUOp, wCALUSrc, wCreg1, wCreg2, wCImm, ifid[31:25], ifid[14:12], ifid[11:7]};
		end
	end
	

always @(*)
begin
	case(idex[111])
		1'b0:
		wCiULA2 <= idex[78:47];
		1'b1:
		wCiULA2 <= idex[46:15];
	endcase
end

ALU ALU0(
	.iControl(wCALUContr),
	.iA(idex[110:79]),
	.iB(wCiULA2),
	.oResult(wCsaidaULA),
	.zero(wCzero),
);


ALUControl ALUControl(
	.Funct10(idex[14:5]),
	.ALUOp(idex[113:112]),
	.ALUCtrl(wCALUContr)
);

always @(posedge clock or posedge reset)
	begin
	if (reset)
		begin
			x_men <= 74'b0;
		end
	else
		begin
			x_men <= {idex[118], idex[117], idex[116], idex[115], idex[114], wCsaidaULA, wCiULA2, idex[4:0]};
		end
	end

DataRAM MemData (
	.address(x_men[68:37]),
	.clock(clock2),
	.data(x_men[36:5]),
	.wren(x_men[71]),
	.rden(x_men[70]),
	.q(wCsaidaMEM)
);

always @(posedge clock or posedge reset)
	begin
	if (reset)
		begin
			memwb <= 71'b0;
		end
	else
		begin
			memwb <= {x_men[73], x_men[72], wCsaidaMEM, x_men[68:37], x_men[4:0]};
		end
	end

always @(*)
begin 
	case (memwb[70])
	1'b0:
		wCregdata <= memwb[36:5];
	1'b1:
		wCregdata <= memwb[68:37];
	endcase
end

endmodule
