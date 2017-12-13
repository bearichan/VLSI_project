module twiddle_factor_gen(
							input clk,
							input rst,
							input [3:0]control_address,
							output reg [31:0]w_re,
							output reg [31:0]w_im
							);
							
	always @(control_address)
		begin
			//if(!rst)
			//	begin
			//		w_re <= 32'b0;
			//		w_im <= 32'b0;
			//	end
			//else
				begin
					case(control_address)
						4'd0:
							begin
								w_re <= 32'b00111111100000000000000000000000;
								w_im <= 32'b0;
							end
						4'd1:	
							begin
								w_re <= 32'b00111111011110110001010010111110;
								w_im <= 32'b10111110010001111100010111000010;
							end
						4'd2:	
							begin
								w_re <= 32'b00111111011011001000001101011110;
								w_im <= 32'b10111110110000111110111100010101;
							end
						4'd3:	
							begin
								w_re <= 32'b00111111010101001101101100110001;
								w_im <= 32'b10111111000011100011100111011010;
							end
						4'd4:
							begin
								w_re <= 32'b00111111001101010000010011110011;
								w_im <= 32'b10111111001101010000010011110011;
							end
						4'd5:	
							begin
								w_re <= 32'b00111111000011100011100111011010;
								w_im <= 32'b10111111010101001101101100110001;
							end
						4'd6:	
							begin
								w_re <= 32'b00111110110000111110111100010101;
								w_im <= 32'b10111111011011001000001101011110;
							end
						4'd7:	
							begin
								w_re <= 32'b00111110010001111100010111000010;
								w_im <= 32'b10111111011110110001010010111110;
							end
						4'd8:	
							begin
								w_re <= 32'b0;
								w_im <= 32'b10111111100000000000000000000000;
							end
						4'd9:	
							begin
								w_re <= 32'b10111110010001111100010111000010;
								w_im <= 32'b10111111011110110001010010111110;
							end
						4'd10:	
							begin
								w_re <= 32'b10111110110000111110111100010101;
								w_im <= 32'b10111111011011001000001101011110;
							end
						4'd11:	
							begin
								w_re <= 32'b10111111000011100011100111011010;
								w_im <= 32'b10111111010101001101101100110001;
							end
						4'd12:	
							begin
								w_re <= 32'b10111111001101010000010011110011;
								w_im <= 32'b10111111001101010000010011110011;
							end
						4'd13:	
							begin
								w_re <= 32'b10111111010101001101101100110001;
								w_im <= 32'b10111111000011100011100111011010;
							end
						4'd14:	
							begin
								w_re <= 32'b10111111011011001000001101011110;
								w_im <= 32'b10111110110000111110111100010101;
							end
						4'd15:	
							begin
								w_re <= 32'b10111111011110110001010010111110;
								w_im <= 32'b10111110010001111100010111000010;
							end
					endcase
				end
		end
		
endmodule