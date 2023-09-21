//Create a SV file named “dec416.sv” that contains one SV module named dec416.
//Write structural SV to describe the operation of a 4:16 decoder with active-high outputs.
//You may choose to at an enable input (it is your choice whether this enable is active-high or active-low).
// Remember to follow our active level naming convention as follows
//
//3. System Verilog
// In all labs (and projects) you should have exactly one SV module per .sv file.
// The module should have well documented inputs, outputs, and internal logic connections using comments.
// Use proper indentation using TAB to make your SV easier to read.
// When connecting multiple modules together using structural SV, you must use explicit port mapping and not locational port mapping.
// You will lose points if you do not use explicit port mapping.

// 4. Active Level Naming Conventions
// Pick your variable names to mean something.
// If a signal has a logic-1 when a door is open, name it something like doorOpen.
// If a signal has a logic-0 when a window is closed, you might name it windowClosedL where the “L” indicates that this signal is “active-low,” or that it has the value of zero when asserted.
// Obviously this signal could also be named windowOpen which would be active-high, but suppose the signal gave a zero when a fuel tank was full.
// In that case a good name would be fuelTankFullL but fuelTankEmpty would not be a good way to avoid the active-low signal because “not all the way full” is different from “empty”.
// It should be noted that there is no “H” on the end of active-high signal names.
// Signal names are assumed to be active-high unless designated as active-low.
// Also note that we should not try to avoid active-low signals, just label them appropriately.
// There is nothing inherently bad about an active-low signal.
// In fact, proper use of active-high and active-low signals can make the logic simpler or circuit faster.


// This module is a 4-to-16 decoder that takes a 4-bit input and generates a 16-bit output. 
// The output is a binary number that represents the input value in binary. 
// The enable input is used to enable/disable the output. 
// When enable is low, the output is disabled and set to 0. 
// When enable is high, the output is enabled and set to the binary representation of the input value.
// The module uses a case statement to generate the output based on the input value.
// If the input value is not in the range of 1 to 16, the output is set to 0x8000 (binary 1000000000000000).


module dec416 (
    input logic [3:0] in,
    //input logic A, B, C, D, // 4-bit input signal
    
    input enable, // enable signal
    
    //output logic [P:O:N:M:L:K:J:I:H:G:F:E:D:C:B:A] out
    output logic [15:0] out
);

    logic

    

    //assign out = enableL ? {16{1'b0}} : (1 << in);
    
    // The decoder logic
    always_comb begin
        case (in)
            4'b0001: out = 16'b0000000000000001;
            4'b0010: out = 16'b0000000000000010;
            4'b0011: out = 16'b0000000000000100;
            4'b0100: out = 16'b0000000000001000;
            4'b0101: out = 16'b0000000000010000;
            4'b0110: out = 16'b0000000000100000;
            4'b0111: out = 16'b0000000001000000;
            4'b1000: out = 16'b0000000010000000;
            4'b1001: out = 16'b0000000100000000;
            4'b1010: out = 16'b0000001000000000;
            4'b1011: out = 16'b0000010000000000;
            4'b1100: out = 16'b0000100000000000;
            4'b1101: out = 16'b0001000000000000;
            4'b1110: out = 16'b0010000000000000;
            4'b1111: out = 16'b0100000000000000;
            default: out = 16'b1000000000000000;
        endcase
    end

    // Output is disabled when enable is low
    assign out = enable ? out : 16'b0000000000000000;

endmodule