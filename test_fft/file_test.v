module file_rw_tb();
	reg clk;
	reg rstn;
	
	reg [31:0]memh[0:31];
	reg [31:0]data;
	
	integer i;
	integer handle;
	
	initial
		begin
			clk = 0;
			rstn = 1;
			#50 rstn = 0;
			#100 rstn = 1;
			
			handle = $fopen("w_test.dat");
			$readmemh("test_fft/tb_data/sin_re_bin.dat", memh);
			
			for(i=0;i<32;i=i+1)
				begin
					$fdisplay(handle, "%b", memh[i]);
				end
			
			#800
			$finish
		end
	
	always #20 clk = ~clk;
	
endmodule