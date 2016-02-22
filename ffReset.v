module ffReset (
	input  clk   , // Clock
	input  clk_en, // Clock Enable
	input  rst_n , // Asynchronous reset active low
	input  d    , // data line
	output q2  // output
);

	wire del,del_,rst_n_pulse,pulse_,q1_;
	buf #(1,1) (del, rst_n);
	not(del_,del);
	not(rst_n_,rst_n);
	not(q1_,q1);
	and(pulse, del_,rst_n_); // rising, positive pulse
	not(pulse_,pulse);


	ff ff0 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (pulse_),
		.d3    (d    ),
		
		.q     (q0tod1)
	);

	ff ff1 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (pulse_ ),
		.d3    (q0tod1  ),
		
		.q     (q1    )
	);

	ff ff2 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (q1_ ),
		.d3    (d   ),
		
		.q     (q2    )
	);


endmodule

/*
ff ff1 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d1toq_1),   
		
		.q     (q1toclk2     )
	);
*/