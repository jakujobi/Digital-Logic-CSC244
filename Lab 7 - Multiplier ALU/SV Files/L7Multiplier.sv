// Top-level module
module L7Multiplier(
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