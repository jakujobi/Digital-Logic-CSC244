module d_latch(input logic d, enable, output logic q, q_bar);

    always_comb begin
        if (enable) begin
            q = d;
            q_bar = ~d;
        end
    end

endmodule
