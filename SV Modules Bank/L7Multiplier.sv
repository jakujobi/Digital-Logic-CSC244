// Top-level module
module L7Multiplier(
    input logic [3:0] A, // Switch inputs //
    input logic [3:0] B, // Switch inputs //

    output logic [6:0] HEXA,
    output logic [6:0] HEXB,

    output logic [6:0] HEXP0, // 7-segment display outputs
    output logic [6:0] HEXP1 // 7-segment display outputs
);

// Assuming you have a 7-segment decoder module named 'decimal7decoder'
binary4todecimal7decoder decA(
    .binary(A),
    .sevenSeg(HEXA),
);

//Display B in HEX
binary4todecimal7decoder decB(
    .binary(B),
    .sevenSeg(HEXB),
);


logic [7:0] product;
logic [3:0] P0, P1; //This is to split the product into 2

assign P0 = product[3:0];
assign P1 = product[7:4];

mult4 my_multiplier(
    .A(A),
    .B(B),
    .P(product) // 8-bit product
);

//Display product in HEX
binary4todecimal7decoder decP0(
    .binary(P0),
    .sevenSeg(HEXP0),
);

binary4todecimal7decoder decP1(
    .binary(P1),
    .sevenSeg(HEXP1),
);

endmodule