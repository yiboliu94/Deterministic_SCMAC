`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    MAIN 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MAIN
(
	input clk,
	input SN_X,
	input SN_Y,
	//input sel,  //Now we use sel signal from inside
	output Q
);
// Use this Main_module, to have an optional sel input, either from outside or from inside of MAIN module.
reg sel;

wire [6:0] RN_X;
LFSR_2 LFSR_X (
	.clk(clk),
	.rst(rst),
	.a(7'd35), //input initial random seed
	.a_rn(RN_X)
	);
always @(posedge clk) begin
        if (RN_X>7'd63)
            sel <= 1'b1;
        else 
            sel <= 1'b0;
    end

//wire z;
sc_sum scsum(
	.clk(clk),
	.x_sn(SN_X),
	.y_sn(SN_Y),
	.sel(sel),
	.Q(Q)
	);



endmodule
