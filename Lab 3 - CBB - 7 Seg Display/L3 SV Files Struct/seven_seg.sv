// Create an SV file named “seven_seg.sv” that contains one SV module name seven_seg.
// Write structural SV to describe the operation of seven segment display driver.
// The description should include at least one “dec416” sub module.
// The module should have 4 input wires and have outputs so that when it is connected to a seven segment display the hex digits 0-F are displayed.

module seven_seg(
    input [3:0] sevIn,
    input sevEnable,        //enable: enable signal
    output logic [6:0] sevOut     //out: 16-bit output signal
);

// This wire is used to store the input value in decimal format
//wire [3:0] dec_in;

// // This assign statement checks if the input value is greater than 9. If it is, it assigns 4'b1111 (15 in decimal) to dec_in. Otherwise, it assigns the input value to dec_in.
//assign dec_in = (in > 4'd9) ? 4'd15 : in;

logic [15:0] decOut;

//This instantiates a dec416 module with the input, enable, and output ports connected to dec_in, enable, and out respectively.
dec416 dec1(
    .in(sevIn),
    .enable(sevEnable),
    .out(decOut)
);

//or ( sevOut[#], decOut[0], decOut[1], decOut[2], decOut[3], decOut[4], decOut[5], decOut[6], decOut[7], decOut[8], decOut[9], decOut[10], decOut[11], decOut[12], decOut[14], decOut[15]);
assign sevOut[0] = sevEnable & ~(decOut[0] | decOut[2] | decOut[3] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[12] | decOut[14] | decOut[15]);
assign sevOut[1] = sevEnable & ~(decOut[0] | decOut[1] | decOut[2] | decOut[3] | decOut[4] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[13]);
assign sevOut[2] = sevEnable & ~(decOut[0] | decOut[1] | decOut[3] | decOut[4] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[11] | decOut[13]);
assign sevOut[3] = sevEnable & ~(decOut[0] | decOut[2] | decOut[3] | decOut[5] | decOut[6] | decOut[8] | decOut[9] | decOut[11] | decOut[12] | decOut[13] | decOut[14]);
assign sevOut[4] = sevEnable & ~(decOut[0] | decOut[2] | decOut[6] | decOut[8] | decOut[10]| decOut[11]| decOut[12] | decOut[13] | decOut[14] | decOut[15]);
assign sevOut[5] = sevEnable & ~(decOut[0] | decOut[4] | decOut[5] | decOut[6] | decOut[8] | decOut[9] | decOut[10] | decOut[11] | decOut[12] | decOut[14] | decOut[15]);
assign sevOut[6] = sevEnable & ~(decOut[2] | decOut[3] | decOut[4] | decOut[5] | decOut[6] |  decOut[8] |decOut[9] | decOut[10] | decOut[11] | decOut[13] | decOut[14] | decOut[15]);

// //or ( sevOut[#], decOut[0], decOut[1], decOut[2], decOut[3], decOut[4], decOut[5], decOut[6], decOut[7], decOut[8], decOut[9], decOut[10], decOut[11], decOut[12], decOut[14], decOut[15]);
// assign sevOut[0] = sevEnable & ~decOut[2] | ~decOut[3] | ~decOut[5] | ~decOut[6] | ~decOut[7] | ~decOut[8] | ~decOut[9] | ~decOut[10] | ~decOut[12] | ~decOut[14] | ~decOut[15];
// assign sevOut[1] = sevEnable & ~decOut[0] | ~decOut[1] | ~decOut[2] | ~decOut[3] | ~decOut[4] | ~decOut[7] | ~decOut[8] | ~decOut[9] | ~decOut[10] | ~decOut[13];
// assign sevOut[2] = sevEnable & ~decOut[0] | ~decOut[1] | ~decOut[3] | ~decOut[4] | ~decOut[5] | ~decOut[6] | ~decOut[7] | ~decOut[8] | ~decOut[9] | ~decOut[10] | ~decOut[11] | ~decOut[13];
// assign sevOut[3] = sevEnable & ~decOut[0] | ~decOut[2] | ~decOut[3] | ~decOut[5] | ~decOut[6] | ~decOut[7] | ~decOut[8] | ~decOut[9] | ~decOut[11] | ~decOut[12] | ~decOut[13] | ~decOut[14];
// assign sevOut[4] = sevEnable & ~decOut[0] | ~decOut[2] | ~decOut[6] | ~decOut[7] | ~decOut[8] | ~decOut[10] | ~decOut[11] | ~decOut[12] | ~decOut[13] | ~decOut[14] | ~decOut[15];
// assign sevOut[5] = sevEnable & ~decOut[0] | ~decOut[4] | ~decOut[5] | ~decOut[6] | ~decOut[7] | ~decOut[8] | ~decOut[9] | ~decOut[10] | ~decOut[11] | ~decOut[12] | ~decOut[14] | ~decOut[15];
// assign sevOut[6] = sevEnable & ~decOut[2] | ~decOut[3] | ~decOut[4] | ~decOut[5] | ~decOut[6] | ~decOut[7] | ~decOut[9] | ~decOut[10] | ~decOut[11] | ~decOut[13] | ~decOut[14] | ~decOut[15];

// //or ( sevOut[#], decOut[0], decOut[1], decOut[2], decOut[3], decOut[4], decOut[5], decOut[6], decOut[7], decOut[8], decOut[9], decOut[10], decOut[11], decOut[12], decOut[14], decOut[15]);
// assign sevOut[0] = sevEnable & decOut[2] | decOut[3] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[12] | decOut[14] | decOut[15];
// assign sevOut[1] = sevEnable & decOut[0] | decOut[1] | decOut[2] | decOut[3] | decOut[4] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[13];
// assign sevOut[2] = sevEnable & decOut[0] | decOut[1] | decOut[3] | decOut[4] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[11] | decOut[13];
// assign sevOut[3] = sevEnable & decOut[0] | decOut[2] | decOut[3] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[11] | decOut[12] | decOut[13] | decOut[14];
// assign sevOut[4] = sevEnable & decOut[0] | decOut[2] | decOut[6] | decOut[7] | decOut[8] | decOut[10] | decOut[11] | decOut[12] | decOut[13] | decOut[14] | decOut[15];
// assign sevOut[5] = sevEnable & decOut[0] | decOut[4] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[11] | decOut[12] | decOut[14] | decOut[15];
// assign sevOut[6] = sevEnable & decOut[2] | decOut[3] | decOut[4] | decOut[5] | decOut[6] | decOut[7] | decOut[9] | decOut[10] | decOut[11] | decOut[13] | decOut[14] | decOut[15];

// //or ( sevOut[#], decOut[0], decOut[1], decOut[2], decOut[3], decOut[4], decOut[5], decOut[6], decOut[7], decOut[8], decOut[9], decOut[10], decOut[11], decOut[12], decOut[14], decOut[15]);
// assign sevOut[0] = sevEnable & decOut[2] | decOut[3] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[12] | decOut[14] | decOut[15];
// assign sevOut[1] = decOut[0] | decOut[1] | decOut[2] | decOut[3] | decOut[4] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[13];
// assign sevOut[2] = decOut[0] | decOut[1] | decOut[3] | decOut[4] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[11] | decOut[13];
// assign sevOut[3] = decOut[0] | decOut[2] | decOut[3] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[11] | decOut[12] | decOut[13] | decOut[14];
// assign sevOut[4] = decOut[0] | decOut[2] | decOut[6] | decOut[7] | decOut[8] | decOut[10] | decOut[11] | decOut[12] | decOut[13] | decOut[14] | decOut[15];
// assign sevOut[5] = decOut[0] | decOut[4] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[11] | decOut[12] | decOut[14] | decOut[15];
// assign sevOut[6] = decOut[2] | decOut[3] | decOut[4] | decOut[5] | decOut[6] | decOut[7] | decOut[9] | decOut[10] | decOut[11] | decOut[13] | decOut[14] | decOut[15];

// or ( sevOut[1], decOut[0], decOut[1], decOut[2], decOut[3], decOut[4], decOut[7], decOut[8], decOut[9], decOut[10], decOut[13]);
// or ( sevOut[2], decOut[0], decOut[1], decOut[3], decOut[4], decOut[5], decOut[6], decOut[7], decOut[8], decOut[9], decOut[10], decOut[11], decOut[13]);
// or ( sevOut[3], decOut[0], decOut[2], decOut[3], decOut[5], decOut[6], decOut[7], decOut[8], decOut[9], decOut[11], decOut[12], decOut[13], decOut[14]);
// or ( sevOut[4], decOut[0], decOut[2], decOut[6], decOut[7], decOut[8], decOut[10], decOut[11], decOut[12], decOut[13], decOut[14], decOut[15]);
// or ( sevOut[5], decOut[0], decOut[4], decOut[5], decOut[6], decOut[7], decOut[8], decOut[9], decOut[10], decOut[11], decOut[12], decOut[14], decOut[15]);
// or ( sevOut[6], decOut[2], decOut[3], decOut[4], decOut[5], decOut[6], decOut[7], decOut[9], decOut[10], decOut[11], decOut[13], decOut[14], decOut[15]);


// // The decoder logic
// always @(*) begin
//     case (sevIn)
//         4'b0000: sevOut = 7'b1111110;
//         4'b0001: sevOut = 7'b0110000;
//         4'b0010: sevOut = 7'b1101101;
//         4'b0011: sevOut = 7'b1111001;
//         4'b0100: sevOut = 7'b0110011;
//         4'b0101: sevOut = 7'b1011011;
//         4'b0110: sevOut = 7'b1011111;
//         4'b0111: sevOut = 7'b1111111;
//         4'b1000: sevOut = 7'b1111110;
//         4'b1001: sevOut = 7'b1111011;
//         4'b1010: sevOut = 7'b1110111;
//         4'b1011: sevOut = 7'b0011111;
//         4'b1100: sevOut = 7'b1001110;
//         4'b1101: sevOut = 7'b0111101;
//         4'b1110: sevOut = 7'b1001111;
//         4'b1111: sevOut = 7'b1000111;
//     endcase
    
//     //Output is disabled when enable is low
//     if (!sevEnable) begin
//        sevOut <= 7'b1111110;
//     end
// end


// or ( sevOut[0], out[0], in [0]);
// or ( sevOut[1], out[1], in [1]);
// or ( sevOut[2], out[2], in [2]);
// or ( sevOut[3], out[3], in [3]);
// or ( sevOut[4], out[4], in [4]);
// or ( sevOut[5], out[5], in [5]);
// or ( sevOut[6], out[6], in [6]);
// or ( sevOut[7], out[7], in [7]);
// or ( sevOut[8], out[8], in [8]);
// or ( sevOut[9], out[9], in [9]);
// or ( sevOut[10], out[10], in [10]);
// or ( sevOut[11], out[11], in [11]);
// or ( sevOut[12], out[12], in [12]);
// or ( sevOut[13], out[13], in [13]);
// or ( sevOut[14], out[14], in [14]);
// or ( sevOut[15], out[15], in [15]);


    // // The decoder logic
// always @(*) begin
//     case (in)
//         4'b0000: out = 7'b1111110;
//         4'b0001: out = 7'b0110000;
//         4'b0010: out = 7'b1101101;
//         4'b0011: out = 7'b1111001;
//         4'b0100: out = 7'b0110011;
//         4'b0101: out = 7'b1011011;
//         4'b0110: out = 7'b1011111;
//         4'b0111: out = 7'b1111111;
//         4'b1000: out = 7'b1111110;
//         4'b1001: out = 7'b1111011;
//         4'b1010: out = 7'b1110111;
//         4'b1011: out = 7'b0011111;
//         4'b1100: out = 7'b1001110;
//         4'b1101: out = 7'b0111101;
//         4'b1110: out = 7'b1001111;
//         4'b1111: out = 7'b1000111;
//     endcase
    
//     // Output is disabled when enable is low
//     if (!enable) begin
//         out <= 7'b1111110;
//     end
// end


endmodule