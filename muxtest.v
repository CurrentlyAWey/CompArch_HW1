// testbench for mux41 module
`timescale 1ns / 1ps
module muxtest();
	// Inputs
	reg d0;
	reg d1;
	reg d2;
	reg d3;
	reg a0;
	reg a1;

	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	mux41 uut (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d     ),
		
		.q     (q     )
	);

	initial begin
		$dumpfile("mux41.vcd");
		$dumpvars(21,d0,d1,d2,d3,a0,a1);
	end

	initial begin
		$display("d0\td1\td2\td3\ta0\ta1\n"); //Setup Table Headers

		// Initialize Inputs
		d0=d1=d2=d3=a0=a1=1;

		// 	time delay	changes
		#20			clk = 1;
		#10			clk = 0;
		//not floating; clocked into q
		#20			d = 0;


		#40;

	end

	initial begin
		$monitor("%d\t%d\t%d\t%d\t%d\t%d \n",d0,d1,d2,d3,a0,a1);
	end

endmodule