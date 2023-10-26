// Top-level module
module L7Multiplier(
    input logic [3:0] A, // Switch inputs //
    input logic [3:0] B, // Switch inputs //

    output logic [6:0] HEXA,
    output logic [6:0] HEXB,
    output logic [6:0] HEXP // 7-segment display outputs
);

wire [7:0] product;
logic [6:0] asign, bsign, psign;

mult4 my_multiplier(
    .A(A),
    .B(B),
    .P(product) // 8-bit product
);

// Assuming you have a 7-segment decoder module named 'decimal7decoder'
decimal7decoder dec2(
    .SW(A),
    .numHEX(HEX2),
    .signHEX(asign)
);

//Display B in HEX
decimal7decoder dec1(
    .SW(B),
    .numHEX(HEXB),
    .signHEX(bsign)
);

decimal7decoder dec0(
    .SW(product),
    .numHEX(HEXP),
    .signHEX(psign)
);

endmodule