module butterfly_unit(
					input [31:0]a_re,
					input [31:0]a_im,
					input [31:0]b_re,
					input [31:0]b_im,
					input [31:0]w_re,
					input [31:0]w_im,
					output [31:0]a_o_re,
					output [31:0]a_o_im,
					output [31:0]b_o_re,
					output [31:0]b_o_im
					);
	
	fp_adder_comb adder01(
						.x(a_re),
						.y(b_re),
						.z(a_o_re)
						);
	
	fp_adder_comb adder02(
						.x(a_im),
						.y(b_im),
						.z(a_o_im)
						);
	
	wire [31:0]a_b_re_sub;
	wire [31:0]a_b_im_sub;
	fp_adder_comb adder03(
						.x(a_re),
						.y({~b_re[31], b_re[30:0]}),
						.z(a_b_re_sub)
						);
	
	fp_adder_comb adder04(
						.x(a_im),
						.y({~b_im[31], b_im[30:0]}),
						.z(a_b_im_sub)
						);
	
	
	wire [31:0]subre_wre_mul;
	wire [31:0]subim_wim_mul;
	wire [31:0]subre_wim_mul;
	wire [31:0]subim_wre_mul;
	fp_multiplier_comb mul01(
							.x(a_b_re_sub),
							.y(w_re),
							.z(subre_wre_mul)
							);
	
	fp_multiplier_comb mul02(
							.x(a_b_im_sub),
							.y(w_im),
							.z(subim_wim_mul)
							);
	
	fp_multiplier_comb mul03(
							.x(a_b_re_sub),
							.y(w_im),
							.z(subre_wim_mul)
							);
	
	fp_multiplier_comb mul04(
							.x(a_b_im_sub),
							.y(w_re),
							.z(subim_wre_mul)
							);
	
	fp_adder_comb adder05(
						.x(subre_wre_mul),
						.y({~subim_wim_mul[31], subim_wim_mul[30:0]}),
						.z(b_o_re)
						);
	
	fp_adder_comb adder06(
						.x(subre_wim_mul),
						.y(subim_wre_mul),
						.z(b_o_im)
						);
	
endmodule