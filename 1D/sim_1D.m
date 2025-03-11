compressing_factor=2;
larger_pixel=10;
shifting_direction='r';
range_start=0;
range_end=0.5;

whole_spectrum=create_image(larger_pixel,compressing_factor,range_start,range_end);
%whole_spectrum(end-compressing_factor+1:end)=0;


[image_series,GT]=compress_1D(whole_spectrum,compressing_factor,larger_pixel,shifting_direction);

%% Simulate when assuming redundancies as averages of the last image

final_image=zeros(1,compressing_factor*larger_pixel+compressing_factor-1);

% A.*v=I
A=generate_slider(larger_pixel,compressing_factor);

%assuming redundancies

final_image(compressing_factor*larger_pixel+1:end)=image_series{end}(end)/compressing_factor;
% I=Au.*vu+Ak.*vk  vu=(I-Ak.*vk)/Au

vk=final_image(compressing_factor*larger_pixel+1:end)';
Ak=A(:,compressing_factor*larger_pixel+1:end);

I=zeros(compressing_factor,larger_pixel);
for i=1:length(image_series)
    I(i,:)=image_series{i};
end

I=reshape(I,1,[])';
Au=A(:,1:compressing_factor*larger_pixel);

vu=Au\(I-Ak*vk);

mse=sum((vu'-GT).^2/length(GT))
