module jk_ff (
    input j, k, clk,
    output reg q,
    output reg q_bar
);

    always @(posedge clk) begin
        if (j && !k) begin
            q <= 1;
            q_bar <= 0;
        end else if (!j && k) begin
            q <= 0;
            q_bar <= 1;
        end else if (j && k) begin
            q <= ~q;
            q_bar <= ~q_bar;
        end
    end

endmodule
