module ALU#(
	parameter N = 8
)
(
	input  logic [N-1:0] A, B,
	input  logic [1:0] ALUControl,
	output logic [N-1:0] Result,
	output logic V, C, Neg, Z //replicate from Fig. 5.17 in your book
);

	/*
	*	create an ALU with the following operations:
	*		2'b00: ADD
	*		2'b01: SUB
	*		2'b10: AND
	*		2'b11: OR
	*/
	
	
	/*
	Output Flags:
		V: oVerflow
		C: Carry
		Neg: Negative
		Z: Zero
		
		Must replicate logic from book ALU (Fig. 5.17)
	*/
	
endmodule 