// Top-level module
module L7Multiplier(
    input logic [3:0] A, // Switch inputs //
    input logic [3:0] B, // Switch inputs //

    output logic [6:0] HEXA,
    output logic [6:0] HEXB,

    output logic [6:0] HEXP0, // 7-segment display outputs
    output logic [6:0] HEXP1 // 7-segment display outputs
);

wire [7:0] product;
logic [3:0] P0, P1; //This is to split the product into 2

logic [6:0] asign, bsign, P0sign, P1sign;

mult4 my_multiplier(
    .A(A),
    .B(B),
    .P(product) // 8-bit product
);

assign P0 = product[3:0];
assign P1 = product[7:4];

// Assuming you have a 7-segment decoder module named 'decimal7decoder'
decimal7decoder decA(
    .SW(A),
    .numHEX(HEXA),
    .signHEX(asign)
);

//Display B in HEX
decimal7decoder decB(
    .SW(B),
    .numHEX(HEXB),
    .signHEX(bsign)
);

//Display product in HEX
decimal7decoder decP0(
    .SW(P0),
    .numHEX(HEXP0),
    .signHEX(P0sign)
);

decimal7decoder decP1(
    .SW(P1),
    .numHEX(HEXP1),
    .signHEX(P1sign)
);

endmodule