compressing_factor=5;
larger_pixel=10;
shifting_direction='r';
range_start=0;
range_end=1;

whole_spectrum=create_image(larger_pixel,compressing_factor,range_start,range_end);

[image_series,GT]=compress_1D(whole_spectrum,compressing_factor,larger_pixel);

%% Simulate when assuming redundancies as averages of the last image

final_image=zeros(1,compressing_factor*larger_pixel+compressing_factor-1);

% A.*v=I
A=generate_slider(larger_pixel,compressing_factor,shifting_direction);
I=