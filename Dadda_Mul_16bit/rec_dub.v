`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:17 11/08/2020 
// Design Name: 
// Module Name:    rec_dub 
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
module rec_dub(
   input [31:0] A,
   input [31:0] B,
   output [31:0] S,
	output C
   );

	wire [63:0] kgp;
	wire [63:0] temp_1;
	wire [63:0] temp_2;
	wire [63:0] temp_3;
	wire [63:0] temp_4;
	wire [63:0] temp_5;
	
	wire[31:0] cin;
	
	genvar i;	
	for(i = 0; i < 32; i = i + 1)
	begin
		assign kgp[2 * i] = A[i];
		assign kgp[2 * i + 1] = B[i];
	end
	
	// Using array of modules so as to reduce the length of the code
	parallel_prefix pp_0(kgp[1:0], 2'b00, temp_1[1:0]);
	parallel_prefix pp_1[31:1] (kgp[63:2], temp_1[61:0], temp_1[63:2]);
	
	parallel_prefix pp_2[1:0] (temp_1[3:0], 2'b00, temp_2[3:0]);
	parallel_prefix pp_3[31:2] (temp_1[63:4], temp_2[61:2], temp_2[63:4]);
	
	parallel_prefix pp_4[3:0] (temp_2[7:0], 2'b00, temp_3[7:0]);
	parallel_prefix pp_5[31:4] (temp_2[63:8], temp_3[61:6], temp_3[63:8]);
	
	parallel_prefix pp_6[7:0] (temp_3[15:0], 2'b00, temp_4[15:0]);
	parallel_prefix pp_7[31:8] (temp_3[63:16], temp_4[61:14], temp_4[63:16]);

	parallel_prefix pp_8[15:0] (temp_4[31:0], 2'b00, temp_5[31:0]);
	parallel_prefix pp_9[31:16] (temp_4[63:32], temp_5[61:30], temp_5[63:32]);
	
	generate
		for(i = 0; i < 32; i = i + 1)
		begin
			assign cin[i] = temp_5[2 * i + 1];
		end
	endgenerate
	
	assign S[0] = A[0] ^ B[0];
	
	generate
		for(i = 1; i < 32; i = i + 1)
		begin
			assign S[i] = A[i] ^ B[i] ^ cin[i - 1];
		end
	endgenerate
	
	assign C = cin[31];


endmodule
