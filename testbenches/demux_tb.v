`include "demux.v"
module demux_tb ();
	reg c1, c0;
	wire jnp, inc, halt, start;
	demux test (
		.c1(c1),
		.c0(c0),
		.inc(inc),
		.jnp(jnp),
		.halt(halt),
		.start(start)
	);
	initial begin
		$monitor ($time, "inc: %d, jnp: %d, halt: %d, start: %d, input : %d %d", inc, jnp, halt, start, c1, c0);
		c1 = 1'b0;
		c0 = 1'b0;
		//Initial should be 00
		#2 c0 = ~c0; // 01
		#3 c1 = ~c1; // 11
		#4 c0 = ~c0; // 10
		#5 $stop;
	end
endmodule