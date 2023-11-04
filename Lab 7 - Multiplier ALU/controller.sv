module controller(
	input logic CLKb,
	output logic enA, enC, enALU
);

	/*
	* create a sequential controller
	* 	need a counter to keep track of current step (sequential logic!) - always_ff
	*	need a combinational logic circuit to assign outputs based on current step - always_comb
	*/
	logic [1:0] crr_state; 
	logic [1:0] next_state;
	
	always_ff@(negedge(CLKb))
	begin
		crr_state <= next_state;
	end
	
	always_comb
	begin
			case(crr_state)
			
				2'b00 : begin //Get operation
					enALU = 1'b1;
					enA = 1'b0;
					enC = 1'b0;
					next_state = 2'b01;
				end
				
				2'b01 : begin //Get A input
					enALU = 1'b0;
					enA = 1'b1;
					enC = 1'b0;
					next_state = 2'b10;
				end
				
				2'b10 : begin //Store result
					enALU = 1'b0;
					enA = 1'b0;
					enC = 1'b1;
					next_state = 2'b00;
				end
				
				default: begin	//default
					next_state = 2'b00;
					enALU = 1'b0;
					enA = 1'b0;
					enC = 1'b0;
				end
			endcase
	end
	
endmodule 