//Create a SV file named “machineComparison.sv” that contains one SV module named machineComparison.
//Write structural SV to combine the two FSM modules together

module machineComparison ( 
    input logic rawclock, //raw clock from the switch
    input logic Clock50M, //50 MHz internal clock
    input logic A,

    output logic Z_moore,
    output logic S_moore,
    output logic Z_mealy,
    output logic S_mealy
);