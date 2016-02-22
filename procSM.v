module procSM(
	input c2,
	input c1,
	input c0,
	input r2,
	output q2,
	output q1,
	output q0
	);

wire d2,d1,d0,c2_,c0_,r2_,and1,and2,and3,and4,and5);

not(c2_,c2);
not(c0_,c0);
not(r2_,r2);
and(and1,c1,c0_,r2_);
and(and2,c2_,i0);
and(and3,c1,c0_,r2_);
and(and4,c2_,i1);
and(and5,c1,c0_,r2_);
or(d2,c2_,and1);
or(d1,and2,and3);
or(d0,and4,and5);

	ff ff2 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d2    ),
		
		.q     (q2    )
	);

	ff ff1 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d1    ),
		
		.q     (q1    )
	);

	ff ff0 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d0    ),
		
		.q     (q0    )
	);


endmodule // procSM