`ifndef PARAM
	`include "Parametros.v"
`endif

module ALUControl (
	input [9:0] Funct10,
	input [1:0] ALUOp,
	output [3:0] ALUCtrl
	
	);

always @(*)

	case (ALUOp)
		2'b00: 
			ALUCtrl <= OPADD;
		2'b01: 
			ALUCtrl <= OPSUB;
		2'b10:
			case (Funct10)
				FUNADD: 
					ALUCtrl <= OPADD;
				FUNSUB: 
					ALUCtrl <= OPSUB;
				FUNAND: 
					ALUCtrl <= OPAND;
				FUNOR:
					ALUCtrl <= OPOR;
				FUNSLT: 
					ALUCtrl <= OPSLT;
			default: 	
				ALUCtrl <= 4'b0000;
			endcase
		default: ALUCtrl <= 4'b0000;
	endcase

endmodule
