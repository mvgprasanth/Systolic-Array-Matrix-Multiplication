`timescale 1ns / 1ps

// sample testbench for a 4X4 Systolic Array

module test_TPU;

	// Inputs
	reg clk;
	reg control;
	reg [31:0] data_arr;
	reg [31:0] wt_arr;

	// Outputs
	wire [127:0] acc_out;

	// Instantiate the Unit Under Test (UUT)
	MMU uut (
		.clk(clk), 
		.control(control), 
		.data_arr(data_arr), 
		.wt_arr(wt_arr), 
		.acc_out(acc_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		control = 0;
		data_arr = 0;
		wt_arr = 0;
		
		// Wait 100 ns for global reset to finish
		#5000;
       end
		// Add stimulus here
		always
		#250 clk=!clk;
		
		initial begin
		@(posedge clk);
		control=1;
		wt_arr=32'h 05020304;
		
		@(posedge clk);
		wt_arr=32'h 03010203;
		
		@(posedge clk);
		wt_arr=32'h 07040102;

		@(posedge clk);
		wt_arr=32'h 01020403;

		
		@(posedge clk);

		control=0;
		
		data_arr=32'h 00000001;
		
		@(posedge clk);
		data_arr=32'h 00000102;
		
		@(posedge clk);
		data_arr=32'h 00010200;
		
		@(posedge clk);
		data_arr=32'h 00010100;
		
		@(posedge clk);
		data_arr=32'h 02030200;
		
		@(posedge clk);
		data_arr=32'h 04010000;
		
		@(posedge clk);
		data_arr=32'h 05000000;
		
		end
      
endmodule

