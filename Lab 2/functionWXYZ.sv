module functionWXYZ(
input logic W, X, Y, Z,
output logic F
//F = (W’ . X’ . Y’ ) + (W . X’ . Y’) + (W’ . X’ . Z)
);

logic nW, nX, nY, nZ, WnXnY, WnXnZ, WnXnYnZ;
// nW is W'
// nX is X'
// nY is Y'
// nZ is Z'
// WnXnY is W'.X'.Y'
// WnXnZ is W'.X'.Z'
// WnXnYnZ is W.X'.Y'

not (nW, W); // nW is W'
not (nX, X); // nX is X'
not (nY, Y); // nY is Y'
not (nZ, Z); // nZ is Z'

and (WnXnY, nW, nX, nY); // W'.X'.Y'
and (WnXnZ, W, nX, nY); // W.X'.Y'
and (WnXnYnZ, nW, nX, Z); // W'.X'.Z'

or (F, WnXnY, WnXnZ, WnXnYnZ); // F = (W' . X' . Y' ) + (W . X' . Y') + (W' . X' . Z)

endmodule