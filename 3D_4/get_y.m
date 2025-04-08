function output=get_y(xy_z,yz_x,xz_y,two_xy)
    [x,y,z_over_4]=size(xy_z);
    output=zeros(x^3,1);
    
    % xy_z=permute(xy_z,[2,1,3]);
    % yz_x=permute(yz_x,[2,1,3]);
    % xz_y=permute(xz_y,[2,1,3]);
    % two_xy=permute(two_xy,[2,1,3]);
    output(1:x^3/4)=compress(xy_z);
    output(1+x^3/4:2*x^3/4)=compress(yz_x);
    output(1+2*x^3/4:3*x^3/4)=compress(xz_y);
    output(1+3*x^3/4:4*x^3/4)=compress(two_xy);

end