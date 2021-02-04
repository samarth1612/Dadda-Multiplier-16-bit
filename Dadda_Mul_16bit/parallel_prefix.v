`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:51 11/08/2020 
// Design Name: 
// Module Name:    parallel_prefix 
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
module parallel_prefix(
    input [1:0] A,
    input [1:0] B,
    output reg [1:0] C
    );

	always@(A, B)
	begin
		if(A == 2'b00 || A == 2'b11)
			C = A;
		else
			C = B;
	end

endmodule
