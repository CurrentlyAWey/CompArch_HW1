`include "registerCounter.v"
module regctr_tb ();
	reg clk, clk_en, rst_n;
	wire q2, q1, q0;
	
	registerCounter test(
		.clk(clk),
		.clk_en(clk_en),
		.rst_n(rst_n),
		.q2(q2),
		.q1(q1),
		.q0(q0)
	);
	always
		#1 clk = ~clk;
	initial begin
		$monitor ($time, " count: %d %d %d clock: %d clk_en: %d", q2, q1, q0, clk, clk_en);
		clk = 1'b0;
		clk_en = 1'b0;
		rst_n = 1'b1;
		#3 rst_n = ~rst_n;
		#4 clk_en = ~clk_en;
		#5 clk_en = ~clk_en;
		#7 clk_en = ~clk_en;
		#13;
			$stop;
	end
endmodule