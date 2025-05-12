function A=get_A(GT)
    [x,y,z]=size(GT);
    if (~x==y)||(~y==z)
        error("Dimension of GT is wrong; it should have same number of pixels in all dimension.");
    end

    if (~mod(x,3)==0)
        error("GT should have a size of 3n x 3n x 3n");
    end

    A=zeros(x^3,x^3);

    % xy_z,yz_x,xz_y
    % xy_z
    counter=1;
    for i=1:z/3
        for j=1:x
            for k=1:y
                temp=zeros(x,y,z);
                temp(j,k,1+(i-1)*3:i*3)=1;
                A(counter,:)=compress(temp)';
                counter=counter+1;
            end
        end
    end

    % yz_x
    for i=1:z
        for j=1:x
            for k=1:y/3
                temp=zeros(x,y,z);
                temp(j,1+(k-1)*3:k*3,i)=1;
                A(counter,:)=compress(temp)';
                counter=counter+1;
            end
        end
    end

    % xz_y
    for i=1:z
        for j=1:x/3
            for k=1:y
                temp=zeros(x,y,z);
                temp(1+(j-1)*3:j*3,k,i)=1;
                A(counter,:)=compress(temp)';
                counter=counter+1;
            end
        end
    end
    
end