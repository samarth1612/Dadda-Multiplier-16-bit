`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:32 11/08/2020 
// Design Name: 
// Module Name:    partial_pro 
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
module partial_pro(    
	input [15:0] A,
   input B,
   output reg [15:0] C
	);
	
	always@(A, B)
	begin
		if (B == 1'b0)
			C = {32{1'b0}};
		else
			C = A;
	end

endmodule
