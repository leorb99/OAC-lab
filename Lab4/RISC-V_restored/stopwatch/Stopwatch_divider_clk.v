module Stopwatch_divider_clk(
	input  logic clk,
	output logic new_freq
	);

reg [15:0] count;


initial begin
	count <= 16'b0;
	new_freq <= 1'b0;
end
	


always @( posedge clk )
begin
	if (count == 16'd25000)
		begin
			count 	<= 16'd0;
			new_freq <= ~new_freq;
		end
	else
		begin
			count <= count + 1'b1;
		end
end




endmodule
			
