`ifndef registerCounter
`define registerCounter
`define N 4
`define M ('N << 2)
`include "ff.v"

module registerCounter (
	clk    ,
	clk_en ,
	rst_n,
	r2     , //c2	MSB of state
	r1     , //c1 	2SB of state
	r0       //c0	LSB of state
);
 
	input wire clk, clk_en, rst_n;
	output wire r2, r1, r0;
	wire d0,d1,d2;
	assign d2 = r2&(~r1) | r2&(~r0) | (~r2)&r1&r0; 
	assign d1 = (~r1)&r0 | r1&(~r0);
	assign d0 = ~r0; 

	ff ff0 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d0    ),
		
		.q     (r0    )
	);

	ff ff1 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d1    ),
		
		.q     (r1    )
	);

	ff ff2 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d2    ),
		
		.q     (r2    )
	);

endmodule // regctr

`endif
