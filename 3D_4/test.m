GT=phantom3d(24);
temp=rand(4,4,4);
%% 
[xy_z,yz_x,xz_y,two_xy]=get_inputs(temp);
A=get_A(zeros(4,4,4));
y=get_y(xy_z,yz_x,xz_y,two_xy);
x=A\y;

image=convert_x(x);