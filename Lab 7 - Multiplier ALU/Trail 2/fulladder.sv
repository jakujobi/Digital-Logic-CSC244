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
    input wire A,
    input wire B,
    input wire Cin,
    output wire S, Cout
);

// Logic for a single full-adder
always_comb begin
    // Sum is the XOR of A, B, and Cin
    S = A ^ B ^ Cin;

    // Carry out is set if any two of A, B, and Cin are 1
    Cout = (A & B) | (B & Cin) | (A & Cin);
end

endmodule