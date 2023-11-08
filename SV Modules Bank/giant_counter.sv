module top_level (
    input logic KEY0,
    input logic CLK50M,
    output logic [3:0] LED,
    output logic IO0
);

    logic [25:0] counter;
    logic [0:0] toggle_ff;
    logic [0:0] logic_var;

    debouncer debouncer_inst (
        .A_noisy(KEY0),
        .CLK50M(CLK50M),
        .A (clean_clk)
    );

    counter26bit counter_inst (
        .CLK(CLK_50),
        .ENP(debouncer_inst.Q),
        .ENT(debouncer_inst.Q),
        .LD(1'b0),
        .CLR(1'b0),
        .QA_QZ(counter),
        .rco(toggle_ff)
    );

    assign LED = counter[3:0];
    assign IO0 = toggle_ff;

    always_comb begin
        if (counter < 26_000_000) begin
            logic_var = 1'b0;
        end
        else begin
            logic_var = 1'b1;
        end
    end

    assign debouncer_inst.CLK = CLK_50;

endmodule