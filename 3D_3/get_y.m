function output=get_y(xy_z,yz_x,xz_y)
    [x,y,z_over_4]=size(xy_z);
    output=zeros(x^3,1);
    
    % xy_z=permute(xy_z,[2,1,3]);
    % yz_x=permute(yz_x,[2,1,3]);
    % xz_y=permute(xz_y,[2,1,3]);
    % two_xy=permute(two_xy,[2,1,3]);
    output(1:x^3/3)=compress(xy_z);
    output(1+x^3/3:2*x^3/3)=compress(yz_x);
    output(1+2*x^3/3:3*x^3/3)=compress(xz_y);

end