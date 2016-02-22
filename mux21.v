module mux21 (
	input  a0,
	input  d1,
	input  d0,
	output q // output

);
	

	wire a0_,and1,and0;

	not(a0_,a0);
	and(and1,a0, d1);
	and(and0,a0_,d0);
	or(q,and1,and2);

endmodule


/*
	mux21 mux (
		.a0   (clk   ),
		.d1(clk_en),
		.d0(rst_n ),

		.q     (q     )
	);



*/