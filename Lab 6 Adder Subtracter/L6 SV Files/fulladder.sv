// 1-bit Full Adder Module
module fulladder (
    input wire A, B, Cin,
    output wire S, Cout
);
    assign S = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));
endmodule


// module full_adder(
//     input bit a,
//     input bit b,
//     input bit cin,
//     output bit sum,
//     output bit cout
// );

//     assign sum = a ^ b ^ cin;
//     assign cout = (a & b) | (cin & (a ^ b));

// endmodule