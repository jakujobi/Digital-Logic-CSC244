//Create a SV file named “machineComparison.sv” that contains one SV module named machineComparison.
//Write structural SV to combine the two FSM modules together

module machineComparison ( 
    input logic rawclock, //raw clock from the switch //B8
    input logic Clock50M, //50 MHz internal clock //PIN_P11
    input logic A,  //C10

    output logic Z_moore, //B11
    output logic [2:0] S_moore, //C13, E14, D14
    output logic Z_mealy, //A8
    output logic [1:0] S_mealy //D12 C12
);

sequenceDetectorMealy module1 (
    .clk(rawclock),
    //.reset(reset),
    .data_in(A),
    .seq_detected(Z_mealy),
    .state_out(S_mealy)
);

sequenceDetectorMoore module2 (
    .clk(rawclock),
    //.reset(reset),
    .data_in(A),
    .detected(Z_moore),
    .state_out(S_moore)
);

endmodule