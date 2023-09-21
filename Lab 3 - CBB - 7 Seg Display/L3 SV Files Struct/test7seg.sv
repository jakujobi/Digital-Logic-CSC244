/**
 * This module is used to test the seven-segment display module. It takes in a 4-bit input and a decimal point signal and outputs a 7-bit signal to display the corresponding digit on the seven-segment display.
 *
 * @param in 4-bit input signal to display on the seven-segment display.
 * @param dp Decimal point signal to turn on the decimal point on the seven-segment display.
 * @param out 7-bit output signal to display the corresponding digit on the seven-segment display.
 */
module test7seg(
    input logic [3:0] in,  //in: 4-bit input signal
    input enable,        //enable: enable signal
    output logic [6:0] out //out: 16-bit output signal
);

seven_seg seg1(
    .sevIn(in),    //in: 4-bit input signal (connected to in)
    .sevEnable(enable),    //enable: enable signal (connected to enable)
    .sevOut(out)   //out: 16-bit output signal
);

endmodule