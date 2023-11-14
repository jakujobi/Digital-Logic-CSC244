
module Lab_8(
	
	input logic CLK, CLK50Mhz,
	input logic LD, CLR,
	input logic ENP, ENT,
	
	output logic [3:0] Q, 
	output logic RCO, isHalf

);

	logic CLK_Db;
	debouncer (.A(CLK_Db), .CLK50M(CLK50Mhz), .A_noisy(CLK));
	
	
	logic isHalf_1, RCO1;
	logic isHalf_1_DB;
	
	
	counter26bit halfsecond_step(.isHalf(isHalf_1), .RCO(RCO1), .ENP(1'b1), .ENT(1'b1), .LDb(1'b0), .CLRb(1'b1), .CLKb(CLK50Mhz));
	
	//debounce isHalfsignal
	debouncer (.A(isHalf_1_DB), .CLK50M(CLK50Mhz), .A_noisy(isHalf_1));
	
	counter26bit counter1(.isHalf(isHalf),.QA(Q[0]), .QB(Q[1]), .QC(Q[2]), .QD(Q[3]), .RCO(RCO), .ENP(ENP), .ENT(ENT), .LDb(LD), .CLRb(CLR), .CLKb(RCO1));

endmodule