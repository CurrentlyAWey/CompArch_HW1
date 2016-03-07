`include "programCounter.v"
module pgctr_tb();
	reg jnp, inc, r2, i1, i0, clk, rst_n;
	wire p1, p0;
	wire a1, a0;
	assign a1 = inc | (~r2)&jnp;
	assign a0 = jnp;
	programCounter test(
		.clk(clk),
		.rst_n(rst_n),
		.jnp(jnp),
		.inc(inc),
		.r2(r2),
		.i1(i1),
		.i0(i0),
		.p1(p1),
		.p0(p0)
	);
	always
		#1 clk = ~clk;
		
	initial begin
		$monitor($time, " Clock:%d jnp:%d inc:%d r2:%d i:%d%d p: %d%d a: %d%d:", clk, jnp, inc, r2, i1, i0, p1, p0, a1, a0);
		rst_n = 1'b1;
		clk = 1'b0;
		i1 = 1'b0;
		i0 = 1'b0;
		jnp = 1'b0;
		inc = 1'b0;
		r2 = 1'b0;
		#3 rst_n = ~rst_n;
		#4 jnp = ~jnp;
		#5 jnp = ~jnp;
		#6 r2 = ~r2;
		#8 jnp = ~jnp;
		
		#9 $stop;
	end
endmodule