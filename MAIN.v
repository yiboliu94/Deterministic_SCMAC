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
	input rst,
	input [6:0] BN_X, //input 7bit binary number for SC multiplication
    input [6:0] BN_Y,
    input SN_Z, //input SN for SC_addition, from other MAC.
	//input sel,  //deprecated input mux_selection when we generate it inside by LFSR.
	output Q    // Q is the sum_output, in SN.
);


// convert input BN_X, BN_Y to SN_X, SN_Y.
//reg rst;
CBSC_SNG SNG_1 (
	.clk(clk),
	.rst(rst),
	.x(BN_X),
	.x_sn(SN_X)
	);

CBSC_SNG SNG_2 (
	.clk(clk),
	.rst(rst),
	.x(BN_Y),
	.x_sn(SN_Y)
	);
	
// And gate for SC multiplication
reg SN_P; // multiplication product in SN.
always @(posedge clk) begin
        SN_P <= SN_X & SN_Y;
    end

//  Generate mux_selection_signal, based on LFSR generated random number.
wire [6:0] RN_X;
reg sel;
LFSR_2 LFSR_X (
	.clk(clk),
	.rst(rst),
	.a(7'd35), //input initial random seed
	.a_rn(RN_X)//output random number(RN), in binary.
	);
always @(posedge clk) begin
        if (RN_X>7'd63)   //if random number RN > 0.5, set mux_selection_signal to be 1, else to be 0. 
            sel <= 1'b1;
        else 
            sel <= 1'b0;
    end

//wire z;
//sc_sum module: // module to conduct SC addition by mux
//      input: 
//              SN_input_1  SN_X;
//              SN_input_2  SN_Y;
//              probability_selection sel;  // sel = 0.5 when SN_X and SN_Y have same scaling factor.
//      output: 
//              SN_output  Q;
sc_sum scsum(
	.clk(clk),
	.x_sn(SN_P),
	.y_sn(SN_Z),
	.sel(sel),
	.Q(Q)
	);



endmodule
