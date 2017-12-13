x = 0:4*pi/31:4*pi;
sin_y_re = sin(x);
for i=1:32
    sin_y_im(1,i) = 0;
    W_re(1, i) = cos(-pi*(i-1)/16);
    W_im(1, i) = sin(-pi*(i-1)/16);
end

%stage 1 out
for i=1:16
    stage_1_o_first_re(1,i) = sin_y_re(1,i) + sin_y_re(1,i+16);
    stage_1_o_first_im(1,i) = sin_y_im(1,i) + sin_y_im(1,i+16);
    stage_1_o_second_re(1,i) = (sin_y_re(1,i)-sin_y_re(1,i+16))*W_re(1,i)-(sin_y_im(1,i)-sin_y_im(1,i+16))*W_im(1,i);
    stage_1_o_second_im(1,i) = (sin_y_im(1,i)-sin_y_im(1,i+16))*W_re(1,i)+(sin_y_re(1,i)-sin_y_re(1,i+16))*W_im(1,i);
end

%stage 2 in
for i=1:8
    stage_2_i_first_re(1,i) = stage_1_o_first_re(1,i);
    stage_2_i_first_im(1,i) = stage_1_o_first_im(1,i);
    stage_2_i_second_re(1,i) = stage_1_o_first_re(1,i+8);
    stage_2_i_second_im(1,i) = stage_1_o_first_im(1,i+8);
end
for i=1:8
    stage_2_i_first_re(1,i+8) = stage_1_o_second_re(1,i);
    stage_2_i_first_im(1,i+8) = stage_1_o_second_im(1,i);
    stage_2_i_second_re(1,i+8) = stage_1_o_second_re(1,i+8);
    stage_2_i_second_im(1,i+8) = stage_1_o_second_im(1,i+8);
end

%stage 2 out
for i=1:8
    stage_2_o_first_re(1,i) = stage_2_i_first_re(1,i)+stage_2_i_second_re(1,i);
    stage_2_o_first_im(1,i) = stage_2_i_first_im(1,i)+stage_2_i_second_im(1,i);
    stage_2_o_second_re(1,i) = (stage_2_i_first_re(1,i)-stage_2_i_second_re(1,i))*W_re(1,2*i-1)-(stage_2_i_first_im(1,i)-stage_2_i_second_im(1,i))*W_im(1,2*i-1);
    stage_2_o_second_im(1,i) = (stage_2_i_first_re(1,i)-stage_2_i_second_re(1,i))*W_im(1,2*i-1)+(stage_2_i_first_im(1,i)-stage_2_i_second_im(1,i))*W_re(1,2*i-1);
end
for i=1:8
    stage_2_o_first_re(1,i+8) = stage_2_i_first_re(1,i+8)+stage_2_i_second_re(1,i+8);
    stage_2_o_first_im(1,i+8) = stage_2_i_first_im(1,i+8)+stage_2_i_second_im(1,i+8);
    stage_2_o_second_re(1,i+8) = (stage_2_i_first_re(1,i+8)-stage_2_i_second_re(1,i+8))*W_re(1,2*i-1)-(stage_2_i_first_im(1,i+8)-stage_2_i_second_im(1,i+8))*W_im(1,2*i-1);
    stage_2_o_second_im(1,i+8) = (stage_2_i_first_re(1,i+8)-stage_2_i_second_re(1,i+8))*W_im(1,2*i-1)+(stage_2_i_first_im(1,i+8)-stage_2_i_second_im(1,i+8))*W_re(1,2*i-1);
end

%stage 3 in
for i=1:4
    stage_3_i_first_re(1,i) = stage_2_o_first_re(1,i);
    stage_3_i_first_im(1,i) = stage_2_o_first_im(1,i);
    stage_3_i_second_re(1,i) = stage_2_o_first_re(1,i+4);
    stage_3_i_second_im(1,i) = stage_2_o_first_im(1,i+4);
end
for i=1:4
    stage_3_i_first_re(1,i+4) = stage_2_o_second_re(1,i);
    stage_3_i_first_im(1,i+4) = stage_2_o_second_im(1,i);
    stage_3_i_second_re(1,i+4) = stage_2_o_second_re(1,i+4);
    stage_3_i_second_im(1,i+4) = stage_2_o_second_im(1,i+4);
end
for i=1:4
    stage_3_i_first_re(1,i+8) = stage_2_o_first_re(1,i+8);
    stage_3_i_first_im(1,i+8) = stage_2_o_first_im(1,i+8);
    stage_3_i_second_re(1,i+8) = stage_2_o_first_re(1,i+12);
    stage_3_i_second_im(1,i+8) = stage_2_o_first_im(1,i+12);
end
for i=1:4
    stage_3_i_first_re(1,i+12) = stage_2_o_second_re(1,i+8);
    stage_3_i_first_im(1,i+12) = stage_2_o_second_im(1,i+8);
    stage_3_i_second_re(1,i+12) = stage_2_o_second_re(1,i+12);
    stage_3_i_second_im(1,i+12) = stage_2_o_second_im(1,i+12);
end

%stage 3 output
for i=1:4
    stage_3_o_first_re(1,i) = stage_3_i_first_re(1,i)+stage_3_i_second_re(1,i);
    stage_3_o_first_im(1,i) = stage_3_i_first_im(1,i)+stage_3_i_second_im(1,i);
    stage_3_o_second_re(1,i) = (stage_3_i_first_re(1,i)-stage_3_i_second_re(1,i))*W_re(1,4*i-3)-(stage_3_i_first_im(1,i)-stage_3_i_second_im(1,i))*W_im(1,4*i-3);
    stage_3_o_second_im(1,i) = (stage_3_i_first_re(1,i)-stage_3_i_second_re(1,i))*W_im(1,4*i-3)+(stage_3_i_first_im(1,i)-stage_3_i_second_im(1,i))*W_re(1,4*i-3);
end
for i=1:4
    stage_3_o_first_re(1,i+4) = stage_3_i_first_re(1,i+4)+stage_3_i_second_re(1,i+4);
    stage_3_o_first_im(1,i+4) = stage_3_i_first_im(1,i+4)+stage_3_i_second_im(1,i+4);
    stage_3_o_second_re(1,i+4) = (stage_3_i_first_re(1,i+4)-stage_3_i_second_re(1,i+4))*W_re(1,4*i-3)-(stage_3_i_first_im(1,i+4)-stage_3_i_second_im(1,i+4))*W_im(1,4*i-3);
    stage_3_o_second_im(1,i+4) = (stage_3_i_first_re(1,i+4)-stage_3_i_second_re(1,i+4))*W_im(1,4*i-3)+(stage_3_i_first_im(1,i+4)-stage_3_i_second_im(1,i+4))*W_re(1,4*i-3);
end
for i=1:4
    stage_3_o_first_re(1,i+8) = stage_3_i_first_re(1,i+8)+stage_3_i_second_re(1,i+8);
    stage_3_o_first_im(1,i+8) = stage_3_i_first_im(1,i+8)+stage_3_i_second_im(1,i+8);
    stage_3_o_second_re(1,i+8) = (stage_3_i_first_re(1,i+8)-stage_3_i_second_re(1,i+8))*W_re(1,4*i-3)-(stage_3_i_first_im(1,i+8)-stage_3_i_second_im(1,i+8))*W_im(1,4*i-3);
    stage_3_o_second_im(1,i+8) = (stage_3_i_first_re(1,i+8)-stage_3_i_second_re(1,i+8))*W_im(1,4*i-3)+(stage_3_i_first_im(1,i+8)-stage_3_i_second_im(1,i+8))*W_re(1,4*i-3);
end
for i=1:4
    stage_3_o_first_re(1,i+12) = stage_3_i_first_re(1,i+12)+stage_3_i_second_re(1,i+12);
    stage_3_o_first_im(1,i+12) = stage_3_i_first_im(1,i+12)+stage_3_i_second_im(1,i+12);
    stage_3_o_second_re(1,i+12) = (stage_3_i_first_re(1,i+12)-stage_3_i_second_re(1,i+12))*W_re(1,4*i-3)-(stage_3_i_first_im(1,i+12)-stage_3_i_second_im(1,i+12))*W_im(1,4*i-3);
    stage_3_o_second_im(1,i+12) = (stage_3_i_first_re(1,i+12)-stage_3_i_second_re(1,i+12))*W_im(1,4*i-3)+(stage_3_i_first_im(1,i+12)-stage_3_i_second_im(1,i+12))*W_re(1,4*i-3);
end

%stage 4 input
for i=1:2
    stage_4_i_first_re(1,i) = stage_3_o_first_re(1,i);
    stage_4_i_first_im(1,i) = stage_3_o_first_im(1,i);
    stage_4_i_second_re(1,i) = stage_3_o_first_re(1,i+2);
    stage_4_i_second_im(1,i) = stage_3_o_first_im(1,i+2);
end
for i=1:2
    stage_4_i_first_re(1,i+2) = stage_3_o_second_re(1,i);
    stage_4_i_first_im(1,i+2) = stage_3_o_second_im(1,i);
    stage_4_i_second_re(1,i+2) = stage_3_o_second_re(1,i+2);
    stage_4_i_second_im(1,i+2) = stage_3_o_second_im(1,i+2);
end
for i=1:2
    stage_4_i_first_re(1,i+4) = stage_3_o_first_re(1,i+4);
    stage_4_i_first_im(1,i+4) = stage_3_o_first_im(1,i+4);
    stage_4_i_second_re(1,i+4) = stage_3_o_first_re(1,i+6);
    stage_4_i_second_im(1,i+4) = stage_3_o_first_im(1,i+6);
end
for i=1:2
    stage_4_i_first_re(1,i+6) = stage_3_o_second_re(1,i+4);
    stage_4_i_first_im(1,i+6) = stage_3_o_second_im(1,i+4);
    stage_4_i_second_re(1,i+6) = stage_3_o_second_re(1,i+6);
    stage_4_i_second_im(1,i+6) = stage_3_o_second_im(1,i+6);
end
for i=1:2
    stage_4_i_first_re(1,i+8) = stage_3_o_first_re(1,i+8);
    stage_4_i_first_im(1,i+8) = stage_3_o_first_im(1,i+8);
    stage_4_i_second_re(1,i+8) = stage_3_o_first_re(1,i+10);
    stage_4_i_second_im(1,i+8) = stage_3_o_first_im(1,i+10);
end
for i=1:2
    stage_4_i_first_re(1,i+10) = stage_3_o_second_re(1,i+8);
    stage_4_i_first_im(1,i+10) = stage_3_o_second_im(1,i+8);
    stage_4_i_second_re(1,i+10) = stage_3_o_second_re(1,i+10);
    stage_4_i_second_im(1,i+10) = stage_3_o_second_im(1,i+10);
end
for i=1:2
    stage_4_i_first_re(1,i+12) = stage_3_o_first_re(1,i+12);
    stage_4_i_first_im(1,i+12) = stage_3_o_first_im(1,i+12);
    stage_4_i_second_re(1,i+12) = stage_3_o_first_re(1,i+14);
    stage_4_i_second_im(1,i+12) = stage_3_o_first_im(1,i+14);
end
for i=1:2
    stage_4_i_first_re(1,i+14) = stage_3_o_second_re(1,i+12);
    stage_4_i_first_im(1,i+14) = stage_3_o_second_im(1,i+12);
    stage_4_i_second_re(1,i+14) = stage_3_o_second_re(1,i+14);
    stage_4_i_second_im(1,i+14) = stage_3_o_second_im(1,i+14);
end

%stage 4 output
for i=1:2
    stage_4_o_first_re(1,i) = stage_4_i_first_re(1,i)+stage_4_i_second_re(1,i);
    stage_4_o_first_im(1,i) = stage_4_i_first_im(1,i)+stage_4_i_second_im(1,i);
    stage_4_o_second_re(1,i) = (stage_4_i_first_re(1,i)-stage_4_i_second_re(1,i))*W_re(1,8*i-7)-(stage_4_i_first_im(1,i)-stage_4_i_second_im(1,i))*W_im(1,8*i-7);
    stage_4_o_second_im(1,i) = (stage_4_i_first_re(1,i)-stage_4_i_second_re(1,i))*W_im(1,8*i-7)+(stage_4_i_first_im(1,i)-stage_4_i_second_im(1,i))*W_re(1,8*i-7);
end
for i=1:2
    stage_4_o_first_re(1,i+2) = stage_4_i_first_re(1,i+2)+stage_4_i_second_re(1,i+2);
    stage_4_o_first_im(1,i+2) = stage_4_i_first_im(1,i+2)+stage_4_i_second_im(1,i+2);
    stage_4_o_second_re(1,i+2) = (stage_4_i_first_re(1,i+2)-stage_4_i_second_re(1,i+2))*W_re(1,8*i-7)-(stage_4_i_first_im(1,i+2)-stage_4_i_second_im(1,i+2))*W_im(1,8*i-7);
    stage_4_o_second_im(1,i+2) = (stage_4_i_first_re(1,i+2)-stage_4_i_second_re(1,i+2))*W_im(1,8*i-7)+(stage_4_i_first_im(1,i+2)-stage_4_i_second_im(1,i+2))*W_re(1,8*i-7);
end
for i=1:2
    stage_4_o_first_re(1,i+4) = stage_4_i_first_re(1,i+4)+stage_4_i_second_re(1,i+4);
    stage_4_o_first_im(1,i+4) = stage_4_i_first_im(1,i+4)+stage_4_i_second_im(1,i+4);
    stage_4_o_second_re(1,i+4) = (stage_4_i_first_re(1,i+4)-stage_4_i_second_re(1,i+4))*W_re(1,8*i-7)-(stage_4_i_first_im(1,i+4)-stage_4_i_second_im(1,i+4))*W_im(1,8*i-7);
    stage_4_o_second_im(1,i+4) = (stage_4_i_first_re(1,i+4)-stage_4_i_second_re(1,i+4))*W_im(1,8*i-7)+(stage_4_i_first_im(1,i+4)-stage_4_i_second_im(1,i+4))*W_re(1,8*i-7);
end
for i=1:2
    stage_4_o_first_re(1,i+6) = stage_4_i_first_re(1,i+6)+stage_4_i_second_re(1,i+6);
    stage_4_o_first_im(1,i+6) = stage_4_i_first_im(1,i+6)+stage_4_i_second_im(1,i+6);
    stage_4_o_second_re(1,i+6) = (stage_4_i_first_re(1,i+6)-stage_4_i_second_re(1,i+6))*W_re(1,8*i-7)-(stage_4_i_first_im(1,i+6)-stage_4_i_second_im(1,i+6))*W_im(1,8*i-7);
    stage_4_o_second_im(1,i+6) = (stage_4_i_first_re(1,i+6)-stage_4_i_second_re(1,i+6))*W_im(1,8*i-7)+(stage_4_i_first_im(1,i+6)-stage_4_i_second_im(1,i+6))*W_re(1,8*i-7);
end
for i=1:2
    stage_4_o_first_re(1,i+8) = stage_4_i_first_re(1,i+8)+stage_4_i_second_re(1,i+8);
    stage_4_o_first_im(1,i+8) = stage_4_i_first_im(1,i+8)+stage_4_i_second_im(1,i+8);
    stage_4_o_second_re(1,i+8) = (stage_4_i_first_re(1,i+8)-stage_4_i_second_re(1,i+8))*W_re(1,8*i-7)-(stage_4_i_first_im(1,i+8)-stage_4_i_second_im(1,i+8))*W_im(1,8*i-7);
    stage_4_o_second_im(1,i+8) = (stage_4_i_first_re(1,i+8)-stage_4_i_second_re(1,i+8))*W_im(1,8*i-7)+(stage_4_i_first_im(1,i+8)-stage_4_i_second_im(1,i+8))*W_re(1,8*i-7);
end
for i=1:2
    stage_4_o_first_re(1,i+10) = stage_4_i_first_re(1,i+10)+stage_4_i_second_re(1,i+10);
    stage_4_o_first_im(1,i+10) = stage_4_i_first_im(1,i+10)+stage_4_i_second_im(1,i+10);
    stage_4_o_second_re(1,i+10) = (stage_4_i_first_re(1,i+10)-stage_4_i_second_re(1,i+10))*W_re(1,8*i-7)-(stage_4_i_first_im(1,i+10)-stage_4_i_second_im(1,i+10))*W_im(1,8*i-7);
    stage_4_o_second_im(1,i+10) = (stage_4_i_first_re(1,i+10)-stage_4_i_second_re(1,i+10))*W_im(1,8*i-7)+(stage_4_i_first_im(1,i+10)-stage_4_i_second_im(1,i+10))*W_re(1,8*i-7);
end
for i=1:2
    stage_4_o_first_re(1,i+12) = stage_4_i_first_re(1,i+12)+stage_4_i_second_re(1,i+12);
    stage_4_o_first_im(1,i+12) = stage_4_i_first_im(1,i+12)+stage_4_i_second_im(1,i+12);
    stage_4_o_second_re(1,i+12) = (stage_4_i_first_re(1,i+12)-stage_4_i_second_re(1,i+12))*W_re(1,8*i-7)-(stage_4_i_first_im(1,i+12)-stage_4_i_second_im(1,i+12))*W_im(1,8*i-7);
    stage_4_o_second_im(1,i+12) = (stage_4_i_first_re(1,i+12)-stage_4_i_second_re(1,i+12))*W_im(1,8*i-7)+(stage_4_i_first_im(1,i+12)-stage_4_i_second_im(1,i+12))*W_re(1,8*i-7);
end
for i=1:2
    stage_4_o_first_re(1,i+14) = stage_4_i_first_re(1,i+14)+stage_4_i_second_re(1,i+14);
    stage_4_o_first_im(1,i+14) = stage_4_i_first_im(1,i+14)+stage_4_i_second_im(1,i+14);
    stage_4_o_second_re(1,i+14) = (stage_4_i_first_re(1,i+14)-stage_4_i_second_re(1,i+14))*W_re(1,8*i-7)-(stage_4_i_first_im(1,i+14)-stage_4_i_second_im(1,i+14))*W_im(1,8*i-7);
    stage_4_o_second_im(1,i+14) = (stage_4_i_first_re(1,i+14)-stage_4_i_second_re(1,i+14))*W_im(1,8*i-7)+(stage_4_i_first_im(1,i+14)-stage_4_i_second_im(1,i+14))*W_re(1,8*i-7);
end

%stage 5 input
for i=1:8
    stage_5_i_first_re(1,2*i-1) = stage_4_o_first_re(1,2*i-1);
    stage_5_i_first_im(1,2*i-1) = stage_4_o_first_im(1,2*i-1);
    stage_5_i_second_re(1,2*i-1) = stage_4_o_first_re(1,2*i);
    stage_5_i_second_im(1,2*i-1) = stage_4_o_first_im(1,2*i);
    stage_5_i_first_re(1,2*i) = stage_4_o_second_re(1,2*i-1);
    stage_5_i_first_im(1,2*i) = stage_4_o_second_im(1,2*i-1);
    stage_5_i_second_re(1,2*i) = stage_4_o_second_re(1,2*i);
    stage_5_i_second_im(1,2*i) = stage_4_o_second_im(1,2*i);
end

%stage 5 output
for i=1:16
    stage_5_o_first_re(1,i) = stage_5_i_first_re(1,i) + stage_5_i_second_re(1,i);
    stage_5_o_first_im(1,i) = stage_5_i_first_im(1,i) + stage_5_i_second_im(1,i);
    stage_5_o_second_re(1,i) = (stage_5_i_first_re(1,i)-stage_5_i_second_re(1,i))*W_re(1,1)-(stage_5_i_first_im(1,i)-stage_5_i_second_im(1,i))*W_im(1,1);
    stage_5_o_second_im(1,i) = (stage_5_i_first_im(1,i)-stage_5_i_second_im(1,i))*W_re(1,1)+(stage_5_i_first_re(1,i)-stage_5_i_second_re(1,i))*W_im(1,1);
end