`ifndef PARAM
	`include "Parametros.v"
`endif
 
 
module ALU (
	input 		 [3:0]  iControl,
	input signed [31:0] iA, 
	input signed [31:0] iB,
	output 		 [31:0] oResult,
	output zero
	);


always @(*)
begin
    case (iControl)
		OPAND:
			begin
				oResult  <= iA & iB;
				zero <= iA == iB;
			end
		OPOR:
			begin
				oResult  <= iA | iB;
				zero <= iA == iB;
			end
		OPADD:
			begin
				oResult  <= iA + iB;
				zero <= iA == iB;
			end
		OPSUB:
			begin
				oResult  <= iA - iB;
				zero <= iA == iB;
			end
		OPSLT:
			begin
				oResult  <= iA < iB;
				zero <= iA == iB;
			end
		OPNULL:
			begin
				oResult  <= ZERO;
				zero <= iA == iB;
			end
		default:
			begin
				oResult  <= ZERO;
				zero <= iA == iB;
			end
    endcase
end

endmodule
