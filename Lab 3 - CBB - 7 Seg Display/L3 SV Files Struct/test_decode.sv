// Module: test_decode
//This module is used to test the functionality of the dec416 decoder module. It takes a 4-bit input and an enable signal as inputs and outputs a 16-bit signal.
module test_decode (
    input logic [3:0] in,  //in: 4-bit input signal
    input enable,        //enable: enable signal
    output logic [15:0] out //out: 16-bit output signal
);

// The dec416 decoder module is instantiated inside this module
// And its inputs and outputs are connected to the inputs and outputs of this module respectively.
dec416 decoder (
    .in(in),    //in: 4-bit input signal (connected to in)
    .enable(enable),    //enable: enable signal (connected to enable)
    .out(out)   //out: 16-bit output signal
);

endmodule
