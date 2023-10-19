/**
 * 1-bit Full Adder Module
 *
 * This module implements a 1-bit full adder that takes in three inputs (A, B, Cin) and produces two outputs (S, Cout).
 * The output S is the sum of the three inputs, while Cout is the carry-out bit.
 *
 * @param A     Input wire A
 * @param B     Input wire B
 * @param Cin   Input wire Cin (carry-in)
 * @param S     Output wire S (sum)
 * @param Cout  Output wire Cout (carry-out)
 */
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