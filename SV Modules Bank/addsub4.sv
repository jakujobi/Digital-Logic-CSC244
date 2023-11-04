// Improved 4-bit Adder/Subtractor Module
module addsub4 (
    input wire [3:0] A, // 4-bit input A
    input wire [3:0] B, // 4-bit input B
    input wire sub,      // Subtraction control signal
    
    output wire [3:0] S, // 4-bit sum/difference output
    output wire C,       // Carry-out
    output wire V        // Overflow
);

    // Internal signals
    wire [3:0] B_inv = ~B;                 // Inverted B for subtraction
    wire [3:0] B_final = sub ? B_inv : B;  // Final B based on control signal
    wire C0 = sub;                         // Carry-in for subtraction
    wire C4, V_temp;                       // Internal carry-out and overflow

    // Instantiate 4-bit adder module
    adder4 add4 (
        .A(A),
        .B(B_final),
        .C0(C0), 
        .S(S),
        .C4(C4),
        .V(V_temp)
    );

    // Assign outputs
    assign C = sub ? ~C4 : C4;  // Invert carry-out if subtraction
    assign V = V_temp;           // Overflow remains the same

endmodule

// // 4-bit Adder/Subtractor Module
// module addsub4 (
//     input wire [3:0] A, B,
//     input wire sub,
//     output wire [3:0] S,
//     output wire C, V
// );

//     wire [3:0] B_inv = ~B;
//     wire [3:0] B_final = sub ? B_inv : B;
//     wire C0 = sub;
//     wire C4, V_temp;

//     adder4 add4 (
//         .A(A),
//         .B(B_final),
//         .C0(C0), 
//         .S(S),
//         .C4(C4),
//         .V(V_temp)
//     );

//     assign C = sub ? ~C4 : C4;
//     assign V = V_temp;
	 
// endmodule