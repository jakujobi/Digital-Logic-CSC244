
module giant_counter(
	input logic CLK,
    input logic CLK50M,
	input logic LD,
    input logic CLR,
	input logic ENP,
    input logic ENT,
	
	output logic [3:0] Q, 
	output logic RCO,
    output logic isHalf
);

logic CLK_Db;
debouncer (
    .A(CLK_Db),
    .CLK50M(CLK50M),
    .A_noisy(CLK)
);

logic isHalf_1, RCO1;
logic isHalf_1_DB;


counter26bit halfsecond_step(
    .isHalf(isHalf_1),
    .RCO(RCO1),
    .ENP(1'b1),
    .ENT(1'b1),
    .LDb(1'b0),
    .CLRb(1'b1),
    .CLKb(CLK50Mhz)
);

//debounce isHalfsignal
debouncer (
    .A(isHalf_1_DB),
    .CLK50M(CLK50M),
    .A_noisy(isHalf_1)
);

counter26bit counter1(
    .isHalf(isHalf),
    .QA(Q[0]),
    .QB(Q[1]),
    .QC(Q[2]),
    .QD(Q[3]),
    .RCO(RCO),
    .ENP(ENP),
    .ENT(ENT),
    .LDb(LD),
    .CLRb(CLR),
    .CLKb(RCO1)
);

endmodule


// module giant_counter (
//     input logic KEY0,
//     input logic CLK50M,
//     output logic LED0
//     //output logic IO0
// );

//     logic [25:0] counter;
//     //logic toggle_ff;
//     logic [0:0] logic_var;

//     debouncer debouncer_inst (
//         .A_noisy(KEY0),
//         .CLK50M(CLK50M),
//         .A (clean_clk)
//     );

//     counter26bit counter_inst (
//         .CLK(CLK_50),
//         .reset(reset),
//         .q(counter)
//     );

//     assign LED0 = logic_var;
//     //assign IO0 = toggle_ff;

//     always_comb begin
//         if (counter < 25_000_000) begin
//             logic_var = 1'b0;
//         end
//         else begin
//             logic_var = 1'b1;
//         end
//     end

//     //assign debouncer_inst.CLK = CLK_50;

// endmodule