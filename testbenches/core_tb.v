`include "processorCore.v"

module core_tb ();
	reg clk, clk_en, reset, i1, i0;
	wire c1, c0;
	
	processorCore test(
		.clk(clk),
		.clk_en(clk_en),
		.reset(reset),
		.i1(i1),
		.i0(i0),
		.c1(c1),
		.c0(c0)
	);
	always
		#1 clk = ~clk;
	initial begin
		$monitor ($time, " State: %d %d clock: %d inputs: %d %d", c1, c0, clk, i1, i0);
		clk = 1'b0;
		clk_en = 1'b1;
		reset = 1'b1;
		i1 = 1'b0;
		i0 = 1'b0;
		#3 i1 = 1'b0;
		#3 i0 = 1'b0;
		#5 reset = ~reset;
		#7 i1 = 1'b0;
		#7 i0 = 1'b1;
		#12 i1 = 1'b1;
		#12 i0 = 1'b0;
		#13;
			$stop;
	end
endmodule