module clk_unit(
				input clk_in,
				input rst,
				output clk_out,
				output clk_out_slow
				);
	
	reg clk_slow_reg;
	assign clk_out = (rst == 1) ? clk_in : 1'b0;
	assign clk_out_slow = (rst == 1) ? clk_slow_reg : clk_in;
	
	always @(posedge clk_in)
		begin
			if(!rst)
				clk_slow_reg <= 1'b0;
			else
				clk_slow_reg <= ~clk_slow_reg;
		end

endmodule