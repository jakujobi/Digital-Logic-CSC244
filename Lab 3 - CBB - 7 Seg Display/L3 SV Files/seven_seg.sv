//Create an SV file named “seven_seg.sv” that contains one SV module name seven_seg.
// Write structural or behavioral SV to describe the operation of seven segment display driver.
// The description should include at least one “dec416” sub module.
// The module should have 4 input wires and have outputs so that when it is connected to a seven segment display the hex digits 0-F are displayed.

module seven_seg(
    input [3:0] in,
    output reg [6:0] out
);

wire [3:0] dec_in;
assign dec_in = (in > 4'd9) ? 4'd15 : in;

dec416 dec1(.in(dec_in), .out(out));

endmodule