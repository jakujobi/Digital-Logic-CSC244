/*******************************************
* Author: Dr. Hansen
* Date: Mar. 29, 2021
*
* Module: ALUcontroller
* 
* Description: Top-level module for a multi-stage
*	arithmetic logic unit (ALU). The ALU takes
*	an 8-bit INPUT for the A and B operands via
*	a shared set of switches. Depending on the 
*	ALUcontrol signal, one of four operations is 
*	performed (A op B = C). 
*
* ALUControl: 2-bits wide
*	2'b00: ADD
*	2'b01: SUB
*	2'b10: AND
*	2'b11: OR
*
* Sequence of inputs:
*	0: save INPUT to A, save ALUcontrol bits
*	1: INPUT goes to B, save Result in C 
* 
* Inputs: 
*	INPUT: 8-bit shared input from SW[7:0]
*   ALUcontrol: 2-bit control from SW[9:8]
*	CLKb: 1-bit clock from KEY0
*	clk50M:	50 MHz clock from DE10-Lite
*
* Outputs:
*		Aseg: two 7-bit outputs showing A to HEX5:4
*		Bseg: two 7-bit outputs showing INPUT to HEX3:2
*		Cseg: two 7-bit outputs showing C to HEX1:0
*		V, C, N, Z: ALU Flags 
*
********************************************/

module ALUcontroller(
	input logic [7:0] INPUT,
	input logic [1:0] ALUcontrol,
	input logic CLKb, CLK50M,
	
	output logic [0:6] Aseg[1:0], Bseg[1:0], Cseg[1:0],
	output logic V, C, Neg, Z
);
	
	/*
	* debounce the clock
	*/
	logic CLKb_deb;
	debouncer clkdeb(.A_noisy(CLKb), .CLK50M(CLK50M), .A(CLKb_deb));

	/*
	* sequential controller to determine enable signals
	*	enA - active high enable for the A register
	*	enC - active high enable for the C register
	*	enALU - active high enable for the ALUcontrol register
	*/
	logic enA, enC, enALU;
	controller _cont(.CLKb(CLKb_deb), .enA(enA), .enC(enC), .enALU(enALU));
	

	/*
	* registers to hold the values of A, output of ALU (C), and ALUcontrol
	*/
	logic [7:0] _A, _Cin, _Cout;
	logic [1:0] _ALUcontrol;
	logic _V,_C,_Neg,_Z;
	
	regN Areg(.D(INPUT), .CLKb(CLKb_deb), .E(enA), .Q(_A));
		defparam Areg.N = 8; //set the width of the A register to 8-bits
	regN Creg(.D(_Cin), .CLKb(CLKb_deb), .E(enC), .Q(_Cout));
		defparam Creg.N = 8; //set the width of the C register to 8-bits
	regN ALUreg(.D(ALUcontrol), .CLKb(CLKb_deb), .E(enALU), .Q(_ALUcontrol));
		defparam ALUreg.N = 2; //set the width of the ALUcontrol register to 2-bits
	regN statusreg(.D({_V,_C,_Neg,_Z}),.CLKb(CLKb_deb), .E(enC), .Q({V,C,Neg,Z}));
		defparam statusreg.N = 4; //set the width of the status register to 4-bits
								  //can use the same logic as enC 
	
	/*
	* combinational ALU. A op INPUT = C
	*/
	ALU _ALU(.A(_A), .B(INPUT), .ALUControl(_ALUcontrol), .Result(_Cin),
			 .V(_V), .C(_C), .Neg(_Neg), .Z(_Z)); //ALU Flags
		defparam _ALU.N = 8;
	
	/*
	*	7segment outputs for A, "B", and C
	*	replace the module names with your 7-segment hex decoder
	*/ 
	
	/*
	seg7hex hexA1(.in(_A[7:4]), .dig_out(Aseg[1]));
	seg7hex hexA0(.in(_A[3:0]), .dig_out(Aseg[0]));
	
	seg7hex hexB1(.in(INPUT[7:4]), .dig_out(Bseg[1]));
	seg7hex hexB0(.in(INPUT[3:0]), .dig_out(Bseg[0]));
	
	seg7hex hexC1(.in(_Cout[7:4]), .dig_out(Cseg[1]));
	seg7hex hexC0(.in(_Cout[3:0]), .dig_out(Cseg[0]));
	*/

endmodule

