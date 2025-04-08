function [xy_z,yz_x,xz_y,two_xy]=get_inputs(GT)
    [x,y,z]=size(GT);
    if (~x==y)||(~y==z)
        error("Dimension of GT is wrong; it should have same number of pixels in all dimension.");
    end

    if (~mod(x,4)==0)
        error("GT should have a size of 4n x 4n x 4n");
    end

    temp=GT(1:2:end,:,:)+GT(2:2:end,:,:);
    two_xy=temp(:,1:2:end,:)+temp(:,2:2:end,:);

    xy_z=GT(:,:,1:4:end)+GT(:,:,2:4:end)+GT(:,:,3:4:end)+GT(:,:,4:4:end);
    yz_x=GT(1:4:end,:,:)+GT(2:4:end,:,:)+GT(3:4:end,:,:)+GT(4:4:end,:,:);
    xz_y=GT(:,1:4:end,:)+GT(:,2:4:end,:)+GT(:,3:4:end,:)+GT(:,4:4:end,:);
end