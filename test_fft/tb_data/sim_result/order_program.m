%load raw sim result files
sin_re_bin_id = fopen('sin_sim_result_re_bin.dat');
sin_re_bin = textscan(sin_re_bin_id, '%s');
sin_im_bin_id = fopen('sin_sim_result_im_bin.dat');
sin_im_bin = textscan(sin_im_bin_id, '%s');
dc_re_bin_id = fopen('dc_sim_result_re_bin.dat');
dc_re_bin = textscan(dc_re_bin_id, '%s');
dc_im_bin_id = fopen('dc_sim_result_im_bin.dat');
dc_im_bin = textscan(dc_im_bin_id, '%s');
noise_re_bin_id = fopen('noise_sim_result_re_bin.dat');
noise_re_bin = textscan(noise_re_bin_id, '%s');
noise_im_bin_id = fopen('noise_sim_result_im_bin.dat');
noise_im_bin = textscan(noise_im_bin_id, '%s');
sn_re_bin_id = fopen('sn_sim_result_re_bin.dat');
sn_re_bin = textscan(sn_re_bin_id, '%s');
sn_im_bin_id = fopen('sn_sim_result_im_bin.dat');
sn_im_bin = textscan(sn_im_bin_id, '%s');

fclose(sin_re_bin_id);
fclose(sin_im_bin_id);
fclose(dc_re_bin_id);
fclose(dc_im_bin_id);
fclose(noise_re_bin_id);
fclose(noise_im_bin_id);
fclose(sn_re_bin_id);
fclose(sn_im_bin_id);

%order the result
sin_re_array(1,:) = sin_re_bin{1}{1};
sin_im_array(1,:) = sin_im_bin{1}{1};
dc_re_array(1,:) = dc_re_bin{1}{1};
dc_im_array(1,:) = dc_im_bin{1}{1};
noise_re_array(1,:) = noise_re_bin{1}{1};
noise_im_array(1,:) = noise_im_bin{1}{1};
sn_re_array(1,:) = sn_re_bin{1}{1};
sn_im_array(1,:) = sn_im_bin{1}{1};

sin_re_array(17,:) = sin_re_bin{1}{2};
sin_im_array(17,:) = sin_im_bin{1}{2};
dc_re_array(17,:) = dc_re_bin{1}{2};
dc_im_array(17,:) = dc_im_bin{1}{2};
noise_re_array(17,:) = noise_re_bin{1}{2};
noise_im_array(17,:) = noise_im_bin{1}{2};
sn_re_array(17,:) = sn_re_bin{1}{2};
sn_im_array(17,:) = sn_im_bin{1}{2};

sin_re_array(9,:) = sin_re_bin{1}{3};
sin_im_array(9,:) = sin_im_bin{1}{3};
dc_re_array(9,:) = dc_re_bin{1}{3};
dc_im_array(9,:) = dc_im_bin{1}{3};
noise_re_array(9,:) = noise_re_bin{1}{3};
noise_im_array(9,:) = noise_im_bin{1}{3};
sn_re_array(9,:) = sn_re_bin{1}{3};
sn_im_array(9,:) = sn_im_bin{1}{3};

sin_re_array(25,:) = sin_re_bin{1}{4};
sin_im_array(25,:) = sin_im_bin{1}{4};
dc_re_array(25,:) = dc_re_bin{1}{4};
dc_im_array(25,:) = dc_im_bin{1}{4};
noise_re_array(25,:) = noise_re_bin{1}{4};
noise_im_array(25,:) = noise_im_bin{1}{4};
sn_re_array(25,:) = sn_re_bin{1}{4};
sn_im_array(25,:) = sn_im_bin{1}{4};

sin_re_array(5,:) = sin_re_bin{1}{5};
sin_im_array(5,:) = sin_im_bin{1}{5};
dc_re_array(5,:) = dc_re_bin{1}{5};
dc_im_array(5,:) = dc_im_bin{1}{5};
noise_re_array(5,:) = noise_re_bin{1}{5};
noise_im_array(5,:) = noise_im_bin{1}{5};
sn_re_array(5,:) = sn_re_bin{1}{5};
sn_im_array(5,:) = sn_im_bin{1}{5};

sin_re_array(21,:) = sin_re_bin{1}{6};
sin_im_array(21,:) = sin_im_bin{1}{6};
dc_re_array(21,:) = dc_re_bin{1}{6};
dc_im_array(21,:) = dc_im_bin{1}{6};
noise_re_array(21,:) = noise_re_bin{1}{6};
noise_im_array(21,:) = noise_im_bin{1}{6};
sn_re_array(21,:) = sn_re_bin{1}{6};
sn_im_array(21,:) = sn_im_bin{1}{6};

sin_re_array(13,:) = sin_re_bin{1}{7};
sin_im_array(13,:) = sin_im_bin{1}{7};
dc_re_array(13,:) = dc_re_bin{1}{7};
dc_im_array(13,:) = dc_im_bin{1}{7};
noise_re_array(13,:) = noise_re_bin{1}{7};
noise_im_array(13,:) = noise_im_bin{1}{7};
sn_re_array(13,:) = sn_re_bin{1}{7};
sn_im_array(13,:) = sn_im_bin{1}{7};

sin_re_array(29,:) = sin_re_bin{1}{8};
sin_im_array(29,:) = sin_im_bin{1}{8};
dc_re_array(29,:) = dc_re_bin{1}{8};
dc_im_array(29,:) = dc_im_bin{1}{8};
noise_re_array(29,:) = noise_re_bin{1}{8};
noise_im_array(29,:) = noise_im_bin{1}{8};
sn_re_array(29,:) = sn_re_bin{1}{8};
sn_im_array(29,:) = sn_im_bin{1}{8};

sin_re_array(3,:) = sin_re_bin{1}{9};
sin_im_array(3,:) = sin_im_bin{1}{9};
dc_re_array(3,:) = dc_re_bin{1}{9};
dc_im_array(3,:) = dc_im_bin{1}{9};
noise_re_array(3,:) = noise_re_bin{1}{9};
noise_im_array(3,:) = noise_im_bin{1}{9};
sn_re_array(3,:) = sn_re_bin{1}{9};
sn_im_array(3,:) = sn_im_bin{1}{9};

sin_re_array(19,:) = sin_re_bin{1}{10};
sin_im_array(19,:) = sin_im_bin{1}{10};
dc_re_array(19,:) = dc_re_bin{1}{10};
dc_im_array(19,:) = dc_im_bin{1}{10};
noise_re_array(19,:) = noise_re_bin{1}{10};
noise_im_array(19,:) = noise_im_bin{1}{10};
sn_re_array(19,:) = sn_re_bin{1}{10};
sn_im_array(19,:) = sn_im_bin{1}{10};

sin_re_array(11,:) = sin_re_bin{1}{11};
sin_im_array(11,:) = sin_im_bin{1}{11};
dc_re_array(11,:) = dc_re_bin{1}{11};
dc_im_array(11,:) = dc_im_bin{1}{11};
noise_re_array(11,:) = noise_re_bin{1}{11};
noise_im_array(11,:) = noise_im_bin{1}{11};
sn_re_array(11,:) = sn_re_bin{1}{11};
sn_im_array(11,:) = sn_im_bin{1}{11};

sin_re_array(27,:) = sin_re_bin{1}{12};
sin_im_array(27,:) = sin_im_bin{1}{12};
dc_re_array(27,:) = dc_re_bin{1}{12};
dc_im_array(27,:) = dc_im_bin{1}{12};
noise_re_array(27,:) = noise_re_bin{1}{12};
noise_im_array(27,:) = noise_im_bin{1}{12};
sn_re_array(27,:) = sn_re_bin{1}{12};
sn_im_array(27,:) = sn_im_bin{1}{12};

sin_re_array(7,:) = sin_re_bin{1}{13};
sin_im_array(7,:) = sin_im_bin{1}{13};
dc_re_array(7,:) = dc_re_bin{1}{13};
dc_im_array(7,:) = dc_im_bin{1}{13};
noise_re_array(7,:) = noise_re_bin{1}{13};
noise_im_array(7,:) = noise_im_bin{1}{13};
sn_re_array(7,:) = sn_re_bin{1}{13};
sn_im_array(7,:) = sn_im_bin{1}{13};

sin_re_array(23,:) = sin_re_bin{1}{14};
sin_im_array(23,:) = sin_im_bin{1}{14};
dc_re_array(23,:) = dc_re_bin{1}{14};
dc_im_array(23,:) = dc_im_bin{1}{14};
noise_re_array(23,:) = noise_re_bin{1}{14};
noise_im_array(23,:) = noise_im_bin{1}{14};
sn_re_array(23,:) = sn_re_bin{1}{14};
sn_im_array(23,:) = sn_im_bin{1}{14};

sin_re_array(15,:) = sin_re_bin{1}{15};
sin_im_array(15,:) = sin_im_bin{1}{15};
dc_re_array(15,:) = dc_re_bin{1}{15};
dc_im_array(15,:) = dc_im_bin{1}{15};
noise_re_array(15,:) = noise_re_bin{1}{15};
noise_im_array(15,:) = noise_im_bin{1}{15};
sn_re_array(15,:) = sn_re_bin{1}{15};
sn_im_array(15,:) = sn_im_bin{1}{15};

sin_re_array(31,:) = sin_re_bin{1}{16};
sin_im_array(31,:) = sin_im_bin{1}{16};
dc_re_array(31,:) = dc_re_bin{1}{16};
dc_im_array(31,:) = dc_im_bin{1}{16};
noise_re_array(31,:) = noise_re_bin{1}{16};
noise_im_array(31,:) = noise_im_bin{1}{16};
sn_re_array(31,:) = sn_re_bin{1}{16};
sn_im_array(31,:) = sn_im_bin{1}{16};

sin_re_array(2,:) = sin_re_bin{1}{17};
sin_im_array(2,:) = sin_im_bin{1}{17};
dc_re_array(2,:) = dc_re_bin{1}{17};
dc_im_array(2,:) = dc_im_bin{1}{17};
noise_re_array(2,:) = noise_re_bin{1}{17};
noise_im_array(2,:) = noise_im_bin{1}{17};
sn_re_array(2,:) = sn_re_bin{1}{17};
sn_im_array(2,:) = sn_im_bin{1}{17};

sin_re_array(18,:) = sin_re_bin{1}{18};
sin_im_array(18,:) = sin_im_bin{1}{18};
dc_re_array(18,:) = dc_re_bin{1}{18};
dc_im_array(18,:) = dc_im_bin{1}{18};
noise_re_array(18,:) = noise_re_bin{1}{18};
noise_im_array(18,:) = noise_im_bin{1}{18};
sn_re_array(18,:) = sn_re_bin{1}{18};
sn_im_array(18,:) = sn_im_bin{1}{18};

sin_re_array(10,:) = sin_re_bin{1}{19};
sin_im_array(10,:) = sin_im_bin{1}{19};
dc_re_array(10,:) = dc_re_bin{1}{19};
dc_im_array(10,:) = dc_im_bin{1}{19};
noise_re_array(10,:) = noise_re_bin{1}{19};
noise_im_array(10,:) = noise_im_bin{1}{19};
sn_re_array(10,:) = sn_re_bin{1}{19};
sn_im_array(10,:) = sn_im_bin{1}{19};

sin_re_array(26,:) = sin_re_bin{1}{20};
sin_im_array(26,:) = sin_im_bin{1}{20};
dc_re_array(26,:) = dc_re_bin{1}{20};
dc_im_array(26,:) = dc_im_bin{1}{20};
noise_re_array(26,:) = noise_re_bin{1}{20};
noise_im_array(26,:) = noise_im_bin{1}{20};
sn_re_array(26,:) = sn_re_bin{1}{20};
sn_im_array(26,:) = sn_im_bin{1}{20};

sin_re_array(6,:) = sin_re_bin{1}{21};
sin_im_array(6,:) = sin_im_bin{1}{21};
dc_re_array(6,:) = dc_re_bin{1}{21};
dc_im_array(6,:) = dc_im_bin{1}{21};
noise_re_array(6,:) = noise_re_bin{1}{21};
noise_im_array(6,:) = noise_im_bin{1}{21};
sn_re_array(6,:) = sn_re_bin{1}{21};
sn_im_array(6,:) = sn_im_bin{1}{21};

sin_re_array(22,:) = sin_re_bin{1}{22};
sin_im_array(22,:) = sin_im_bin{1}{22};
dc_re_array(22,:) = dc_re_bin{1}{22};
dc_im_array(22,:) = dc_im_bin{1}{22};
noise_re_array(22,:) = noise_re_bin{1}{22};
noise_im_array(22,:) = noise_im_bin{1}{22};
sn_re_array(22,:) = sn_re_bin{1}{22};
sn_im_array(22,:) = sn_im_bin{1}{22};

sin_re_array(14,:) = sin_re_bin{1}{23};
sin_im_array(14,:) = sin_im_bin{1}{23};
dc_re_array(14,:) = dc_re_bin{1}{23};
dc_im_array(14,:) = dc_im_bin{1}{23};
noise_re_array(14,:) = noise_re_bin{1}{23};
noise_im_array(14,:) = noise_im_bin{1}{23};
sn_re_array(14,:) = sn_re_bin{1}{23};
sn_im_array(14,:) = sn_im_bin{1}{23};

sin_re_array(30,:) = sin_re_bin{1}{24};
sin_im_array(30,:) = sin_im_bin{1}{24};
dc_re_array(30,:) = dc_re_bin{1}{24};
dc_im_array(30,:) = dc_im_bin{1}{24};
noise_re_array(30,:) = noise_re_bin{1}{24};
noise_im_array(30,:) = noise_im_bin{1}{24};
sn_re_array(30,:) = sn_re_bin{1}{24};
sn_im_array(30,:) = sn_im_bin{1}{24};

sin_re_array(4,:) = sin_re_bin{1}{25};
sin_im_array(4,:) = sin_im_bin{1}{25};
dc_re_array(4,:) = dc_re_bin{1}{25};
dc_im_array(4,:) = dc_im_bin{1}{25};
noise_re_array(4,:) = noise_re_bin{1}{25};
noise_im_array(4,:) = noise_im_bin{1}{25};
sn_re_array(4,:) = sn_re_bin{1}{25};
sn_im_array(4,:) = sn_im_bin{1}{25};

sin_re_array(20,:) = sin_re_bin{1}{26};
sin_im_array(20,:) = sin_im_bin{1}{26};
dc_re_array(20,:) = dc_re_bin{1}{26};
dc_im_array(20,:) = dc_im_bin{1}{26};
noise_re_array(20,:) = noise_re_bin{1}{26};
noise_im_array(20,:) = noise_im_bin{1}{26};
sn_re_array(20,:) = sn_re_bin{1}{26};
sn_im_array(20,:) = sn_im_bin{1}{26};

sin_re_array(12,:) = sin_re_bin{1}{27};
sin_im_array(12,:) = sin_im_bin{1}{27};
dc_re_array(12,:) = dc_re_bin{1}{27};
dc_im_array(12,:) = dc_im_bin{1}{27};
noise_re_array(12,:) = noise_re_bin{1}{27};
noise_im_array(12,:) = noise_im_bin{1}{27};
sn_re_array(12,:) = sn_re_bin{1}{27};
sn_im_array(12,:) = sn_im_bin{1}{27};

sin_re_array(28,:) = sin_re_bin{1}{28};
sin_im_array(28,:) = sin_im_bin{1}{28};
dc_re_array(28,:) = dc_re_bin{1}{28};
dc_im_array(28,:) = dc_im_bin{1}{28};
noise_re_array(28,:) = noise_re_bin{1}{28};
noise_im_array(28,:) = noise_im_bin{1}{28};
sn_re_array(28,:) = sn_re_bin{1}{28};
sn_im_array(28,:) = sn_im_bin{1}{28};

sin_re_array(8,:) = sin_re_bin{1}{29};
sin_im_array(8,:) = sin_im_bin{1}{29};
dc_re_array(8,:) = dc_re_bin{1}{29};
dc_im_array(8,:) = dc_im_bin{1}{29};
noise_re_array(8,:) = noise_re_bin{1}{29};
noise_im_array(8,:) = noise_im_bin{1}{29};
sn_re_array(8,:) = sn_re_bin{1}{29};
sn_im_array(8,:) = sn_im_bin{1}{29};

sin_re_array(24,:) = sin_re_bin{1}{30};
sin_im_array(24,:) = sin_im_bin{1}{30};
dc_re_array(24,:) = dc_re_bin{1}{30};
dc_im_array(24,:) = dc_im_bin{1}{30};
noise_re_array(24,:) = noise_re_bin{1}{30};
noise_im_array(24,:) = noise_im_bin{1}{30};
sn_re_array(24,:) = sn_re_bin{1}{30};
sn_im_array(24,:) = sn_im_bin{1}{30};

sin_re_array(16,:) = sin_re_bin{1}{31};
sin_im_array(16,:) = sin_im_bin{1}{31};
dc_re_array(16,:) = dc_re_bin{1}{31};
dc_im_array(16,:) = dc_im_bin{1}{31};
noise_re_array(16,:) = noise_re_bin{1}{31};
noise_im_array(16,:) = noise_im_bin{1}{31};
sn_re_array(16,:) = sn_re_bin{1}{31};
sn_im_array(16,:) = sn_im_bin{1}{31};

sin_re_array(32,:) = sin_re_bin{1}{32};
sin_im_array(32,:) = sin_im_bin{1}{32};
dc_re_array(32,:) = dc_re_bin{1}{32};
dc_im_array(32,:) = dc_im_bin{1}{32};
noise_re_array(32,:) = noise_re_bin{1}{32};
noise_im_array(32,:) = noise_im_bin{1}{32};
sn_re_array(32,:) = sn_re_bin{1}{32};
sn_im_array(32,:) = sn_im_bin{1}{32};

for i=1:32
    sin_re_num_array(1,i) = hexsingle2num(sin_re_array(i,:));
    sin_im_num_array(1,i) = hexsingle2num(sin_im_array(i,:));
    dc_re_num_array(1,i) = hexsingle2num(dc_re_array(i,:));
    dc_im_num_array(1,i) = hexsingle2num(dc_im_array(i,:));
    noise_re_num_array(1,i) = hexsingle2num(noise_re_array(i,:));
    noise_im_num_array(1,i) = hexsingle2num(noise_im_array(i,:));
    sn_re_num_array(1,i) = hexsingle2num(sn_re_array(i,:));
    sn_im_num_array(1,i) = hexsingle2num(sn_im_array(i,:));
end

ordered_sin_re_id = fopen('ordered_sin_re.dat', 'wt');
ordered_sin_im_id = fopen('ordered_sin_im.dat', 'wt');
ordered_dc_re_id = fopen('ordered_dc_re.dat', 'wt');
ordered_dc_im_id = fopen('ordered_dc_im.dat', 'wt');
ordered_noise_re_id = fopen('ordered_noise_re.dat', 'wt');
ordered_noise_im_id = fopen('ordered_noise_im.dat', 'wt');
ordered_sn_re_id = fopen('ordered_sn_re.dat', 'wt');
ordered_sn_im_id = fopen('ordered_sn_im.dat', 'wt');

for i=1:32
    fprintf(ordered_sin_re_id, '%f\n', sin_re_num_array(1,i));
    fprintf(ordered_sin_im_id, '%f\n', sin_im_num_array(1,i));
    fprintf(ordered_dc_re_id, '%f\n', dc_re_num_array(1,i));
    fprintf(ordered_dc_im_id, '%f\n', dc_im_num_array(1,i));
    fprintf(ordered_noise_re_id, '%f\n', noise_re_num_array(1,i));
    fprintf(ordered_noise_im_id, '%f\n', noise_im_num_array(1,i));
    fprintf(ordered_sn_re_id, '%f\n', sn_re_num_array(1,i));
    fprintf(ordered_sn_im_id, '%f\n', sn_im_num_array(1,i));
end    

fclose(ordered_sin_re_id);
fclose(ordered_sin_im_id);
fclose(ordered_dc_re_id);
fclose(ordered_dc_im_id);
fclose(ordered_noise_re_id);
fclose(ordered_noise_im_id);
fclose(ordered_sn_re_id);
fclose(ordered_sn_im_id);