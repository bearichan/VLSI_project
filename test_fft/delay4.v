module delay4(
			input clk,
			input rst,
			input [31:0]data_in,
			output reg[31:0] data_out
			);
	
	reg [31:0]tmp1;
	reg [31:0]tmp2;
	reg [31:0]tmp3;
	
	always @(posedge clk)
		begin
			if(!rst)
				begin
					data_out <= 32'b0;
					tmp1 <= 32'b0;
					tmp2 <= 32'b0;
					tmp3 <= 32'b0;
				end
			else
				begin
					tmp1 <= data_in;
					tmp2 <= tmp1;
					tmp3 <= tmp2;
					data_out <= tmp3;
				end
		end

endmodule