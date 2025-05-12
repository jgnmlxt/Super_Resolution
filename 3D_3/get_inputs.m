function [xy_z,yz_x,xz_y]=get_inputs(GT)
    [x,y,z]=size(GT);
    if (~x==y)||(~y==z)
        error("Dimension of GT is wrong; it should have same number of pixels in all dimension.");
    end

    if (~mod(x,3)==0)
        error("GT should have a size of 3n x 3n x 3n");
    end

    xy_z=GT(:,:,1:3:end)+GT(:,:,2:3:end)+GT(:,:,3:3:end);
    yz_x=GT(1:3:end,:,:)+GT(2:3:end,:,:)+GT(3:3:end,:,:);
    xz_y=GT(:,1:3:end,:)+GT(:,2:3:end,:)+GT(:,3:3:end,:);
end