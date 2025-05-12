GT=phantom3d(24);
[xy_z,yz_x,xz_y,two_xy]=get_inputs(GT);
figure;
imagesc(xy_z(:,:,3));

A=get_A(GT);
%% 

y=get_y(xy_z,yz_x,xz_y,two_xy);

x=A\y;

image=convert_x(x);

%% 

figure;
imshow(image(:,:,12));