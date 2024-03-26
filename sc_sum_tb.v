`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   
// Design Name:   MAIN
// Module Name:   
// Project Name:  
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MAIN
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module scsum_tb;

	// Inputs
	reg clk;
	reg SN_X;
	reg SN_Y;
	// Outputs
	wire Q;


	// Instantiate the Unit Under Test (UUT)
	MAIN uut (
		.clk(clk), 
		.SN_X(SN_X),
		.SN_Y(SN_Y),

		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		SN_X = 0;
		SN_Y = 0;


		
		#100;

		SN_X = 1'b0;
		SN_Y = 1'b0;
		#10;
		SN_X = 1'b0;
		SN_Y = 1'b1;
		#10;
		SN_X = 1'b1;
		SN_Y = 1'b1;
		#10;
		SN_X = 1'b0;
		SN_Y = 1'b0;
		#10;
		SN_X = 1'b0;
		SN_Y = 1'b1;
		// Add stimulus here
		#20;
		$stop;

	end
 
always #5 clk = ~clk;
 
endmodule

