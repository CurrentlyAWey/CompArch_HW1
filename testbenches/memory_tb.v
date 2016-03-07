`include "memory.v"
module memory_tb();
	reg [1:0] address;
	wire [1:0] data;
	memory test (
		.address(address),
		.data(data)
	);
	initial begin 
		$monitor($time, " address: %b data: %b", address, data);
		address[1] = 1'b0;
		address[0] = 1'b0;
		#2 address[0] = ~address[0];
		#3 address[1] = ~address[1];
		#4 address[0] = ~address[0];
		#5; $stop;
	end
endmodule
