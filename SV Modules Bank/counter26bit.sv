module counter26bit #(parameter N = 26)
(
	input logic ENP, ENT,
	input logic LDb, CLRb,
	input logic CLKb,
	
	output logic QA, QB, QC, QD,
	output logic RCO,
	output logic isHalf
);	

const int MAX_RANGE = 50000000;
logic [N-1:0] crrNum;
logic [3:0] count_4bit;

logic isEnable;
assign isEnable = ENP | ENT;

//in-module clr
logic CLR;

logic combine_CLR;
assign combine_CLR = ~CLRb | CLR;


always_ff@(posedge(CLKb))
    if(combine_CLR)
        crrNum <= 0;
    else if(~LDb & isEnable)
        crrNum <= crrNum + 1;
    else
        crrNum = crrNum;

always_comb begin
// always combinational 
    if(crrNum > MAX_RANGE)
        CLR = 1;
    else
        CLR = 0;
        
    if(crrNum == MAX_RANGE)
        RCO = ENT;
    else
        RCO = 0;
    
    if(crrNum > (MAX_RANGE/2))
        isHalf = 1;
    else
        isHalf = 0;
    
end

//count_4bit
assign QA = crrNum[0];
assign QB = crrNum[1];
assign QC = crrNum[2];
assign QD = crrNum[3];
	
	
endmodule



// module counter26bit #(parameter N = 26)(
//     input logic CLK,
//     input logic reset,
//     output logic [N-1:0] q
// );

// logic p;

// always_ff @(posedge CLK, posedge reset)
// begin
//     if (reset) q <= 0;
//     else q <= q + 1;
// end

// always_comb
// begin
//     if (q == 50000000) q <= 0;

//     // if (q < 25000000) p=0;
//     // else p=1;
// end

// endmodule

// module counter26bit (
//     input logic CLK,
//     input logic ENP,
//     input logic ENT,
//     input logic LD,    //active low load
//     input logic CLR,   //active low
//     output logic [25:0] QA_QZ,
//     output logic rco
// );

//     logic [25:0] counter;
//     logic [25:0] next_counter;
//     logic [25:0] load_value = 26'h0;
//     logic [25:0] max_value = 26'h2FAF080;
//     logic [1:0] enable;
//     logic [25:0] reset_value = 26'h0;
//     logic [0:0] toggle_ff;

//     assign LD = 1'b0;
//     assign CLR = 1'b0;

//     always_ff @(posedge CLK) begin
//         if (CLR == 1'b0) begin
//             counter <= reset_value;
//             enable <= 2'b0;
//         end
//         else if (LD == 1'b0) begin
//             counter <= load_value;
//             enable <= 2'b0;
//         end
//         else if (enable == 2'b11) begin
//             counter <= next_counter;
//             enable <= 2'b0;
//         end
//         else begin
//             next_counter <= counter + 26'h1;
//             enable <= 2'b11;
//         end
//     end

//     assign q = counter[25:0];
//     assign rco = (counter == max_value) ? 1'b1 : 1'b0;

// endmodule



/*
Giant Counter with Blinking Light
The 74x163, shown in Fig. 1, is a 4-bit counter integrated circuit (IC) with two active-high enables
(ENP/ENT), a synchronous active-low load (LDb), and a synchronous active-low clear (CLRb).
The 4-bit count value is output on QD–QA from most-significant to least-significant bit, respectively.
When the counter reaches its maximum value, the ripple-carry output (RCO) is a logic-1 (if ENT
is active).
- Create a SV file names ”counter26bit.sv” that contains one SV module named counter26bit.
Using any SV you wish create a 26 bit version of the 74x163. (note: you do not need to
differentiate between what ENP/ENT do, just implement them as enables).
- Optional in the top level module using the debouncer module connect the clock input of the
counter26bit module up to KEY0 and the 3-4 output bits to LEDs and confirm that the
counter behaves as expected.
Figure 1: A 4-bit counter with synchronous load and clear functionality.
- Connect the output bits of the counter so that it resets when it has counted to 50,000,000.
- Create a logic variable which is 0 one the counter is less than 25,000,000 and 1 when the
counter is greater than 25,000,000.
- In the top level module connect the logic variable to LED0. Connect the clk input of the
counter to the 50MHz internal clock of the DE10 board. Load the SV files on to your DE10
lite board. LED0 should blink one time per second with a 50% duty cycle, and demo for the
TA.
- In the top level connect the toggle flip flop output to Arduino pin IO0 (PIN AB5).
- Turn on the scope connect the scope output to GND and Arduino pin IO0. Select measure
and frequency.

*/

