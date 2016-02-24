module ff (
	input  clk   , // Clock
	input  clk_en, // Clock Enable
	input  rst_n , // Asynchronous reset active low
	input  d3    , // data line
	output q     , // output
	output q_
);

	wire d_,s1,r1,a,b,clk_,s2,s3,r2,r3,clk_en_,d2,d3,q2,d;

	and(d2,d3, clk_en);
	not(clk_en_, clk_en);
	and(q2, clk_en_, q);

	or(d,d2,q2);

	not(clk_,clk);
	not(d_,d);

	nand(s1, d, clk_);
	nand(r1, d_, clk_);

	nand(s2,s1,r2);
	nand(r2,r1,s2);

	nand(s3,clk,s2);
	nand(r3,clk,r2);

	nand(q,s3,q_);
	nand(q_,r3,q);
endmodule
