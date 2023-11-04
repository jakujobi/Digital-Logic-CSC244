module controller(
	input logic CLKb,
	output logic enA, enC, enALU
);

/*
* create a sequential controller
* 	need a counter to keep track of current step (sequential logic!) - always_ff
*	need a combinational logic circuit to assign outputs based on current step - always_comb
*/

// Define the current and next state variables as 2-bit logic vectors
logic [1:0] current_state; 
logic [1:0] next_state;

// Sequential logic block triggered on the negative edge of the CLKb signal
always_ff@(negedge(CLKb))
begin
	current_state <= next_state;	// Update the current state with the next state
end

// Combinational logic block
always_comb
begin
	case(current_state)	// Determine the next state based on the current state
	
		// State 00: Get operation
		2'b00 : begin
			enALU = 1'b1; // Enable the ALU

			enA = 1'b0;	//disable A by setting it to 0
			enC = 1'b0;	//disable C	like we did with A
			
			next_state = 2'b01; // Move to the next state
		end
		
		// State 01: Get A input
		2'b01 : begin
			// Disable the ALU, enable A, disable C
			enALU = 1'b0;
			enA = 1'b1;
			enC = 1'b0;
			// Move to the next state
			next_state = 2'b10;
		end
		
		// State 10: Store result
		2'b10 : begin
			// Disable the ALU, disable A, enable C
			enALU = 1'b0;
			enA = 1'b0;
			enC = 1'b1;
			// Move to the next state
			next_state = 2'b00;
		end
		
		// Default state
		default: begin
			// Reset to state 00 and disable all signals
			next_state = 2'b00;
			enALU = 1'b0;
			enA = 1'b0;
			enC = 1'b0;
		end
	endcase
end

endmodule