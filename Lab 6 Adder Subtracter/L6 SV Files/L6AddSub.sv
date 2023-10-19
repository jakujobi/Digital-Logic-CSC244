// Improved Top-Level Module for 4-bit Addition and Subtraction
module L6AddSub (
    input logic [3:0] A, // 4-bit input A
    input logic [3:0] B, // 4-bit input B
    input logic sub,      // Subtraction control signal

    output logic [6:0] HEX0, // 7-segment display for numeral
    output logic [6:0] HEX1, // 7-segment display for sign
	 output logic [6:0] HEX2, // 7-segment display for B
	 output logic [6:0] HEX3, // 7-segment display for sign


    output logic C4, // Carry-out or Borrow-out flag
    output logic V  // Overflow flag
);

logic [6:0] g;
logic [6:0] k;


//!Display A in HEX
// Instantiate the decimal7decoder module to show the 4-bit A
decimal7decoder decodeA (
    .SW(A),
    .numHEX(HEX3),
    .signHEX(g)
);

//!Display B in HEX
// Instantiate the decimal7decoder module to show the 4-bit B
decimal7decoder decodeB (
    .SW(B),
    .numHEX(HEX2),
    .signHEX(k)
);


//!AddSub
// Intermediate signal to hold the sum or difference
logic [3:0] Result;

// Instantiate the addsub4 module
addsub4 addsub_module (
    .A(A),  
    .B(B),
    .S(Result),
    .C(C4),
    .V(V)
);

// Instantiate the decimal7decoder module to show the sume of the 4-bit
decimal7decoder decoder_module (
    .SW(Result),
    .numHEX(HEX0),
    .signHEX(HEX1)
);

endmodule


// //This is the top level module that takes in a 4 bit in
// module L6AddSub (
//     input logic [3:0] A,
//     input logic [3:0] B,

//     //output logic [3:0] S,
//     output logic [6:0] HEX0,
//     output logic [6:0] HEX1,
//     output logic C4,
//     output logic V
// );

// logic [3:0] SW;

// addsub4 mod1 (
//     .A(A),  
//     .B(B),
//     .S(SW),
//     .C(C4),
//     .V(V)
// );

// decimal7decoder mod2 (
//     .SW(SW),
//     .HEX0(HEX0),
//     .HEX1(HEX1)
// );

// endmodule