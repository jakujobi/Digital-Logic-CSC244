/**
 * This module is used to test the seven-segment display module. It takes in a 4-bit input and a decimal point signal and outputs a 7-bit signal to display the corresponding digit on the seven-segment display.
 *
 * @param in 4-bit input signal to display on the seven-segment display.
 * @param dp Decimal point signal to turn on the decimal point on the seven-segment display.
 * @param out 7-bit output signal to display the corresponding digit on the seven-segment display.
 */
module test7seg(
    input [3:0] in,
    output reg [6:0] out
);

seven_seg seg1(
    .in(in),
    .out(out));

endmodule