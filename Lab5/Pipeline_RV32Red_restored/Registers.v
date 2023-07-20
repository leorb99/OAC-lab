`ifndef PARAM
	`include "Parametros.v"
`endif


module Registers (
    input wire 			CLK, RST, RegWrite,
    input wire  [4:0] 	RS1, RS2, RD,
    input wire  [31:0] 	WriteData,
    output wire [31:0] 	ReadData1, ReadData2,
	 ///////////////////////////////////////////
	 output wire [31:0] t0, t1, t2, s0, s1, sp,
	 ///////////////////////////////////////////
	 input wire	[4:0]		Rin,
	 output wire [31:0]	Rout
    );

/* Register file */
reg [31:0] registers[31:0]; 

parameter  SPR=5'd2;                    // SP
parameter  GPR=5'd3;

reg [5:0] i;

initial
	begin
		for (i = 0; i <= 31; i = i + 1'b1)
			registers[i] = 32'd0;
		registers[SPR] = STACK_ADDRESS;
		registers[GPR] = BEGINNING_DATA;
	end
//////////////////////////////////////////////////////////
assign sp = registers[5'b00010];
assign t0 = registers[5'b00101];
assign t1 = registers[5'b00110];
assign t2 = registers[5'b00111];
assign s0 = registers[5'b01000];
assign s1 = registers[5'b01001];
//////////////////////////////////////////////////////////
assign ReadData1 =	registers[RS1];
assign ReadData2 =	registers[RS2];
assign Rout		  =	registers[Rin];


always @(posedge CLK or posedge RST)
	begin
		if (RST)
			begin // reseta o banco de registradores e pilha
				for (i = 0; i <= 31; i = i + 1'b1)
					registers[i] <= 32'b0;
				registers[SPR]  <= STACK_ADDRESS;  // SP
				registers[GPR]  <= BEGINNING_DATA;
			end
		else
			 begin
				i<=6'b0; // para não dar warning
				if(RegWrite && (RD != 5'b0))
					registers[RD] <= WriteData;
			 end
	end

endmodule
