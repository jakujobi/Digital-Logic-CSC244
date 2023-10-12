// sequenceDetectorMealy.sv

module sequenceDetectorMealy (
    input logic CLK, A,
    output logic Z,
    output logic [1:0] stateOut
);

    typedef enum {S0, S1, S2, S3} state_t;
    state_t currentState = S0, nextState;

    always_ff @(posedge CLK) begin
        currentState <= nextState;
    end

    always_comb begin
        nextState = currentState; // Default
        case(currentState)
            S0: nextState = A ? S1 : S0;
            S1: nextState = A ? S1 : S2;
            S2: nextState = A ? S3 : S0;
            S3: nextState = A ? S1 : S0;
        endcase

        Z = (currentState == S3) && !A;
        stateOut = currentState[1:0];
    end

endmodule



// module sequenceDetectorMealy (
//     input logic clk,
//     //input logic reset,
//     input logic data_in,
//     output logic seq_detected,
//     output logic [1:0] state_out
// );

// // Define the states using an enum
// typedef enum logic [1:0] {
//     S0,
//     S1,
//     S2,
//     S3
// } state_t;

// // Define the state register and initialize to S0
// state_t state_reg = S0;

// // Define the next state logic
// always_ff @(posedge clk) begin
//     begin
//         case (state_reg)
//             S0: if (data_in == 1'b0)
//                     begin
//                         state_reg <= S0;
//                     end
//                 else
//                     begin
//                         state_reg <= S1;
//                     end

//             S1: if (data_in == 1'b0)
//                     begin
//                         state_reg <= S2;
//                     end
//                 else
//                 begin
//                         state_reg <= S1;
//                     end

//             S2: if (data_in == 1'b0)
//                 begin
//                     state_reg <= S0;
//                 end
//                     else begin
//                         state_reg <= S3;
//                     end

//             S3: if (data_in == 1'b0) begin
//                         state_reg <= S2;
//                     end else begin
//                         state_reg <= S1;
//                     end
//         endcase
//     end
// end

// // Define the output logic
// always_comb begin
//     if (state_reg == S3)
//         begin
//             seq_detected = 1'b1;
//         end
//     else
//         begin
//             seq_detected = 1'b0;
//         end
//     state_out = state_reg;
// end

// endmodule
