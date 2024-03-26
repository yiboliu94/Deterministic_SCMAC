`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    sc_sum
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
//The sum module. No scale singal considered. Sacle signal will be design outside
module sc_sum  
(
	input clk,
	input x_sn,
	input y_sn,
	input sel,
	output reg Q
);



always @(posedge clk) begin
	case (sel)
			1'b0:	Q <= x_sn;
			1'b1:	Q <= y_sn;
			default:;
	endcase
end

endmodule
