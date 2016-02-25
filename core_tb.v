module core_tb ();
	reg clk, clk_en, reset, i1, i0;
	wire c1, c0;
	
	processorCore test(
		.clk(clk),
		.clk_en(clk_en),
		.reset(reset),
		.i1(i1),
		.i0(i0)
	);
	
	