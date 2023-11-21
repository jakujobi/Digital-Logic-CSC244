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
	


logic Cin, Cout;
	
always_comb
		begin
			case (ALUControl)
				2'b00:
				{Cout, Result} = A + B;
				
				2'b01:
				{Cout, Result} = A - B;
				
				2'b10:
				begin
				Result = A & B;
				Cout = 0;
				end
				
				2'b11:
				begin
				Result = A | B;
				Cout = 0;
				end
				
			endcase
		end
	
	
	/*
	Output Flags:
		V: oVerflow
		C: Carry
		Neg: Negative
		Z: Zero
		
			
		
		Must replicate logic from book ALU (Fig. 5.17)
	*/
	
	assign V = ~(ALUControl[0] ^ A[7] ^ B[7]) & (A[7] ^ Result[7]) & ~(ALUControl[1]);
	assign C = ALUControl[1] & Cout;
	assign Neg = Result[7];
	assign Z = (Result == '0);


	// always_comb //Check if we add or subtract first
	// begin
		
	// 	case(ALUControl)
			
	// 		2'b00 : Cin = 1'b0; //add
	// 		2'b01 : Cin = 1'b1; //sub
		
	// 	default:
	// 		Cin = 1'b0;
	// 	endcase
		
	// end
	
	// logic [7:0] temp_result; //temporary hold the result
	// logic [7:0] Cout;	//carry out
	
	// logic [7:0] B_true;	//B_true for correct B
	
	// assign B_true[0] = Cin ^ B[0];
	// assign B_true[1] = Cin ^ B[1];
	// assign B_true[2] = Cin ^ B[2];
	// assign B_true[3] = Cin ^ B[3];
	// assign B_true[4] = Cin ^ B[4];
	// assign B_true[5] = Cin ^ B[5];
	// assign B_true[6] = Cin ^ B[6];
	// assign B_true[7] = Cin ^ B[7];
	
	// fulladder zero			(.S(temp_result[0]), .Cout(Cout[0]), .A(A[0]), .B(B_true[0]), .Cin(Cin));
	// fulladder one			(.S(temp_result[1]), .Cout(Cout[1]), .A(A[1]), .B(B_true[1]), .Cin(Cout[0]));
	// fulladder two			(.S(temp_result[2]), .Cout(Cout[2]), .A(A[2]), .B(B_true[2]), .Cin(Cout[1]));
	// fulladder three		(.S(temp_result[3]), .Cout(Cout[3]), .A(A[3]), .B(B_true[3]), .Cin(Cout[2]));
	// fulladder four			(.S(temp_result[4]), .Cout(Cout[4]), .A(A[4]), .B(B_true[4]), .Cin(Cout[3]));
	// fulladder five			(.S(temp_result[5]), .Cout(Cout[5]), .A(A[5]), .B(B_true[5]), .Cin(Cout[4]));
	// fulladder six			(.S(temp_result[6]), .Cout(Cout[6]), .A(A[6]), .B(B_true[6]), .Cin(Cout[5]));
	// fulladder seven		(.S(temp_result[7]), .Cout(Cout[7]), .A(A[7]), .B(B_true[7]), .Cin(Cout[6]));
	
	// assign V = Cout[7] ^ Cout [6]; //oVerflow
	// assign C = Cout[7];	//carry out
	
	// /*
	// Output Flags:
	// 	V: oVerflow
	// 	C: Carry
	// 	Neg: Negative
	// 	Z: Zero
		
	// 	Must replicate logic from book ALU (Fig. 5.17)
	// */
	// always_comb
	// begin
	// 	case(ALUControl)	//Check if they want the AND, OR bitwise
			
	// 		2'b10 : Result = A & B;
	// 		2'b11 : Result = A | B;
		
	// 	default:
	// 		begin
	// 			Result[0] = temp_result[0];
	// 			Result[1] = temp_result[1];
	// 			Result[2] = temp_result[2];
	// 			Result[3] = temp_result[3];
	// 			Result[4] = temp_result[4];
	// 			Result[5] = temp_result[5];
	// 			Result[6] = temp_result[6];
	// 			Result[7] = temp_result[7];
	// 		end
	// 	endcase
		
	// 	if(temp_result[7] == 1'b1)	//check negaive
	// 		Neg = 1'b1;
	// 	else
	// 		Neg = 1'b0;
			
	// 	if(temp_result == 8'd0)	//check zero
	// 		Z = 1'b1;
	// 	else
	// 		Z = 1'b0;
	// end
	
endmodule 