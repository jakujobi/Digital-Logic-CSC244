module PP4 
(
    input logic [3:0] A, PPrev,
	input logic B,
    output logic [4:0] P
);
	 logic [3:0] Ain;
	 assign Ain[0] = A[0]& B;
	 assign Ain[1] = A[1]& B;
	 assign Ain[2] = A[2]& B;
	 assign Ain[3] = A[3]& B;
	 
	 logic C4, V;
	 
    adder4 fa0 (.A(Ain), .B(PPrev), .C0(1'b0), .S(P[3:0]), .C4(C4), .V(V));
	assign P[4] = C4;
	
endmodule