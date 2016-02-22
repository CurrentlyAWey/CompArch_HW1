// testbench for combining modules
`timescale 1ns / 1ps
`timescale 1ns / 1ps
module reg2b();
	// Inputs
	reg d1    ;
	reg d2    ;
	reg clk   ;
	reg clk_en;
	reg reset ;


	// Outputs
	wire q1,q2;

	// Instantiate the Unit Under Test (UUT)
	ff ff1 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d1    ), // data line
		
		.q     (q1     )
	);

	// Instantiate the Unit Under Test (UUT)
	ff ff2 (
		.clk   (clk   ),
		.clk_en(clk_en),
		.rst_n (rst_n ),
		.d3    (d2    ), // data line
		
		.q     (q2    )
	);

	initial begin
		$dumpfile("2bd.vcd");
		$dumpvars(0,d1,d2,clk,q1,q2);
	end

	initial begin
		$display("d1\td2\tclk\tq1\tq2\n"); //Setup Table Headers

		// Initialize Inputs
		d1 = 1;
		d2 = 1;
		clk = 0;
		clk_en = 1;
		reset = 1;
		// 	time delay	changes
		#20			clk = 1;
		#10			clk = 0;
		//not floating; clocked into q
		#20			d = 0;
		#10		 	clk = 1;
		#10	 		clk = 0;
		#20 		d = 1;
		#10		 	clk = 1;
		#10	 		clk = 0;
		#20			d = 0;
		#10		 	clk = 1;
		#10	 		clk = 0;

		$display("clk_en stuff");
		#20			clk_en = 0;
					d = 1;
		#10		 	clk = 1;
		#10	 		clk = 0;
		#20			d = 0;
		#10		 	clk = 1;
		#10	 		clk = 0;

		#40;

	end

	initial begin
		$monitor("%d\t%d\t%d\t%d \n",d1,d2,clk,q1,q2);
	end

endmodule