module output_unit(
					input clk,
					input rst,
					input [31:0]data_in_first_re,
					input [31:0]data_in_first_im,
					input [31:0]data_in_second_re,
					input [31:0]data_in_second_im,
					output reg [31:0]data_out_re,
					output reg [31:0]data_out_im,
					output reg dout_valid
					);
	
	reg [5:0]count_valid;
	reg count_dout;
	reg flag;
	
	always @(posedge clk)
		begin
			if(!rst)
				count_valid <= 6'b111111;
			else if(flag==0)
				count_valid <= count_valid + 1;
			else
				count_valid <= count_valid;
		end
	
	always @(posedge clk)
		begin
			if(!rst)
				flag <= 0;
			else if(count_valid == 6'b111101)
				flag <= 1;
			else
				flag <= flag;
		end
		
	always @(posedge clk)
		begin
			if(!rst)
				count_dout <= 1'b1;
			else
				count_dout <= ~count_dout;
		end
	
	always @(posedge clk)
		begin
			if(!rst)
				begin
					data_out_re <= 32'b0;
					data_out_im <= 32'b0;
				end
			else if(count_dout == 0)
				begin
					data_out_re <= data_in_first_re;
					data_out_im <= data_in_first_im;
				end
			else
				begin
					data_out_re <= data_in_second_re;
					data_out_im <= data_in_second_im;
				end
		end
	
	always @(posedge clk)
		begin
			if(!rst)
				dout_valid <= 1'b0;
			else if(flag == 1)
				dout_valid <= 1'b1;
			else
				dout_valid <= 1'b0;
		end
	
endmodule