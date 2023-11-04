// Module for 4-bit partial-product calculator (PP4)
module PP4(
    input [3:0] A, // Multiplicand
    input Bi, // Bit i of the multiplier
    input [3:0] PP_prev, // Partial product from previous row
    output reg [3:0] PP_next, // Next partial product
    output reg Pi // Product bit
);
    // Assuming you have a 4-bit adder module named 'adder4'
    wire [3:0] sum;
    wire C4, V;
    
    adder4 my_adder(A, PP_prev, 0, sum, C4, V);
    assign PP_next = sum;
    assign Pi = C4;
endmodule