module switch1(
				input [3:0]count,
				input [31:0]first_line_in,
				input [31:0]second_line_in,
				output [31:0]first_line_out,
				output [31:0]second_line_out
				);
	
	assign first_line_out = (count == 1) ? second_line_in : first_line_in;
	assign second_line_out = (count == 1) ? first_line_in : second_line_in;

endmodule