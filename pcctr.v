module pcctr (
	input  c2     , //MSB of RegCtr
	input  c1     ,
	input  c0     , //LSB of RegCtr
	input  i1     , //MSB of Data
	input  i0     , //LSB of Data
	input  r2     , //Overflow, Status Register
	input  clk    ,
	input  clk_en ,
	input  reset_n,
	output q2     , //c2	MSB of state
	output q1     , //c1 	2SB of state
	output q0       //c0	LSB of state
);

	wire d0,d1,d2,c0_,r2_,q2_,c2_,and1,and2,and3,and4;
	not(c_,c);
	and(d2,c1,c2,c0_,r2_);
	and(and1,q2_,q1);
	and(and2,q2,i1);
	and(and3,q2_,q0,c2_);
	and(and4,q2_,c2_);
	or(d1,and1,and2,and3);
	or(d0,i0,and4);
	
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