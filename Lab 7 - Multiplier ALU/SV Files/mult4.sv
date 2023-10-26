// Module for 4-bit array multiplier (mult4)
module mult4(
    input [3:0] A, B, // Multiplicands
    output reg [7:0] P // 8-bit product
);
    wire [3:0] PP0, PP1, PP2, PP3;
    wire P0, P1, P2, P3;
    PP4 pp0(A, B[0], 4'b0, PP0, P0);
    PP4 pp1(A, B[1], PP0, PP1, P1);
    PP4 pp2(A, B[2], PP1, PP2, P2);
    PP4 pp3(A, B[3], PP2, PP3, P3);
    assign P = {P3, P2, P1, P0, PP3};
endmodule

// Top-level module
module top(
    input [7:0] SW, // Switch inputs
    output [6:0] HEX2, HEX1, HEX0 // 7-segment display outputs
);
    wire [7:0] product;
    mult4 my_multiplier(SW[7:4], SW[3:0], product);
    // Assuming you have a 7-segment decoder module named 'decimal7decoder'
    decimal7decoder dec2(SW[7:4], HEX2);
    decimal7decoder dec1(SW[3:0], HEX1);
    decimal7decoder dec0(product[7:4], HEX0);
endmodule