// sequenceDetectorMoore.sv

// Author: John Akujobi
// Date: Oct 12 2023
// Description: 
/**
 * The sequenceDetectorMoore module is a Moore state machine that detects a specific sequence of inputs.
 * It has one input, A, and one output, Z, which is high when the sequence is detected.
 * The module also has a 3-bit output, stateOut, which indicates the current state of the state machine.
 * The state machine has 5 states, S0 to S4, and transitions between states based on the input A.
 * The module operates on the positive edge of the clock signal, CLK.
 */

module sequenceDetectorMoore (
    input logic CLK, A,
    output logic Z,
    output logic [2:0] stateOut  // Corrected to 3 bits
);

    typedef enum {S0, S1, S2, S3, S4} state_t;  // Define the states using an enum
    state_t currentState = S0, nextState;   // Define the state register and initialize to S0

    // always_ff block updates the currentState of the state machine on the positive edge of the clock
    always_ff @(posedge CLK) begin 
        currentState <= nextState;  // Update the currentState
    end

    // always_comb block defines the nextState of the state machine based on the currentState and input A
    always_comb begin
        nextState = currentState; // Default
        case(currentState)
            S0: nextState = A ? S1 : S0;
            S1: nextState = A ? S1 : S2;
            S2: nextState = A ? S3 : S0;
            S3: nextState = A ? S1 : S4;
            S4: nextState = A ? S1 : S0;
        endcase
    end

    // always_comb block defines the stateOut of the state machine based on the currentState
    always_comb begin
        Z = (currentState == S4);   // Z is high when the sequence is detected
        stateOut = currentState[2:0];   // Corrected to 3 bits
    end

endmodule


//! Old machine that didn't work
// // Define the module sequenceDetectorMoore with inputs clk, reset, and data_in, and outputs detected and state_out
// module sequenceDetectorMoore (
//     input logic clk,
//     //input logic reset,
//     input logic data_in,
//     output logic detected,
//     output logic [2:0] state_out
// );

//     // Define states using an enum
//     typedef enum logic [3:0] {
//         IDLE,
//         S1,
//         S2,
//         S3,
//         S4
//     } state_t;

//     // Define parameters for the state transitions
//     parameter state_t INIT_STATE = IDLE;
//     parameter state_t FINAL_STATE = S4;
//     parameter logic [1:0] SEQ = 2'b1010;

//     // Define state register and output register
//     logic [1:0] state_reg;
//     logic [1:0] output_reg;
//     logic something;

//     // Define combinational logic for the next state and output
//     always_ff @(posedge clk)
// 	 begin
//         //always_ff @(posedge clk, posedge reset) begin
//             case (state_reg) // Check the current state of the state register
//                 IDLE: begin // If the current state is IDLE
//                     if (data_in == SEQ[0]) begin // Check if the input matches the first bit of the sequence
//                         state_reg <= S1; // If it does, move to state S1
//                         output_reg <= 2'b000; // Set the output to 0
//                     end else begin // If it doesn't match
//                         state_reg <= IDLE; // Stay in the IDLE state
//                         output_reg <= 2'b000; // Set the output to 0
//                     end
//                 end
//                 S1: begin // If the current state is S1
//                     if (data_in == SEQ[1]) begin // Check if the input matches the second bit of the sequence
//                         state_reg <= S2; // If it does, move to state S2
//                         output_reg <= 2'b001; // Set the output to 1
//                     end else begin // If it doesn't match
//                         state_reg <= IDLE; // Go back to the IDLE state
//                         output_reg <= 2'b000; // Set the output to 0
//                     end
//                 end
//                 S2: begin // If the current state is S2
//                     if (data_in == SEQ[0]) begin // Check if the input matches the first bit of the sequence
//                         state_reg <= S3; // If it does, move to state S3
//                         output_reg <= 2'b010; // Set the output to 2
//                     end else begin // If it doesn't match
//                         state_reg <= IDLE; // Go back to the IDLE state
//                         output_reg <= 2'b000; // Set the output to 0
//                     end
//                 end
//                 S3: begin // If the current state is S3
//                     if (data_in == SEQ[1]) begin // Check if the input matches the second bit of the sequence
//                         state_reg <= S4; // If it does, move to state S4
//                         output_reg <= 2'b011; // Set the output to 3
//                     end else begin // If it doesn't match
//                         state_reg <= IDLE; // Go back to the IDLE state
//                         output_reg <= 2'b000; // Set the output to 0
//                     end
//                 end
//                 S4: begin // If the current state is S4
//                     state_reg <= FINAL_STATE; // Set the state register to the final state
//                     output_reg <= 2'b100; // Set the output to 4
//                 end
//             endcase
//         end
//     //end

//     // Assign the output to the output register
//     assign something = output_reg[1]; // The output is the first bit of the output register, which is something
//     assign detected = something; // The detected output is the something output
//     assign state_out = state_reg; // The state_out output is the state register

// endmodule