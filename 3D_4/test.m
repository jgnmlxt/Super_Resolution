GT=phantom3d(24);
%% 
[xy_z,yz_x,xz_y]=get_inputs(GT);
A=get_A(zeros(3,3,3));
y=get_y(xy_z,yz_x,xz_y);
x=A\y;

image=convert_x(x);