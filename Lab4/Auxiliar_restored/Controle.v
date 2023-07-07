`ifndef PARAM
	`include "Parametros.v"
`endif

module Controle (
	input wire iCLK,
	input wire [6:0] iOpCode,
	output wire [1:0] oMem2Reg, oOrigAULA, oOrigBULA,
	output wire oOrigPC, oALUOp, oEscrevePCB, oEscreveReg, oEscreveIR, oLeMem, oEscreveMem, oIouD, oEscrevePC, oEscrevePCCond
);

endmodule	