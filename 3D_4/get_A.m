function A=get_A(GT)
    [x,y,z]=size(GT);
    if (~x==y)||(~y==z)
        error("Dimension of GT is wrong; it should have same number of pixels in all dimension.");
    end

    if (~mod(x,4)==0)
        error("GT should have a size of 4n x 4n x 4n");
    end

    A=zeros(x^3,x^3);

    % xy_z,yz_x,xz_y,two_xy
    % xy_z
    counter=1;
    for i=1:z/4
        for j=1:x
            for k=1:y
                temp=zeros(x,y,z);
                temp(j,k,1+(i-1)*4:i*4)=1;
                A(counter,:)=compress(temp)';
                counter=counter+1;
            end
        end
    end

    % yz_x
    for i=1:z
        for j=1:x
            for k=1:y/4
                temp=zeros(x,y,z);
                temp(j,1+(k-1)*4:k*4,i)=1;
                A(counter,:)=compress(temp)';
                counter=counter+1;
            end
        end
    end

    % xz_y
    for i=1:z
        for j=1:x/4
            for k=1:y
                temp=zeros(x,y,z);
                temp(1+(j-1)*4:j*4,k,i)=1;
                A(counter,:)=compress(temp)';
                counter=counter+1;
            end
        end
    end
    
    % two_xy
    for i=1:z
        for j=1:x/2
            for k=1:y/2
                temp=zeros(x,y,z);
                temp(1+(j-1)*2:j*2,1+(k-1)*2:k*2,i)=1;
                A(counter,:)=compress(temp)';
                counter=counter+1;
            end
        end
    end
    
end