//F = (A.B.C') + (A.B.C)
module functionABCreduced(
input logic A, B, C,
output logic F
);

logic nC, ABnC, ABC;
// nC is C'
// ABnC is A.B.C'
// ABC is A.B.C

not (nC, C); // nC is C'

and (ABnC, A, B, nC); // A.B.C'
and (ABC, A, B, C); // A.B.C

or (F, ABnC, ABC); // F = (A.B.C') + (A.B.C)

endmodule