`ifndef PARAM
	`include "../Parametros.v"
`endif

module STOPWATCH_Interface(
    input         iCLK_50, iCLK,
	 output			intertimer,
    //  Barramento de IO
    input         wReadEnable, wWriteEnable,
    input  			[3:0]  wByteEnable,
    input  			[31:0] wAddress, wWriteData,
    output 			[31:0] wReadData
);


reg [63:0] time_count;
reg [63:0] time_interrupt;


initial begin
	time_count 		<= 64'b0;
	time_interrupt <= 64'b0;
end


wire clk;
logic reset_flag;

Stopwatch_divider_clk divider(
	.clk(iCLK_50),
	.new_freq(clk)
);


always @(posedge clk or posedge reset_flag) begin
	if (reset_flag)
		time_count <= 32'b0;
	else
		time_count <= time_count + 1'b1;
end


always @ ( posedge iCLK ) begin
	if (wWriteEnable)
		if (wAddress == STOPWATCH_ADDRESS)
			reset_flag <= 1'b1;
		else
			reset_flag <= 1'b0;
	else	
		reset_flag <= 1'b0;
end


always @ ( posedge iCLK ) begin
	if (wWriteEnable)
		if (wAddress == INTERLOW_ADDRESS)
			time_interrupt[31:0] <= wWriteData;
		else
		if (wAddress == INTERHIGH_ADDRESS)
			time_interrupt[63:32] <= wWriteData;
end


/* Para quando a compatibilidade com o Time Tool do Rars for feita */
always @ ( posedge iCLK ) begin
	if (time_count == time_interrupt)
		intertimer <= 1'b1;
	else
		intertimer <= 1'b0;
end



always @(*) begin
	if(wReadEnable)
			if (wAddress == STOPWATCH_ADDRESS || wAddress == TIMERLOW_ADDRESS)
				wReadData <= time_count[31:0];
			else 
			if (wAddress == TIMERHIGH_ADDRESS)
				wReadData <= time_count[63:32];
			else
				wReadData <= 32'hzzzzzzzz;	
	else 
		wReadData <= 32'hzzzzzzzz;
end

endmodule
