
module counter26bit #(parameter N = 26)

(
	input logic ENP, ENT,
	input logic LDb, CLRb,
	input logic CLKb,
	
	output logic QA, QB, QC, QD,
	output logic RCO,
	output logic isHalf
	
);	

	const int MAX_RANGE = 50000000;
	logic [N-1:0] crrNum;
	logic [3:0] count_4bit;
	
	logic isEnable;
	assign isEnable = ENP | ENT;
	
	//in-module clr
	logic CLR;

	logic combine_CLR;
	assign combine_CLR = ~CLRb | CLR;
	

	always_ff@(posedge(CLKb))
		
		if(combine_CLR)
			crrNum <= 0;
		else if(~LDb & isEnable)
			crrNum <= crrNum + 1;
		else
			crrNum = crrNum;
		 
		
	
	always_comb begin
	// always combinational 
		if(crrNum > MAX_RANGE)
			CLR = 1;
		else
			CLR = 0;
			
		if(crrNum == MAX_RANGE)
			RCO = ENT;
		else
			RCO = 0;
		
		if(crrNum > (MAX_RANGE/2))
			isHalf = 1;
		else
			isHalf = 0;
		
	end
	
	//count_4bit
	assign QA = crrNum[0];
	assign QB = crrNum[1];
	assign QC = crrNum[2];
	assign QD = crrNum[3];
	
	
endmodule