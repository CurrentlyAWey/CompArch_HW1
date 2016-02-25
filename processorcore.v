module processorcore(
	input clk,
	input clk_en,
	input reset,
	input i1,	//MSB Instruction
	input i0,	//LSB Instruction,
	
	output c1,	//MSB state
	output c0	//LSB state
);

	wire i1, i0, c1, c0, d1, d0 ,c0_,c1_;
	assign d0 = ~c1 | c0&(~i1)&i0;
	assign d1 = ~c1 | ~c0 | ~i0 | i1;
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
