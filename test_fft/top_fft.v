module top_fft(
				input clk_in,
				input rst,
				input [31:0]data_in_re,
				input [31:0]data_in_im,
				input din_valid,
				output [31:0]data_out_re,
				output [31:0]data_out_im,
				output dout_valid
				);
	
	wire clk_quick, clk_slow;
	wire [3:0]control_address;
	
	clk_unit clk_unit_0(
						.clk_in(clk_in),
						.rst(rst),
						.clk_out(clk_quick),
						.clk_out_slow(clk_slow)
						);
	
	control_unit control_unit_0(
								.clk(clk_slow),
								.rst(rst),
								.control_address(control_address)
								);
	
	wire [31:0]input_stage_out_first_re;
	wire [31:0]input_stage_out_first_im;
	wire [31:0]input_stage_out_second_re;
	wire [31:0]input_stage_out_second_im;
	
	input_unit input_unit_0(
							.clk(clk_in),
							.clk_slow(clk_slow),
							.rst(rst),
							.din_valid(din_valid),
							.data_in_re(data_in_re),
							.data_in_im(data_in_im),
							.data_out_first_re(input_stage_out_first_re),
							.data_out_first_im(input_stage_out_first_im),
							.data_out_second_re(input_stage_out_second_re),
							.data_out_second_im(input_stage_out_second_im)
							);
	
	wire [31:0]w_s1_re;
	wire [31:0]w_s1_im;
	wire [31:0]s1_out_first_re;
	wire [31:0]s1_out_first_im;
	wire [31:0]s1_out_second_re;
	wire [31:0]s1_out_second_im;
	
	twiddle_factor_gen tf_gen_s1(
								.clk(clk_slow),
								.rst(rst),
								.control_address(control_address),
								.w_re(w_s1_re),
								.w_im(w_s1_im)
								);
	
	butterfly_unit bu_s1(
						.a_re(input_stage_out_first_re),
						.a_im(input_stage_out_first_im),
						.b_re(input_stage_out_second_re),
						.b_im(input_stage_out_second_im),
						.w_re(w_s1_re),
						.w_im(w_s1_im),
						.a_o_re(s1_out_first_re),
						.a_o_im(s1_out_first_im),
						.b_o_re(s1_out_second_re),
						.b_o_im(s1_out_second_im)
						);
						
	wire [31:0]delay8_1_out_re;
	wire [31:0]delay8_1_out_im;
	wire [31:0]sw8_out_first_re;
	wire [31:0]sw8_out_first_im;
	wire [31:0]sw8_out_second_re;
	wire [31:0]sw8_out_second_im;
	wire [31:0]delay8_2_out_re;
	wire [31:0]delay8_2_out_im;
	
	delay8 delay8_1_re(
					.clk(clk_slow),
					.rst(rst),
					.data_in(s1_out_second_re),
					.data_out(delay8_1_out_re)
					);
	
	delay8 delay8_1_im(
					.clk(clk_slow),
					.rst(rst),
					.data_in(s1_out_second_im),
					.data_out(delay8_1_out_im)
					);
	
	switch8 s8_re(
				.count(control_address),
				.first_line_in(s1_out_first_re),
				.second_line_in(delay8_1_out_re),
				.first_line_out(sw8_out_first_re),
				.second_line_out(sw8_out_second_re)
				);
	
	switch8 s8_im(
				.count(control_address),
				.first_line_in(s1_out_first_im),
				.second_line_in(delay8_1_out_im),
				.first_line_out(sw8_out_first_im),
				.second_line_out(sw8_out_second_im)
				);
	
	delay8 delay8_2_re(
					.clk(clk_slow),
					.rst(rst),
					.data_in(sw8_out_first_re),
					.data_out(delay8_2_out_re)
					);
	
	delay8 delay8_2_im(
					.clk(clk_slow),
					.rst(rst),
					.data_in(sw8_out_first_im),
					.data_out(delay8_2_out_im)
					);
	
	wire [31:0]w_s2_re;
	wire [31:0]w_s2_im;
	wire [31:0]s2_out_first_re;
	wire [31:0]s2_out_first_im;
	wire [31:0]s2_out_second_re;
	wire [31:0]s2_out_second_im;
	
	twiddle_factor_gen tf_gen_s2(
								.clk(clk_slow),
								.rst(rst),
								.control_address({control_address[2:0], 1'b0}),
								.w_re(w_s2_re),
								.w_im(w_s2_im)
								);
	
	butterfly_unit bu_s2(
						.a_re(delay8_2_out_re),
						.a_im(delay8_2_out_im),
						.b_re(sw8_out_second_re),
						.b_im(sw8_out_second_im),
						.w_re(w_s2_re),
						.w_im(w_s2_im),
						.a_o_re(s2_out_first_re),
						.a_o_im(s2_out_first_im),
						.b_o_re(s2_out_second_re),
						.b_o_im(s2_out_second_im)
						);
	
	wire [31:0]delay4_1_out_re;
	wire [31:0]delay4_1_out_im;
	wire [31:0]sw4_out_first_re;
	wire [31:0]sw4_out_first_im;
	wire [31:0]sw4_out_second_re;
	wire [31:0]sw4_out_second_im;
	wire [31:0]delay4_2_out_re;
	wire [31:0]delay4_2_out_im;
	
	delay4 delay4_1_re(
					.clk(clk_slow),
					.rst(rst),
					.data_in(s2_out_second_re),
					.data_out(delay4_1_out_re)
					);
	
	delay4 delay4_1_im(
					.clk(clk_slow),
					.rst(rst),
					.data_in(s2_out_second_im),
					.data_out(delay4_1_out_im)
					);
	
	switch4 s4_re(
				.count({1'b0, control_address[2:0]}),
				.first_line_in(s2_out_first_re),
				.second_line_in(delay4_1_out_re),
				.first_line_out(sw4_out_first_re),
				.second_line_out(sw4_out_second_re)
				);
	
	switch4 s4_im(
				.count({1'b0, control_address[2:0]}),
				.first_line_in(s2_out_first_im),
				.second_line_in(delay4_1_out_im),
				.first_line_out(sw4_out_first_im),
				.second_line_out(sw4_out_second_im)
				);
	
	delay4 delay4_2_re(
					.clk(clk_slow),
					.rst(rst),
					.data_in(sw4_out_first_re),
					.data_out(delay4_2_out_re)
					);
	
	delay4 delay4_2_im(
					.clk(clk_slow),
					.rst(rst),
					.data_in(sw4_out_first_im),
					.data_out(delay4_2_out_im)
					);
	
	wire [31:0]w_s3_re;
	wire [31:0]w_s3_im;
	wire [31:0]s3_out_first_re;
	wire [31:0]s3_out_first_im;
	wire [31:0]s3_out_second_re;
	wire [31:0]s3_out_second_im;
	
	twiddle_factor_gen tf_gen_s3(
								.clk(clk_slow),
								.rst(rst),
								.control_address({control_address[1:0], 2'b0}),
								.w_re(w_s3_re),
								.w_im(w_s3_im)
								);
	
	butterfly_unit bu_s3(
						.a_re(delay4_2_out_re),
						.a_im(delay4_2_out_im),
						.b_re(sw4_out_second_re),
						.b_im(sw4_out_second_im),
						.w_re(w_s3_re),
						.w_im(w_s3_im),
						.a_o_re(s3_out_first_re),
						.a_o_im(s3_out_first_im),
						.b_o_re(s3_out_second_re),
						.b_o_im(s3_out_second_im)
						);
						
	wire [31:0]delay2_1_out_re;
	wire [31:0]delay2_1_out_im;
	wire [31:0]sw2_out_first_re;
	wire [31:0]sw2_out_first_im;
	wire [31:0]sw2_out_second_re;
	wire [31:0]sw2_out_second_im;
	wire [31:0]delay2_2_out_re;
	wire [31:0]delay2_2_out_im;
	
	delay2 delay2_1_re(
					.clk(clk_slow),
					.rst(rst),
					.data_in(s3_out_second_re),
					.data_out(delay2_1_out_re)
					);
	
	delay2 delay2_1_im(
					.clk(clk_slow),
					.rst(rst),
					.data_in(s3_out_second_im),
					.data_out(delay2_1_out_im)
					);
	
	switch2 s2_re(
				.count({2'b0, control_address[1:0]}),
				.first_line_in(s3_out_first_re),
				.second_line_in(delay2_1_out_re),
				.first_line_out(sw2_out_first_re),
				.second_line_out(sw2_out_second_re)
				);
	
	switch2 s2_im(
				.count({2'b0, control_address[1:0]}),
				.first_line_in(s3_out_first_im),
				.second_line_in(delay2_1_out_im),
				.first_line_out(sw2_out_first_im),
				.second_line_out(sw2_out_second_im)
				);
	
	delay2 delay2_2_re(
					.clk(clk_slow),
					.rst(rst),
					.data_in(sw2_out_first_re),
					.data_out(delay2_2_out_re)
					);
	
	delay2 delay2_2_im(
					.clk(clk_slow),
					.rst(rst),
					.data_in(sw2_out_first_im),
					.data_out(delay2_2_out_im)
					);
	
	wire [31:0]w_s4_re;
	wire [31:0]w_s4_im;
	wire [31:0]s4_out_first_re;
	wire [31:0]s4_out_first_im;
	wire [31:0]s4_out_second_re;
	wire [31:0]s4_out_second_im;
	
	twiddle_factor_gen tf_gen_s4(
								.clk(clk_slow),
								.rst(rst),
								.control_address({control_address[0], 3'b0}),
								.w_re(w_s4_re),
								.w_im(w_s4_im)
								);
	
	butterfly_unit bu_s4(
						.a_re(delay2_2_out_re),
						.a_im(delay2_2_out_im),
						.b_re(sw2_out_second_re),
						.b_im(sw2_out_second_im),
						.w_re(w_s4_re),
						.w_im(w_s4_im),
						.a_o_re(s4_out_first_re),
						.a_o_im(s4_out_first_im),
						.b_o_re(s4_out_second_re),
						.b_o_im(s4_out_second_im)
						);
						
	wire [31:0]delay1_1_out_re;
	wire [31:0]delay1_1_out_im;
	wire [31:0]sw1_out_first_re;
	wire [31:0]sw1_out_first_im;
	wire [31:0]sw1_out_second_re;
	wire [31:0]sw1_out_second_im;
	wire [31:0]delay1_2_out_re;
	wire [31:0]delay1_2_out_im;
	
	delay1 delay1_1_re(
					.clk(clk_slow),
					.rst(rst),
					.data_in(s4_out_second_re),
					.data_out(delay1_1_out_re)
					);
	
	delay1 delay1_1_im(
					.clk(clk_slow),
					.rst(rst),
					.data_in(s4_out_second_im),
					.data_out(delay1_1_out_im)
					);
	
	switch1 s1_re(
				.count({3'b0, control_address[0]}),
				.first_line_in(s4_out_first_re),
				.second_line_in(delay1_1_out_re),
				.first_line_out(sw1_out_first_re),
				.second_line_out(sw1_out_second_re)
				);
	
	switch1 s1_im(
				.count({3'b0, control_address[0]}),
				.first_line_in(s4_out_first_im),
				.second_line_in(delay1_1_out_im),
				.first_line_out(sw1_out_first_im),
				.second_line_out(sw1_out_second_im)
				);
	
	delay1 delay1_2_re(
					.clk(clk_slow),
					.rst(rst),
					.data_in(sw1_out_first_re),
					.data_out(delay1_2_out_re)
					);
	
	delay1 delay1_2_im(
					.clk(clk_slow),
					.rst(rst),
					.data_in(sw1_out_first_im),
					.data_out(delay1_2_out_im)
					);
					
	wire [31:0]w_s5_re;
	wire [31:0]w_s5_im;
	wire [31:0]s5_out_first_re;
	wire [31:0]s5_out_first_im;
	wire [31:0]s5_out_second_re;
	wire [31:0]s5_out_second_im;
	
	twiddle_factor_gen tf_gen_s5(
								.clk(clk_slow),
								.rst(rst),
								.control_address(4'b0),
								.w_re(w_s5_re),
								.w_im(w_s5_im)
								);
	
	butterfly_unit bu_s5(
						.a_re(delay1_2_out_re),
						.a_im(delay1_2_out_im),
						.b_re(sw1_out_second_re),
						.b_im(sw1_out_second_im),
						.w_re(w_s5_re),
						.w_im(w_s5_im),
						.a_o_re(s5_out_first_re),
						.a_o_im(s5_out_first_im),
						.b_o_re(s5_out_second_re),
						.b_o_im(s5_out_second_im)
						);
	
	output_unit output_unit_0(
								.clk(clk_in),
								.rst(rst),
								.data_in_first_re(s5_out_first_re),
								.data_in_first_im(s5_out_first_im),
								.data_in_second_re(s5_out_second_re),
								.data_in_second_im(s5_out_second_im),
								.data_out_re(data_out_re),
								.data_out_im(data_out_im),
								.dout_valid(dout_valid)
								);

endmodule