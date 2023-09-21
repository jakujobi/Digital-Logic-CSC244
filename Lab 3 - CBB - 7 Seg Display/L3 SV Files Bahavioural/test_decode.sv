// This module is used to test the functionality of the dec416 module. It takes in a 4-bit input, an enable signal, and outputs a 16-bit signal.
module test_decode (
    //input logic [D:C:B:A] in,
    input logic A, B, C, D, // 4-bit input signal
    
    input enable, // enable signal
    
    //output logic [P:O:N:M:L:K:J:I:H:G:F:E:D:C:B:A] out
    output logic [15:0] out // 16-bit output signal
);

// Instantiate the dec416 module and connect its input, enable, and output signals to the corresponding signals in this module.
dec416 dec1 (
    .A(A), .B(B), .C(C), .D(D), // connect input signal
    .enable(enable), // connect enable signal
    .out(out) // connect output signal
);

endmodule


// // Instantiate the dec416 module and connect its input, enable, and output signals to the corresponding signals in this module.
// dec416 dec1 (
//     .in(in), // connect input signal
//     .enable(enable), // connect enable signal
//     .out(out) // connect output signal
// );

// endmodule
