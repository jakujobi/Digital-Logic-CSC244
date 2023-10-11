module sequenceDetectorMoore (
    input logic clk,
    input logic reset,
    input logic data_in,
    output logic detected,
    output logic [2:0] state_out
);

    // Define states using an enum
    typedef enum logic [1:0] {
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
            state_reg <= INIT_STATE;
            output_reg <= 2'b0;
        end else begin
            case (state_reg)
                IDLE: begin
                    if (data_in == SEQ[0]) begin
                        state_reg <= S1;
                        output_reg <= 2'b000;
                    end else begin
                        state_reg <= IDLE;
                        output_reg <= 2'b000;
                    end
                end
                S1: begin
                    if (data_in == SEQ[1]) begin
                        state_reg <= S2;
                        output_reg <= 2'b001;
                    end else begin
                        state_reg <= IDLE;
                        output_reg <= 2'b000;
                    end
                end
                S2: begin
                    if (data_in == SEQ[0]) begin
                        state_reg <= S3;
                        output_reg <= 2'b010;
                    end else begin
                        state_reg <= IDLE;
                        output_reg <= 2'b000;
                    end
                end
                S3: begin
                    if (data_in == SEQ[1]) begin
                        state_reg <= S4;
                        output_reg <= 2'b011;
                    end else begin
                        state_reg <= IDLE;
                        output_reg <= 2'b000;
                    end
                end
                S4: begin
                    state_reg <= FINAL_STATE;
                    output_reg <= 2'b100;
                end
            endcase
        end
    end

    // Assign the output to the output register
    assign detected = output_reg[1];
    assign state_out = state_reg;

endmodule