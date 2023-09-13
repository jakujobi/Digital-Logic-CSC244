module functionABC(
input logic A, B, C,
output logic Y
);

//Y = (A′ + B′· C)′· (A′ + B′· C′)′
logic nA, nB, nC, nBaC, nBanC, E, F, nE, nF;
// nBaC is B'.C						nBanC is B'.C'
// E = A'+(B'.C)					nE = (A'+(B'.C))'
// F = A'+(B'.C') 				nF = (A'+(B'.C'))'

not (nA, A); // nA is A'
not (nB, B); // nB is  B'
not (nC, C); // nC is C'

and (nBaC, nB, C); // (B′· C)
and (nBanC, nB, nC); // (B′· C')

or (E, nA, nBaC); // A′ + B′· C
or (F, nA, nBanC); // A′ + B′· C′ 

not (nE, E); //nE is E' = (A′ + B′· C)′
not (nF, F); //nF is F' = (A′ + B′· C')′

and (Y, nE, nF);
//Y = (A′ + B′· C)′· (A′ + B′· C′)′

endmodule