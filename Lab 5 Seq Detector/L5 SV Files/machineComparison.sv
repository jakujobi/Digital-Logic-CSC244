//machineComparison.sv

// Author: John Akujobi
// Date: Oct 12 2023
// Description: 
/**
 * The module machineComparison compares the outputs of two sequence detectors, one implemented using Mealy machine and the other using Moore machine.
 * It takes in a raw clock signal from a switch, a 50 MHz internal clock, and an input signal A.
 * It outputs the outputs of the Mealy machine and Moore machine sequence detectors, Z_mealy and Z_moore respectively, along with their current states S_mealy and S_moore respectively.
 * The raw clock signal is debounced using a debouncer module before being used as the clock input for the sequence detectors.
 */

module machineComparison ( 
    input logic rawclock, //raw clock from the switch //B8
    input logic Clock50M, //50 MHz internal clock //PIN_P11
    input logic A,  //C10

    output logic Z_moore, //B11
    output logic [2:0] S_moore, //C13, E14, D14
    output logic Z_mealy, //A8
    output logic [1:0] S_mealy //D12 C12
);

logic cleanCLK;

//Debouncer to clean up the noisy clock input
debouncer mod1 (
    .A_noisy(rawclock),
    .CLK50M(Clock50M),
    .A(cleanCLK)
);

sequenceDetectorMealy module1 (
    .CLK(cleanCLK),
    .A(A),
    .Z(Z_mealy),
    .stateOut(S_mealy)
);

sequenceDetectorMoore module2 (
    .CLK(cleanCLK),
    .A(A),
    .Z(Z_moore),
    .stateOut(S_moore)
);

endmodule