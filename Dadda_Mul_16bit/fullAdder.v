`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:27 11/08/2020 
// Design Name: 
// Module Name:    fullAdder 
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
module fullAdder(
    input a, 
	 input b, 
	 input cin, 
	 output sum, 
	 output ca
	 );

    wire w1, w2, w3, w4, w5;

    xor xor_0 (w1, a, b);
    xor xor_1 (sum, w1, cin);

    and and_0 (w2, a, b);
    and and_1 (w3, a, cin);
    and and_2 (w4, b, cin);
    or  or_0 (w5, w2, w3);
    or  or_1 (ca, w4, w5);
	 
endmodule
