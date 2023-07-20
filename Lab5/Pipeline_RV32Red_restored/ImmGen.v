
`ifndef PARAM
	`include "Parametros.v"
`endif

/* Unidade de geração do imediato */

module ImmGen (
    input  		  [31:0] iInstrucao,
    output logic [31:0] oImm
);


always @ (*)
    case (iInstrucao[6:0])
        OPC_LOAD:
				oImm <= {{22{iInstrucao[31]}}, iInstrucao[31:22]};
				
    	  OPC_STORE:
            oImm <= {{22{iInstrucao[31]}}, iInstrucao[31:25], iInstrucao[11:9]};

        OPC_BRANCH:
            oImm <= {{22{iInstrucao[31]}}, iInstrucao[7], iInstrucao[30:25], iInstrucao[11:9]};

        OPC_JAL:
            oImm <= {{14{iInstrucao[31]}}, iInstrucao[19:12], iInstrucao[20], iInstrucao[30:22]};
				
        default:
            oImm <= ZERO;
    endcase

endmodule
