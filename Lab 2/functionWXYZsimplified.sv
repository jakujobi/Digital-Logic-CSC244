module functionWXYZsimplified(
input logic W, X, Y, Z,
output logic F
//F = X’ (Y’ + W’.Z)
);

logic nW, nX, nY, nZ, WnZ, YnWnZ;
// nW is W'
// nX is X'
// nY is Y'
// nZ is Z'
// WnZ is W'.Z
// YnWnZ is Y' + W'.Z

not (nW, W); // nW is W'
not (nX, X); // nX is X'
not (nY, Y); // nY is Y'
not (nZ, Z); // nZ is Z'

and (WnZ, nW, Z); // W'.Z
or (YnWnZ, nY, WnZ); // Y' + W'.Z

and (F, nX, YnWnZ); // F = X' (Y' + W'.Z)

endmodule

//Create a an SV module named fWXYZtoplevel. Use structural SV and explicit port mapping to connect together functionWXYZ and functionWXYZsimplified