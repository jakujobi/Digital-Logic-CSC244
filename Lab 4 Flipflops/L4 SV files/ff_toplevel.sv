module ff_toplevel ( 
    input logic rawclock, //raw clock from the switch
    input logic Clock50M, //50 MHz internal clock
    input logic dorjort,    //represents d, j, and k
    input logic k,
    output logic q,
    output logic q_bar
);


logic cleanclk;

debouncer module1 (
    .A_noisy(rawclock),
    .CLK50M(Clock50M),
    .A(cleanclk)
);

// d_ff module2 (
//     .d(dorjort),
//     .clk(cleanclk),
//     .q(q),
//     .q_bar(q_bar)
// );


jk_ff module3 (
    .j(dorjort),
    .k(k),
    .clk(cleanclk),
    .q(q),
    .q_bar(q_bar)
);


// t_ff module4 (
//     .t(dorjort),
//     .clk(cleanclk),
//     .q(q),
// 	.q_bar(q_bar)
// );


endmodule