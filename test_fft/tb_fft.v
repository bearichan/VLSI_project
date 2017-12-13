module tb_fft();
	reg clk;
	reg rst;
	reg [31:0]data_in_re;
	reg [31:0]data_in_im;
	reg din_valid;
	wire [31:0]data_out_re;
	wire [31:0]data_out_im;
	wire dout_valid;
	
	reg [31:0]mem_sin[0:31];
	reg [31:0]mem_dc[0:31];
	reg [31:0]mem_noise[0:31];
	reg [31:0]mem_sn[0:31];
	
	integer i;
	integer handle_sin_re;
	integer handle_sin_im;
	integer handle_dc_re;
	integer handle_dc_im;
	integer handle_noise_re;
	integer handle_noise_im;
	integer handle_sn_re;
	integer handle_sn_im;
	
	top_fft DUT(
				.clk_in(clk),
				.rst(rst),
				.data_in_re(data_in_re),
				.data_in_im(data_in_im),
				.din_valid(din_valid),
				.data_out_re(data_out_re),
				.data_out_im(data_out_im),
				.dout_valid(dout_valid)
				);
	
	always #20 clk = ~clk;
	
	initial
		begin
			$readmemh("tb_data/sin_re_bin.dat", mem_sin);
			$readmemh("tb_data/dc_re_bin.dat", mem_dc);
			$readmemh("tb_data/noise_re_bin.dat", mem_noise);
			$readmemh("tb_data/sn_re_bin.dat", mem_sn);
			
			handle_sin_re = $fopen("tb_data/sim_result/sin_sim_result_re_bin.dat", "w");
			handle_sin_im = $fopen("tb_data/sim_result/sin_sim_result_im_bin.dat", "w");
			handle_dc_re = $fopen("tb_data/sim_result/dc_sim_result_re_bin.dat", "w");
			handle_dc_im = $fopen("tb_data/sim_result/dc_sim_result_im_bin.dat", "w");
			handle_noise_re = $fopen("tb_data/sim_result/noise_sim_result_re_bin.dat", "w");
			handle_noise_im = $fopen("tb_data/sim_result/noise_sim_result_im_bin.dat", "w");
			handle_sn_re = $fopen("tb_data/sim_result/sn_sim_result_re_bin.dat", "w");
			handle_sn_im = $fopen("tb_data/sim_result/sn_sim_result_im_bin.dat", "w");
			
			clk = 0;
			rst = 0;
			din_valid = 0;
			data_in_re = 32'b0;
			data_in_im = 32'b0;
			
			#80
			rst = 1;
			din_valid = 1;
			for(i=0;i<32;i=i+1)
				begin
					data_in_re = mem_sin[i];
					data_in_im = 32'b0;
					#40;
				end
				
			for(i=0;i<32;i=i+1)
				begin
					data_in_re = mem_dc[i];
					data_in_im = 32'b0;
					#40;
				end
			
			for(i=0;i<32;i=i+1)
				begin
					data_in_re = mem_noise[i];
					data_in_im = 32'b0;
					#40;
				end
			
			for(i=0;i<32;i=i+1)
				begin
					data_in_re = mem_sn[i];
					data_in_im = 32'b0;
					#40;
				end
			
			#3000;
			$fclose(handle_sin_re);
			$fclose(handle_sin_im);
			$fclose(handle_dc_re);
			$fclose(handle_dc_im);
			$fclose(handle_noise_re);
			$fclose(handle_noise_im);
			$fclose(handle_sn_re);
			$fclose(handle_sn_im);
			$stop;
		end
	
	initial
		begin
			repeat(66) @(posedge clk);
			repeat(32) @(posedge clk)	begin
											$fdisplay(handle_sin_re, "%h", data_out_re);
											$fdisplay(handle_sin_im, "%h", data_out_im);
										end
			repeat(32) @(posedge clk)	
										begin
											$fdisplay(handle_dc_re, "%h", data_out_re);
											$fdisplay(handle_dc_im, "%h", data_out_im);
										end
			repeat(32) @(posedge clk)	
										begin
											$fdisplay(handle_noise_re, "%h", data_out_re);
											$fdisplay(handle_noise_im, "%h", data_out_im);
										end
			repeat(32) @(posedge clk)	
										begin
											$fdisplay(handle_sn_re, "%h", data_out_re);
											$fdisplay(handle_sn_im, "%h", data_out_im);
										end
		end
	
endmodule