function output=get_y(xy_z,yz_x,xz_y,two_xy)
    [x,y,z_over_4]=size(xy_z);
    output=zeros(x^3,1);

    output(1:x^3/4)=compress(xy_z);
    output(1+x^3/4:2*x^3/4)=compress(yz_x);
    output(1+2*x^3/4:3*x^3/4)=compress(xz_y);
    output(1+3*x^3/4:4*x^3/4)=compress(two_xy);

end