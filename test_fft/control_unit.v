module control_unit(
					input clk,
					input rst,
					output reg [3:0]control_address
					);
					
	always @(posedge clk)
		begin
			if(!rst)
				control_address <= 4'b1111;
			else
				control_address <= control_address + 1;
		end

endmodule