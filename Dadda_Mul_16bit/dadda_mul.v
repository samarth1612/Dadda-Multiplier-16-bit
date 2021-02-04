`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:54 11/08/2020 
// Design Name: 
// Module Name:    dadda_mul 
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
module dadda_mul(
	input [15:0] A,
   input [15:0] B,
   output [32:0] C
   );
	
	genvar i;
	
	wire [15:0] temp [15:0];
	wire [31:0] AB[15:0], temp_var[15:0], w1[5:0], w2[1:0], w3[1:0];
	// Taking partial products 
	generate
		for (i = 0; i < 16; i = i + 1)
		begin: partial_pro_loop
			partial_pro pp(A, B[i], temp[i]);
			assign temp_var[i] = {{16{1'b0}}, temp[i]};
			assign AB[i] = temp_var[i] << i;
		end
	endgenerate
	
	// First level
	compressor_5_2 comp_5_2_1 (AB[0], AB[1], AB[2], AB[3], AB[4], w1[0], w1[1]);
	compressor_5_2 comp_5_2_2 (AB[5], AB[6], AB[7], AB[8], AB[9], w1[2], w1[3]);
	compressor_5_2 comp_5_2_3 (AB[10], AB[11], AB[12], AB[13], AB[14], w1[4], w1[5]);
	// Second level
	compressor_5_2 comp_5_2_4 (w1[0], w1[1], w1[2], w1[3], w1[4], w2[0], w2[1]);
	// Third level
	compressor_4_2 comp_4_2_1 (AB[15], w1[5], w2[0], w2[1], w3[0], w3[1]);
	// Final level
	rec_dub rd_1 (w3[0], w3[1], C[31:0], C[32]);

endmodule
