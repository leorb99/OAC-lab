/* 
   Colocar valores SW[9:0] e pressionar KEY[0] para armazenar em A
   Colocar valores SW[9:0] e pressionar KEY[1] para armazenar em B
	Pressionar KEY[2] para ver o valor de A
	Pressionar KEY[3] para ver o valor de B
	As chaves SW[4:0] definem a operação de acordo com Parametros
	Os LEDR[4:0] mostram a Operação
	LEDR[9] = Ready
	SW[9] = Start
*/

module TopDE (
	input  CLOCK_50,
	input  [3:0] KEY,
	input  [9:0] SW,
	output [9:0] LEDR,
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
	);


reg [31:0] idataa,idatab,oresult;

wire [31:0] wresult;

initial
	begin
		idataa	<= 32'b0;
		idatab	<= 32'b0;
		oresult	<= 32'b0;
	end

assign LEDR[4:0]= SW[4:0];

	
	
always @(negedge KEY[0])
		idataa <= {SW[9:0],22'b0};
		
always @(negedge KEY[1])
		idatab <= {SW[9:0],22'b0};

always @(posedge CLOCK_50)
	begin
		if(~KEY[2])
				oresult <= idataa;
		else
			if(~KEY[3])
				oresult <= idatab;
			else
				oresult <= wresult;
	end				

	
	
FPALU fpalu1 (
	.iclock(CLOCK_50), 
	.idataa(idataa),
	.idatab(idatab),
	.icontrol(SW[4:0]),
	.istart(SW[9]),
	.oresult(wresult),
	.oready(LEDR[9])
	);

Decoder7 d0 (oresult[11: 8],HEX0);
Decoder7 d1 (oresult[15:12],HEX1);
Decoder7 d2 (oresult[19:16],HEX2);
Decoder7 d3 (oresult[23:20],HEX3);
Decoder7 d4 (oresult[27:24],HEX4);
Decoder7 d5 (oresult[31:28],HEX5);


endmodule
