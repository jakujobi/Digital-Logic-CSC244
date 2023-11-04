module regN#(
	parameter N = 8 //variable width register
)
(
	input logic [N-1:0] D,
	input logic CLKb, E,
	output logic [N-1:0] Q
);

	//negedge register with synchronous active-high enable
	always_ff@(negedge CLKb)
	begin
		if(E)
			Q <= D;
		else
			Q <= Q;
	end

endmodule 
