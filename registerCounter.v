module registerCounter (
	input  clk    ,
	input  clk_en ,
	input  rst_n,
	output q2     , //c2	MSB of state
	output q1     , //c1 	2SB of state
	output q0       //c0	LSB of state
);

	wire d0,d1,d2, q2, q1, q0;
	assign d2 = q2&(~q1) | q2&(~q0) | (~q2)&q1&q0; 
	assign d1 = (~q1)&q0 | q1&(~q0);
	assign d0 = ~q0; 

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