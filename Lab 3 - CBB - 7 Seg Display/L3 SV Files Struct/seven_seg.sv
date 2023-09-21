// Create an SV file named “seven_seg.sv” that contains one SV module name seven_seg.
// Write structural or behavioral SV to describe the operation of seven segment display driver.
// The description should include at least one “dec416” sub module.
// The module should have 4 input wires and have outputs so that when it is connected to a seven segment display the hex digits 0-F are displayed.

module seven_seg(
    input [3:0] in,
    input enable,        //enable: enable signal
    output logic [6:0] out     //out: 16-bit output signal
);

// wire [3:0] dec_in;
// assign dec_in = (in > 4'd9) ? 4'd15 : in;

// dec416 dec1(
//     .in(dec_in),
//     .enable(enable),
//     .out(out)
// );

    // The decoder logic
    always @(*) begin
        case (in)
            4'b0001: out = 7'b0110000;
            4'b0010: out = 7'b1101101;
            4'b0011: out = 7'b1111001;
            4'b0100: out = 7'b0110011;
            4'b0101: out = 7'b1011011;
            4'b0110: out = 7'b1011111;
            4'b0111: out = 7'b1111111;
            4'b1000: out = 7'b1111110;
            4'b1001: out = 7'b1111011;
            4'b1010: out = 7'b1110111;
            4'b1011: out = 7'b0011111;
            4'b1100: out = 7'b1001110;
            4'b1101: out = 7'b0111101;
            4'b1110: out = 7'b1001111;
            4'b1111: out = 7'b1000111;
            default: out = 7'b1111110;
        endcase
        
        // Output is disabled when enable is low
        if (!enable) begin
            out <= 7'b1111110;
        end
    end


endmodule