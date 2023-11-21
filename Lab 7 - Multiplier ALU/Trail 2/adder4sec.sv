// This module implements a 4-bit ripple-carry adder.
// It takes two 4-bit inputs A and B, and an input carry bit C0.
// It outputs a 4-bit sum S, a carry-out bit C4, and a valid bit V.
module adder4sec (
    input wire [3:0] A, B,
    input wire C0,
    output wire [3:0] S,
    output wire C4, V
);
    // Declare internal wires for the carry bits between the full adders.
    wire c1, c2, c3;
    
    // Instantiate four full adders to perform the addition.
    fulladder fa0 (.A(A[0]), .B(B[0]), .Cin(C0), .S(S[0]), .Cout(c1));
    fulladder fa1 (.A(A[1]), .B(B[1]), .Cin(c1), .S(S[1]), .Cout(c2));
    fulladder fa2 (.A(A[2]), .B(B[2]), .Cin(c2), .S(S[2]), .Cout(c3));
    fulladder fa3 (.A(A[3]), .B(B[3]), .Cin(c3), .S(S[3]), .Cout(C4));
    
    // Calculate the valid bit V as the XOR of the carry-out bit and the second-to-last carry bit.
    assign V = C4 ^ c3;
endmodule