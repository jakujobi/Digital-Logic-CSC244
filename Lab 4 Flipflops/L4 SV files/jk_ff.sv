module jk_ff (
    input j, k, clk,
    output reg q,
    output reg q_bar
);

logic jandq_bar, kn, knandq, jandq_barorknandq;


assign jandq_bar = j & q_bar;
assign kn = ~k;
assign knandq = kn & q;
assign jandq_barorknandq = jandq_bar | knandq;

d_ff module1 (
    .d(jandq_barorknandq),
    .clk(clk),
    .q(q),
    .q_bar(q_bar)
);


endmodule
