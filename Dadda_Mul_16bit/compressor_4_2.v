`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:48 11/08/2020 
// Design Name: 
// Module Name:    compressor_4_2 
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
module compressor_4_2(
    input [31:0] A1,
    input [31:0] A2,
    input [31:0] A3,
    input [31:0] A4,
    output [31:0] S1,
    output [31:0] S2
    );
	
	wire [31:0] w1, w2;

	carry_save_add csa1 (A1, A2, A3, w1, w2);
	carry_save_add	csa2 (A4, w1, w2, S1, S2);

endmodule
