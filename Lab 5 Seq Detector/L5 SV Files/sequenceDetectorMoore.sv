// Define the module sequenceDetectorMoore with inputs clk, reset, and data_in, and outputs detected and state_out
module sequenceDetectorMoore (
    input logic clk,
    input logic reset,
    input logic data_in,
    output logic detected,
    output logic [2:0] state_out
);

    // Define states using an enum
    typedef enum logic [3:0] {
        IDLE,
        S1,
        S2,
        S3,
        S4
    } state_t;

    // Define parameters for the state transitions
    parameter state_t INIT_STATE = IDLE;
    parameter state_t FINAL_STATE = S4;
    parameter logic [1:0] SEQ = 2'b1010;

    // Define state register and output register
    logic [1:0] state_reg;
    logic [1:0] output_reg;

    // Define combinational logic for the next state and output
    always_ff @(posedge clk, posedge reset) begin
        if (reset) begin
            state_reg <= INIT_STATE; // Set the state register to the initial state when reset is high
            output_reg <= 2'b0; // Set the output register to 0 when reset is high
        end else begin
            case (state_reg) // Check the current state of the state register
                IDLE: begin // If the current state is IDLE
                    if (data_in == SEQ[0]) begin // Check if the input matches the first bit of the sequence
                        state_reg <= S1; // If it does, move to state S1
                        output_reg <= 2'b000; // Set the output to 0
                    end else begin // If it doesn't match
                        state_reg <= IDLE; // Stay in the IDLE state
                        output_reg <= 2'b000; // Set the output to 0
                    end
                end
                S1: begin // If the current state is S1
                    if (data_in == SEQ[1]) begin // Check if the input matches the second bit of the sequence
                        state_reg <= S2; // If it does, move to state S2
                        output_reg <= 2'b001; // Set the output to 1
                    end else begin // If it doesn't match
                        state_reg <= IDLE; // Go back to the IDLE state
                        output_reg <= 2'b000; // Set the output to 0
                    end
                end
                S2: begin // If the current state is S2
                    if (data_in == SEQ[0]) begin // Check if the input matches the first bit of the sequence
                        state_reg <= S3; // If it does, move to state S3
                        output_reg <= 2'b010; // Set the output to 2
                    end else begin // If it doesn't match
                        state_reg <= IDLE; // Go back to the IDLE state
                        output_reg <= 2'b000; // Set the output to 0
                    end
                end
                S3: begin // If the current state is S3
                    if (data_in == SEQ[1]) begin // Check if the input matches the second bit of the sequence
                        state_reg <= S4; // If it does, move to state S4
                        output_reg <= 2'b011; // Set the output to 3
                    end else begin // If it doesn't match
                        state_reg <= IDLE; // Go back to the IDLE state
                        output_reg <= 2'b000; // Set the output to 0
                    end
                end
                S4: begin // If the current state is S4
                    state_reg <= FINAL_STATE; // Set the state register to the final state
                    output_reg <= 2'b100; // Set the output to 4
                end
            endcase
        end
    end

    // Assign the output to the output register
    assign detected = output_reg[1]; // The detected output is the second bit of the output register
    assign state_out = state_reg; // The state_out output is the state register

endmodule