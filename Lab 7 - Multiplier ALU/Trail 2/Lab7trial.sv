module Lab7trial
(
    input logic [3:0] A, 
    input logic [3:0] B,
    output logic [6:0] HEX5, 
    output logic [6:0] HEX3, 
	output logic [6:0] HEX0, 
	output logic [6:0] HEX1 
);




binary4todecimal7decoder decodeA (
    .binary(A),
    .sevenSeg(HEX3)
);


binary4todecimal7decoder decodeB (
    .binary(B),
    .sevenSeg(HEX5)
);



logic [7:0] Result;
logic [3:0] Partone;
logic [3:0] Parttwo;

assign Partone = Result [7:4];
assign Parttwo = Result [3:0];

mult4second mod (
    .A(A),  
    .B(B),
    .P(Result)
);



binary4todecimal7decoder decoderC (
    .binary(Parttwo),
    .sevenSeg(HEX0)
);


binary4todecimal7decoder decoderD (
    .binary(Partone),
    .sevenSeg(HEX1)
);
endmodule