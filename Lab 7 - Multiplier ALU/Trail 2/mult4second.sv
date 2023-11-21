module mult4second (
    input logic [3:0] A, B,
    output logic [7:0] P
);
	
	logic [4:0] P0, P1, P2, P3;
	
	
	PP4second partialone (.A(A), .B(B[0]), .PPrev(4 'b0000), .P(P0));
	PP4second partialtwo (.A(A), .B(B[1]), .PPrev(P0[4:1]), .P(P1));
	PP4second partialthree (.A(A), .B(B[2]), .PPrev(P1[4:1]), .P(P2));
	PP4second partialtfour (.A(A), .B(B[3]), .PPrev(P2[4:1]), .P(P3));

	assign P = {P3[4], P3[3], P3[2], P3[1], P3[0], P2[0], P1[0], P0[0]};
	
endmodule