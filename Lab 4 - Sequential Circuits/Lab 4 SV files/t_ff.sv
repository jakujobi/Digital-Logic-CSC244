module t_ff(input t, input clk, output reg q);

always @(posedge clk) begin
    if (t) begin
        q <= ~q;
    end
end

endmodule

