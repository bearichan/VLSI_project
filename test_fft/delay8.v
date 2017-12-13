module delay8(
			input clk,
			input rst,
			input [31:0]data_in,
			output reg [31:0]data_out
			);
	
	reg [31:0]tmp1;
	reg [31:0]tmp2;
	reg [31:0]tmp3;
	reg [31:0]tmp4;
	reg [31:0]tmp5;
	reg [31:0]tmp6;
	reg [31:0]tmp7;
	
	always @(posedge clk)
		begin
			if(!rst)
				begin
					data_out <= 32'b0;
					tmp1 <= 32'b0;
					tmp2 <= 32'b0;
					tmp3 <= 32'b0;
					tmp4 <= 32'b0;
					tmp5 <= 32'b0;
					tmp6 <= 32'b0;
					tmp7 <= 32'b0;
				end
			else
				begin
					tmp1 <= data_in;
					tmp2 <= tmp1;
					tmp3 <= tmp2;
					tmp4 <= tmp3;
					tmp5 <= tmp4;
					tmp6 <= tmp5;
					tmp7 <= tmp6;
					data_out <= tmp7;
				end
		end

endmodule