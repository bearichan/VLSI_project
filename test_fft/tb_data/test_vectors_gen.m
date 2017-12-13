%sin
fileID = fopen('sin_re_bin.dat', 'wt');
fileID1 = fopen('sin.dat', 'wt');
fileID2 = fopen('sin_im_bin.dat', 'wt');
fileID3 = fopen('sin_result_re.dat', 'wt');
fileID4 = fopen('sin_result_im.dat', 'wt');
fileID5 = fopen('sin_result_re_bin.dat', 'wt');
fileID6 = fopen('sin_result_im_bin.dat', 'wt');
x = 0:4*pi/31:4*pi;
sin_y = sin(x);
sin_re = dec2hex(typecast(single(sin_y),'uint32'),8);
sin_y_fft = fft(sin_y, 32);
sin_y_fft_re = real(sin_y_fft);
sin_y_fft_re_bin = dec2hex(typecast(single(sin_y_fft_re),'uint32'),8);
sin_y_fft_im = imag(sin_y_fft);
sin_y_fft_im_bin = dec2hex(typecast(single(sin_y_fft_im),'uint32'),8);
for i=1:32
    fprintf(fileID, '%s\n', sin_re(i,:));
    fprintf(fileID1, '%f\n', sin_y(1,i));
    fprintf(fileID2, '%s\n', dec2hex(typecast(single(0),'uint32'),8));
    fprintf(fileID3, '%f\n', sin_y_fft_re(1,i));
    fprintf(fileID4, '%f\n', sin_y_fft_im(1,i));
    fprintf(fileID5, '%s\n', sin_y_fft_re_bin(i,:));
    fprintf(fileID6, '%s\n', sin_y_fft_im_bin(i,:));
end
fclose(fileID);
fclose(fileID1);
fclose(fileID2);
fclose(fileID3);
fclose(fileID4);
fclose(fileID5);
fclose(fileID6);

%dc
fileID = fopen('dc_re_bin.dat', 'wt');
fileID1 = fopen('dc.dat', 'wt');
fileID2 = fopen('dc_im_bin.dat', 'wt');
fileID3 = fopen('dc_result_re.dat', 'wt');
fileID4 = fopen('dc_result_im.dat', 'wt');
fileID5 = fopen('dc_result_re_bin.dat', 'wt');
fileID6 = fopen('dc_result_im_bin.dat', 'wt');
for i=1:32
    dc_y(1, i) = 1;
end
dc_re = dec2hex(typecast(single(dc_y),'uint32'),8);
dc_y_fft = fft(dc_y, 32);
dc_y_fft_re = real(dc_y_fft);
dc_y_fft_re_bin = dec2hex(typecast(single(dc_y_fft_re),'uint32'),8);
dc_y_fft_im = imag(dc_y_fft);
dc_y_fft_im_bin = dec2hex(typecast(single(dc_y_fft_im),'uint32'),8);
for i=1:32
    fprintf(fileID, '%s\n', dc_re(i,:));
    fprintf(fileID1, '%f\n', dc_y(1,i));
    fprintf(fileID2, '%s\n', dec2hex(typecast(single(0),'uint32'),8));
    fprintf(fileID3, '%f\n', dc_y_fft_re(1,i));
    fprintf(fileID4, '%f\n', dc_y_fft_im(1,i));
    fprintf(fileID5, '%s\n', dc_y_fft_re_bin(i,:));
    fprintf(fileID6, '%s\n', dc_y_fft_im_bin(i,:));
end
fclose(fileID);
fclose(fileID1);
fclose(fileID2);
fclose(fileID3);
fclose(fileID4);
fclose(fileID5);
fclose(fileID6);

%noise
fileID = fopen('noise_re_bin.dat', 'wt');
fileID1 = fopen('noise.dat', 'wt');
fileID2 = fopen('noise_im_bin.dat', 'wt');
fileID3 = fopen('noise_result_re.dat', 'wt');
fileID4 = fopen('noise_result_im.dat', 'wt');
fileID5 = fopen('noise_result_re_bin.dat', 'wt');
fileID6 = fopen('noise_result_im_bin.dat', 'wt');
noise_y = -3 + 6*rand(1, 32);
noise_re = dec2hex(typecast(single(noise_y),'uint32'),8);
noise_y_fft = fft(noise_y, 32);
noise_y_fft_re = real(noise_y_fft);
noise_y_fft_re_bin = dec2hex(typecast(single(noise_y_fft_re),'uint32'),8);
noise_y_fft_im = imag(noise_y_fft);
noise_y_fft_im_bin = dec2hex(typecast(single(noise_y_fft_im),'uint32'),8);
for i=1:32
    fprintf(fileID, '%s\n', noise_re(i,:));
    fprintf(fileID1, '%f\n', noise_y(1, i));
    fprintf(fileID2, '%s\n', dec2hex(typecast(single(0),'uint32'),8));
    fprintf(fileID3, '%f\n', noise_y_fft_re(1,i));
    fprintf(fileID4, '%f\n', noise_y_fft_im(1,i));
    fprintf(fileID5, '%s\n', noise_y_fft_re_bin(i,:));
    fprintf(fileID6, '%s\n', noise_y_fft_im_bin(i,:));
end
fclose(fileID);
fclose(fileID1);
fclose(fileID2);
fclose(fileID3);
fclose(fileID4);
fclose(fileID5);
fclose(fileID6);

%sin+noise
fileID = fopen('sn_re_bin.dat', 'wt');
fileID1 = fopen('sn.dat', 'wt');
fileID2 = fopen('sn_im_bin.dat', 'wt');
fileID3 = fopen('sn_result_re.dat', 'wt');
fileID4 = fopen('sn_result_im.dat', 'wt');
fileID5 = fopen('sn_result_re_bin.dat', 'wt');
fileID6 = fopen('sn_result_im_bin.dat', 'wt');
clear x;
x = 0:4*pi/31:4*pi;
sin_y = sin(x);
sn_y = sin_y + 0.2*rand(1, 32);
sn_re = dec2hex(typecast(single(sn_y),'uint32'),8);
sn_y_fft = fft(sn_y, 32);
sn_y_fft_re = real(sn_y_fft);
sn_y_fft_im = imag(sn_y_fft);
sn_y_fft_re_bin = dec2hex(typecast(single(sn_y_fft_re),'uint32'),8);
sn_y_fft_im_bin = dec2hex(typecast(single(sn_y_fft_im),'uint32'),8);
for i=1:32
    fprintf(fileID, '%s\n', sn_re(i,:));
    fprintf(fileID1, '%f\n', sn_y(1,i));
    fprintf(fileID2, '%s\n', dec2hex(typecast(single(0),'uint32'),8));
    fprintf(fileID3, '%f\n', sn_y_fft_re(1,i));
    fprintf(fileID4, '%f\n', sn_y_fft_im(1,i));
    fprintf(fileID5, '%s\n', sn_y_fft_re_bin(i,:));
    fprintf(fileID6, '%s\n', sn_y_fft_im_bin(i,:));
end
fclose(fileID);
fclose(fileID1);
fclose(fileID2);
fclose(fileID3);
fclose(fileID4);
fclose(fileID5);
fclose(fileID6);
