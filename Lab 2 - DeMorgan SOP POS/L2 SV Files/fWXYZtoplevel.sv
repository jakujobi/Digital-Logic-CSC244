module fWXYZtoplevel(
input logic W, X, Y, Z,
output logic F1, F2
);

// Instantiating functionWXYZ
functionWXYZ u1 (
    .W(W), .X(X),
    .Y(Y),  .Z(Z),
    .F(F1)  // Output of functionWXYZ is F1
);

// Instantiating functionWXYZsimplified
functionWXYZsimplified u2 (
    .W(W), .X(X), 
    .Y(Y), .Z(Z), 
    .F(F2)  // Output of functionWXYZsimplified is F2
);

endmodule