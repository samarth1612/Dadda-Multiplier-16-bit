`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:13:33 11/08/2020 
// Design Name: 
// Module Name:    carry_save_add 
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
module carry_save_add(
    input [31:0] A,
    input [31:0] B,
    input [31:0] Ci,
    output [31:0] S,
    output [31:0] Ca
    );
// This is carry save adder i.e 3:2 compressor
	genvar i;
	generate
		for(i = 0; i < 31; i = i + 1)
		begin: csa
			fullAdder fa(A[i], B[i], Ci[i], S[i], Ca[i + 1]);
		end
	endgenerate
	assign Ca[0] = 1'b0;
	assign S[31] = 1'b0;


endmodule
