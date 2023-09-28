module d_ff(input logic D, input logic clk, output logic Q, output logic Q_bar);
    always_ff @(posedge clk) begin
        Q <= D;
        Q_bar <= ~D;
    end
endmodule
