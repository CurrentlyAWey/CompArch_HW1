`include "ff.v"

`ifndef processorCore
`define processorCore
`define N 4
`define M ('N << 2)

`endif

module processorCore(
	clk,
	clk_en,
	reset,
	i1,	//MSB Instruction
	i0,	//LSB Instruction,
	
	c1,	//MSB state
	c0	//LSB state
);
	input wire clk, clk_en, reset, i1, i0;
	output wire c1, c0;
	wire d1, d0 ,c0_,c1_;
	assign d1 = c1&(~c0) | (~c0)&(~i0);
	assign d0 = (~c1)&(~c0)&(~i1);
	ff ff0 (
		.clk   (clk),
		.clk_en(clk_en),
		.rst_n (reset),
		.d3    (d0),
		.q     (c0),
		.q_    (c0_)
	);
	ff ff1 (
		.clk   (clk),
		.clk_en(clk_en),
		.rst_n (reset),
		.d3    (d1),
		.q     (c1),
		.q_    (c1_)
	);
endmodule	
