// This module is used to test the functionality of the dec416 module. It takes in a 4-bit input, an enable signal, and outputs a 16-bit signal.
module test_decode (
    //input logic [D:C:B:A] in,
    input logic A, B, C, D, // 4-bit input signal
    
    input enable, // enable signal
    
    output logic E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T // 16-bit output signal
);

// Instantiate the dec416 module and connect its input, enable, and output signals to the corresponding signals in this module.
dec416 dec1 (
    .A(A), .B(B), .C(C), .D(D), // connect input signal
    .enable(enable), // connect enable signal
    .E(E), .F(F), .G(G), .H(H), .I(I), .J(J), .K(K), .L(L), .M(M), .N(N), .O(O), .P(P), .Q(Q), .R(R), .S(S), .T(T) // connect output signal
);

endmodule