module t_ff(
    input logic t,
    input logic clk,
    output logic q,
    output logic q_bar
);

logic tn, tnandqbar, tnandq, tnandqbarortnandq;
// tn = not t
// tnandqbar = tn & q_bar
// tnandq = tn & q
// tnandqbarortnandq = tnandqbar | tnandq

assign tn = ~t;
assign tnandqbar = tn & q_bar;
assign tnandq = tn & q;
assign tnandqbarortnandq = tnandqbar | tnandq;

d_latch latch (
    .d(tn),
    .clk(clk),
    .q(q),
    .q_bar(q_bar)
);


// module t_ff(input t, input clk, output reg q);

// always @(posedge clk) begin
//     if (t) begin
//         q <= ~q;
//     end
// end

// endmodule


endmodule