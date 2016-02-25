module ff_tb();
	reg clk, clk_en, rst_n, d3;
	wire q, q_;
	ff test(
		.clk(clk),
		.clk_en(clk_en),
		.rst_n(rst_n),
		.d3(d3),
		.q(q),
		.q_(q_)
	);
	always
		#1 clk = ~clk;
		
	initial begin
		$monitor($time, " Clock: %d Input: %d Output: %d", clk, d3, q);
		rst_n = 1'b1;
		clk_en = 1'b0;
		clk = 1'b0;
		d3 =  1'b0;
		#2 rst_n = ~rst_n;
		#4 d3 = ~d3;
		#7 d3 = ~d3;
		#9 d3 = ~d3;
		#11 rst_n = ~rst_n;
		#14; $stop;
	end
endmodule