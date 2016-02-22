module regctr (
	input  i1     , //MSB of data
	input  i0     , //LSB of data
	input  clk    ,
	input  clk_en ,
	input  reset_n,
	output q2     , //c2	MSB of state
	output q1     , //c1 	2SB of state
	output q0       //c0	LSB of state
);

	wire d0,d1,d2;
	and(d2,i1,i0);
	xor(d1,i1,i0);
	not(d0,i0);

	ff ff0 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d0    ),
		
		.q     (q0    )
	);

	ff ff1 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d1    ),
		
		.q     (q1    )
	);

	ff ff2 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d2    ),
		
		.q     (q2    )
	);

endmodule // regctr