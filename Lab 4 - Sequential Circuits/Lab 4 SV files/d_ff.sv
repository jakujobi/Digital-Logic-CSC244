module d_ff(
    input logic D,
    input logic clk,
    input logic reset,
    output logic Q,
    output logic Q_bar);

    always_ff @(posedge clk, posedge reset) begin
        if (reset) begin
            Q <= 0;
            Q_bar <= 1;
        end else begin
            Q <= D;
            Q_bar <= ~D;
        end
    end
endmodule
