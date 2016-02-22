// testbench for counter module
`timescale 1ns / 1ps
module stimulus();
	// Inputs
	reg rst_n =0;

	parameter iv = 1;
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
		.d3    (d1toq_1),   
		
		.q     (q1toclk2     )
	);

	ff ff2 (
		.clk   (q1toclk2   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (q_2tod2),   
		
		.q     (q2     )
	);

	initial begin
		$dumpfile("ff.vcd");
		$dumpvars(21,q1toclk2,q2,clk);
	end

	initial begin
		$display("q1\tq2\tclk\n"); //Setup Table Headers
	end

	initial begin
		$monitor("%d\t%d\t%d \n",q1toclk2,q2,clk);
	end

endmodule