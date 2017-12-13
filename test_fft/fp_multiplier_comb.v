module fp_multiplier_comb(
						input [31:0]x,
						input [31:0]y,
						output reg [31:0]z
						);
	
	reg [25:0]x_true;
	reg [25:0]y_true;
	reg [7:0]x_expo;
	reg [7:0]y_expo;
	
	always @(x, y)
		begin
			x_true = {x[31], (x[30:23] == 8'b0) ? 2'b00 : 2'b01, x[22:0]};
			y_true = {y[31], (y[30:23] == 8'b0) ? 2'b00 : 2'b01, y[22:0]};
			x_expo = x[30:23];
			y_expo = y[30:23];
		end
		
	reg [25:0]x_true_after;
	reg [25:0]y_true_after;
	reg [7:0]x_expo_after;
	reg [7:0]y_expo_after;
	reg [7:0]expo_dif;
	
	always @(x_true, y_true, x_expo, y_expo)
		begin
			if(x_true[24:0] == 0 || y_true[24:0] == 0)
				begin
					x_true_after = x_true;
					y_true_after = y_true;
					x_expo_after = x_expo;
					y_expo_after = y_expo;
				end
			else if(x_expo >= y_expo)
				begin
					expo_dif = x_expo - y_expo;
					y_expo_after = x_expo;
					y_true_after[25] = y_true[25];
					y_true_after[24:0] = y_true[24:0] >> expo_dif;
					x_expo_after = x_expo;
					x_true_after = x_true;
				end
			else
				begin
					expo_dif = y_expo - x_expo;
					x_expo_after = y_expo;
					x_true_after[25] = x_true[25];
					x_true_after[24:0] = x_true[24:0] >> expo_dif;
					y_expo_after = y_expo;
					y_true_after = y_true;
				end
		end
	
	reg [7:0]z_expo;
	reg [25:0]z_true;
	reg [49:0]mult_tmp;
	
	always @(x_true_after, y_true_after, x_expo_after, y_expo_after)
		begin
			if(x_true_after[24:0] == 0 || y_true_after[24:0] == 0)
				begin
					z_expo = 8'b0;
					z_true = 26'b0;
				end
			else
				begin
					z_expo = x_expo_after + y_expo_after - 8'b01111111;
					z_true[25] = x_true_after[25] ^ y_true_after[25];
					mult_tmp = x_true_after[24:0] * y_true_after[24:0];
					z_true[24:0] = mult_tmp[47:23];
				end
		end
		
	reg [7:0]z_expo_after;
	reg [25:0]z_true_after;
	
	always @(z_expo, z_true)
		begin
			if(z_true[24:0] == 0)
				begin
					z_expo_after = 8'b0;
					z_true_after = 26'b0;
				end
			else if(z_true[24] == 1'b1)
				begin
					z_expo_after = z_expo + 1;
					z_true_after = {z_true[25], 1'b0, z_true[24:1]};
				end
			else if(z_true[23] == 1'b1)
				begin
					z_expo_after = z_expo;
					z_true_after = z_true;
				end
			else if(z_true[22] == 1'b1)
				begin
					z_expo_after = z_expo - 1;
					z_true_after = {z_true[25], z_true[23:0], 1'b0};
				end
			else if(z_true[21] == 1'b1)
				begin
					z_expo_after = z_expo - 2;
					z_true_after = {z_true[25], z_true[22:0], 2'b0};
				end
			else if(z_true[20] == 1'b1)
				begin
					z_expo_after = z_expo - 3;
					z_true_after = {z_true[25], z_true[21:0], 3'b0};
				end
			else if(z_true[19] == 1'b1)
				begin
					z_expo_after = z_expo - 4;
					z_true_after = {z_true[25], z_true[20:0], 4'b0};
				end
			else if(z_true[18] == 1'b1)
				begin
					z_expo_after = z_expo - 5;
					z_true_after = {z_true[25], z_true[19:0], 5'b0};
				end
			else if(z_true[17] == 1'b1)
				begin
					z_expo_after = z_expo - 6;
					z_true_after = {z_true[25], z_true[18:0], 6'b0};
				end
			else if(z_true[16] == 1'b1)
				begin
					z_expo_after = z_expo - 7;
					z_true_after = {z_true[25], z_true[17:0], 7'b0};
				end
			else if(z_true[15] == 1'b1)
				begin
					z_expo_after = z_expo - 8;
					z_true_after = {z_true[25], z_true[16:0], 8'b0};
				end
			else if(z_true[14] == 1'b1)
				begin
					z_expo_after = z_expo - 9;
					z_true_after = {z_true[25], z_true[15:0], 9'b0};
				end
			else if(z_true[13] == 1'b1)
				begin
					z_expo_after = z_expo - 10;
					z_true_after = {z_true[25], z_true[14:0], 10'b0};
				end
			else if(z_true[12] == 1'b1)
				begin
					z_expo_after = z_expo - 11;
					z_true_after = {z_true[25], z_true[13:0], 11'b0};
				end
			else if(z_true[11] == 1'b1)
				begin
					z_expo_after = z_expo - 12;
					z_true_after = {z_true[25], z_true[12:0], 12'b0};
				end
			else if(z_true[10] == 1'b1)
				begin
					z_expo_after = z_expo - 13;
					z_true_after = {z_true[25], z_true[11:0], 13'b0};
				end
			else if(z_true[9] == 1'b1)
				begin
					z_expo_after = z_expo - 14;
					z_true_after = {z_true[25], z_true[10:0], 14'b0};
				end
			else if(z_true[8] == 1'b1)
				begin
					z_expo_after = z_expo - 15;
					z_true_after = {z_true[25], z_true[9:0], 15'b0};
				end
			else if(z_true[7] == 1'b1)
				begin
					z_expo_after = z_expo - 16;
					z_true_after = {z_true[25], z_true[8:0], 16'b0};
				end
			else if(z_true[6] == 1'b1)
				begin
					z_expo_after = z_expo - 17;
					z_true_after = {z_true[25], z_true[7:0], 17'b0};
				end
			else if(z_true[5] == 1'b1)
				begin
					z_expo_after = z_expo - 18;
					z_true_after = {z_true[25], z_true[6:0], 18'b0};
				end
			else if(z_true[4] == 1'b1)
				begin
					z_expo_after = z_expo - 19;
					z_true_after = {z_true[25], z_true[5:0], 19'b0};
				end
			else if(z_true[3] == 1'b1)
				begin
					z_expo_after = z_expo - 20;
					z_true_after = {z_true[25], z_true[4:0], 20'b0};
				end
			else if(z_true[2] == 1'b1)
				begin
					z_expo_after = z_expo - 21;
					z_true_after = {z_true[25], z_true[3:0], 21'b0};
				end
			else if(z_true[1] == 1'b1)
				begin
					z_expo_after = z_expo - 22;
					z_true_after = {z_true[25], z_true[2:0], 22'b0};
				end
			else
				begin
					z_expo_after = z_expo - 23;
					z_true_after = {z_true[25], z_true[1:0], 23'b0};
				end
		end
	
	always @(z_expo_after, z_true_after)
		begin
			z = {z_true_after[25], z_expo_after, z_true_after[22:0]};
		end
	
endmodule