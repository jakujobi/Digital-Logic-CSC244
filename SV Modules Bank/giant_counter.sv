module giant_counter (
    input logic KEY0,
    input logic CLK50M,
    output logic LED0
    //output logic IO0
);

    logic [25:0] counter;
    //logic toggle_ff;
    logic [0:0] logic_var;

    debouncer debouncer_inst (
        .A_noisy(KEY0),
        .CLK50M(CLK50M),
        .A (clean_clk)
    );

    counter26bit counter_inst (
        .CLK(CLK_50),
        .reset(reset),
        .q(counter)
    );

    assign LED0 = logic_var;
    //assign IO0 = toggle_ff;

    always_comb begin
        if (counter < 25_000_000) begin
            logic_var = 1'b0;
        end
        else begin
            logic_var = 1'b1;
        end
    end

    //assign debouncer_inst.CLK = CLK_50;

endmodule