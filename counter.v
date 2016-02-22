// testbench for counter module
`timescale 1ns / 1ps
module stimulus();
	// Inputs
	reg rst_n =0;
	initial begin 
		$dumpfile("test.vcd");
		$dumpvars(0,test);

		// changing values here.

		%20 d=1;

	end

	reg clk = 0;
	always #1 clk = !clk;
	reg clk_en = 1;

	

	// Outputs
	wire q_1,q_2,d1toq_1,q1toclk2,q_2tod2,q2;
	not(q_1,q1);
	not(q_2,q2);
	// Instantiate the Unit Under Test (UUT)
	ff ff1 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d1toq_1),    ),
		
		.q     (q1toclk2     )
	);

	ff ff1 (
		.clk   (q1toclk2   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (q_2tod2),    ),
		
		.q     (q2     )
	);

	initial begin
		$dumpfile("ff.vcd");
		$dumpvars(21,q1toclk2,q2,clk);
	end

	initial begin
		$display("q1\tq2\tclk\n"); //Setup Table Headers

		
		// 	time delay	changes
		
		#4		 	 = 1;
		#10	 		clk = 0;
		#20			d = 0;
		#10		 	clk = 1;
		#10	 		clk = 0;

		#40;

	end

	initial begin
		$monitor("%d\t%d\t%d\t%d \n",d,clk,q,clk_en);
	end

endmodule