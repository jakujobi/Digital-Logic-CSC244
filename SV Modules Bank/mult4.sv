// Module for 4-bit array multiplier (mult4)
module mult4(
    input logic [3:0] A, // Multiplicands
    input logic [3:0] B, // Multipliers

    output logic [7:0] P // 8-bit product
);

logic [4:0] P0, P1, P2, P3;

PP4 partialone (.A(A), .B(B[0]), .PPrev(4 'b0000), .P(P0));
PP4 partialtwo (.A(A), .B(B[1]), .PPrev(P0[4:1]), .P(P1));
PP4 partialthree (.A(A), .B(B[2]), .PPrev(P1[4:1]), .P(P2));
PP4 partialtfour (.A(A), .B(B[3]), .PPrev(P2[4:1]), .P(P3));

assign P = {P3[4], P3[3], P3[2], P3[1], P3[0], P2[0], P1[0], P0[0]};

endmodule



// // Module for 4-bit array multiplier (mult4)
// module mult4(
//     input logic [3:0] A, // Multiplicands
//     input logic [3:0] B, // Multipliers

//     output reg [7:0] P // 8-bit product
// );
//     wire [3:0] PP0, PP1, PP2, PP3;
//     wire P0, P1, P2, P3;
    
//     PP4 pp0(
//         A,
//         B[0],
//         4'b0,
//         PP0,
//         P0
//     );

//     PP4 pp1(
//         A,
//         B[1],
//         PP0,
//         PP1,
//         P1
//     );

//     PP4 pp2(
//         A,
//         B[2], PP1, PP2, P2);
//     PP4 pp3(A, B[3], PP2, PP3, P3);

//     assign P = {P3, P2, P1, P0,};
// endmodule