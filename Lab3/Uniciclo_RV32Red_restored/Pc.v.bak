`ifndef PARAM
	`include "Parametros.v"
`endif

module Pc(
	input clk,
	input rst,
   input [31:0] PCNext,
   output [31:0]PC
);
initial
	begin
		PC<=32'h0040_0000;
	end
   
always @(posedge clk or posedge rst)
	begin
		if(rst)
			PC <= 32'h0040_0000;
		else
			PC <= PCNext;
	end
endmodule