module delay2(
			input clk,
			input rst,
			input [31:0]data_in,
			output reg[31:0] data_out
			);
	
	reg [31:0]tmp1;
	
	always @(posedge clk)
		begin
			if(!rst)
				begin
					data_out <= 32'b0;
					tmp1 <= 32'b0;
				end
			else
				begin
					tmp1 <= data_in;
					data_out <= tmp1;
				end
		end

endmodule