module input_unit(
				input clk,
				input clk_slow,
				input rst,
				input din_valid,
				input [31:0]data_in_re,
				input [31:0]data_in_im,
				output reg [31:0]data_out_first_re,
				output reg [31:0]data_out_first_im,
				output reg [31:0]data_out_second_re,
				output reg [31:0]data_out_second_im
				);
	
	reg [31:0]mem_re [0:63];
	reg [31:0]mem_im [0:63];
	reg [5:0]count_in;
	reg [4:0]count_out;
	
	always @(posedge clk)
		begin
			if(!rst)
				count_in <= 6'b0;
			else if(din_valid)
				count_in <= count_in + 1;
			else
				count_in <= count_in;
		end
	
	always @(posedge clk)
		begin
			if(!rst)
				begin
					mem_re[0]<=32'b0; mem_re[1]<=32'b0; mem_re[2]<=32'b0; mem_re[3]<=32'b0; mem_re[4]<=32'b0; mem_re[5]<=32'b0; mem_re[6]<=32'b0; mem_re[7]<=32'b0; 
					mem_re[8]<=32'b0; mem_re[9]<=32'b0; mem_re[10]<=32'b0; mem_re[11]<=32'b0; mem_re[12]<=32'b0; mem_re[13]<=32'b0; mem_re[14]<=32'b0; mem_re[15]<=32'b0; 
					mem_re[16]<=32'b0; mem_re[17]<=32'b0; mem_re[18]<=32'b0; mem_re[19]<=32'b0; mem_re[20]<=32'b0; mem_re[21]<=32'b0; mem_re[22]<=32'b0; mem_re[23]<=32'b0; 
					mem_re[24]<=32'b0; mem_re[25]<=32'b0; mem_re[26]<=32'b0; mem_re[27]<=32'b0; mem_re[28]<=32'b0; mem_re[29]<=32'b0; mem_re[30]<=32'b0; mem_re[31]<=32'b0; 
					mem_re[32]<=32'b0; mem_re[33]<=32'b0; mem_re[34]<=32'b0; mem_re[35]<=32'b0; mem_re[36]<=32'b0; mem_re[37]<=32'b0; mem_re[38]<=32'b0; mem_re[39]<=32'b0; 
					mem_re[40]<=32'b0; mem_re[41]<=32'b0; mem_re[42]<=32'b0; mem_re[43]<=32'b0; mem_re[44]<=32'b0; mem_re[45]<=32'b0; mem_re[46]<=32'b0; mem_re[47]<=32'b0; 
					mem_re[48]<=32'b0; mem_re[49]<=32'b0; mem_re[50]<=32'b0; mem_re[51]<=32'b0; mem_re[52]<=32'b0; mem_re[53]<=32'b0; mem_re[54]<=32'b0; mem_re[55]<=32'b0; 
					mem_re[56]<=32'b0; mem_re[57]<=32'b0; mem_re[58]<=32'b0; mem_re[59]<=32'b0; mem_re[60]<=32'b0; mem_re[61]<=32'b0; mem_re[62]<=32'b0; mem_re[63]<=32'b0; 
					mem_im[0]<=32'b0; mem_im[1]<=32'b0; mem_im[2]<=32'b0; mem_im[3]<=32'b0; mem_im[4]<=32'b0; mem_im[5]<=32'b0; mem_im[6]<=32'b0; mem_im[7]<=32'b0; 
					mem_im[8]<=32'b0; mem_im[9]<=32'b0; mem_im[10]<=32'b0; mem_im[11]<=32'b0; mem_im[12]<=32'b0; mem_im[13]<=32'b0; mem_im[14]<=32'b0; mem_im[15]<=32'b0; 
					mem_im[16]<=32'b0; mem_im[17]<=32'b0; mem_im[18]<=32'b0; mem_im[19]<=32'b0; mem_im[20]<=32'b0; mem_im[21]<=32'b0; mem_im[22]<=32'b0; mem_im[23]<=32'b0; 
					mem_im[24]<=32'b0; mem_im[25]<=32'b0; mem_im[26]<=32'b0; mem_im[27]<=32'b0; mem_im[28]<=32'b0; mem_im[29]<=32'b0; mem_im[30]<=32'b0; mem_im[31]<=32'b0; 
					mem_im[32]<=32'b0; mem_im[33]<=32'b0; mem_im[34]<=32'b0; mem_im[35]<=32'b0; mem_im[36]<=32'b0; mem_im[37]<=32'b0; mem_im[38]<=32'b0; mem_im[39]<=32'b0; 
					mem_im[40]<=32'b0; mem_im[41]<=32'b0; mem_im[42]<=32'b0; mem_im[43]<=32'b0; mem_im[44]<=32'b0; mem_im[45]<=32'b0; mem_im[46]<=32'b0; mem_im[47]<=32'b0; 
					mem_im[48]<=32'b0; mem_im[49]<=32'b0; mem_im[50]<=32'b0; mem_im[51]<=32'b0; mem_im[52]<=32'b0; mem_im[53]<=32'b0; mem_im[54]<=32'b0; mem_im[55]<=32'b0; 
					mem_im[56]<=32'b0; mem_im[57]<=32'b0; mem_im[58]<=32'b0; mem_im[59]<=32'b0; mem_im[60]<=32'b0; mem_im[61]<=32'b0; mem_im[62]<=32'b0; mem_im[63]<=32'b0; 
				end
			else if(din_valid)
				begin
					mem_re[count_in] <= data_in_re;
					mem_im[count_in] <= data_in_im;
				end
		end
		
	always @(posedge clk_slow)
		begin
			if(!rst)
				count_out <= 5'b0;
			else if(din_valid)
				count_out <= count_out + 1;
			else
				count_out <= count_out;
		end
	
	always @(posedge clk_slow)
		begin
			if(!rst)
				begin
					data_out_first_re <= 32'b0;
					data_out_first_im <= 32'b0;
					data_out_second_re <= 32'b0;
					data_out_second_im <= 32'b0;
				end
			else if(count_out >= 5'd16)
				begin
					data_out_first_re <= mem_re[count_out - 16];
					data_out_first_im <= mem_im[count_out - 16];
					data_out_second_re <= mem_re[count_out];
					data_out_second_im <= mem_im[count_out];
				end
			else
				begin
					data_out_first_re <= mem_re[count_out + 32];
					data_out_first_im <= mem_im[count_out + 32];
					data_out_second_re <= mem_re[count_out + 48];
					data_out_second_im <= mem_im[count_out + 48];
				end
		end

endmodule