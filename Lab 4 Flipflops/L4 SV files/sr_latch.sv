module sr_latch(
    input s, r,
    output reg q, q_bar
);

assign  q = ~(r | q_bar);
assign q_bar = ~(s | q);

endmodule