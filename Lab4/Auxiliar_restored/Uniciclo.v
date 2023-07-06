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





			
endmodule
