compressing_factor=2;
larger_pixel=1000;
shifting_direction='r';
range_start=0;
range_end=1/2;


[GT,vu,vu_pos]=sim_1D(compressing_factor,larger_pixel,shifting_direction,range_start,range_end);

GT_=zeros(larger_pixel*compressing_factor,larger_pixel*compressing_factor);
vu_=zeros(larger_pixel*compressing_factor,larger_pixel*compressing_factor);
vu_pos_=zeros(larger_pixel*compressing_factor,larger_pixel*compressing_factor);
for i=1:larger_pixel*compressing_factor
    [GT,vu,vu_pos]=sim_1D(compressing_factor,larger_pixel,shifting_direction,range_start,range_end);
    GT_(i,:)=GT;
    vu_(i,:)=vu;
    vu_pos_(i,:)=vu_pos;
end
figure;
imshow(GT_);
figure;
imshow(vu_pos_);
figure;
imshow(GT_-vu_pos_,Colormap=copper);
disp(sum(abs(GT_-vu_pos_),"all")/(larger_pixel*compressing_factor)^2);